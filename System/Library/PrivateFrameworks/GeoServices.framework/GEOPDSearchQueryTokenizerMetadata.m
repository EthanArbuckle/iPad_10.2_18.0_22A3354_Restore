@implementation GEOPDSearchQueryTokenizerMetadata

- (GEOPDSearchQueryTokenizerMetadata)init
{
  GEOPDSearchQueryTokenizerMetadata *v2;
  GEOPDSearchQueryTokenizerMetadata *v3;
  GEOPDSearchQueryTokenizerMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  v2 = -[GEOPDSearchQueryTokenizerMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryTokenizerMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryTokenizerMetadata *v3;
  GEOPDSearchQueryTokenizerMetadata *v4;
  GEOPDSearchQueryTokenizerMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  v3 = -[GEOPDSearchQueryTokenizerMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
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
  v8.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  -[GEOPDSearchQueryTokenizerMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryTokenizerMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTokenizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;

  if (a1)
  {
    -[GEOPDSearchQueryTokenizerMetadata readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_1610);
        objc_sync_exit(v6);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v7 = *(id *)(a1 + 16);
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("tokenSet");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("token_set");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v11 = *(int *)(a1 + 44);
      if (v11 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E1C0A908[v11];
      }
      if (a2)
        v13 = CFSTR("tokenizerType");
      else
        v13 = CFSTR("tokenizer_type");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenizerName_tags);
        objc_sync_exit(v15);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    v16 = *(id *)(a1 + 24);
    if (v16)
    {
      if (a2)
        v17 = CFSTR("tokenizerName");
      else
        v17 = CFSTR("tokenizer_name");
      objc_msgSend(v4, "setObject:forKey:", v16, v17);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryTokenizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1619;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1620;
      GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDSearchTokenSet readAll:](*(_QWORD *)(a1 + 16), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  GEOPDSearchTokenSet *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_40;
  if (a3)
    v7 = CFSTR("tokenSet");
  else
    v7 = CFSTR("token_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = [GEOPDSearchTokenSet alloc];
    if (v9)
      v10 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v9, v8, a3);
    else
      v10 = 0;
    v11 = v10;
    *(_BYTE *)(v6 + 48) |= 2u;
    *(_BYTE *)(v6 + 48) |= 8u;
    objc_storeStrong((id *)(v6 + 16), v10);

  }
  if (a3)
    v12 = CFSTR("tokenizerType");
  else
    v12 = CFSTR("tokenizer_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v13;
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v15 = 0;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TOKENIZER_STANDARD")) & 1) != 0)
    {
      v15 = 1;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TOKENIZER_WHITESPACE")) & 1) != 0)
    {
      v15 = 2;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TOKENIZER_ZH")) & 1) != 0)
    {
      v15 = 3;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ANALYZER_ZH")) & 1) != 0)
    {
      v15 = 4;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TOKENIZER_JP")) & 1) != 0)
    {
      v15 = 5;
    }
    else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ANALYZER_JP")) & 1) != 0)
    {
      v15 = 6;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("GEO_SEARCH_TOKENIZER_CJK")))
    {
      v15 = 7;
    }
    else
    {
      v15 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v13, "intValue");
LABEL_33:
    *(_BYTE *)(v6 + 48) |= 8u;
    *(_BYTE *)(v6 + 48) |= 1u;
    *(_DWORD *)(v6 + 44) = v15;
  }

  if (a3)
    v16 = CFSTR("tokenizerName");
  else
    v16 = CFSTR("tokenizer_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    v19 = v18;
    *(_BYTE *)(v6 + 48) |= 4u;
    *(_BYTE *)(v6 + 48) |= 8u;
    objc_storeStrong((id *)(v6 + 24), v18);

  }
LABEL_40:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTokenizerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryTokenizerMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_tokenSet)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_tokenizerName)
      PBDataWriterWriteStringField();
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryTokenizerMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_tokenizerType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_tokenizerName, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchTokenSet *tokenSet;
  NSString *tokenizerName;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)v4, 1);
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_tokenizerType != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  tokenizerName = self->_tokenizerName;
  if ((unint64_t)tokenizerName | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](tokenizerName, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_tokenizerType;
  else
    v4 = 0;
  return v4 ^ -[NSString hash](self->_tokenizerName, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerName, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
