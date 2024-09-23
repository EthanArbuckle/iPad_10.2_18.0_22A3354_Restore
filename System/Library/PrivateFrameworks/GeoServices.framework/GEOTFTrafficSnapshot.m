@implementation GEOTFTrafficSnapshot

- (GEOTFTrafficSnapshot)init
{
  GEOTFTrafficSnapshot *v2;
  GEOTFTrafficSnapshot *v3;
  GEOTFTrafficSnapshot *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTFTrafficSnapshot;
  v2 = -[GEOTFTrafficSnapshot init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFTrafficSnapshot)initWithData:(id)a3
{
  GEOTFTrafficSnapshot *v3;
  GEOTFTrafficSnapshot *v4;
  GEOTFTrafficSnapshot *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTFTrafficSnapshot;
  v3 = -[GEOTFTrafficSnapshot initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRegions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)regions
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *regions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  regions = self->_regions;
  self->_regions = v4;

}

- (void)clearRegions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_regions, "removeAllObjects");
}

- (void)addRegion:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsRegion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)regionsCount
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  return -[NSMutableArray count](self->_regions, "count");
}

- (id)regionAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_regions, "objectAtIndex:", a3);
}

+ (Class)regionType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)incidents
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  return self->_incidents;
}

- (void)setIncidents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  incidents = self->_incidents;
  self->_incidents = v4;

}

- (void)clearIncidents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_incidents, "removeAllObjects");
}

- (void)addIncidents:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsIncidents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsIncidents:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)incidentsCount
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  return -[NSMutableArray count](self->_incidents, "count");
}

- (id)incidentsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidents, "objectAtIndex:", a3);
}

+ (Class)incidentsType
{
  return (Class)objc_opt_class();
}

- (void)_readSpeeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpeeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)speeds
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  return self->_speeds;
}

- (void)setSpeeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *speeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  speeds = self->_speeds;
  self->_speeds = v4;

}

- (void)clearSpeeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_speeds, "removeAllObjects");
}

- (void)addSpeeds:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsSpeeds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSpeeds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)speedsCount
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  return -[NSMutableArray count](self->_speeds, "count");
}

- (id)speedsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_speeds, "objectAtIndex:", a3);
}

+ (Class)speedsType
{
  return (Class)objc_opt_class();
}

- (int64_t)feedUpdateTime
{
  return self->_feedUpdateTime;
}

- (void)setFeedUpdateTime:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_feedUpdateTime = a3;
}

- (void)setHasFeedUpdateTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFeedUpdateTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readFeedId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasFeedId
{
  -[GEOTFTrafficSnapshot _readFeedId]((uint64_t)self);
  return self->_feedId != 0;
}

- (NSString)feedId
{
  -[GEOTFTrafficSnapshot _readFeedId]((uint64_t)self);
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (unsigned)trafficVersion
{
  return self->_trafficVersion;
}

- (void)setTrafficVersion:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_trafficVersion = a3;
}

- (void)setHasTrafficVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasTrafficVersion
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)feedPublishTime
{
  return self->_feedPublishTime;
}

- (void)setFeedPublishTime:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_feedPublishTime = a3;
}

- (void)setHasFeedPublishTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasFeedPublishTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCompactSpeeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCompactSpeeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)compactSpeeds
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  return self->_compactSpeeds;
}

- (void)setCompactSpeeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *compactSpeeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  compactSpeeds = self->_compactSpeeds;
  self->_compactSpeeds = v4;

}

- (void)clearCompactSpeeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_compactSpeeds, "removeAllObjects");
}

- (void)addCompactSpeeds:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsCompactSpeeds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsCompactSpeeds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)compactSpeedsCount
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  return -[NSMutableArray count](self->_compactSpeeds, "count");
}

- (id)compactSpeedsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_compactSpeeds, "objectAtIndex:", a3);
}

+ (Class)compactSpeedsType
{
  return (Class)objc_opt_class();
}

- (void)_readSnapshotId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSnapshotId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSnapshotId
{
  -[GEOTFTrafficSnapshot _readSnapshotId]((uint64_t)self);
  return self->_snapshotId != 0;
}

- (NSString)snapshotId
{
  -[GEOTFTrafficSnapshot _readSnapshotId]((uint64_t)self);
  return self->_snapshotId;
}

