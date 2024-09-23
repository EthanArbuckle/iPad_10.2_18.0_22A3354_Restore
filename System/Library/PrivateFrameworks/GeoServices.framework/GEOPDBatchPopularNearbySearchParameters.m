@implementation GEOPDBatchPopularNearbySearchParameters

- (GEOPDBatchPopularNearbySearchParameters)init
{
  GEOPDBatchPopularNearbySearchParameters *v2;
  GEOPDBatchPopularNearbySearchParameters *v3;
  GEOPDBatchPopularNearbySearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  v2 = -[GEOPDBatchPopularNearbySearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDBatchPopularNearbySearchParameters)initWithData:(id)a3
{
  GEOPDBatchPopularNearbySearchParameters *v3;
  GEOPDBatchPopularNearbySearchParameters *v4;
  GEOPDBatchPopularNearbySearchParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  v3 = -[GEOPDBatchPopularNearbySearchParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1684);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 64) |= 0x10u;
  *(_BYTE *)(a1 + 64) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readSuggestionEntryMetadatas
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestionEntryMetadatas_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (id)suggestionEntryMetadatas
{
  -[GEOPDBatchPopularNearbySearchParameters _readSuggestionEntryMetadatas](a1);
  return *(id *)(a1 + 32);
}

- (void)addSuggestionEntryMetadata:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDBatchPopularNearbySearchParameters _readSuggestionEntryMetadatas](a1);
    -[GEOPDBatchPopularNearbySearchParameters _addNoFlagsSuggestionEntryMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsSuggestionEntryMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDBatchPopularNearbySearchParameters;
  -[GEOPDBatchPopularNearbySearchParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBatchPopularNearbySearchParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBatchPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDBatchPopularNearbySearchParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 64) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("maxResults");
    else
      v6 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  -[GEOPDBatchPopularNearbySearchParameters _readViewportInfo](a1);
  v7 = *(id *)(a1 + 40);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("requestLocalTimestamp");
    else
      v12 = CFSTR("request_local_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (a2)
    {
      v13 = (void *)MEMORY[0x1E0C99DE8];
      -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v18);
      }

      v22 = CFSTR("suggestionEntryMetadata");
    }
    else
    {
      -[GEOPDBatchPopularNearbySearchParameters suggestionEntryMetadatas](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("suggestion_entry_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v22);

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
      v30[2] = __69__GEOPDBatchPopularNearbySearchParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDBatchPopularNearbySearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1693;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1694;
      GEOPDBatchPopularNearbySearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 40), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __69__GEOPDBatchPopularNearbySearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDBatchPopularNearbySearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_viewportInfo)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_suggestionEntryMetadatas;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteDataField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PBUnknownFields *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDBatchPopularNearbySearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v9 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_requestLocalTimestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_suggestionEntryMetadatas;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        -[GEOPDBatchPopularNearbySearchParameters addSuggestionEntryMetadata:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDViewportInfo *viewportInfo;
  NSMutableArray *suggestionEntryMetadatas;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)v4, 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 64);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_maxResults != *((_DWORD *)v4 + 15))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_17;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
    {
LABEL_17:
      v9 = 0;
      goto LABEL_18;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_requestLocalTimestamp != *((double *)v4 + 3))
      goto LABEL_17;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_17;
  }
  suggestionEntryMetadatas = self->_suggestionEntryMetadatas;
  if ((unint64_t)suggestionEntryMetadatas | *((_QWORD *)v4 + 4))
    v9 = -[NSMutableArray isEqual:](suggestionEntryMetadatas, "isEqual:");
  else
    v9 = 1;
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double requestLocalTimestamp;
  double v7;
  long double v8;
  double v9;

  -[GEOPDBatchPopularNearbySearchParameters readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_maxResults;
  else
    v3 = 0;
  v4 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    requestLocalTimestamp = self->_requestLocalTimestamp;
    v7 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0)
      v7 = self->_requestLocalTimestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_suggestionEntryMetadatas, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_suggestionEntryMetadatas, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
