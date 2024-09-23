@implementation GEOABAssignmentResponse

- (id)_clientConfigValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[GEOABAssignmentResponse clientConfig](self, "clientConfig", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configKeyValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "abConfigKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          objc_msgSend(v11, "abConfigValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "abConfigValueType") - 1;
          switch(v15)
          {
            case 0:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "intValue"));
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            case 1:
              v18 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "doubleValue");
              objc_msgSend(v18, "numberWithDouble:");
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            case 2:
              objc_msgSend(v14, "stringValue");
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            case 3:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "BOOLValue"));
              v17 = objc_claimAutoreleasedReturnValue();
              break;
            default:

              continue;
          }
          v16 = (void *)v17;

          goto LABEL_19;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v16 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (GEOABClientConfig)clientConfig
{
  -[GEOABAssignmentResponse _readClientConfig]((uint64_t)self);
  return self->_clientConfig;
}

- (void)_readClientConfig
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientConfig_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOABAssignmentResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOABAssignmentResponse)initWithData:(id)a3
{
  GEOABAssignmentResponse *v3;
  GEOABAssignmentResponse *v4;
  GEOABAssignmentResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOABAssignmentResponse;
  v3 = -[GEOABAssignmentResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)mapsAbClientMetadata
{
  -[GEOABAssignmentResponse _readMapsAbClientMetadata]((uint64_t)self);
  return self->_mapsAbClientMetadata;
}

- (void)_readMapsAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsAbClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOABSecondPartyPlaceRequestClientMetaData)parsecClientMetadata
{
  -[GEOABAssignmentResponse _readParsecClientMetadata]((uint64_t)self);
  return self->_parsecClientMetadata;
}

- (void)_readParsecClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParsecClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (GEOABAssignmentResponse)init
{
  GEOABAssignmentResponse *v2;
  GEOABAssignmentResponse *v3;
  GEOABAssignmentResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOABAssignmentResponse;
  v2 = -[GEOABAssignmentResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_readRequestGuid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestGuid_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRequestGuid
{
  -[GEOABAssignmentResponse _readRequestGuid]((uint64_t)self);
  return self->_requestGuid != 0;
}

- (NSString)requestGuid
{
  -[GEOABAssignmentResponse _readRequestGuid]((uint64_t)self);
  return self->_requestGuid;
}

- (void)setRequestGuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4800u;
  objc_storeStrong((id *)&self->_requestGuid, a3);
}

- (void)_readAssignments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAssignments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)assignments
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  return self->_assignments;
}

- (void)setAssignments:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *assignments;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  assignments = self->_assignments;
  self->_assignments = v4;

}

- (void)clearAssignments
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_assignments, "removeAllObjects");
}

- (void)addAssignment:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  -[GEOABAssignmentResponse _addNoFlagsAssignment:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsAssignment:(uint64_t)a1
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

- (unint64_t)assignmentsCount
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  return -[NSMutableArray count](self->_assignments, "count");
}

- (id)assignmentAtIndex:(unint64_t)a3
{
  -[GEOABAssignmentResponse _readAssignments]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_assignments, "objectAtIndex:", a3);
}

+ (Class)assignmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)invalidateTileCache
{
  return self->_invalidateTileCache;
}

- (void)setInvalidateTileCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4010u;
  self->_invalidateTileCache = a3;
}

- (void)setHasInvalidateTileCache:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16400;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasInvalidateTileCache
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)invalidatePoiCache
{
  return self->_invalidatePoiCache;
}

- (void)setInvalidatePoiCache:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x4008u;
  self->_invalidatePoiCache = a3;
}

- (void)setHasInvalidatePoiCache:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16392;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasInvalidatePoiCache
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)refreshIntervalSeconds
{
  return self->_refreshIntervalSeconds;
}

- (void)setRefreshIntervalSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x4002u;
  self->_refreshIntervalSeconds = a3;
}

- (void)setHasRefreshIntervalSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16386;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRefreshIntervalSeconds
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)hasClientConfig
{
  -[GEOABAssignmentResponse _readClientConfig]((uint64_t)self);
  return self->_clientConfig != 0;
}

- (void)setClientConfig:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4080u;
  objc_storeStrong((id *)&self->_clientConfig, a3);
}