- (void)setSnapshotId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_snapshotId, a3);
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
  v8.super_class = (Class)GEOTFTrafficSnapshot;
  -[GEOTFTrafficSnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTFTrafficSnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFTrafficSnapshot _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)a1, "regions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("region"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("incidents"));
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v15 = *(id *)(a1 + 72);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("speeds"));
  }
  if ((*(_WORD *)(a1 + 96) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("feedUpdateTime");
    else
      v23 = CFSTR("feed_update_time");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "feedId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (a2)
      v25 = CFSTR("feedId");
    else
      v25 = CFSTR("feed_id");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);
  }

  v26 = *(_WORD *)(a1 + 96);
  if ((v26 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("trafficVersion");
    else
      v28 = CFSTR("traffic_version");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v26 = *(_WORD *)(a1 + 96);
  }
  if ((v26 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("feedPublishTime");
    else
      v30 = CFSTR("feed_publish_time");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = *(id *)(a1 + 16);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation", (_QWORD)v42);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38, (_QWORD)v42);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v34);
    }

    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("compactSpeeds"));
  }
  objc_msgSend((id)a1, "snapshotId", (_QWORD)v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    if (a2)
      v40 = CFSTR("snapshotId");
    else
      v40 = CFSTR("snapshot_id");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFTrafficSnapshot _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTFTrafficSnapshot)initWithDictionary:(id)a3
{
  return (GEOTFTrafficSnapshot *)-[GEOTFTrafficSnapshot _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  GEOTFIncident *v30;
  GEOTFIncident *v31;
  void *v32;
  id v33;
  int v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  PBDataReader *reader;
  PBDataReader *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  GEOTFInfo *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  unsigned int v76;
  void *v77;
  char v78;
  void *v79;
  id v80;
  int v81;
  void *v82;
  char v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  float v89;
  void *v90;
  id v91;
  int v92;
  void *v93;
  unsigned int v94;
  void *v95;
  unsigned int v96;
  void *v97;
  float v98;
  void *v99;
  char v100;
  void *v101;
  id v102;
  int v103;
  void *v104;
  id v105;
  int v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  unsigned int v113;
  void *v114;
  char v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  const __CFString *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  GEOTFRoadSpeed *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  int v137;
  void *v138;
  int v139;
  void *v140;
  char v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  GEOTFPredictedSpeed *v147;
  id v148;
  uint64_t v149;
  void *v150;
  int v151;
  void *v152;
  int v153;
  uint64_t v154;
  void *v155;
  id v156;
  int v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  int v164;
  void *v165;
  int v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t m;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t n;
  void *v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t ii;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  uint64_t v194;
  const __CFString *v195;
  void *v196;
  const __CFString *v197;
  void *v198;
  void *v199;
  const __CFString *v200;
  void *v201;
  const __CFString *v202;
  void *v203;
  const __CFString *v204;
  const __CFString *v205;
  const __CFString *v206;
  const __CFString *v207;
  const __CFString *v208;
  const __CFString *v209;
  const __CFString *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  GEOTFCompactRoadSpeeds *v214;
  uint64_t v215;
  void *v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t jj;
  void *v221;
  void *v222;
  id v223;
  void *v224;
  int v225;
  void *v226;
  int v227;
  void *v228;
  char v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  GEOTFCompactPredictedSpeed *v235;
  id v236;
  uint64_t v237;
  void *v238;
  int v239;
  void *v240;
  int v241;
  uint64_t v242;
  void *v243;
  id v244;
  int v245;
  void *v246;
  int v247;
  void *v248;
  int v249;
  void *v250;
  int v251;
  void *v252;
  void *v253;
  id v254;
  uint64_t v255;
  const __CFString *v256;
  void *v257;
  void *v258;
  void *v260;
  id v262;
  const __CFString *v263;
  const __CFString *v264;
  const __CFString *v265;
  const __CFString *v266;
  const __CFString *v267;
  const __CFString *v268;
  const __CFString *v269;
  void *v270;
  const __CFString *v271;
  const __CFString *v272;
  const __CFString *v273;
  const __CFString *v274;
  void *v275;
  const __CFString *v276;
  const __CFString *v277;
  const __CFString *v278;
  const __CFString *v279;
  const __CFString *v280;
  const __CFString *v281;
  const __CFString *v282;
  const __CFString *v283;
  const __CFString *v284;
  const __CFString *v285;
  const __CFString *v286;
  const __CFString *v287;
  const __CFString *v288;
  const __CFString *v289;
  const __CFString *v290;
  const __CFString *v291;
  const __CFString *v292;
  id v293;
  const __CFString *v294;
  id v295;
  id v296;
  id obj;
  id obja;
  id objb;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  uint64_t v303;
  void *v304;
  uint64_t v305;
  void *v306;
  void *v307;
  uint64_t v308;
  id v309;
  uint64_t v310;
  id v311;
  const __CFString *v312;
  id v313;
  const __CFString *v314;
  const __CFString *v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  _BYTE v348[128];
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  _BYTE v360[128];
  _BYTE v361[128];
  uint64_t v362;

  v362 = *MEMORY[0x1E0C80C00];
  v262 = a2;
  if (!a1 || (v306 = (void *)objc_msgSend(a1, "init")) == 0)
  {
    v306 = 0;
    goto LABEL_512;
  }
  objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("region"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v330 = 0u;
    v331 = 0u;
    v328 = 0u;
    v329 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v328, v351, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v329;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v329 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v306, "addRegion:", v10);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v328, v351, 16);
      }
      while (v6);
    }

  }
  objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("incidents"));
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v326 = 0u;
    v327 = 0u;
    v324 = 0u;
    v325 = 0u;
    obj = v260;
    v303 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v324, v350, 16);
    if (!v303)
      goto LABEL_250;
    v300 = *(_QWORD *)v325;
    if (a3)
      v11 = CFSTR("incidentId");
    else
      v11 = CFSTR("incident_id");
    v12 = CFSTR("start_time");
    if (a3)
      v12 = CFSTR("startTime");
    v291 = v12;
    v294 = v11;
    v13 = CFSTR("updateTime");
    if (!a3)
      v13 = CFSTR("update_time");
    v288 = v13;
    v14 = CFSTR("cross_street");
    if (a3)
      v14 = CFSTR("crossStreet");
    v285 = v14;
    if (a3)
      v15 = CFSTR("laneClosureCount");
    else
      v15 = CFSTR("lane_closure_count");
    v282 = v15;
    if (a3)
      v16 = CFSTR("endTimeReliable");
    else
      v16 = CFSTR("end_time_reliable");
    v17 = CFSTR("lane_closure_type");
    if (a3)
      v17 = CFSTR("laneClosureType");
    v276 = v17;
    v279 = v16;
    if (a3)
      v18 = CFSTR("hardBlocked");
    else
      v18 = CFSTR("hard_blocked");
    v19 = CFSTR("startOffset");
    if (!a3)
      v19 = CFSTR("start_offset");
    v271 = v19;
    v273 = v18;
    v20 = CFSTR("end_offset");
    if (a3)
      v20 = CFSTR("endOffset");
    v269 = v20;
    if (a3)
      v21 = CFSTR("minZoomLevel");
    else
      v21 = CFSTR("min_zoom_level");
    v268 = v21;
    if (a3)
      v22 = CFSTR("maxZoomLevel");
    else
      v22 = CFSTR("max_zoom_level");
    v23 = CFSTR("traffic_trend");
    if (a3)
      v23 = CFSTR("trafficTrend");
    v266 = v23;
    v267 = v22;
    if (a3)
      v24 = CFSTR("durationMin");
    else
      v24 = CFSTR("duration_min");
    v25 = CFSTR("alertCCode");
    if (!a3)
      v25 = CFSTR("alert_c_code");
    v264 = v25;
    v265 = v24;
    v26 = CFSTR("navigation_alert");
    if (a3)
      v26 = CFSTR("navigationAlert");
    v263 = v26;
    while (1)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v325 != v300)
        {
          v28 = v27;
          objc_enumerationMutation(obj);
          v27 = v28;
        }
        v310 = v27;
        v29 = *(void **)(*((_QWORD *)&v324 + 1) + 8 * v27);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = [GEOTFIncident alloc];
          if (v30)
          {
            v313 = v29;
            v31 = -[GEOTFIncident init](v30, "init");

            if (v31)
            {
              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("type"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = v32;
                if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ROAD_CLOSURE")) & 1) != 0)
                {
                  v34 = 3;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("LANE_CLOSURE")) & 1) != 0)
                {
                  v34 = 4;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("WEATHER")) & 1) != 0)
                {
                  v34 = 7;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("EVENT")) & 1) != 0)
                {
                  v34 = 8;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ACCIDENT")) & 1) != 0)
                {
                  v34 = 9;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("HAZARD")) & 1) != 0)
                {
                  v34 = 10;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("ROADWORKS")) & 1) != 0)
                {
                  v34 = 11;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("RAMP_CLOSURE")) & 1) != 0)
                {
                  v34 = 12;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
                {
                  v34 = 13;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
                {
                  v34 = 14;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("WALKING_CLOSURE")) & 1) != 0)
                {
                  v34 = 15;
                }
                else if (objc_msgSend(v33, "isEqualToString:", CFSTR("NO_THOROUGHFARE_CLOSURE")))
                {
                  v34 = 16;
                }
                else
                {
                  v34 = 3;
                }

