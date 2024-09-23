@implementation GEOPDClientRankingFeatureTypeSource

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureTypeSource;
  -[GEOPDClientRankingFeatureTypeSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientRankingFeatureTypeSource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureTypeSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 20);
    if (v6 >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C05848[v6];
    }
    if (a2)
      v8 = CFSTR("suggestionType");
    else
      v8 = CFSTR("suggestion_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 1) != 0)
  {
    v9 = *(int *)(a1 + 16);
    if (v9 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C058C0[v9];
    }
    if (a2)
      v11 = CFSTR("serverEntryType");
    else
      v11 = CFSTR("server_entry_type");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __65__GEOPDClientRankingFeatureTypeSource__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureTypeSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPDClientRankingFeatureTypeSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  void *v12;
  id v13;
  int v14;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("suggestionType");
    else
      v7 = CFSTR("suggestion_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_UNKNOWN")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_COREROUTINE")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MESSAGES")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CORERECENT_MAIL")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_QUERY")) & 1) != 0)
      {
        v10 = 4;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS")) & 1) != 0)
      {
        v10 = 5;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MAPSRECENT_PLACE")) & 1) != 0)
      {
        v10 = 6;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_CONTACTS")) & 1) != 0)
      {
        v10 = 7;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_FAVORITE")) & 1) != 0)
      {
        v10 = 8;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_SERVER")) & 1) != 0)
      {
        v10 = 9;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT")) & 1) != 0)
      {
        v10 = 10;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_USER_LOCATION")) & 1) != 0)
      {
        v10 = 11;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PARKED_CAR")) & 1) != 0)
      {
        v10 = 12;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_MARKED_LOCATION")) & 1) != 0)
      {
        v10 = 13;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("AC_TYPE_CLIENT_PROACTIVE")))
      {
        v10 = 14;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_41;
      v10 = objc_msgSend(v8, "intValue");
    }
    *(_BYTE *)(v6 + 24) |= 2u;
    *(_DWORD *)(v6 + 20) = v10;
LABEL_41:

    if (a3)
      v11 = CFSTR("serverEntryType");
    else
      v11 = CFSTR("server_entry_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("QUERY")) & 1) != 0)
      {
        v14 = 0;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BUSINESS")) & 1) != 0)
      {
        v14 = 1;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
      {
        v14 = 2;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
      {
        v14 = 3;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("BRAND_PROFILE")) & 1) != 0)
      {
        v14 = 4;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("OFFLINE_AREA")) & 1) != 0)
      {
        v14 = 5;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CLIENT_RESOLVED")) & 1) != 0)
      {
        v14 = 6;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("DIRECTION_INTENT")) & 1) != 0)
      {
        v14 = 7;
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("COLLECTION")) & 1) != 0)
      {
        v14 = 8;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PUBLISHER")))
      {
        v14 = 9;
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_70:

        goto LABEL_71;
      }
      v14 = objc_msgSend(v12, "intValue");
    }
    *(_BYTE *)(v6 + 24) |= 1u;
    *(_DWORD *)(v6 + 16) = v14;
    goto LABEL_70;
  }
LABEL_71:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureTypeSourceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_suggestionType;
    *(_BYTE *)(v4 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_serverEntryType;
    *(_BYTE *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_suggestionType != *((_DWORD *)v4 + 5))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_serverEntryType != *((_DWORD *)v4 + 4))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v2 = 2654435761 * self->_suggestionType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_serverEntryType;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
