@implementation GEOGenericStringData

- (BOOL)hasTokenSubstitute
{
  return self->_tokenSubstitute != 0;
}

- (NSString)tokenSubstitute
{
  return self->_tokenSubstitute;
}

- (void)setTokenSubstitute:(id)a3
{
  objc_storeStrong((id *)&self->_tokenSubstitute, a3);
}

- (int)stringSubstituteType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_stringSubstituteType;
  else
    return 0;
}

- (void)setStringSubstituteType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_stringSubstituteType = a3;
}

- (void)setHasStringSubstituteType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStringSubstituteType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)stringSubstituteTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C081D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStringSubstituteType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEXT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_NAME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_NAME")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_LABEL")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)privacyFilterType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_privacyFilterType;
  else
    return 1;
}

- (void)setPrivacyFilterType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_privacyFilterType = a3;
}

- (void)setHasPrivacyFilterType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPrivacyFilterType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)privacyFilterTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C08200[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrivacyFilterType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVACY_FILTER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVACY_FILTER_PUBLIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVACY_FILTER_AMBIGUOUS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVACY_FILTER_PRIVATE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

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
  v8.super_class = (Class)GEOGenericStringData;
  -[GEOGenericStringData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOGenericStringData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOGenericStringData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "tokenSubstitute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("tokenSubstitute");
    else
      v6 = CFSTR("token_substitute");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 32);
  if ((v7 & 2) != 0)
  {
    v8 = *(int *)(a1 + 28);
    if (v8 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C081D0[v8];
    }
    if (a2)
      v10 = CFSTR("stringSubstituteType");
    else
      v10 = CFSTR("string_substitute_type");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v7 = *(_BYTE *)(a1 + 32);
  }
  if ((v7 & 1) != 0)
  {
    v11 = *(int *)(a1 + 24);
    if (v11 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C08200[v11];
    }
    if (a2)
      v13 = CFSTR("privacyFilterType");
    else
      v13 = CFSTR("privacy_filter_type");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __50__GEOGenericStringData__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOGenericStringData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOGenericStringData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOGenericStringData)initWithDictionary:(id)a3
{
  return (GEOGenericStringData *)-[GEOGenericStringData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tokenSubstitute");
      else
        v6 = CFSTR("token_substitute");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setTokenSubstitute:", v8);

      }
      if (a3)
        v9 = CFSTR("stringSubstituteType");
      else
        v9 = CFSTR("string_substitute_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TEXT")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
        {
          v12 = 2;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("CONTACT_NAME")) & 1) != 0)
        {
          v12 = 3;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_NAME")) & 1) != 0)
        {
          v12 = 4;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ADDRESS_LABEL")))
        {
          v12 = 5;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_29;
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setStringSubstituteType:", v12);
LABEL_29:

      if (a3)
        v13 = CFSTR("privacyFilterType");
      else
        v13 = CFSTR("privacy_filter_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PRIVACY_FILTER_UNKNOWN")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PRIVACY_FILTER_PUBLIC")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PRIVACY_FILTER_AMBIGUOUS")) & 1) != 0)
        {
          v16 = 2;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PRIVACY_FILTER_PRIVATE")))
        {
          v16 = 3;
        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_46:

          goto LABEL_47;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setPrivacyFilterType:", v16);
      goto LABEL_46;
    }
  }
LABEL_47:

  return a1;
}

- (GEOGenericStringData)initWithJSON:(id)a3
{
  return (GEOGenericStringData *)-[GEOGenericStringData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOGenericStringDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOGenericStringDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_tokenSubstitute)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOGenericStringData readAll:](self, "readAll:", 0);
  if (self->_tokenSubstitute)
    objc_msgSend(v5, "setTokenSubstitute:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_stringSubstituteType;
    *((_BYTE *)v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_privacyFilterType;
    *((_BYTE *)v5 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_tokenSubstitute, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_stringSubstituteType;
    *(_BYTE *)(v5 + 32) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_privacyFilterType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *tokenSubstitute;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOGenericStringData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  tokenSubstitute = self->_tokenSubstitute;
  if ((unint64_t)tokenSubstitute | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](tokenSubstitute, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_stringSubstituteType != *((_DWORD *)v4 + 7))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_privacyFilterType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOGenericStringData readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_tokenSubstitute, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_stringSubstituteType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_privacyFilterType;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 2))
    -[GEOGenericStringData setTokenSubstitute:](self, "setTokenSubstitute:");
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_stringSubstituteType = v5[7];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 32);
  }
  if ((v4 & 1) != 0)
  {
    self->_privacyFilterType = v5[6];
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
    -[GEOGenericStringData readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSubstitute, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