LABEL_91:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x20000u;
                v31->_type = v34;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v34 = objc_msgSend(v32, "intValue");
                  goto LABEL_91;
                }
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("geoid"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v359 = 0u;
                v358 = 0u;
                v357 = 0u;
                v356 = 0u;
                v36 = v35;
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v356, v361, 16);
                if (v37)
                {
                  v38 = *(_QWORD *)v357;
                  do
                  {
                    for (j = 0; j != v37; ++j)
                    {
                      if (*(_QWORD *)v357 != v38)
                        objc_enumerationMutation(v36);
                      v40 = *(void **)(*((_QWORD *)&v356 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v40, "longLongValue");
                        os_unfair_lock_lock(&v31->_readerLock);
                        if ((*((_BYTE *)&v31->_flags + 2) & 0x80) == 0)
                        {
                          reader = v31->_reader;
                          if (reader)
                          {
                            v42 = reader;
                            objc_sync_enter(v42);
                            GEOTFIncidentReadSpecified((uint64_t)v31, (unint64_t)v31->_reader, (int *)&_readGeoids_tags);
                            objc_sync_exit(v42);

                          }
                        }
                        os_unfair_lock_unlock(&v31->_readerLock);
                        PBRepeatedInt64Add();
                        os_unfair_lock_lock_with_options();
                        *(_DWORD *)&v31->_flags |= 0x800000u;
                        os_unfair_lock_unlock(&v31->_readerLock);
                        *(_DWORD *)&v31->_flags |= 0x40000000u;
                      }
                    }
                    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v356, v361, 16);
                  }
                  while (v37);
                }

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("info"));
              v307 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v355 = 0u;
                v354 = 0u;
                v353 = 0u;
                v352 = 0u;
                v43 = v307;
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v352, v360, 16);
                if (v44)
                {
                  v45 = *(_QWORD *)v353;
                  do
                  {
                    for (k = 0; k != v44; ++k)
                    {
                      if (*(_QWORD *)v353 != v45)
                        objc_enumerationMutation(v43);
                      v47 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * k);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v48 = [GEOTFInfo alloc];
                        if (v48)
                        {
                          v49 = v47;
                          v48 = -[GEOTFInfo init](v48, "init");
                          if (v48)
                          {
                            objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("language"));
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v51 = (void *)objc_msgSend(v50, "copy");
                              v52 = v51;
                              *(_BYTE *)&v48->_flags |= 2u;
                              *(_BYTE *)&v48->_flags |= 4u;
                              objc_storeStrong((id *)&v48->_language, v51);

                            }
                            objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("comment"));
                            v53 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v54 = (void *)objc_msgSend(v53, "copy");
                              v55 = v54;
                              *(_BYTE *)&v48->_flags |= 1u;
                              *(_BYTE *)&v48->_flags |= 4u;
                              objc_storeStrong((id *)&v48->_comment, v54);

                            }
                          }

                        }
                        -[GEOTFIncident addInfo:]((uint64_t)v31, v48);

                      }
                    }
                    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v352, v360, 16);
                  }
                  while (v44);
                }

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", v294);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = (void *)objc_msgSend(v56, "copy");
                v58 = v57;
                *(_DWORD *)&v31->_flags |= 0x2000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_incidentId, v57);

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("latitude"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v59, "doubleValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 4u;
                v31->_latitude = v60;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("longitude"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v61, "doubleValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 8u;
                v31->_longitude = v62;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v291);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v64 = objc_msgSend(v63, "longLongValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x20u;
                v31->_startTime = v64;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v288);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v66 = objc_msgSend(v65, "longLongValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x40u;
                v31->_updateTime = v66;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("blocked"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v68 = objc_msgSend(v67, "BOOLValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x40000u;
                v31->_blocked = v68;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("street"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v70 = (void *)objc_msgSend(v69, "copy");
                v71 = v70;
                *(_DWORD *)&v31->_flags |= 0x10000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_street, v70);

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", v285);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v73 = (void *)objc_msgSend(v72, "copy");
                v74 = v73;
                *(_DWORD *)&v31->_flags |= 0x1000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_crossStreet, v73);

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", v282);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v76 = objc_msgSend(v75, "unsignedIntValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x400u;
                v31->_laneClosureCount = v76;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v279);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v78 = objc_msgSend(v77, "BOOLValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x80000u;
                v31->_endTimeReliable = v78;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v276);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v80 = v79;
                if ((objc_msgSend(v80, "isEqualToString:", CFSTR("LEFT_LANE")) & 1) != 0)
                {
                  v81 = 1;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("CENTER_LANE")) & 1) != 0)
                {
                  v81 = 2;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("RIGHT_LANE")) & 1) != 0)
                {
                  v81 = 3;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("SHOULDER_LANE")) & 1) != 0)
                {
                  v81 = 4;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("CARPOOL_LANE")) & 1) != 0)
                {
                  v81 = 5;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("BUS_LANE")) & 1) != 0)
                {
                  v81 = 6;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("OTHER_LANE")) & 1) != 0)
                {
                  v81 = 7;
                }
                else if ((objc_msgSend(v80, "isEqualToString:", CFSTR("ON_RAMP")) & 1) != 0)
                {
                  v81 = 8;
                }
                else if (objc_msgSend(v80, "isEqualToString:", CFSTR("OFF_RAMP")))
                {
                  v81 = 9;
                }
                else
                {
                  v81 = 1;
                }

