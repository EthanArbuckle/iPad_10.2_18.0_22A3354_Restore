@implementation GEOFormattedStringMetaData

- (int)realtimeStatus
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_realtimeStatus;
  else
    return 0;
}

- (void)setRealtimeStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_realtimeStatus = a3;
}

- (void)setHasRealtimeStatus:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRealtimeStatus
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)realtimeStatusAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C08198[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRealtimeStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_ON_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_DELAYED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_EARLY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_CANCELLED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_STOP_SKIPPED")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_STATUS_NO_SERVICE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)spokenPrivacyFilterType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_spokenPrivacyFilterType;
  else
    return 0;
}

- (void)setSpokenPrivacyFilterType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_spokenPrivacyFilterType = a3;
}

- (void)setHasSpokenPrivacyFilterType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSpokenPrivacyFilterType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)spokenPrivacyFilterTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C08200[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSpokenPrivacyFilterType:(id)a3
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
  v8.super_class = (Class)GEOFormattedStringMetaData;
  -[GEOFormattedStringMetaData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFormattedStringMetaData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormattedStringMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    v6 = *(int *)(a1 + 16);
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C08198[v6];
    }
    if (a2)
      v8 = CFSTR("realtimeStatus");
    else
      v8 = CFSTR("realtime_status");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    v9 = *(int *)(a1 + 20);
    if (v9 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C08200[v9];
    }
    if (a2)
      v11 = CFSTR("spokenPrivacyFilterType");
    else
      v11 = CFSTR("spoken_privacy_filter_type");
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
      v19[2] = __56__GEOFormattedStringMetaData__dictionaryRepresentation___block_invoke;
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
  return -[GEOFormattedStringMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOFormattedStringMetaData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOFormattedStringMetaData)initWithDictionary:(id)a3
{
  return (GEOFormattedStringMetaData *)-[GEOFormattedStringMetaData _initWithDictionary:isJSON:](self, a3, 0);
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
  id v12;
  uint64_t v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("realtimeStatus");
      else
        v6 = CFSTR("realtime_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_ON_TIME")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_DELAYED")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_EARLY")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_CANCELLED")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_STOP_SKIPPED")) & 1) != 0)
        {
          v9 = 5;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("REALTIME_STATUS_NO_SERVICE")))
        {
          v9 = 6;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setRealtimeStatus:", v9);
LABEL_26:

      if (a3)
        v10 = CFSTR("spokenPrivacyFilterType");
      else
        v10 = CFSTR("spoken_privacy_filter_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVACY_FILTER_UNKNOWN")) & 1) != 0)
        {
          v13 = 0;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVACY_FILTER_PUBLIC")) & 1) != 0)
        {
          v13 = 1;
        }
        else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVACY_FILTER_AMBIGUOUS")) & 1) != 0)
        {
          v13 = 2;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("PRIVACY_FILTER_PRIVATE")))
        {
          v13 = 3;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_43:

          goto LABEL_44;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setSpokenPrivacyFilterType:", v13);
      goto LABEL_43;
    }
  }
LABEL_44:

  return a1;
}

- (GEOFormattedStringMetaData)initWithJSON:(id)a3
{
  return (GEOFormattedStringMetaData *)-[GEOFormattedStringMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormattedStringMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormattedStringMetaDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOFormattedStringMetaData readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[4] = self->_realtimeStatus;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_spokenPrivacyFilterType;
    *((_BYTE *)v5 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_realtimeStatus;
    *(_BYTE *)(v4 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_spokenPrivacyFilterType;
    *(_BYTE *)(v4 + 24) |= 2u;
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
  -[GEOFormattedStringMetaData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_realtimeStatus != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_spokenPrivacyFilterType != *((_DWORD *)v4 + 5))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOFormattedStringMetaData readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_realtimeStatus;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_spokenPrivacyFilterType;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_realtimeStatus = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_spokenPrivacyFilterType = v5[5];
    *(_BYTE *)&self->_flags |= 2u;
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
    -[GEOFormattedStringMetaData readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