- (BOOL)hasParsecClientMetadata
{
  -[GEOABAssignmentResponse _readParsecClientMetadata]((uint64_t)self);
  return self->_parsecClientMetadata != 0;
}

- (void)setParsecClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4200u;
  objc_storeStrong((id *)&self->_parsecClientMetadata, a3);
}

- (void)_readSiriClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasSiriClientMetadata
{
  -[GEOABAssignmentResponse _readSiriClientMetadata]((uint64_t)self);
  return self->_siriClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)siriClientMetadata
{
  -[GEOABAssignmentResponse _readSiriClientMetadata]((uint64_t)self);
  return self->_siriClientMetadata;
}

- (void)setSiriClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x5000u;
  objc_storeStrong((id *)&self->_siriClientMetadata, a3);
}

- (void)_readRapClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRapClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRapClientMetadata
{
  -[GEOABAssignmentResponse _readRapClientMetadata]((uint64_t)self);
  return self->_rapClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)rapClientMetadata
{
  -[GEOABAssignmentResponse _readRapClientMetadata]((uint64_t)self);
  return self->_rapClientMetadata;
}

- (void)setRapClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4400u;
  objc_storeStrong((id *)&self->_rapClientMetadata, a3);
}

- (BOOL)hasMapsAbClientMetadata
{
  -[GEOABAssignmentResponse _readMapsAbClientMetadata]((uint64_t)self);
  return self->_mapsAbClientMetadata != 0;
}

- (void)setMapsAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4100u;
  objc_storeStrong((id *)&self->_mapsAbClientMetadata, a3);
}

- (unint64_t)branchExpirationTtlHours
{
  return self->_branchExpirationTtlHours;
}

- (void)setBranchExpirationTtlHours:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x4001u;
  self->_branchExpirationTtlHours = a3;
}

- (void)setHasBranchExpirationTtlHours:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x4000;
}

- (BOOL)hasBranchExpirationTtlHours
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOABAssignmentResponse;
  -[GEOABAssignmentResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABAssignmentResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABAssignmentResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int16 v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "requestGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("requestGuid");
    else
      v6 = CFSTR("request_guid");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("assignment"));
  }
  v15 = *(_WORD *)(a1 + 128);
  if ((v15 & 0x10) == 0)
  {
    if ((v15 & 8) == 0)
      goto LABEL_21;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 124));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("invalidatePoiCache");
    else
      v25 = CFSTR("invalidate_poi_cache");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    if ((*(_WORD *)(a1 + 128) & 2) == 0)
      goto LABEL_26;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 125));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("invalidateTileCache");
  else
    v23 = CFSTR("invalidate_tile_cache");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v15 = *(_WORD *)(a1 + 128);
  if ((v15 & 8) != 0)
    goto LABEL_33;