LABEL_168:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x800u;
                v31->_laneClosureType = v81;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v81 = objc_msgSend(v79, "intValue");
                  goto LABEL_168;
                }
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v273);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = objc_msgSend(v82, "BOOLValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x100000u;
                v31->_hardBlocked = v83;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v271);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v84, "doubleValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x10u;
                v31->_startOffset = v85;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v269);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v86, "doubleValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 2u;
                v31->_endOffset = v87;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("delay"));
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v88, "floatValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x200u;
                v31->_delay = v89;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("significance"));
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v91 = v90;
                if ((objc_msgSend(v91, "isEqualToString:", CFSTR("UNKNOWN_IMPACT")) & 1) != 0)
                {
                  v92 = 0;
                }
                else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("LOW_IMPACT")) & 1) != 0)
                {
                  v92 = 1;
                }
                else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MODERATE_LOCAL_IMPACT")) & 1) != 0)
                {
                  v92 = 2;
                }
                else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("HIGH_LOCAL_IMPACT")) & 1) != 0)
                {
                  v92 = 3;
                }
                else if ((objc_msgSend(v91, "isEqualToString:", CFSTR("MODERATE_REGIONAL_IMPACT")) & 1) != 0)
                {
                  v92 = 4;
                }
                else if (objc_msgSend(v91, "isEqualToString:", CFSTR("WIDE_REGIONAL_IMPACT")))
                {
                  v92 = 5;
                }
                else
                {
                  v92 = 0;
                }

LABEL_194:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x4000u;
                v31->_significance = v92;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v92 = objc_msgSend(v90, "intValue");
                  goto LABEL_194;
                }
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v268);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v94 = objc_msgSend(v93, "unsignedIntValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x2000u;
                v31->_minZoomLevel = v94;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v267);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v96 = objc_msgSend(v95, "unsignedIntValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x1000u;
                v31->_maxZoomLevel = v96;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("speed"));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v97, "floatValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x8000u;
                v31->_speed = v98;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("hidden"));
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v100 = objc_msgSend(v99, "BOOLValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x200000u;
                v31->_hidden = v100;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v266);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v102 = v101;
                if ((objc_msgSend(v102, "isEqualToString:", CFSTR("UNKNOWN_TREND")) & 1) != 0)
                {
                  v103 = 0;
                }
                else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("TRAFFIC_EASING")) & 1) != 0)
                {
                  v103 = 1;
                }
                else if ((objc_msgSend(v102, "isEqualToString:", CFSTR("TRAFFIC_BUILDING_UP")) & 1) != 0)
                {
                  v103 = 2;
                }
                else if (objc_msgSend(v102, "isEqualToString:", CFSTR("TRAFFIC_STABLE")))
                {
                  v103 = 3;
                }
                else
                {
                  v103 = 0;
                }

