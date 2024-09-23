@implementation GEOSuggestionsOptions

- (GEOSuggestionsOptions)init
{
  GEOSuggestionsOptions *v2;
  GEOSuggestionsOptions *v3;
  GEOSuggestionsOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSuggestionsOptions;
  v2 = -[GEOSuggestionsOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSuggestionsOptions)initWithData:(id)a3
{
  GEOSuggestionsOptions *v3;
  GEOSuggestionsOptions *v4;
  GEOSuggestionsOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSuggestionsOptions;
  v3 = -[GEOSuggestionsOptions initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSuggestionMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 64) |= 0x40u;
  *(_BYTE *)(a1 + 64) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)setSuggestionEntryMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 64) |= 0x20u;
  *(_BYTE *)(a1 + 64) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);

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
  v8.super_class = (Class)GEOSuggestionsOptions;
  -[GEOSuggestionsOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSuggestionsOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionsOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  -[GEOSuggestionsOptions readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 56);
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C0F328[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("listType"));

    v5 = *(_BYTE *)(a1 + 64);
  }
  if ((v5 & 1) != 0)
  {
    v8 = *(int *)(a1 + 52);
    if (v8 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C0F340[v8];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("entriesType"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 64) & 0x40) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOSuggestionsOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionMetadata_tags_2871);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v12 = *(id *)(a1 + 32);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("suggestionMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("suggestionMetadata"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 64) & 0x20) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOSuggestionsOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadata_tags_2872);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v17 = *(id *)(a1 + 24);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("suggestionEntryMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("suggestionEntryMetadata"));
    }
  }

  v20 = *(_BYTE *)(a1 + 64);
  if ((v20 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 61));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("normalizePOIs"));

    v20 = *(_BYTE *)(a1 + 64);
  }
  if ((v20 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("includeRankingFeatures"));

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __51__GEOSuggestionsOptions__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSuggestionsOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2881;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2882;
      GEOSuggestionsOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __51__GEOSuggestionsOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOSuggestionsOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
  char v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0x1Fu))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSuggestionsOptions readAll:]((uint64_t)self, 0);
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    v6 = v10;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v10;
    }
    if (self->_suggestionMetadata)
    {
      PBDataWriterWriteDataField();
      v6 = v10;
    }
    if (self->_suggestionEntryMetadata)
    {
      PBDataWriterWriteDataField();
      v6 = v10;
    }
    v7 = (char)self->_flags;
    if ((v7 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v10;
      v7 = (char)self->_flags;
    }
    if ((v7 & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  PBUnknownFields *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOSuggestionsOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_listType;
    *(_BYTE *)(v5 + 64) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_entriesType;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_suggestionMetadata, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSData copyWithZone:](self->_suggestionEntryMetadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = (char)self->_flags;
  if ((v14 & 8) != 0)
  {
    *(_BYTE *)(v5 + 61) = self->_normalizePOIs;
    *(_BYTE *)(v5 + 64) |= 8u;
    v14 = (char)self->_flags;
  }
  if ((v14 & 4) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_includeRankingFeatures;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *suggestionMetadata;
  NSData *suggestionEntryMetadata;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 1);
  -[GEOSuggestionsOptions readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_listType != *((_DWORD *)v4 + 14))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_entriesType != *((_DWORD *)v4 + 13))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_26;
  }
  suggestionMetadata = self->_suggestionMetadata;
  if ((unint64_t)suggestionMetadata | *((_QWORD *)v4 + 4)
    && !-[NSData isEqual:](suggestionMetadata, "isEqual:"))
  {
    goto LABEL_26;
  }
  suggestionEntryMetadata = self->_suggestionEntryMetadata;
  if ((unint64_t)suggestionEntryMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](suggestionEntryMetadata, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0)
      goto LABEL_26;
    if (self->_normalizePOIs)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_26;
  }
  v7 = (*((_BYTE *)v4 + 64) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) != 0)
    {
      if (self->_includeRankingFeatures)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_26;
      }
      else if (*((_BYTE *)v4 + 60))
      {
        goto LABEL_26;
      }
      v7 = 1;
      goto LABEL_27;
    }
LABEL_26:
    v7 = 0;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOSuggestionsOptions readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_listType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_entriesType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_suggestionMetadata, "hash");
  v6 = -[NSData hash](self->_suggestionEntryMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v7 = 2654435761 * self->_normalizePOIs;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761 * self->_includeRankingFeatures;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
