@implementation GEOPBCompanionSubscriptionsInfo

- (GEOPBCompanionSubscriptionsInfo)init
{
  GEOPBCompanionSubscriptionsInfo *v2;
  GEOPBCompanionSubscriptionsInfo *v3;
  GEOPBCompanionSubscriptionsInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  v2 = -[GEOPBCompanionSubscriptionsInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBCompanionSubscriptionsInfo)initWithData:(id)a3
{
  GEOPBCompanionSubscriptionsInfo *v3;
  GEOPBCompanionSubscriptionsInfo *v4;
  GEOPBCompanionSubscriptionsInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  v3 = -[GEOPBCompanionSubscriptionsInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLoadedSubscriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionsInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLoadedSubscriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)loadedSubscriptions
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  return self->_loadedSubscriptions;
}

- (void)setLoadedSubscriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *loadedSubscriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  loadedSubscriptions = self->_loadedSubscriptions;
  self->_loadedSubscriptions = v4;

}

- (void)clearLoadedSubscriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_loadedSubscriptions, "removeAllObjects");
}

- (void)addLoadedSubscription:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  -[GEOPBCompanionSubscriptionsInfo _addNoFlagsLoadedSubscription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLoadedSubscription:(uint64_t)a1
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

- (unint64_t)loadedSubscriptionsCount
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_loadedSubscriptions, "count");
}

- (id)loadedSubscriptionAtIndex:(unint64_t)a3
{
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_loadedSubscriptions, "objectAtIndex:", a3);
}

+ (Class)loadedSubscriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readOfflineTileMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPBCompanionSubscriptionsInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineTileMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasOfflineTileMetadata
{
  -[GEOPBCompanionSubscriptionsInfo _readOfflineTileMetadata]((uint64_t)self);
  return self->_offlineTileMetadata != 0;
}

- (GEOPBOfflineTileMetadata)offlineTileMetadata
{
  -[GEOPBCompanionSubscriptionsInfo _readOfflineTileMetadata]((uint64_t)self);
  return self->_offlineTileMetadata;
}

- (void)setOfflineTileMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_offlineTileMetadata, a3);
}

- (double)offlineLastUpdatedTimestamp
{
  return self->_offlineLastUpdatedTimestamp;
}

- (void)setOfflineLastUpdatedTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_offlineLastUpdatedTimestamp = a3;
}

- (void)setHasOfflineLastUpdatedTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasOfflineLastUpdatedTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)padding
{
  return self->_padding;
}

- (void)setPadding:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_padding = a3;
}