LABEL_216:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x10000u;
                v31->_trafficTrend = v103;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v103 = objc_msgSend(v101, "intValue");
                  goto LABEL_216;
                }
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("color"));
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v105 = v104;
                if ((objc_msgSend(v105, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                {
                  v106 = 0;
                }
                else if ((objc_msgSend(v105, "isEqualToString:", CFSTR("BLACK")) & 1) != 0)
                {
                  v106 = 1;
                }
                else if ((objc_msgSend(v105, "isEqualToString:", CFSTR("RED")) & 1) != 0)
                {
                  v106 = 2;
                }
                else if ((objc_msgSend(v105, "isEqualToString:", CFSTR("YELLOW")) & 1) != 0)
                {
                  v106 = 3;
                }
                else if (objc_msgSend(v105, "isEqualToString:", CFSTR("GREEN")))
                {
                  v106 = 4;
                }
                else
                {
                  v106 = 0;
                }

LABEL_232:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x100u;
                v31->_color = v106;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v106 = objc_msgSend(v104, "intValue");
                  goto LABEL_232;
                }
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v265);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v108 = objc_msgSend(v107, "unsignedLongLongValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 1u;
                v31->_durationMin = v108;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("zilch"));
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v110 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v109, 0);
                v111 = v110;
                *(_DWORD *)&v31->_flags |= 0x20000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_zilch, v110);

              }
              objc_msgSend(v313, "objectForKeyedSubscript:", v264);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v113 = objc_msgSend(v112, "unsignedIntValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x80u;
                v31->_alertCCode = v113;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", v263);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v115 = objc_msgSend(v114, "BOOLValue");
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x400000u;
                v31->_navigationAlert = v115;
              }

              objc_msgSend(v313, "objectForKeyedSubscript:", CFSTR("openlr"));
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v116, 0);
                v118 = v117;
                *(_DWORD *)&v31->_flags |= 0x8000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_openlr, v117);

              }
            }

          }
          else
          {
            v31 = 0;
          }
          objc_msgSend(v306, "addIncidents:", v31, v260);

        }
        v27 = v310 + 1;
      }
      while (v310 + 1 != v303);
      v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v324, v350, 16);
      v303 = v119;
      if (!v119)
      {
LABEL_250:

        break;
      }
    }
  }

  objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("speeds"));
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_386;
  v322 = 0u;
  v323 = 0u;
  v320 = 0u;
  v321 = 0u;
  v295 = v270;
  v301 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v320, v349, 16);
  if (!v301)
    goto LABEL_385;
  v120 = CFSTR("start_offset");
  obja = *(id *)v321;
  if (a3)
    v120 = CFSTR("startOffset");
  v292 = v120;
  if (a3)
    v121 = CFSTR("endOffset");
  else
    v121 = CFSTR("end_offset");
  v122 = CFSTR("predicted_speed");
  if (a3)
    v122 = CFSTR("predictedSpeed");
  v286 = v122;
  v289 = v121;
  v123 = CFSTR("delta_minutes_in_future");
  if (a3)
    v123 = CFSTR("deltaMinutesInFuture");
  v314 = v123;
  if (a3)
    v124 = CFSTR("speedKph");
  else
    v124 = CFSTR("speed_kph");
  v125 = CFSTR("decayTimeWindowInMinutes");
  if (!a3)
    v125 = CFSTR("decay_time_window_in_minutes");
  v280 = v125;
  v283 = v124;
  v126 = CFSTR("latitude_coordinates");
  if (a3)
    v126 = CFSTR("latitudeCoordinates");
  v277 = v126;
  if (a3)
    v127 = CFSTR("longitudeCoordinates");
  else
    v127 = CFSTR("longitude_coordinates");
  v274 = v127;
  v128 = CFSTR("geo_ids");
  if (a3)
    v128 = CFSTR("geoIds");
  v272 = v128;
  do
  {
    v129 = 0;
    do
    {
      if (*(id *)v321 != obja)
      {
        v130 = v129;
        objc_enumerationMutation(v295);
        v129 = v130;
      }
      v308 = v129;
      v131 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * v129);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v132 = [GEOTFRoadSpeed alloc];
        if (v132)
        {
          v311 = v131;
          v133 = -[GEOTFRoadSpeed init](v132, "init");
          if (v133)
          {
            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("geoid"));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v135 = objc_msgSend(v134, "longLongValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_QWORD *)(v133 + 88) = v135;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", v292);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v136, "floatValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x20u;
              *(_DWORD *)(v133 + 152) = v137;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", v289);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v138, "floatValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 8u;
              *(_DWORD *)(v133 + 144) = v139;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("hidden"));
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v141 = objc_msgSend(v140, "BOOLValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x40u;
              *(_BYTE *)(v133 + 156) = v141;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", v286);
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v346 = 0u;
              v347 = 0u;
              v344 = 0u;
              v345 = 0u;
              v142 = v304;
              v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v344, v361, 16);
              if (v143)
              {
                v144 = *(_QWORD *)v345;
                do
                {
                  v145 = 0;
                  do
                  {
                    if (*(_QWORD *)v345 != v144)
                      objc_enumerationMutation(v142);
                    v146 = *(void **)(*((_QWORD *)&v344 + 1) + 8 * v145);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v147 = [GEOTFPredictedSpeed alloc];
                      if (v147)
                      {
                        v148 = v146;
                        v149 = -[GEOTFPredictedSpeed init](v147, "init");
                        if (v149)
                        {
                          objc_msgSend(v148, "objectForKeyedSubscript:", v314);
                          v150 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v151 = objc_msgSend(v150, "unsignedIntValue");
                            *(_BYTE *)(v149 + 16) |= 1u;
                            *(_DWORD *)(v149 + 8) = v151;
                          }

                          objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("speed"));
                          v152 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v153 = objc_msgSend(v152, "unsignedIntValue");
                            *(_BYTE *)(v149 + 16) |= 2u;
                            *(_DWORD *)(v149 + 12) = v153;
                          }

                        }
                      }
                      else
                      {
                        v149 = 0;
                      }
                      -[GEOTFRoadSpeed addPredictedSpeed:](v133, (void *)v149);

                    }
                    ++v145;
                  }
                  while (v143 != v145);
                  v154 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v344, v361, 16);
                  v143 = v154;
                }
                while (v154);
              }

            }
            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("color"));
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v156 = v155;
              if ((objc_msgSend(v156, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
              {
                v157 = 0;
              }
              else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("BLACK")) & 1) != 0)
              {
                v157 = 1;
              }
              else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("RED")) & 1) != 0)
              {
                v157 = 2;
              }
              else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("YELLOW")) & 1) != 0)
              {
                v157 = 3;
              }
              else if (objc_msgSend(v156, "isEqualToString:", CFSTR("GREEN")))
              {
                v157 = 4;
              }
              else
              {
                v157 = 0;
              }

LABEL_325:
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 1u;
              *(_DWORD *)(v133 + 132) = v157;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v157 = objc_msgSend(v155, "intValue");
                goto LABEL_325;
              }
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", v283);
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v159 = objc_msgSend(v158, "unsignedIntValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x10u;
              *(_DWORD *)(v133 + 148) = v159;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("zilch"));
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v161 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v160, 0);
              v162 = v161;
              *(_WORD *)(v133 + 160) |= 0x1000u;
              *(_WORD *)(v133 + 160) |= 0x2000u;
              objc_storeStrong((id *)(v133 + 112), v161);

            }
            objc_msgSend(v311, "objectForKeyedSubscript:", v280);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v164 = objc_msgSend(v163, "unsignedIntValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 4u;
              *(_DWORD *)(v133 + 140) = v164;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("confidence"));
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v165, "floatValue");
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 2u;
              *(_DWORD *)(v133 + 136) = v166;
            }

            objc_msgSend(v311, "objectForKeyedSubscript:", v277);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v342 = 0u;
              v343 = 0u;
              v340 = 0u;
              v341 = 0u;
              v168 = v167;
              v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v340, v360, 16);
              if (v169)
              {
                v170 = *(_QWORD *)v341;
                do
                {
                  for (m = 0; m != v169; ++m)
                  {
                    if (*(_QWORD *)v341 != v170)
                      objc_enumerationMutation(v168);
                    v172 = *(void **)(*((_QWORD *)&v340 + 1) + 8 * m);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v172, "floatValue");
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x100) == 0)
                      {
                        v173 = *(void **)(v133 + 8);
                        if (v173)
                        {
                          v174 = v173;
                          objc_sync_enter(v174);
                          GEOTFRoadSpeedReadSpecified(v133, *(_QWORD *)(v133 + 8), (int *)&_readLatitudeCoordinates_tags);
                          objc_sync_exit(v174);

                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedFloatAdd();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x100u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v340, v360, 16);
                }
                while (v169);
              }

            }
            objc_msgSend(v311, "objectForKeyedSubscript:", v274);
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v338 = 0u;
              v339 = 0u;
              v336 = 0u;
              v337 = 0u;
              v176 = v175;
              v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v336, &v356, 16);
              if (v177)
              {
                v178 = *(_QWORD *)v337;
                do
                {
                  for (n = 0; n != v177; ++n)
                  {
                    if (*(_QWORD *)v337 != v178)
                      objc_enumerationMutation(v176);
                    v180 = *(void **)(*((_QWORD *)&v336 + 1) + 8 * n);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v180, "floatValue");
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x200) == 0)
                      {
                        v181 = *(void **)(v133 + 8);
                        if (v181)
                        {
                          v182 = v181;
                          objc_sync_enter(v182);
                          GEOTFRoadSpeedReadSpecified(v133, *(_QWORD *)(v133 + 8), (int *)&_readLongitudeCoordinates_tags);
                          objc_sync_exit(v182);

                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedFloatAdd();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x200u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v336, &v356, 16);
                }
                while (v177);
              }

            }
            objc_msgSend(v311, "objectForKeyedSubscript:", v272);
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v334 = 0u;
              v335 = 0u;
              v332 = 0u;
              v333 = 0u;
              v184 = v183;
              v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v332, &v352, 16);
              if (v185)
              {
                v186 = *(_QWORD *)v333;
                do
                {
                  for (ii = 0; ii != v185; ++ii)
                  {
                    if (*(_QWORD *)v333 != v186)
                      objc_enumerationMutation(v184);
                    v188 = *(void **)(*((_QWORD *)&v332 + 1) + 8 * ii);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v188, "longLongValue");
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x80) == 0)
                      {
                        v189 = *(void **)(v133 + 8);
                        if (v189)
                        {
                          v190 = v189;
                          objc_sync_enter(v190);
                          GEOTFRoadSpeedReadSpecified(v133, *(_QWORD *)(v133 + 8), (int *)&_readGeoIds_tags_238);
                          objc_sync_exit(v190);

                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedInt64Add();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x80u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v332, &v352, 16);
                }
                while (v185);
              }

            }
            objc_msgSend(v311, "objectForKeyedSubscript:", CFSTR("openlr"));
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v192 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v191, 0);
              v193 = v192;
              *(_WORD *)(v133 + 160) |= 0x400u;
              *(_WORD *)(v133 + 160) |= 0x2000u;
              objc_storeStrong((id *)(v133 + 96), v192);

            }
          }

        }
        else
        {
          v133 = 0;
        }
        objc_msgSend(v306, "addSpeeds:", v133, v260);

      }
      v129 = v308 + 1;
    }
    while (v308 + 1 != v301);
    v194 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v320, v349, 16);
    v301 = v194;
  }
  while (v194);