LABEL_21:
  if ((v15 & 2) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("refreshIntervalSeconds");
    else
      v17 = CFSTR("refresh_interval_seconds");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
LABEL_26:
  objc_msgSend((id)a1, "clientConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("clientConfig");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("client_config");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  objc_msgSend((id)a1, "parsecClientMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("parsecClientMetadata");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("parsec_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "siriClientMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("siriClientMetadata");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("siri_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  objc_msgSend((id)a1, "rapClientMetadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v34, "jsonRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("rapClientMetadata");
    }
    else
    {
      objc_msgSend(v34, "dictionaryRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("rap_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  objc_msgSend((id)a1, "mapsAbClientMetadata");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("mapsAbClientMetadata");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("maps_ab_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  v42 = *(_WORD *)(a1 + 128);
  if ((v42 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("branchExpirationTtlHours");
    else
      v44 = CFSTR("branch_expiration_ttl_hours");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    v42 = *(_WORD *)(a1 + 128);
  }
  if ((v42 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 104));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("timestamp"));

  }
  objc_msgSend((id)a1, "sourceURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("sourceURL"));

  v47 = *(void **)(a1 + 16);
  if (v47)
  {
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __53__GEOABAssignmentResponse__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E1C00600;
      v51 = v50;
      v55 = v51;
      objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v54);
      v52 = v51;

      v49 = v52;
    }
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABAssignmentResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOABAssignmentResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABAssignmentResponse)initWithDictionary:(id)a3
{
  return (GEOABAssignmentResponse *)-[GEOABAssignmentResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOABExperimentAssignment *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOABClientConfig *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEOABSecondPartyPlaceRequestClientMetaData *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOABSecondPartyPlaceRequestClientMetaData *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  GEOABSecondPartyPlaceRequestClientMetaData *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOABSecondPartyPlaceRequestClientMetaData *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("requestGuid");
      else
        v6 = CFSTR("request_guid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setRequestGuid:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assignment"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = v5;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v58 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = [GEOABExperimentAssignment alloc];
                if ((a3 & 1) != 0)
                  v17 = -[GEOABExperimentAssignment initWithJSON:](v16, "initWithJSON:", v15);
                else
                  v17 = -[GEOABExperimentAssignment initWithDictionary:](v16, "initWithDictionary:", v15);
                v18 = (void *)v17;
                objc_msgSend(a1, "addAssignment:", v17);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          }
          while (v12);
        }

        v5 = v56;
      }

      if (a3)
        v19 = CFSTR("invalidateTileCache");
      else
        v19 = CFSTR("invalidate_tile_cache");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setInvalidateTileCache:", objc_msgSend(v20, "BOOLValue"));

      if (a3)
        v21 = CFSTR("invalidatePoiCache");
      else
        v21 = CFSTR("invalidate_poi_cache");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setInvalidatePoiCache:", objc_msgSend(v22, "BOOLValue"));

      if (a3)
        v23 = CFSTR("refreshIntervalSeconds");
      else
        v23 = CFSTR("refresh_interval_seconds");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRefreshIntervalSeconds:", objc_msgSend(v24, "unsignedLongLongValue"));

      if (a3)
        v25 = CFSTR("clientConfig");
      else
        v25 = CFSTR("client_config");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOABClientConfig alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOABClientConfig initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOABClientConfig initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setClientConfig:", v28);

      }
      if (a3)
        v30 = CFSTR("parsecClientMetadata");
      else
        v30 = CFSTR("parsec_client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setParsecClientMetadata:", v33);

      }
      if (a3)
        v35 = CFSTR("siriClientMetadata");
      else
        v35 = CFSTR("siri_client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if ((a3 & 1) != 0)
          v38 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v37, "initWithJSON:", v36);
        else
          v38 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v37, "initWithDictionary:", v36);
        v39 = (void *)v38;
        objc_msgSend(a1, "setSiriClientMetadata:", v38);

      }
      if (a3)
        v40 = CFSTR("rapClientMetadata");
      else
        v40 = CFSTR("rap_client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if ((a3 & 1) != 0)
          v43 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v42, "initWithJSON:", v41);
        else
          v43 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v42, "initWithDictionary:", v41);
        v44 = (void *)v43;
        objc_msgSend(a1, "setRapClientMetadata:", v43);

      }
      if (a3)
        v45 = CFSTR("mapsAbClientMetadata");
      else
        v45 = CFSTR("maps_ab_client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if ((a3 & 1) != 0)
          v48 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v47, "initWithJSON:", v46);
        else
          v48 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v47, "initWithDictionary:", v46);
        v49 = (void *)v48;
        objc_msgSend(a1, "setMapsAbClientMetadata:", v48);

      }
      if (a3)
        v50 = CFSTR("branchExpirationTtlHours");
      else
        v50 = CFSTR("branch_expiration_ttl_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBranchExpirationTtlHours:", objc_msgSend(v51, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v52, "doubleValue");
        objc_msgSend(a1, "setTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sourceURL"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v54 = (void *)objc_msgSend(v53, "copy");
        objc_msgSend(a1, "setSourceURL:", v54);

      }
    }
  }

  return a1;
}

