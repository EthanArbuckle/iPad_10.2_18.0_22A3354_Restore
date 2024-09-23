@implementation GEOTransitSectionOption

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSectionOption;
  -[GEOTransitSectionOption dealloc](&v3, sel_dealloc);
}

- (unint64_t)sectionsCount
{
  return self->_sections.count;
}

- (unsigned)sections
{
  return self->_sections.list;
}

- (void)clearSections
{
  PBRepeatedUInt32Clear();
}

- (void)addSection:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)sectionAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_sections;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_sections = &self->_sections;
  count = self->_sections.count;
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
  return p_sections->list[a3];
}

- (void)setSections:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unsigned)defaultSectionIndex
{
  return self->_defaultSectionIndex;
}

- (void)setDefaultSectionIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_defaultSectionIndex = a3;
}

- (void)setHasDefaultSectionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDefaultSectionIndex
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOTransitSectionOption;
  -[GEOTransitSectionOption description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSectionOption dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSectionOption _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("section"));

  }
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("defaultSectionIndex");
    else
      v7 = CFSTR("default_section_index");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__GEOTransitSectionOption__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSectionOption _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOTransitSectionOption__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSectionOption)initWithDictionary:(id)a3
{
  return (GEOTransitSectionOption *)-[GEOTransitSectionOption _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("section"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v17;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v17 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addSection:", objc_msgSend(v12, "unsignedIntValue", (_QWORD)v16));
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v9);
        }

      }
      if (a3)
        v13 = CFSTR("defaultSectionIndex");
      else
        v13 = CFSTR("default_section_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDefaultSectionIndex:", objc_msgSend(v14, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOTransitSectionOption)initWithJSON:(id)a3
{
  return (GEOTransitSectionOption *)-[GEOTransitSectionOption _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSectionOptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSectionOptionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (self->_sections.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sections.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_sections.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEOTransitSectionOption readAll:](self, "readAll:", 0);
  if (-[GEOTransitSectionOption sectionsCount](self, "sectionsCount"))
  {
    objc_msgSend(v7, "clearSections");
    v4 = -[GEOTransitSectionOption sectionsCount](self, "sectionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSection:", -[GEOTransitSectionOption sectionAtIndex:](self, "sectionAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v7 + 10) = self->_defaultSectionIndex;
    *((_BYTE *)v7 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_defaultSectionIndex;
    *(_BYTE *)(v4 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_7;
  -[GEOTransitSectionOption readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0 && self->_defaultSectionIndex == *((_DWORD *)v4 + 10))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOTransitSectionOption readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_defaultSectionIndex;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unsigned int *v7;

  v7 = (unsigned int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "sectionsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOTransitSectionOption addSection:](self, "addSection:", objc_msgSend(v7, "sectionAtIndex:", i));
  }
  if ((v7[11] & 1) != 0)
  {
    self->_defaultSectionIndex = v7[10];
    *(_BYTE *)&self->_flags |= 1u;
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
    -[GEOTransitSectionOption readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