LABEL_385:

LABEL_386:
  if (a3)
    v195 = CFSTR("feedUpdateTime");
  else
    v195 = CFSTR("feed_update_time");
  objc_msgSend(v262, "objectForKeyedSubscript:", v195, v260);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v306, "setFeedUpdateTime:", objc_msgSend(v196, "longLongValue"));

  if (a3)
    v197 = CFSTR("feedId");
  else
    v197 = CFSTR("feed_id");
  objc_msgSend(v262, "objectForKeyedSubscript:", v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v199 = (void *)objc_msgSend(v198, "copy");
    objc_msgSend(v306, "setFeedId:", v199);

  }
  if (a3)
    v200 = CFSTR("trafficVersion");
  else
    v200 = CFSTR("traffic_version");
  objc_msgSend(v262, "objectForKeyedSubscript:", v200);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v306, "setTrafficVersion:", objc_msgSend(v201, "unsignedIntValue"));

  if (a3)
    v202 = CFSTR("feedPublishTime");
  else
    v202 = CFSTR("feed_publish_time");
  objc_msgSend(v262, "objectForKeyedSubscript:", v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v306, "setFeedPublishTime:", objc_msgSend(v203, "unsignedLongLongValue"));

  objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("compactSpeeds"));
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v318 = 0u;
    v319 = 0u;
    v316 = 0u;
    v317 = 0u;
    v293 = v275;
    objb = (id)objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v316, v348, 16);
    if (!objb)
      goto LABEL_504;
    v296 = *(id *)v317;
    if (a3)
      v204 = CFSTR("geoIds");
    else
      v204 = CFSTR("geo_ids");
    v205 = CFSTR("start_offset");
    if (a3)
      v205 = CFSTR("startOffset");
    v287 = v205;
    v290 = v204;
    if (a3)
      v206 = CFSTR("endOffset");
    else
      v206 = CFSTR("end_offset");
    v207 = CFSTR("predictedSpeed");
    if (!a3)
      v207 = CFSTR("predicted_speed");
    v281 = v207;
    v284 = v206;
    v208 = CFSTR("delta_minutes_in_future");
    if (a3)
      v208 = CFSTR("deltaMinutesInFuture");
    v312 = v208;
    if (a3)
      v209 = CFSTR("speedKph");
    else
      v209 = CFSTR("speed_kph");
    v315 = v209;
    v210 = CFSTR("decay_time_window_in_minutes");
    if (a3)
      v210 = CFSTR("decayTimeWindowInMinutes");
    v278 = v210;
    while (1)
    {
      v211 = 0;
      do
      {
        if (*(id *)v317 != v296)
        {
          v212 = v211;
          objc_enumerationMutation(v293);
          v211 = v212;
        }
        v305 = v211;
        v213 = *(void **)(*((_QWORD *)&v316 + 1) + 8 * v211);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v214 = [GEOTFCompactRoadSpeeds alloc];
          if (v214)
          {
            v309 = v213;
            v215 = -[GEOTFCompactRoadSpeeds init](v214, "init");
            if (v215)
            {
              objc_msgSend(v309, "objectForKeyedSubscript:", v290);
              v216 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v359 = 0u;
                v358 = 0u;
                v357 = 0u;
                v356 = 0u;
                v217 = v216;
                v218 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v356, v361, 16);
                if (v218)
                {
                  v219 = *(_QWORD *)v357;
                  do
                  {
                    for (jj = 0; jj != v218; ++jj)
                    {
                      if (*(_QWORD *)v357 != v219)
                        objc_enumerationMutation(v217);
                      v221 = *(void **)(*((_QWORD *)&v356 + 1) + 8 * jj);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v221, "longLongValue");
                        os_unfair_lock_lock((os_unfair_lock_t)(v215 + 64));
                        if ((*(_WORD *)(v215 + 96) & 0x80) == 0)
                        {
                          v222 = *(void **)(v215 + 8);
                          if (v222)
                          {
                            v223 = v222;
                            objc_sync_enter(v223);
                            GEOTFCompactRoadSpeedsReadSpecified(v215, *(_QWORD *)(v215 + 8), (int *)&_readGeoIds_tags);
                            objc_sync_exit(v223);

                          }
                        }
                        os_unfair_lock_unlock((os_unfair_lock_t)(v215 + 64));
                        PBRepeatedInt64Add();
                        os_unfair_lock_lock_with_options();
                        *(_WORD *)(v215 + 96) |= 0x80u;
                        os_unfair_lock_unlock((os_unfair_lock_t)(v215 + 64));
                        *(_WORD *)(v215 + 96) |= 0x400u;
                      }
                    }
                    v218 = objc_msgSend(v217, "countByEnumeratingWithState:objects:count:", &v356, v361, 16);
                  }
                  while (v218);
                }

              }
              objc_msgSend(v309, "objectForKeyedSubscript:", v287);
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v224, "floatValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x20u;
                *(_DWORD *)(v215 + 88) = v225;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", v284);
              v226 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v226, "floatValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 8u;
                *(_DWORD *)(v215 + 80) = v227;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("hidden"));
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v229 = objc_msgSend(v228, "BOOLValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x40u;
                *(_BYTE *)(v215 + 92) = v229;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", v281);
              v302 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v355 = 0u;
                v354 = 0u;
                v353 = 0u;
                v352 = 0u;
                v230 = v302;
                v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v352, v360, 16);
                if (v231)
                {
                  v232 = *(_QWORD *)v353;
                  do
                  {
                    v233 = 0;
                    do
                    {
                      if (*(_QWORD *)v353 != v232)
                        objc_enumerationMutation(v230);
                      v234 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * v233);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v235 = [GEOTFCompactPredictedSpeed alloc];
                        if (v235)
                        {
                          v236 = v234;
                          v237 = -[GEOTFCompactPredictedSpeed init](v235, "init");
                          if (v237)
                          {
                            objc_msgSend(v236, "objectForKeyedSubscript:", v312);
                            v238 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v239 = objc_msgSend(v238, "unsignedIntValue");
                              *(_BYTE *)(v237 + 16) |= 1u;
                              *(_DWORD *)(v237 + 8) = v239;
                            }

                            objc_msgSend(v236, "objectForKeyedSubscript:", v315);
                            v240 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v241 = objc_msgSend(v240, "unsignedIntValue");
                              *(_BYTE *)(v237 + 16) |= 2u;
                              *(_DWORD *)(v237 + 12) = v241;
                            }

                          }
                        }
                        else
                        {
                          v237 = 0;
                        }
                        -[GEOTFCompactRoadSpeeds addPredictedSpeed:](v215, (void *)v237);

                      }
                      ++v233;
                    }
                    while (v231 != v233);
                    v242 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v352, v360, 16);
                    v231 = v242;
                  }
                  while (v242);
                }

              }
              objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("color"));
              v243 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v244 = v243;
                if ((objc_msgSend(v244, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
                {
                  v245 = 0;
                }
                else if ((objc_msgSend(v244, "isEqualToString:", CFSTR("BLACK")) & 1) != 0)
                {
                  v245 = 1;
                }
                else if ((objc_msgSend(v244, "isEqualToString:", CFSTR("RED")) & 1) != 0)
                {
                  v245 = 2;
                }
                else if ((objc_msgSend(v244, "isEqualToString:", CFSTR("YELLOW")) & 1) != 0)
                {
                  v245 = 3;
                }
                else if (objc_msgSend(v244, "isEqualToString:", CFSTR("GREEN")))
                {
                  v245 = 4;
                }
                else
                {
                  v245 = 0;
                }

LABEL_488:
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 1u;
                *(_DWORD *)(v215 + 68) = v245;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v245 = objc_msgSend(v243, "intValue");
                  goto LABEL_488;
                }
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", v315);
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v247 = objc_msgSend(v246, "unsignedIntValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x10u;
                *(_DWORD *)(v215 + 84) = v247;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", v278);
              v248 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v249 = objc_msgSend(v248, "unsignedIntValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 4u;
                *(_DWORD *)(v215 + 76) = v249;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("confidence"));
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v250, "floatValue");
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 2u;
                *(_DWORD *)(v215 + 72) = v251;
              }

              objc_msgSend(v309, "objectForKeyedSubscript:", CFSTR("openlr"));
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v253 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v252, 0);
                v254 = v253;
                *(_WORD *)(v215 + 96) |= 0x100u;
                *(_WORD *)(v215 + 96) |= 0x400u;
                objc_storeStrong((id *)(v215 + 40), v253);

              }
            }

          }
          else
          {
            v215 = 0;
          }
          objc_msgSend(v306, "addCompactSpeeds:", v215);

        }
        v211 = v305 + 1;
      }
      while ((id)(v305 + 1) != objb);
      v255 = objc_msgSend(v293, "countByEnumeratingWithState:objects:count:", &v316, v348, 16);
      objb = (id)v255;
      if (!v255)
      {
LABEL_504:

        break;
      }
    }
  }

  if (a3)
    v256 = CFSTR("snapshotId");
  else
    v256 = CFSTR("snapshot_id");
  objc_msgSend(v262, "objectForKeyedSubscript:", v256);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v258 = (void *)objc_msgSend(v257, "copy");
    objc_msgSend(v306, "setSnapshotId:", v258);

  }