- (GEOABAssignmentResponse)initWithJSON:(id)a3
{
  return (GEOABAssignmentResponse *)-[GEOABAssignmentResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_158;
    else
      v8 = (int *)&readAll__nonRecursiveTag_159;
    GEOABAssignmentResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOABAssignmentResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABAssignmentResponseIsValid((char *)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 flags;
  __int16 v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOABAssignmentResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOABAssignmentResponse readAll:](self, "readAll:", 0);
    if (self->_requestGuid)
      PBDataWriterWriteStringField();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_assignments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_clientConfig)
      PBDataWriterWriteSubmessage();
    if (self->_parsecClientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_siriClientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_rapClientMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_mapsAbClientMetadata)
      PBDataWriterWriteSubmessage();
    v11 = (__int16)self->_flags;
    if ((v11 & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 4) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_sourceURL)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  id *v9;
  __int16 v10;
  id *v11;

  v11 = (id *)a3;
  -[GEOABAssignmentResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_requestGuid)
    objc_msgSend(v11, "setRequestGuid:");
  if (-[GEOABAssignmentResponse assignmentsCount](self, "assignmentsCount"))
  {
    objc_msgSend(v11, "clearAssignments");
    v4 = -[GEOABAssignmentResponse assignmentsCount](self, "assignmentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOABAssignmentResponse assignmentAtIndex:](self, "assignmentAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAssignment:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  v9 = v11;
  if ((flags & 0x10) != 0)
  {
    *((_BYTE *)v11 + 125) = self->_invalidateTileCache;
    *((_WORD *)v11 + 64) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 2) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v11 + 124) = self->_invalidatePoiCache;
  *((_WORD *)v11 + 64) |= 8u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_10:
    v11[9] = (id)self->_refreshIntervalSeconds;
    *((_WORD *)v11 + 64) |= 2u;
  }
LABEL_11:
  if (self->_clientConfig)
  {
    objc_msgSend(v11, "setClientConfig:");
    v9 = v11;
  }
  if (self->_parsecClientMetadata)
  {
    objc_msgSend(v11, "setParsecClientMetadata:");
    v9 = v11;
  }
  if (self->_siriClientMetadata)
  {
    objc_msgSend(v11, "setSiriClientMetadata:");
    v9 = v11;
  }
  if (self->_rapClientMetadata)
  {
    objc_msgSend(v11, "setRapClientMetadata:");
    v9 = v11;
  }
  if (self->_mapsAbClientMetadata)
  {
    objc_msgSend(v11, "setMapsAbClientMetadata:");
    v9 = v11;
  }
  v10 = (__int16)self->_flags;
  if ((v10 & 1) != 0)
  {
    v9[4] = (id)self->_branchExpirationTtlHours;
    *((_WORD *)v9 + 64) |= 1u;
    v10 = (__int16)self->_flags;
  }
  if ((v10 & 4) != 0)
  {
    v9[13] = *(id *)&self->_timestamp;
    *((_WORD *)v9 + 64) |= 4u;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v11, "setSourceURL:");
    v9 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int16 flags;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  void *v29;
  PBUnknownFields *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOABAssignmentResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOABAssignmentResponse readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_requestGuid, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = self->_assignments;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addAssignment:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 8) == 0)
      goto LABEL_14;
LABEL_23:
    *(_BYTE *)(v5 + 124) = self->_invalidatePoiCache;
    *(_WORD *)(v5 + 128) |= 8u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  *(_BYTE *)(v5 + 125) = self->_invalidateTileCache;
  *(_WORD *)(v5 + 128) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_23;
LABEL_14:
  if ((flags & 2) != 0)
  {
LABEL_15:
    *(_QWORD *)(v5 + 72) = self->_refreshIntervalSeconds;
    *(_WORD *)(v5 + 128) |= 2u;
  }
