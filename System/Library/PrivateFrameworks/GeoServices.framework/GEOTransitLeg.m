@implementation GEOTransitLeg

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitLeg;
  -[GEOTransitLeg dealloc](&v3, sel_dealloc);
}

- (int)sectionOptionIndex
{
  return self->_sectionOptionIndex;
}

- (void)setSectionOptionIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_sectionOptionIndex = a3;
}

- (void)setHasSectionOptionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSectionOptionIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unint64_t)restrictedToSectionIndexsCount
{
  return self->_restrictedToSectionIndexs.count;
}

- (int)restrictedToSectionIndexs
{
  return self->_restrictedToSectionIndexs.list;
}

- (void)clearRestrictedToSectionIndexs
{
  PBRepeatedInt32Clear();
}

- (void)addRestrictedToSectionIndex:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)restrictedToSectionIndexAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_restrictedToSectionIndexs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_restrictedToSectionIndexs = &self->_restrictedToSectionIndexs;
  count = self->_restrictedToSectionIndexs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_restrictedToSectionIndexs->list[a3];
}

- (void)setRestrictedToSectionIndexs:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitLeg;
  -[GEOTransitLeg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitLeg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitLeg _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("sectionOptionIndex");
    else
      v6 = CFSTR("section_option_index");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt32NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("restrictedToSectionIndex");
    else
      v8 = CFSTR("restricted_to_section_index");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __43__GEOTransitLeg__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E1C00600;
      v13 = v12;
      v17 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitLeg _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOTransitLeg__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTransitLeg)initWithDictionary:(id)a3
{
  return (GEOTransitLeg *)-[GEOTransitLeg _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sectionOptionIndex");
      else
        v6 = CFSTR("section_option_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSectionOptionIndex:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("restrictedToSectionIndex");
      else
        v8 = CFSTR("restricted_to_section_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRestrictedToSectionIndex:", objc_msgSend(v15, "intValue", (_QWORD)v17));
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v12);
        }

      }
    }
  }

  return a1;
}

- (GEOTransitLeg)initWithJSON:(id)a3
{
  return (GEOTransitLeg *)-[GEOTransitLeg _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitLegIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitLegReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_restrictedToSectionIndexs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_restrictedToSectionIndexs.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _DWORD *v7;

  v7 = a3;
  -[GEOTransitLeg readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[10] = self->_sectionOptionIndex;
    *((_BYTE *)v7 + 44) |= 1u;
  }
  if (-[GEOTransitLeg restrictedToSectionIndexsCount](self, "restrictedToSectionIndexsCount"))
  {
    objc_msgSend(v7, "clearRestrictedToSectionIndexs");
    v4 = -[GEOTransitLeg restrictedToSectionIndexsCount](self, "restrictedToSectionIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addRestrictedToSectionIndex:", -[GEOTransitLeg restrictedToSectionIndexAtIndex:](self, "restrictedToSectionIndexAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_sectionOptionIndex;
    *(_BYTE *)(v4 + 44) |= 1u;
  }
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOTransitLeg readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_sectionOptionIndex != *((_DWORD *)v4 + 10))
      goto LABEL_8;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOTransitLeg readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_sectionOptionIndex;
  else
    v3 = 0;
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  if ((v7[11] & 1) != 0)
  {
    self->_sectionOptionIndex = v7[10];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v7, "restrictedToSectionIndexsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOTransitLeg addRestrictedToSectionIndex:](self, "addRestrictedToSectionIndex:", objc_msgSend(v7, "restrictedToSectionIndexAtIndex:", i));
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOTransitLeg readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
