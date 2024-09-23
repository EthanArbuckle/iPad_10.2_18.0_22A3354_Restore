@implementation GEOLogMsgEventPlaceCacheLookup

- (BOOL)hasRequestAppIdentifier
{
  return self->_requestAppIdentifier != 0;
}

- (NSString)requestAppIdentifier
{
  return self->_requestAppIdentifier;
}

- (void)setRequestAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestAppIdentifier, a3);
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

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_bytes = a3;
}

- (void)setHasBytes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasBytes
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)lookupResult
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_lookupResult;
  else
    return 0;
}

- (void)setLookupResult:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_lookupResult = a3;
}

- (void)setHasLookupResult:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLookupResult
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)lookupResultAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C22600[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLookupResult:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNUSABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_USABLE")))
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
  v8.super_class = (Class)GEOLogMsgEventPlaceCacheLookup;
  -[GEOLogMsgEventPlaceCacheLookup description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventPlaceCacheLookup dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPlaceCacheLookup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "requestAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("requestAppIdentifier");
    else
      v6 = CFSTR("request_app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("businessId");
    else
      v9 = CFSTR("business_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 36);
  }
  if ((v7 & 4) == 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_14;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("bytes"));

    if ((*(_BYTE *)(a1 + 36) & 8) == 0)
      return v4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 28));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("localSearchProviderID"));

  v7 = *(_BYTE *)(a1 + 36);
  if ((v7 & 2) != 0)
    goto LABEL_17;
LABEL_14:
  if ((v7 & 8) == 0)
    return v4;
LABEL_18:
  v12 = *(int *)(a1 + 32);
  if (v12 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C22600[v12];
  }
  if (a2)
    v14 = CFSTR("lookupResult");
  else
    v14 = CFSTR("lookup_result");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPlaceCacheLookup _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPlaceCacheLookup)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPlaceCacheLookup *)-[GEOLogMsgEventPlaceCacheLookup _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
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
        v6 = CFSTR("requestAppIdentifier");
      else
        v6 = CFSTR("request_app_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setRequestAppIdentifier:", v8);

      }
      if (a3)
        v9 = CFSTR("businessId");
      else
        v9 = CFSTR("business_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBusinessId:", objc_msgSend(v10, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v11, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBytes:", objc_msgSend(v12, "unsignedIntValue"));

      if (a3)
        v13 = CFSTR("lookupResult");
      else
        v13 = CFSTR("lookup_result");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNKNOWN")) & 1) != 0)
        {
          v16 = 0;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNAVAILABLE")) & 1) != 0)
        {
          v16 = 1;
        }
        else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_UNUSABLE")) & 1) != 0)
        {
          v16 = 2;
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PLACE_CACHE_LOOKUP_RESULT_USABLE")))
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
LABEL_34:

          goto LABEL_35;
        }
        v16 = objc_msgSend(v14, "intValue");
      }
      objc_msgSend(a1, "setLookupResult:", v16);
      goto LABEL_34;
    }
  }
LABEL_35:

  return a1;
}

- (GEOLogMsgEventPlaceCacheLookup)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPlaceCacheLookup *)-[GEOLogMsgEventPlaceCacheLookup _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPlaceCacheLookupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPlaceCacheLookupReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_requestAppIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOLogMsgEventPlaceCacheLookup readAll:](self, "readAll:", 0);
  if (self->_requestAppIdentifier)
    objc_msgSend(v5, "setRequestAppIdentifier:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = self->_businessId;
    *((_BYTE *)v5 + 36) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v5 + 6) = self->_bytes;
      *((_BYTE *)v5 + 36) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_localSearchProviderID;
  *((_BYTE *)v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((flags & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_lookupResult;
    *((_BYTE *)v5 + 36) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestAppIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_businessId;
    *(_BYTE *)(v5 + 36) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 24) = self->_bytes;
      *(_BYTE *)(v5 + 36) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_localSearchProviderID;
  *(_BYTE *)(v5 + 36) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_lookupResult;
    *(_BYTE *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestAppIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOLogMsgEventPlaceCacheLookup readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  requestAppIdentifier = self->_requestAppIdentifier;
  if ((unint64_t)requestAppIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestAppIdentifier, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_businessId != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 7))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_bytes != *((_DWORD *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_lookupResult != *((_DWORD *)v4 + 8))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgEventPlaceCacheLookup readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_requestAppIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761u * self->_businessId;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_localSearchProviderID;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_bytes;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_lookupResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 2))
    -[GEOLogMsgEventPlaceCacheLookup setRequestAppIdentifier:](self, "setRequestAppIdentifier:");
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 1) != 0)
  {
    self->_businessId = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 36);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 2) == 0)
        goto LABEL_6;
LABEL_11:
      self->_bytes = *((_DWORD *)v5 + 6);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 36) & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*((_BYTE *)v5 + 36) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_localSearchProviderID = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 36);
  if ((v4 & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v4 & 8) != 0)
  {
LABEL_7:
    self->_lookupResult = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppIdentifier, 0);
}

@end