LABEL_16:
  v17 = -[GEOABClientConfig copyWithZone:](self->_clientConfig, "copyWithZone:", a3, (_QWORD)v32);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_parsecClientMetadata, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v19;

  v21 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_siriClientMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v21;

  v23 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_rapClientMetadata, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  v25 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_mapsAbClientMetadata, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v25;

  v27 = (__int16)self->_flags;
  if ((v27 & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_branchExpirationTtlHours;
    *(_WORD *)(v5 + 128) |= 1u;
    v27 = (__int16)self->_flags;
  }
  if ((v27 & 4) != 0)
  {
    *(double *)(v5 + 104) = self->_timestamp;
    *(_WORD *)(v5 + 128) |= 4u;
  }
  v28 = -[NSString copyWithZone:](self->_sourceURL, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v28;

  v30 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v30;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestGuid;
  NSMutableArray *assignments;
  __int16 flags;
  __int16 v8;
  GEOABClientConfig *clientConfig;
  GEOABSecondPartyPlaceRequestClientMetaData *parsecClientMetadata;
  GEOABSecondPartyPlaceRequestClientMetaData *siriClientMetadata;
  GEOABSecondPartyPlaceRequestClientMetaData *rapClientMetadata;
  GEOABSecondPartyPlaceRequestClientMetaData *mapsAbClientMetadata;
  __int16 v14;
  __int16 v15;
  NSString *sourceURL;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEOABAssignmentResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  requestGuid = self->_requestGuid;
  if ((unint64_t)requestGuid | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](requestGuid, "isEqual:"))
      goto LABEL_49;
  }
  assignments = self->_assignments;
  if ((unint64_t)assignments | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](assignments, "isEqual:"))
      goto LABEL_49;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 64);
  if ((flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_49;
    if (self->_invalidateTileCache)
    {
      if (!*((_BYTE *)v4 + 125))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 125))
    {
      goto LABEL_49;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) != 0)
    {
      if (self->_invalidatePoiCache)
      {
        if (!*((_BYTE *)v4 + 124))
          goto LABEL_49;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_22;
    }
LABEL_49:
    v17 = 0;
    goto LABEL_50;
  }
  if ((v8 & 8) != 0)
    goto LABEL_49;
LABEL_22:
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_refreshIntervalSeconds != *((_QWORD *)v4 + 9))
      goto LABEL_49;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  clientConfig = self->_clientConfig;
  if ((unint64_t)clientConfig | *((_QWORD *)v4 + 5) && !-[GEOABClientConfig isEqual:](clientConfig, "isEqual:"))
    goto LABEL_49;
  parsecClientMetadata = self->_parsecClientMetadata;
  if ((unint64_t)parsecClientMetadata | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](parsecClientMetadata, "isEqual:"))
      goto LABEL_49;
  }
  siriClientMetadata = self->_siriClientMetadata;
  if ((unint64_t)siriClientMetadata | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](siriClientMetadata, "isEqual:"))
      goto LABEL_49;
  }
  rapClientMetadata = self->_rapClientMetadata;
  if ((unint64_t)rapClientMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](rapClientMetadata, "isEqual:"))
      goto LABEL_49;
  }
  mapsAbClientMetadata = self->_mapsAbClientMetadata;
  if ((unint64_t)mapsAbClientMetadata | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](mapsAbClientMetadata, "isEqual:"))
      goto LABEL_49;
  }
  v14 = (__int16)self->_flags;
  v15 = *((_WORD *)v4 + 64);
  if ((v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_branchExpirationTtlHours != *((_QWORD *)v4 + 4))
      goto LABEL_49;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_timestamp != *((double *)v4 + 13))
      goto LABEL_49;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_49;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((_QWORD *)v4 + 12))
    v17 = -[NSString isEqual:](sourceURL, "isEqual:");
  else
    v17 = 1;
