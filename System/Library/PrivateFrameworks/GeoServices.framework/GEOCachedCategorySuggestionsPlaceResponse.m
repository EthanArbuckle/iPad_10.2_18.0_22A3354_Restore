@implementation GEOCachedCategorySuggestionsPlaceResponse

- (GEOCachedCategorySuggestionsPlaceResponse)init
{
  GEOCachedCategorySuggestionsPlaceResponse *v2;
  GEOCachedCategorySuggestionsPlaceResponse *v3;
  GEOCachedCategorySuggestionsPlaceResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  v2 = -[GEOCachedCategorySuggestionsPlaceResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCachedCategorySuggestionsPlaceResponse)initWithData:(id)a3
{
  GEOCachedCategorySuggestionsPlaceResponse *v3;
  GEOCachedCategorySuggestionsPlaceResponse *v4;
  GEOCachedCategorySuggestionsPlaceResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  v3 = -[GEOCachedCategorySuggestionsPlaceResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponse_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasResponse
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readResponse]((uint64_t)self);
  return self->_response != 0;
}

- (GEOPDPlaceResponse)response
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readResponse]((uint64_t)self);
  return self->_response;
}

- (void)setResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_response, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readSourceURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceURL_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSourceURL
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readSourceURL]((uint64_t)self);
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readSourceURL]((uint64_t)self);
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCountryCode
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readCountryCode]((uint64_t)self);
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readCountryCode]((uint64_t)self);
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)_readLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguage_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLanguage
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readLanguage]((uint64_t)self);
  return self->_language != 0;
}

- (NSString)language
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readLanguage]((uint64_t)self);
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_language, a3);
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
  v8.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  -[GEOCachedCategorySuggestionsPlaceResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCachedCategorySuggestionsPlaceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCachedCategorySuggestionsPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  objc_msgSend((id)a1, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("response"));

  }
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "sourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("sourceURL"));

  objc_msgSend((id)a1, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("countryCode"));

  objc_msgSend((id)a1, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("language"));

  v12 = *(void **)(a1 + 16);
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
      v19[2] = __71__GEOCachedCategorySuggestionsPlaceResponse__dictionaryRepresentation___block_invoke;
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
  return -[GEOCachedCategorySuggestionsPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __71__GEOCachedCategorySuggestionsPlaceResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCachedCategorySuggestionsPlaceResponse)initWithDictionary:(id)a3
{
  return (GEOCachedCategorySuggestionsPlaceResponse *)-[GEOCachedCategorySuggestionsPlaceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEOPDPlaceResponse *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("response"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOPDPlaceResponse alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOPDPlaceResponse initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOPDPlaceResponse initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setResponse:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setSourceURL:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setCountryCode:", v14);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("language"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setLanguage:", v16);

      }
    }
  }

  return a1;
}

- (GEOCachedCategorySuggestionsPlaceResponse)initWithJSON:(id)a3
{
  return (GEOCachedCategorySuggestionsPlaceResponse *)-[GEOCachedCategorySuggestionsPlaceResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_121;
    else
      v8 = (int *)&readAll__nonRecursiveTag_122;
    GEOCachedCategorySuggestionsPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPDPlaceResponse readAll:](self->_response, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v6;
          v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *v6;
      v17 = *((unsigned __int8 *)a3 + v16);
      if (*((_BYTE *)a3 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOPDPlaceResponseIsValid((char *)a3))
            goto LABEL_38;
          PBReaderRecallMark();
          goto LABEL_33;
        case 2u:
          if (v18 != 1)
            goto LABEL_38;
          v20 = *v4;
          v21 = *(_QWORD *)((char *)a3 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && (v22 = v21 + 8, v22 <= *(_QWORD *)((char *)a3 + *v5)))
            *(_QWORD *)((char *)a3 + v20) = v22;
          else
            *((_BYTE *)a3 + v16) = 1;
          goto LABEL_33;
        case 3u:
          if (v18 == 2)
            goto LABEL_32;
          goto LABEL_38;
        case 4u:
          if (v18 == 2)
            goto LABEL_32;
          goto LABEL_38;
        case 5u:
          if (v18 == 2)
            goto LABEL_32;
          goto LABEL_38;
        default:
LABEL_32:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
          {
LABEL_38:
            PBReaderRecallMark();
            return 0;
          }
LABEL_33:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_36;
          break;
      }
    }
  }