LABEL_512:

  return v306;
}

- (GEOTFTrafficSnapshot)initWithJSON:(id)a3
{
  return (GEOTFTrafficSnapshot *)-[GEOTFTrafficSnapshot _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_291;
    else
      v8 = (int *)&readAll__nonRecursiveTag_292;
    GEOTFTrafficSnapshotReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTFTrafficSnapshotCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTFTrafficSnapshotIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFTrafficSnapshotReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  __int16 flags;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  PBDataReader *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTFTrafficSnapshotIsDirty((uint64_t)self) & 1) == 0)
  {
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v24);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFTrafficSnapshot readAll:](self, "readAll:", 0);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = self->_regions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v38 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v7);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = self->_incidents;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v11);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = self->_speeds;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v30;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
      }
      while (v15);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt64Field();
    if (self->_feedId)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = self->_compactSpeeds;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v26;
      do
      {
        for (m = 0; m != v20; ++m)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      }
      while (v20);
    }

    if (self->_snapshotId)
      PBDataWriterWriteStringField();
  }

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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id *v16;
  __int16 flags;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  id *v22;

  v22 = (id *)a3;
  -[GEOTFTrafficSnapshot readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 20) = self->_readerMarkPos;
  *((_DWORD *)v22 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTFTrafficSnapshot regionsCount](self, "regionsCount"))
  {
    objc_msgSend(v22, "clearRegions");
    v4 = -[GEOTFTrafficSnapshot regionsCount](self, "regionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTFTrafficSnapshot regionAtIndex:](self, "regionAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addRegion:", v7);

      }
    }
  }
  if (-[GEOTFTrafficSnapshot incidentsCount](self, "incidentsCount"))
  {
    objc_msgSend(v22, "clearIncidents");
    v8 = -[GEOTFTrafficSnapshot incidentsCount](self, "incidentsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTFTrafficSnapshot incidentsAtIndex:](self, "incidentsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addIncidents:", v11);

      }
    }
  }
  if (-[GEOTFTrafficSnapshot speedsCount](self, "speedsCount"))
  {
    objc_msgSend(v22, "clearSpeeds");
    v12 = -[GEOTFTrafficSnapshot speedsCount](self, "speedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOTFTrafficSnapshot speedsAtIndex:](self, "speedsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSpeeds:", v15);

      }
    }
  }
  v16 = v22;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v22[5] = (id)self->_feedUpdateTime;
    *((_WORD *)v22 + 48) |= 2u;
  }
  if (self->_feedId)
  {
    objc_msgSend(v22, "setFeedId:");
    v16 = v22;
  }
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v16 + 23) = self->_trafficVersion;
    *((_WORD *)v16 + 48) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v16[4] = (id)self->_feedPublishTime;
    *((_WORD *)v16 + 48) |= 1u;
  }
  if (-[GEOTFTrafficSnapshot compactSpeedsCount](self, "compactSpeedsCount"))
  {
    objc_msgSend(v22, "clearCompactSpeeds");
    v18 = -[GEOTFTrafficSnapshot compactSpeedsCount](self, "compactSpeedsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[GEOTFTrafficSnapshot compactSpeedsAtIndex:](self, "compactSpeedsAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addCompactSpeeds:", v21);

      }
    }
  }
  if (self->_snapshotId)
    objc_msgSend(v22, "setSnapshotId:");

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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  uint64_t v24;
  void *v25;
  __int16 flags;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTFTrafficSnapshotReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFTrafficSnapshot readAll:](self, "readAll:", 0);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = self->_regions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRegion:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v10);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = self->_incidents;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidents:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v15);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = self->_speeds;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSpeeds:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_feedUpdateTime;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v24 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v24;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_trafficVersion;
    *(_WORD *)(v5 + 96) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_feedPublishTime;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = self->_compactSpeeds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v35;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v27);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v5, "addCompactSpeeds:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v28);
  }

  v32 = -[NSString copyWithZone:](self->_snapshotId, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v32;
LABEL_40:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *regions;
  NSMutableArray *incidents;
  NSMutableArray *speeds;
  __int16 flags;
  __int16 v9;
  NSString *feedId;
  NSMutableArray *compactSpeeds;
  NSString *snapshotId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOTFTrafficSnapshot readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  regions = self->_regions;
  if ((unint64_t)regions | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](regions, "isEqual:"))
      goto LABEL_30;
  }
  incidents = self->_incidents;
  if ((unint64_t)incidents | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](incidents, "isEqual:"))
      goto LABEL_30;
  }
  speeds = self->_speeds;
  if ((unint64_t)speeds | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](speeds, "isEqual:"))
      goto LABEL_30;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 48);
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_feedUpdateTime != *((_QWORD *)v4 + 5))
      goto LABEL_30;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_30;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
    {
LABEL_30:
      v13 = 0;
      goto LABEL_31;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_trafficVersion != *((_DWORD *)v4 + 23))
      goto LABEL_30;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_feedPublishTime != *((_QWORD *)v4 + 4))
      goto LABEL_30;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_30;
  }
  compactSpeeds = self->_compactSpeeds;
  if ((unint64_t)compactSpeeds | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](compactSpeeds, "isEqual:"))
  {
    goto LABEL_30;
  }
  snapshotId = self->_snapshotId;
  if ((unint64_t)snapshotId | *((_QWORD *)v4 + 8))
    v13 = -[NSString isEqual:](snapshotId, "isEqual:");
  else
    v13 = 1;