LABEL_50:

  return v17;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  double timestamp;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;

  -[GEOABAssignmentResponse readAll:](self, "readAll:", 1);
  v21 = -[NSString hash](self->_requestGuid, "hash");
  v20 = -[NSMutableArray hash](self->_assignments, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    v19 = 0;
    if ((flags & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v19 = 2654435761 * self->_invalidateTileCache;
  if ((flags & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_invalidatePoiCache;
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_refreshIntervalSeconds;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[GEOABClientConfig hash](self->_clientConfig, "hash");
  v7 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_parsecClientMetadata, "hash");
  v8 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_siriClientMetadata, "hash");
  v9 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_rapClientMetadata, "hash");
  v10 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_mapsAbClientMetadata, "hash");
  v11 = (__int16)self->_flags;
  if ((v11 & 1) != 0)
  {
    v12 = 2654435761u * self->_branchExpirationTtlHours;
    if ((v11 & 4) != 0)
      goto LABEL_10;
LABEL_15:
    v17 = 0;
    return v20 ^ v21 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ -[NSString hash](self->_sourceURL, "hash");
  }
  v12 = 0;
  if ((v11 & 4) == 0)
    goto LABEL_15;
LABEL_10:
  timestamp = self->_timestamp;
  v14 = -timestamp;
  if (timestamp >= 0.0)
    v14 = self->_timestamp;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
  return v20 ^ v21 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v17 ^ -[NSString hash](self->_sourceURL, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  GEOABClientConfig *clientConfig;
  uint64_t v12;
  GEOABSecondPartyPlaceRequestClientMetaData *parsecClientMetadata;
  uint64_t v14;
  GEOABSecondPartyPlaceRequestClientMetaData *siriClientMetadata;
  uint64_t v16;
  GEOABSecondPartyPlaceRequestClientMetaData *rapClientMetadata;
  uint64_t v18;
  GEOABSecondPartyPlaceRequestClientMetaData *mapsAbClientMetadata;
  uint64_t v20;
  __int16 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 10))
    -[GEOABAssignmentResponse setRequestGuid:](self, "setRequestGuid:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        -[GEOABAssignmentResponse addAssignment:](self, "addAssignment:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 64);
  if ((v10 & 0x10) != 0)
  {
    self->_invalidateTileCache = *((_BYTE *)v4 + 125);
    *(_WORD *)&self->_flags |= 0x10u;
    v10 = *((_WORD *)v4 + 64);
    if ((v10 & 8) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_invalidatePoiCache = *((_BYTE *)v4 + 124);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 64) & 2) != 0)
  {
LABEL_13:
    self->_refreshIntervalSeconds = *((_QWORD *)v4 + 9);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_14:
  clientConfig = self->_clientConfig;
  v12 = *((_QWORD *)v4 + 5);
  if (clientConfig)
  {
    if (v12)
      -[GEOABClientConfig mergeFrom:](clientConfig, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOABAssignmentResponse setClientConfig:](self, "setClientConfig:");
  }
  parsecClientMetadata = self->_parsecClientMetadata;
  v14 = *((_QWORD *)v4 + 7);
  if (parsecClientMetadata)
  {
    if (v14)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](parsecClientMetadata, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOABAssignmentResponse setParsecClientMetadata:](self, "setParsecClientMetadata:");
  }
  siriClientMetadata = self->_siriClientMetadata;
  v16 = *((_QWORD *)v4 + 11);
  if (siriClientMetadata)
  {
    if (v16)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](siriClientMetadata, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOABAssignmentResponse setSiriClientMetadata:](self, "setSiriClientMetadata:");
  }
  rapClientMetadata = self->_rapClientMetadata;
  v18 = *((_QWORD *)v4 + 8);
  if (rapClientMetadata)
  {
    if (v18)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](rapClientMetadata, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEOABAssignmentResponse setRapClientMetadata:](self, "setRapClientMetadata:");
  }
  mapsAbClientMetadata = self->_mapsAbClientMetadata;
  v20 = *((_QWORD *)v4 + 6);
  if (mapsAbClientMetadata)
  {
    if (v20)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](mapsAbClientMetadata, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOABAssignmentResponse setMapsAbClientMetadata:](self, "setMapsAbClientMetadata:");
  }
  v21 = *((_WORD *)v4 + 64);
  if ((v21 & 1) != 0)
  {
    self->_branchExpirationTtlHours = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
    v21 = *((_WORD *)v4 + 64);
  }
  if ((v21 & 4) != 0)
  {
    self->_timestamp = *((double *)v4 + 13);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 12))
    -[GEOABAssignmentResponse setSourceURL:](self, "setSourceURL:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOABAssignmentResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_162);
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
  *(_WORD *)&self->_flags |= 0x4020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOABAssignmentResponse readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_assignments;
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

    -[GEOABClientConfig clearUnknownFields:](self->_clientConfig, "clearUnknownFields:", 1);
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_parsecClientMetadata, "clearUnknownFields:", 1);
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_siriClientMetadata, "clearUnknownFields:", 1);
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_rapClientMetadata, "clearUnknownFields:", 1);
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_mapsAbClientMetadata, "clearUnknownFields:", 1);
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x4004u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16388;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readSourceURL
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 128) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOABAssignmentResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceURL_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasSourceURL
{
  -[GEOABAssignmentResponse _readSourceURL]((uint64_t)self);
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOABAssignmentResponse _readSourceURL]((uint64_t)self);
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x6000u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_siriClientMetadata, 0);
  objc_storeStrong((id *)&self->_requestGuid, 0);
  objc_storeStrong((id *)&self->_rapClientMetadata, 0);
  objc_storeStrong((id *)&self->_parsecClientMetadata, 0);
  objc_storeStrong((id *)&self->_mapsAbClientMetadata, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
