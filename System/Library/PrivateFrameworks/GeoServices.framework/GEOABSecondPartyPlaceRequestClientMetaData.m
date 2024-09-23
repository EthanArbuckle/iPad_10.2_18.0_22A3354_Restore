@implementation GEOABSecondPartyPlaceRequestClientMetaData

- (GEOPDABClientDatasetMetadata)clientDatasetMetadata
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientDatasetMetadata]((uint64_t)self);
  return self->_clientDatasetMetadata;
}

- (void)_readClientDatasetMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientDatasetMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
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
  if (self->_reader && (_GEOABSecondPartyPlaceRequestClientMetaDataIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_serverAbAssignments;
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
    v10 = self->_clientConfigs;
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

    if (self->_clientDatasetMetadata)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

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
      v8 = (int *)&readAll__recursiveTag_572;
    else
      v8 = (int *)&readAll__nonRecursiveTag_573;
    GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOABSecondPartyPlaceRequestClientMetaDataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOABSecondPartyPlaceRequestClientMetaData)init
{
  GEOABSecondPartyPlaceRequestClientMetaData *v2;
  GEOABSecondPartyPlaceRequestClientMetaData *v3;
  GEOABSecondPartyPlaceRequestClientMetaData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  v2 = -[GEOABSecondPartyPlaceRequestClientMetaData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithData:(id)a3
{
  GEOABSecondPartyPlaceRequestClientMetaData *v3;
  GEOABSecondPartyPlaceRequestClientMetaData *v4;
  GEOABSecondPartyPlaceRequestClientMetaData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  v3 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readServerAbAssignments
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
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServerAbAssignments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)serverAbAssignments
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  return self->_serverAbAssignments;
}

- (void)setServerAbAssignments:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serverAbAssignments;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  serverAbAssignments = self->_serverAbAssignments;
  self->_serverAbAssignments = v4;

}

- (void)clearServerAbAssignments
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_serverAbAssignments, "removeAllObjects");
}

- (void)addServerAbAssignment:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  -[GEOABSecondPartyPlaceRequestClientMetaData _addNoFlagsServerAbAssignment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsServerAbAssignment:(uint64_t)a1
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

- (unint64_t)serverAbAssignmentsCount
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  return -[NSMutableArray count](self->_serverAbAssignments, "count");
}

- (id)serverAbAssignmentAtIndex:(unint64_t)a3
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readServerAbAssignments]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serverAbAssignments, "objectAtIndex:", a3);
}

+ (Class)serverAbAssignmentType
{
  return (Class)objc_opt_class();
}

- (void)_readClientConfigs
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
        GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientConfigs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)clientConfigs
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  return self->_clientConfigs;
}

- (void)setClientConfigs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *clientConfigs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  clientConfigs = self->_clientConfigs;
  self->_clientConfigs = v4;

}

- (void)clearClientConfigs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_clientConfigs, "removeAllObjects");
}

- (void)addClientConfig:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  -[GEOABSecondPartyPlaceRequestClientMetaData _addNoFlagsClientConfig:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsClientConfig:(uint64_t)a1
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

- (unint64_t)clientConfigsCount
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  return -[NSMutableArray count](self->_clientConfigs, "count");
}

- (id)clientConfigAtIndex:(unint64_t)a3
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientConfigs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_clientConfigs, "objectAtIndex:", a3);
}

+ (Class)clientConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientDatasetMetadata
{
  -[GEOABSecondPartyPlaceRequestClientMetaData _readClientDatasetMetadata]((uint64_t)self);
  return self->_clientDatasetMetadata != 0;
}

