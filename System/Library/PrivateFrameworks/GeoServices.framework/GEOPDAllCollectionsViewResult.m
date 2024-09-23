@implementation GEOPDAllCollectionsViewResult

- (GEOPDAllCollectionsViewResult)init
{
  GEOPDAllCollectionsViewResult *v2;
  GEOPDAllCollectionsViewResult *v3;
  GEOPDAllCollectionsViewResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAllCollectionsViewResult;
  v2 = -[GEOPDAllCollectionsViewResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAllCollectionsViewResult)initWithData:(id)a3
{
  GEOPDAllCollectionsViewResult *v3;
  GEOPDAllCollectionsViewResult *v4;
  GEOPDAllCollectionsViewResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAllCollectionsViewResult;
  v3 = -[GEOPDAllCollectionsViewResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPublisherSuggestionResult
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDAllCollectionsViewResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherSuggestionResult_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setPublisherSuggestionResult:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 4u;
  *(_BYTE *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readResultFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAllCollectionsViewResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)resultFilters
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAllCollectionsViewResult _readResultFilters]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addResultFilter:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAllCollectionsViewResult _readResultFilters](a1);
    -[GEOPDAllCollectionsViewResult _addNoFlagsResultFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsResultFilter:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readCollectionIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAllCollectionsViewResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollectionIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)collectionIds
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAllCollectionsViewResult _readCollectionIds]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addCollectionId:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAllCollectionsViewResult _readCollectionIds](a1);
    -[GEOPDAllCollectionsViewResult _addNoFlagsCollectionId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsCollectionId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)GEOPDAllCollectionsViewResult;
  -[GEOPDAllCollectionsViewResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAllCollectionsViewResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAllCollectionsViewResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDAllCollectionsViewResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAllCollectionsViewResult _readPublisherSuggestionResult](a1);
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("publisherSuggestionResult");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("publisher_suggestion_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("resultFilter");
    else
      v17 = CFSTR("result_filter");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = *(id *)(a1 + 24);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v24, "jsonRepresentation");
          else
            objc_msgSend(v24, "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }

    if (a2)
      v26 = CFSTR("collectionId");
    else
      v26 = CFSTR("collection_id");
    objc_msgSend(v4, "setObject:forKey:", v18, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __59__GEOPDAllCollectionsViewResult__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAllCollectionsViewResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_172;
      else
        v6 = (int *)&readAll__nonRecursiveTag_173;
      GEOPDAllCollectionsViewResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDAllCollectionsViewResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __59__GEOPDAllCollectionsViewResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAllCollectionsViewResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 0);
    if (self->_publisherSuggestionResult)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_resultFilters;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_collectionIds;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAllCollectionsViewResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 0);
  v8 = -[GEOPDPublisherSuggestionResult copyWithZone:](self->_publisherSuggestionResult, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = self->_resultFilters;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "copyWithZone:", a3);
        -[GEOPDAllCollectionsViewResult addResultFilter:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_collectionIds;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        -[GEOPDAllCollectionsViewResult addCollectionId:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDPublisherSuggestionResult *publisherSuggestionResult;
  NSMutableArray *resultFilters;
  NSMutableArray *collectionIds;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 1),
         -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)v4, 1),
         publisherSuggestionResult = self->_publisherSuggestionResult,
         !((unint64_t)publisherSuggestionResult | v4[4]))
     || -[GEOPDPublisherSuggestionResult isEqual:](publisherSuggestionResult, "isEqual:"))
    && ((resultFilters = self->_resultFilters, !((unint64_t)resultFilters | v4[5]))
     || -[NSMutableArray isEqual:](resultFilters, "isEqual:")))
  {
    collectionIds = self->_collectionIds;
    if ((unint64_t)collectionIds | v4[3])
      v8 = -[NSMutableArray isEqual:](collectionIds, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOPDAllCollectionsViewResult readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDPublisherSuggestionResult hash](self->_publisherSuggestionResult, "hash");
  v4 = -[NSMutableArray hash](self->_resultFilters, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_collectionIds, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_publisherSuggestionResult, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