LABEL_36:
  v23 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v23;
}

- (BOOL)readFrom:(id)a3
{
  return GEOCachedCategorySuggestionsPlaceResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x40) != 0)
    goto LABEL_7;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((GEOPDPlaceResponseIsDirty((os_unfair_lock_s *)self->_response) & 1) != 0)
      goto LABEL_7;
    flags = (char)self->_flags;
  }
  if ((flags & 0x2C) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_18;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 0);
  if (self->_response)
    PBDataWriterWriteSubmessage();
  v6 = v9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v9;
  }
  if (self->_sourceURL)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v6 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
LABEL_18:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  void *v5;
  int HasSensitiveFields;
  void *v7;
  id *v8;

  if (-[GEOCachedCategorySuggestionsPlaceResponse hasResponse](self, "hasResponse")
    && (-[GEOCachedCategorySuggestionsPlaceResponse response](self, "response"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        HasSensitiveFields = GEOPDPlaceResponseHasSensitiveFields(v5, a3),
        v5,
        HasSensitiveFields))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse response](self, "response");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id *)objc_msgSend(v7, "copy");

    GEOPDPlaceResponseClearSensitiveFields(v8, a3, 0);
    -[GEOCachedCategorySuggestionsPlaceResponse setResponse:](self, "setResponse:", v8);
  }
  else
  {
    -[GEOCachedCategorySuggestionsPlaceResponse response](self, "response");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearSensitiveFields:", a3);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOCachedCategorySuggestionsPlaceResponse _readResponse]((uint64_t)self);
  return -[GEOPDPlaceResponse hasGreenTeaWithValue:](self->_response, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_response)
    objc_msgSend(v5, "setResponse:");
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[7] = *(id *)&self->_timestamp;
    *((_BYTE *)v5 + 76) |= 1u;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v5, "setSourceURL:");
    v4 = v5;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v5, "setCountryCode:");
    v4 = v5;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCachedCategorySuggestionsPlaceResponseReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 0);
  v9 = -[GEOPDPlaceResponse copyWithZone:](self->_response, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 56) = self->_timestamp;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_sourceURL, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPlaceResponse *response;
  NSString *sourceURL;
  NSString *countryCode;
  NSString *language;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  response = self->_response;
  if ((unint64_t)response | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPlaceResponse isEqual:](response, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_timestamp != *((double *)v4 + 7))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](sourceURL, "isEqual:"))
    goto LABEL_15;
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_15;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](language, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;

  -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 1);
  v3 = -[GEOPDPlaceResponse hash](self->_response, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v9 = v4 ^ v3;
  v10 = -[NSString hash](self->_sourceURL, "hash");
  v11 = v9 ^ v10 ^ -[NSString hash](self->_countryCode, "hash");
  return v11 ^ -[NSString hash](self->_language, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOPDPlaceResponse *response;
  uint64_t v5;
  double *v6;
  double *v7;

  v7 = (double *)a3;
  objc_msgSend(v7, "readAll:", 0);
  response = self->_response;
  v5 = *((_QWORD *)v7 + 5);
  if (response)
  {
    if (v5)
      -[GEOPDPlaceResponse mergeFrom:](response, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setResponse:](self, "setResponse:");
  }
  v6 = v7;
  if ((*((_BYTE *)v7 + 76) & 1) != 0)
  {
    self->_timestamp = v7[7];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v7 + 6))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setSourceURL:](self, "setSourceURL:");
    v6 = v7;
  }
  if (*((_QWORD *)v6 + 3))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setCountryCode:](self, "setCountryCode:");
    v6 = v7;
  }
  if (*((_QWORD *)v6 + 4))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setLanguage:](self, "setLanguage:");
    v6 = v7;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOCachedCategorySuggestionsPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_125);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOCachedCategorySuggestionsPlaceResponse readAll:](self, "readAll:", 0);
    -[GEOPDPlaceResponse clearUnknownFields:](self->_response, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
