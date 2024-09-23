@implementation GEOGuidanceImportanceMode

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOGuidanceImportanceMode;
  -[GEOGuidanceImportanceMode dealloc](&v3, sel_dealloc);
}

- (unint64_t)guidancePreferenceTypesCount
{
  return self->_guidancePreferenceTypes.count;
}

- (int)guidancePreferenceTypes
{
  return self->_guidancePreferenceTypes.list;
}

- (void)clearGuidancePreferenceTypes
{
  PBRepeatedInt32Clear();
}

- (void)addGuidancePreferenceType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)guidancePreferenceTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_guidancePreferenceTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_guidancePreferenceTypes = &self->_guidancePreferenceTypes;
  count = self->_guidancePreferenceTypes.count;
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
  return p_guidancePreferenceTypes->list[a3];
}

- (void)setGuidancePreferenceTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)guidancePreferenceTypesAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("ALERTS_ONLY");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsGuidancePreferenceTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ALERTS_ONLY"));

  return v4;
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
  v8.super_class = (Class)GEOGuidanceImportanceMode;
  -[GEOGuidanceImportanceMode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGuidanceImportanceMode dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGuidanceImportanceMode _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[3])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1 + 2;
    if (a1[3])
    {
      v7 = 0;
      do
      {
        v8 = *(unsigned int *)(*v6 + 4 * v7);
        if ((_DWORD)v8)
        {
          if ((_DWORD)v8 == 1)
          {
            v9 = CFSTR("ALERTS_ONLY");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v9 = CFSTR("UNKNOWN");
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = a1 + 2;
      }
      while (v7 < a1[3]);
    }
    if (a2)
      v10 = CFSTR("guidancePreferenceType");
    else
      v10 = CFSTR("guidance_preference_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  v11 = (void *)a1[1];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__GEOGuidanceImportanceMode__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGuidanceImportanceMode _dictionaryRepresentation:](self, 1);
}

void __55__GEOGuidanceImportanceMode__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOGuidanceImportanceMode)initWithDictionary:(id)a3
{
  return (GEOGuidanceImportanceMode *)-[GEOGuidanceImportanceMode _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("guidancePreferenceType");
      else
        v6 = CFSTR("guidance_preference_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v7;
        v18 = v5;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (!v9)
          goto LABEL_22;
        v10 = v9;
        v11 = *(_QWORD *)v20;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v13;
              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                v15 = 0;
              else
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("ALERTS_ONLY"));

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_20;
              v15 = objc_msgSend(v13, "intValue");
            }
            objc_msgSend(a1, "addGuidancePreferenceType:", v15, v17, v18, (_QWORD)v19);
LABEL_20:
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (!v10)
          {
LABEL_22:

            v7 = v17;
            v5 = v18;
            break;
          }
        }
      }

    }
  }

  return a1;
}

- (GEOGuidanceImportanceMode)initWithJSON:(id)a3
{
  return (GEOGuidanceImportanceMode *)-[GEOGuidanceImportanceMode _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGuidanceImportanceModeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGuidanceImportanceModeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_guidancePreferenceTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_guidancePreferenceTypes.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEOGuidanceImportanceMode readAll:](self, "readAll:", 0);
  if (-[GEOGuidanceImportanceMode guidancePreferenceTypesCount](self, "guidancePreferenceTypesCount"))
  {
    objc_msgSend(v7, "clearGuidancePreferenceTypes");
    v4 = -[GEOGuidanceImportanceMode guidancePreferenceTypesCount](self, "guidancePreferenceTypesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addGuidancePreferenceType:", -[GEOGuidanceImportanceMode guidancePreferenceTypeAtIndex:](self, "guidancePreferenceTypeAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GEOGuidanceImportanceMode readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOGuidanceImportanceMode readAll:](self, "readAll:", 1);
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "guidancePreferenceTypesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOGuidanceImportanceMode addGuidancePreferenceType:](self, "addGuidancePreferenceType:", objc_msgSend(v7, "guidancePreferenceTypeAtIndex:", i));
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
    -[GEOGuidanceImportanceMode readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