- (void)setClientDatasetMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_clientDatasetMetadata, a3);
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
  v8.super_class = (Class)GEOABSecondPartyPlaceRequestClientMetaData;
  -[GEOABSecondPartyPlaceRequestClientMetaData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABSecondPartyPlaceRequestClientMetaData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABSecondPartyPlaceRequestClientMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("serverAbAssignment");
    else
      v13 = CFSTR("server_ab_assignment");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v15 = *(id *)(a1 + 24);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("clientConfig");
    else
      v22 = CFSTR("client_config");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  objc_msgSend((id)a1, "clientDatasetMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("clientDatasetMetadata");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("client_dataset_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

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
      v34[2] = __72__GEOABSecondPartyPlaceRequestClientMetaData__dictionaryRepresentation___block_invoke;
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
  return -[GEOABSecondPartyPlaceRequestClientMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __72__GEOABSecondPartyPlaceRequestClientMetaData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithDictionary:(id)a3
{
  return (GEOABSecondPartyPlaceRequestClientMetaData *)-[GEOABSecondPartyPlaceRequestClientMetaData _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOABExperimentAssignment *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOABClientConfig *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDABClientDatasetMetadata *v30;
  uint64_t v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("serverAbAssignment");
      else
        v6 = CFSTR("server_ab_assignment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v34 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOABExperimentAssignment alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOABExperimentAssignment initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOABExperimentAssignment initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addServerAbAssignment:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          }
          while (v10);
        }

        v5 = v34;
      }

      if (a3)
        v17 = CFSTR("clientConfig");
      else
        v17 = CFSTR("client_config");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v36 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOABClientConfig alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOABClientConfig initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOABClientConfig initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addClientConfig:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v21);
        }

        v5 = v34;
      }

      if (a3)
        v28 = CFSTR("clientDatasetMetadata");
      else
        v28 = CFSTR("client_dataset_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEOPDABClientDatasetMetadata alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEOPDABClientDatasetMetadata initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEOPDABClientDatasetMetadata initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setClientDatasetMetadata:", v31);

      }
    }
  }

  return a1;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)initWithJSON:(id)a3
{
  return (GEOABSecondPartyPlaceRequestClientMetaData *)-[GEOABSecondPartyPlaceRequestClientMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABSecondPartyPlaceRequestClientMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABSecondPartyPlaceRequestClientMetaDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 12) = self->_readerMarkPos;
  *((_DWORD *)v12 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOABSecondPartyPlaceRequestClientMetaData serverAbAssignmentsCount](self, "serverAbAssignmentsCount"))
  {
    objc_msgSend(v12, "clearServerAbAssignments");
    v4 = -[GEOABSecondPartyPlaceRequestClientMetaData serverAbAssignmentsCount](self, "serverAbAssignmentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOABSecondPartyPlaceRequestClientMetaData serverAbAssignmentAtIndex:](self, "serverAbAssignmentAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addServerAbAssignment:", v7);

      }
    }
  }
  if (-[GEOABSecondPartyPlaceRequestClientMetaData clientConfigsCount](self, "clientConfigsCount"))
  {
    objc_msgSend(v12, "clearClientConfigs");
    v8 = -[GEOABSecondPartyPlaceRequestClientMetaData clientConfigsCount](self, "clientConfigsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOABSecondPartyPlaceRequestClientMetaData clientConfigAtIndex:](self, "clientConfigAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addClientConfig:", v11);

      }
    }
  }
  if (self->_clientDatasetMetadata)
    objc_msgSend(v12, "setClientDatasetMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
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
      GEOABSecondPartyPlaceRequestClientMetaDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_serverAbAssignments;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addServerAbAssignment:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_clientConfigs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addClientConfig:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v18 = -[GEOPDABClientDatasetMetadata copyWithZone:](self->_clientDatasetMetadata, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *serverAbAssignments;
  NSMutableArray *clientConfigs;
  GEOPDABClientDatasetMetadata *clientDatasetMetadata;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         serverAbAssignments = self->_serverAbAssignments,
         !((unint64_t)serverAbAssignments | v4[5]))
     || -[NSMutableArray isEqual:](serverAbAssignments, "isEqual:"))
    && ((clientConfigs = self->_clientConfigs, !((unint64_t)clientConfigs | v4[3]))
     || -[NSMutableArray isEqual:](clientConfigs, "isEqual:")))
  {
    clientDatasetMetadata = self->_clientDatasetMetadata;
    if ((unint64_t)clientDatasetMetadata | v4[4])
      v8 = -[GEOPDABClientDatasetMetadata isEqual:](clientDatasetMetadata, "isEqual:");
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
  uint64_t v3;
  uint64_t v4;

  -[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_serverAbAssignments, "hash");
  v4 = -[NSMutableArray hash](self->_clientConfigs, "hash") ^ v3;
  return v4 ^ -[GEOPDABClientDatasetMetadata hash](self->_clientDatasetMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  GEOPDABClientDatasetMetadata *clientDatasetMetadata;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[GEOABSecondPartyPlaceRequestClientMetaData addServerAbAssignment:](self, "addServerAbAssignment:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[GEOABSecondPartyPlaceRequestClientMetaData addClientConfig:](self, "addClientConfig:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  clientDatasetMetadata = self->_clientDatasetMetadata;
  v16 = v4[4];
  if (clientDatasetMetadata)
  {
    if (v16)
      -[GEOPDABClientDatasetMetadata mergeFrom:](clientDatasetMetadata, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOABSecondPartyPlaceRequestClientMetaData setClientDatasetMetadata:](self, "setClientDatasetMetadata:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOABSecondPartyPlaceRequestClientMetaDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_576);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOABSecondPartyPlaceRequestClientMetaData readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_serverAbAssignments;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_clientConfigs;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOPDABClientDatasetMetadata clearUnknownFields:](self->_clientDatasetMetadata, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAbAssignments, 0);
  objc_storeStrong((id *)&self->_clientDatasetMetadata, 0);
  objc_storeStrong((id *)&self->_clientConfigs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