- (void)setHasPadding:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPadding
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOPBCompanionSubscriptionsInfo;
  -[GEOPBCompanionSubscriptionsInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBCompanionSubscriptionsInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBCompanionSubscriptionsInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  char v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("loadedSubscription");
    else
      v13 = CFSTR("loaded_subscription");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "offlineTileMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("offlineTileMetadata");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("offline_tile_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  v18 = *(_BYTE *)(a1 + 64);
  if ((v18 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("offlineLastUpdatedTimestamp");
    else
      v20 = CFSTR("offline_last_updated_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v18 = *(_BYTE *)(a1 + 64);
  }
  if ((v18 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("padding"));

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __61__GEOPBCompanionSubscriptionsInfo__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBCompanionSubscriptionsInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPBCompanionSubscriptionsInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBCompanionSubscriptionsInfo)initWithDictionary:(id)a3
{
  return (GEOPBCompanionSubscriptionsInfo *)-[GEOPBCompanionSubscriptionsInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOPBCompanionSubscription *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOPBOfflineTileMetadata *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("loadedSubscription");
      else
        v6 = CFSTR("loaded_subscription");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v25 = v7;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOPBCompanionSubscription alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOPBCompanionSubscription initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOPBCompanionSubscription initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addLoadedSubscription:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v10);
        }

        v7 = v25;
      }

      if (a3)
        v17 = CFSTR("offlineTileMetadata");
      else
        v17 = CFSTR("offline_tile_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOPBOfflineTileMetadata alloc];
        if (v19)
          v20 = (void *)-[GEOPBOfflineTileMetadata _initWithDictionary:isJSON:](v19, v18);
        else
          v20 = 0;
        objc_msgSend(a1, "setOfflineTileMetadata:", v20);

      }
      if (a3)
        v21 = CFSTR("offlineLastUpdatedTimestamp");
      else
        v21 = CFSTR("offline_last_updated_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(a1, "setOfflineLastUpdatedTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("padding"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPadding:", objc_msgSend(v23, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPBCompanionSubscriptionsInfo)initWithJSON:(id)a3
{
  return (GEOPBCompanionSubscriptionsInfo *)-[GEOPBCompanionSubscriptionsInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_166_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_167_0;
    GEOPBCompanionSubscriptionsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPBCompanionSubscriptionsInfoCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBCompanionSubscriptionsInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBCompanionSubscriptionsInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_loadedSubscriptions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_offlineTileMetadata)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPBCompanionSubscriptionsInfo _readLoadedSubscriptions]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_loadedSubscriptions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id *v9;

  v9 = (id *)a3;
  -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPBCompanionSubscriptionsInfo loadedSubscriptionsCount](self, "loadedSubscriptionsCount"))
  {
    objc_msgSend(v9, "clearLoadedSubscriptions");
    v4 = -[GEOPBCompanionSubscriptionsInfo loadedSubscriptionsCount](self, "loadedSubscriptionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPBCompanionSubscriptionsInfo loadedSubscriptionAtIndex:](self, "loadedSubscriptionAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addLoadedSubscription:", v7);

      }
    }
  }
  if (self->_offlineTileMetadata)
    objc_msgSend(v9, "setOfflineTileMetadata:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v9[4] = *(id *)&self->_offlineLastUpdatedTimestamp;
    *((_BYTE *)v9 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v9 + 60) = self->_padding;
    *((_BYTE *)v9 + 64) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  char flags;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      GEOPBCompanionSubscriptionsInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_loadedSubscriptions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addLoadedSubscription:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = -[GEOPBOfflineTileMetadata copyWithZone:](self->_offlineTileMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_offlineLastUpdatedTimestamp;
    *(_BYTE *)(v5 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 60) = self->_padding;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *loadedSubscriptions;
  GEOPBOfflineTileMetadata *offlineTileMetadata;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  loadedSubscriptions = self->_loadedSubscriptions;
  if ((unint64_t)loadedSubscriptions | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](loadedSubscriptions, "isEqual:"))
      goto LABEL_13;
  }
  offlineTileMetadata = self->_offlineTileMetadata;
  if ((unint64_t)offlineTileMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPBOfflineTileMetadata isEqual:](offlineTileMetadata, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_offlineLastUpdatedTimestamp != *((double *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_13;
  }
  v7 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0)
    {
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    if (self->_padding)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_13;
    }
    v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  char flags;
  unint64_t v6;
  double offlineLastUpdatedTimestamp;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_loadedSubscriptions, "hash");
  v4 = -[GEOPBOfflineTileMetadata hash](self->_offlineTileMetadata, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    offlineLastUpdatedTimestamp = self->_offlineLastUpdatedTimestamp;
    v8 = -offlineLastUpdatedTimestamp;
    if (offlineLastUpdatedTimestamp >= 0.0)
      v8 = self->_offlineLastUpdatedTimestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((flags & 2) != 0)
    v11 = 2654435761 * self->_padding;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPBOfflineTileMetadata *offlineTileMetadata;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[GEOPBCompanionSubscriptionsInfo addLoadedSubscription:](self, "addLoadedSubscription:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  offlineTileMetadata = self->_offlineTileMetadata;
  v11 = *((_QWORD *)v4 + 5);
  if (offlineTileMetadata)
  {
    if (v11)
      -[GEOPBOfflineTileMetadata mergeFrom:]((uint64_t)offlineTileMetadata, v11);
  }
  else if (v11)
  {
    -[GEOPBCompanionSubscriptionsInfo setOfflineTileMetadata:](self, "setOfflineTileMetadata:", *((_QWORD *)v4 + 5));
  }
  v12 = *((_BYTE *)v4 + 64);
  if ((v12 & 1) != 0)
  {
    self->_offlineLastUpdatedTimestamp = *((double *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v12 = *((_BYTE *)v4 + 64);
  }
  if ((v12 & 2) != 0)
  {
    self->_padding = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPBCompanionSubscriptionsInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_170);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPBCompanionSubscriptionsInfo readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_loadedSubscriptions;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineTileMetadata, 0);
  objc_storeStrong((id *)&self->_loadedSubscriptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