LABEL_31:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  __int16 flags;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOTFTrafficSnapshot readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_regions, "hash");
  v4 = -[NSMutableArray hash](self->_incidents, "hash");
  v5 = -[NSMutableArray hash](self->_speeds, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v6 = 2654435761 * self->_feedUpdateTime;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_feedId, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v9 = 2654435761 * self->_trafficVersion;
    if ((flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v9 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v10 = 2654435761u * self->_feedPublishTime;
LABEL_9:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_compactSpeeds, "hash");
  return v11 ^ -[NSString hash](self->_snapshotId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int16 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        -[GEOTFTrafficSnapshot addRegion:](self, "addRegion:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v7);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = *((id *)v4 + 6);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        -[GEOTFTrafficSnapshot addIncidents:](self, "addIncidents:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = *((id *)v4 + 9);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        -[GEOTFTrafficSnapshot addSpeeds:](self, "addSpeeds:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  if ((*((_WORD *)v4 + 48) & 2) != 0)
  {
    self->_feedUpdateTime = *((_QWORD *)v4 + 5);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
    -[GEOTFTrafficSnapshot setFeedId:](self, "setFeedId:");
  v20 = *((_WORD *)v4 + 48);
  if ((v20 & 4) != 0)
  {
    self->_trafficVersion = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 4u;
    v20 = *((_WORD *)v4 + 48);
  }
  if ((v20 & 1) != 0)
  {
    self->_feedPublishTime = *((_QWORD *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = *((id *)v4 + 2);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        -[GEOTFTrafficSnapshot addCompactSpeeds:](self, "addCompactSpeeds:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * m), (_QWORD)v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v23);
  }

  if (*((_QWORD *)v4 + 8))
    -[GEOTFTrafficSnapshot setSnapshotId:](self, "setSnapshotId:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speeds, 0);
  objc_storeStrong((id *)&self->_snapshotId, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_compactSpeeds, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
