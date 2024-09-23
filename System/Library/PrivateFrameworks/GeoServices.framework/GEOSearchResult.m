@implementation GEOSearchResult

- (int)resultType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasResultType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23830[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_ENRICHED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_MAPS_RESULT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_GUIDE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_businessId = a3;
}

- (void)setHasBusinessId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBusinessId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)localSearchProviderId
{
  return self->_localSearchProviderId;
}

- (void)setLocalSearchProviderId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_localSearchProviderId = a3;
}

- (void)setHasLocalSearchProviderId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalSearchProviderId
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasResultIndex
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)isEnrichedItem
{
  return self->_isEnrichedItem;
}

- (void)setIsEnrichedItem:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isEnrichedItem = a3;
}

- (void)setHasIsEnrichedItem:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsEnrichedItem
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOSearchResult;
  -[GEOSearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 8) != 0)
  {
    v6 = *(int *)(a1 + 24);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C23830[v6];
    }
    if (a2)
      v8 = CFSTR("resultType");
    else
      v8 = CFSTR("result_type");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("businessId");
    else
      v10 = CFSTR("business_id");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_12:
      if ((v5 & 4) == 0)
        goto LABEL_13;
      goto LABEL_23;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("localSearchProviderId");
  else
    v12 = CFSTR("local_search_provider_id");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0)
      return v4;
    goto LABEL_27;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("resultIndex");
  else
    v14 = CFSTR("result_index");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("isEnrichedItem");
    else
      v16 = CFSTR("is_enriched_item");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSearchResult)initWithDictionary:(id)a3
{
  return (GEOSearchResult *)-[GEOSearchResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (!a1)
    goto LABEL_41;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_41;
  if (a3)
    v6 = CFSTR("resultType");
  else
    v6 = CFSTR("result_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_ENRICHED")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_MAPS_RESULT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("SEARCH_RESULTS_RESULT_TYPE_GUIDE")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_19:
    objc_msgSend(a1, "setResultType:", v9);
  }

  if (a3)
    v10 = CFSTR("businessId");
  else
    v10 = CFSTR("business_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBusinessId:", objc_msgSend(v11, "unsignedLongLongValue"));

  if (a3)
    v12 = CFSTR("localSearchProviderId");
  else
    v12 = CFSTR("local_search_provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLocalSearchProviderId:", objc_msgSend(v13, "unsignedIntValue"));

  if (a3)
    v14 = CFSTR("resultIndex");
  else
    v14 = CFSTR("result_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setResultIndex:", objc_msgSend(v15, "unsignedIntValue"));

  if (a3)
    v16 = CFSTR("isEnrichedItem");
  else
    v16 = CFSTR("is_enriched_item");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsEnrichedItem:", objc_msgSend(v17, "BOOLValue"));

LABEL_41:
  return a1;
}

- (GEOSearchResult)initWithJSON:(id)a3
{
  return (GEOSearchResult *)-[GEOSearchResult _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchResultReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOSearchResult readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[6] = self->_resultType;
    *((_BYTE *)v5 + 32) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 1) = self->_businessId;
  *((_BYTE *)v5 + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v5[5] = self->_resultIndex;
    *((_BYTE *)v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v5[4] = self->_localSearchProviderId;
  *((_BYTE *)v5 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    *((_BYTE *)v5 + 28) = self->_isEnrichedItem;
    *((_BYTE *)v5 + 32) |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_resultType;
    *((_BYTE *)result + 32) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = self->_businessId;
  *((_BYTE *)result + 32) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_localSearchProviderId;
  *((_BYTE *)result + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_resultIndex;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 28) = self->_isEnrichedItem;
  *((_BYTE *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOSearchResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_resultType != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_businessId != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_localSearchProviderId != *((_DWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_resultIndex != *((_DWORD *)v4 + 5))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  v5 = (*((_BYTE *)v4 + 32) & 0x10) == 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
    {
LABEL_24:
      v5 = 0;
      goto LABEL_25;
    }
    if (self->_isEnrichedItem)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_24;
    }
    v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOSearchResult readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v3 = 2654435761 * self->_resultType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_businessId;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_localSearchProviderId;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_resultIndex;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_isEnrichedItem;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_resultType = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 8u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_businessId = *((_QWORD *)v5 + 1);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_resultIndex = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 32) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_localSearchProviderId = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
  {
LABEL_6:
    self->_isEnrichedItem = *((_BYTE *)v5 + 28);
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_7:

}

@end
