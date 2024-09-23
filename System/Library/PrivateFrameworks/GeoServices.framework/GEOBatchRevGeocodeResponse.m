@implementation GEOBatchRevGeocodeResponse

- (GEOBatchRevGeocodeResponse)init
{
  GEOBatchRevGeocodeResponse *v2;
  GEOBatchRevGeocodeResponse *v3;
  GEOBatchRevGeocodeResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOBatchRevGeocodeResponse;
  v2 = -[GEOBatchRevGeocodeResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBatchRevGeocodeResponse)initWithData:(id)a3
{
  GEOBatchRevGeocodeResponse *v3;
  GEOBatchRevGeocodeResponse *v4;
  GEOBatchRevGeocodeResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOBatchRevGeocodeResponse;
  v3 = -[GEOBatchRevGeocodeResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)statusCode
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_statusCode;
  else
    return 0;
}

- (void)setStatusCode:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatusCode
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readClusters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClusters_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)clusters
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  return self->_clusters;
}

- (void)setClusters:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *clusters;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  clusters = self->_clusters;
  self->_clusters = v4;

}

- (void)clearClusters
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_clusters, "removeAllObjects");
}

- (void)addCluster:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsCluster:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsCluster:(uint64_t)a1
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

- (unint64_t)clustersCount
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  return -[NSMutableArray count](self->_clusters, "count");
}

- (id)clusterAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_clusters, "objectAtIndex:", a3);
}

+ (Class)clusterType
{
  return (Class)objc_opt_class();
}

- (void)_readBatchPlaceResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchPlaceResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)batchPlaceResults
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  return self->_batchPlaceResults;
}

- (void)setBatchPlaceResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *batchPlaceResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  batchPlaceResults = self->_batchPlaceResults;
  self->_batchPlaceResults = v4;

}

- (void)clearBatchPlaceResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_batchPlaceResults, "removeAllObjects");
}

- (void)addBatchPlaceResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsBatchPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsBatchPlaceResult:(uint64_t)a1
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

- (unint64_t)batchPlaceResultsCount
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  return -[NSMutableArray count](self->_batchPlaceResults, "count");
}

- (id)batchPlaceResultAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_batchPlaceResults, "objectAtIndex:", a3);
}

+ (Class)batchPlaceResultType
{
  return (Class)objc_opt_class();
}

- (unsigned)ttl
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_ttl;
  else
    return 15768000;
}

- (void)setTtl:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readVersionDomains
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVersionDomains_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)versionDomains
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  return self->_versionDomains;
}

- (void)setVersionDomains:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *versionDomains;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  versionDomains = self->_versionDomains;
  self->_versionDomains = v4;

}

- (void)clearVersionDomains
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_versionDomains, "removeAllObjects");
}

- (void)addVersionDomain:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  -[GEOBatchRevGeocodeResponse _addNoFlagsVersionDomain:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsVersionDomain:(uint64_t)a1
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

- (unint64_t)versionDomainsCount
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  return -[NSMutableArray count](self->_versionDomains, "count");
}

- (id)versionDomainAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeResponse _readVersionDomains]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_versionDomains, "objectAtIndex:", a3);
}

+ (Class)versionDomainType
{
  return (Class)objc_opt_class();
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -120;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOBatchRevGeocodeResponse;
  -[GEOBatchRevGeocodeResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBatchRevGeocodeResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  char v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 72) & 2) != 0)
  {
    v5 = *(_DWORD *)(a1 + 60);
    if (v5 <= 29)
    {
      v6 = CFSTR("STATUS_SUCCESS");
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v6 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v5 != 20)
            goto LABEL_15;
          v6 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("statusCode"));

        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cluster"));
  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = *(id *)(a1 + 16);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("batchPlaceResult"));
  }
  if ((*(_BYTE *)(a1 + 72) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("ttl"));

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)a1, "versionDomains");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("versionDomain");
    else
      v25 = CFSTR("version_domain");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(_BYTE *)(a1 + 72);
  if ((v26 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("version"));

    v26 = *(_BYTE *)(a1 + 72);
  }
  if ((v26 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("timestamp"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOBatchRevGeocodeResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBatchRevGeocodeResponse)initWithDictionary:(id)a3
{
  return (GEOBatchRevGeocodeResponse *)-[GEOBatchRevGeocodeResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  char *v8;
  char *v9;
  void *v10;
  GEOCluster *v11;
  uint64_t v12;
  void *v13;
  GEOPlaceResult *v14;
  GEOPlaceResult *v15;
  GEOPlaceResult *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  GEOBatchPlaceResult *v29;
  id v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  GEOPlaceResult *v35;
  GEOPlaceResult *v36;
  GEOPlaceResult *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  char *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v51 = a2;
  if (!a1 || (v59 = (void *)objc_msgSend(a1, "init")) == 0)
  {
    v59 = 0;
    goto LABEL_129;
  }
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v6 = 20;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v6 = 30;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v6 = 40;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v6 = 50;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v6 = 60;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_27:
    objc_msgSend(v59, "setStatusCode:", v6);
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("cluster"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v50;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v50;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v55)
    {
      v54 = *(_QWORD *)v71;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v71 != v54)
          {
            v9 = v8;
            objc_enumerationMutation(obj);
            v8 = v9;
          }
          v60 = v8;
          v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = [GEOCluster alloc];
            if (v11)
            {
              v57 = v10;
              v12 = -[GEOCluster init](v11, "init");
              if (v12)
              {
                objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("container"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v14 = [GEOPlaceResult alloc];
                  if ((a3 & 1) != 0)
                    v15 = -[GEOPlaceResult initWithJSON:](v14, "initWithJSON:", v13);
                  else
                    v15 = -[GEOPlaceResult initWithDictionary:](v14, "initWithDictionary:", v13);
                  v16 = v15;
                  -[GEOCluster setContainer:](v12, v15);

                }
                objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("index"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  v17 = v56;
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
                  if (v18)
                  {
                    v19 = *(_QWORD *)v75;
                    do
                    {
                      for (i = 0; i != v18; ++i)
                      {
                        if (*(_QWORD *)v75 != v19)
                          objc_enumerationMutation(v17);
                        v21 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v21, "intValue");
                          os_unfair_lock_lock((os_unfair_lock_t)(v12 + 56));
                          if ((*(_BYTE *)(v12 + 60) & 1) == 0)
                          {
                            v22 = *(void **)(v12 + 8);
                            if (v22)
                            {
                              v23 = v22;
                              objc_sync_enter(v23);
                              GEOClusterReadSpecified(v12, *(_QWORD *)(v12 + 8), (int *)&_readIndexs_tags);
                              objc_sync_exit(v23);

                            }
                          }
                          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
                          PBRepeatedInt32Add();
                          os_unfair_lock_lock_with_options();
                          *(_BYTE *)(v12 + 60) |= 1u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 56));
                          *(_BYTE *)(v12 + 60) |= 4u;
                        }
                      }
                      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
                    }
                    while (v18);
                  }

                }
              }

            }
            else
            {
              v12 = 0;
            }
            objc_msgSend(v59, "addCluster:", v12, v50);

          }
          v8 = v60 + 1;
        }
        while (v60 + 1 != (char *)v55);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        v55 = v24;
      }
      while (v24);
    }

    v7 = v50;
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("batchPlaceResult"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v61 = v58;
    v25 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    if (!v25)
      goto LABEL_107;
    v26 = *(_QWORD *)v67;
    while (1)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v67 != v26)
          objc_enumerationMutation(v61);
        v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = [GEOBatchPlaceResult alloc];
          if (v29)
          {
            v30 = v28;
            v29 = -[GEOBatchPlaceResult init](v29, "init");
            if (v29)
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("statusCode"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = v31;
                if ((objc_msgSend(v32, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
                {
                  v33 = 0;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
                {
                  v33 = 1;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
                {
                  v33 = 2;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
                {
                  v33 = 5;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
                {
                  v33 = 20;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
                {
                  v33 = 30;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
                {
                  v33 = 40;
                }
                else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
                {
                  v33 = 50;
                }
                else if (objc_msgSend(v32, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
                {
                  v33 = 60;
                }
                else
                {
                  v33 = 0;
                }

LABEL_96:
                *(_BYTE *)&v29->_flags |= 1u;
                v29->_statusCode = v33;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = objc_msgSend(v31, "intValue");
                  goto LABEL_96;
                }
              }

              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("placeResult"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = [GEOPlaceResult alloc];
                if ((a3 & 1) != 0)
                  v36 = -[GEOPlaceResult initWithJSON:](v35, "initWithJSON:", v34);
                else
                  v36 = -[GEOPlaceResult initWithDictionary:](v35, "initWithDictionary:", v34);
                v37 = v36;
                -[GEOBatchPlaceResult setPlaceResult:]((uint64_t)v29, v36);

              }
            }

          }
          objc_msgSend(v59, "addBatchPlaceResult:", v29, v50);

          continue;
        }
      }
      v25 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      if (!v25)
      {
LABEL_107:

        break;
      }
    }
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("ttl"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v59, "setTtl:", objc_msgSend(v38, "unsignedIntValue"));

  if (a3)
    v39 = CFSTR("versionDomain");
  else
    v39 = CFSTR("version_domain");
  objc_msgSend(v51, "objectForKeyedSubscript:", v39, v50);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v63;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v63 != v43)
            objc_enumerationMutation(v41);
          v45 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = (void *)objc_msgSend(v45, "copy");
            objc_msgSend(v59, "addVersionDomain:", v46);

          }
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      }
      while (v42);
    }

  }
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("version"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v59, "setVersion:", objc_msgSend(v47, "unsignedIntValue"));

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v48, "doubleValue");
    objc_msgSend(v59, "setTimestamp:");
  }

LABEL_129:
  return v59;
}

- (GEOBatchRevGeocodeResponse)initWithJSON:(id)a3
{
  return (GEOBatchRevGeocodeResponse *)-[GEOBatchRevGeocodeResponse _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
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

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_170;
    else
      v8 = (int *)&readAll__nonRecursiveTag_171;
    GEOBatchRevGeocodeResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_clusters;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          -[GEOCluster readAll:](*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 1);
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v10);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = self->_batchPlaceResults;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v17;
      while (1)
      {
        if (*(_QWORD *)v17 != v15)
          objc_enumerationMutation(v13);
        if (!--v14)
        {
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (!v14)
            break;
        }
      }
    }

  }
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
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  BOOL v25;
  char v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  int v33;
  int v34;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  int v45;
  char v46;
  unsigned int v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  int v53;
  int v54;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  BOOL v75;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
LABEL_137:
    v75 = *((_BYTE *)a3 + *v6) == 0;
    PBReaderRecallMark();
  }
  else
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_137;
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
        v15 = v9++ >= 9;
        if (v15)
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
        goto LABEL_137;
      switch((v10 >> 3))
      {
        case 1u:
          if ((v10 & 7) != 0)
            goto LABEL_139;
          v20 = 0;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_129;
            v24 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v22);
            *(_QWORD *)((char *)a3 + v21) = v23;
            if (v24 < 0)
            {
              v25 = v20++ > 8;
              if (!v25)
                continue;
            }
            goto LABEL_131;
          }
        case 2u:
          if (v18 != 2 || !PBReaderPlaceMark())
            goto LABEL_139;
          objc_msgSend(a3, "position", 0, 0);
          objc_msgSend(a3, "length");
LABEL_30:
          while (2)
          {
            if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5) || *((_BYTE *)a3 + *v6))
              goto LABEL_108;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            while (1)
            {
              v29 = *v4;
              v30 = *(_QWORD *)((char *)a3 + v29);
              v31 = v30 + 1;
              if (v30 == -1 || v31 > *(_QWORD *)((char *)a3 + *v5))
                break;
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v30);
              *(_QWORD *)((char *)a3 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if ((v32 & 0x80) == 0)
                goto LABEL_40;
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                v28 = 0;
                v33 = *((unsigned __int8 *)a3 + *v6);
                goto LABEL_42;
              }
            }
            *((_BYTE *)a3 + *v6) = 1;
LABEL_40:
            v33 = *((unsigned __int8 *)a3 + *v6);
            if (*((_BYTE *)a3 + *v6))
              v28 = 0;
LABEL_42:
            v34 = v28 & 7;
            if (v33 || v34 == 4)
              goto LABEL_108;
            if ((v28 >> 3) == 2)
            {
              if (v34 == 2)
              {
                if (PBReaderPlaceMark())
                {
LABEL_62:
                  while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5))
                  {
                    v41 = *((unsigned __int8 *)a3 + *v6);
                    if (*((_BYTE *)a3 + *v6))
                      break;
                    while (1)
                    {
                      v42 = *v4;
                      v43 = *(_QWORD *)((char *)a3 + v42);
                      v44 = v43 + 1;
                      if (v43 == -1 || v44 > *(_QWORD *)((char *)a3 + *v5))
                        break;
                      v45 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v43);
                      *(_QWORD *)((char *)a3 + v42) = v44;
                      if (v45 < 0)
                      {
                        v15 = v41++ >= 9;
                        if (!v15)
                          continue;
                      }
                      goto LABEL_62;
                    }
                    *((_BYTE *)a3 + *v6) = 1;
                  }
                  goto LABEL_51;
                }
              }
              else if ((v28 & 7) == 0)
              {
                do
                {
                  v36 = *v4;
                  v37 = *(_QWORD *)((char *)a3 + v36);
                  v38 = v37 + 1;
                  if (v37 == -1 || v38 > *(_QWORD *)((char *)a3 + *v5))
                  {
                    *((_BYTE *)a3 + *v6) = 1;
                    goto LABEL_30;
                  }
                  v39 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v37);
                  *(_QWORD *)((char *)a3 + v36) = v38;
                  if ((v39 & 0x80000000) == 0)
                    break;
                  v40 = v34++;
                }
                while (v40 <= 8);
                continue;
              }
            }
            else
            {
              if ((v28 >> 3) != 1)
              {
                if ((PBReaderSkipValueWithTag() & 1) == 0)
                  break;
                continue;
              }
              if (v34 == 2 && PBReaderPlaceMark() && GEOPlaceResultIsValid((char *)a3))
              {
LABEL_51:
                PBReaderRecallMark();
                continue;
              }
            }
            break;
          }
LABEL_138:
          PBReaderRecallMark();
LABEL_139:
          PBReaderRecallMark();
          v75 = 0;
          break;
        case 3u:
          if (v18 != 2 || !PBReaderPlaceMark())
            goto LABEL_139;
          objc_msgSend(a3, "position", 0, 0);
          objc_msgSend(a3, "length");
LABEL_75:
          while (2)
          {
            if (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5) && !*((_BYTE *)a3 + *v6))
            {
              v46 = 0;
              v47 = 0;
              v48 = 0;
              while (1)
              {
                v49 = *v4;
                v50 = *(_QWORD *)((char *)a3 + v49);
                v51 = v50 + 1;
                if (v50 == -1 || v51 > *(_QWORD *)((char *)a3 + *v5))
                  break;
                v52 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v50);
                *(_QWORD *)((char *)a3 + v49) = v51;
                v48 |= (unint64_t)(v52 & 0x7F) << v46;
                if ((v52 & 0x80) == 0)
                  goto LABEL_85;
                v46 += 7;
                v15 = v47++ >= 9;
                if (v15)
                {
                  v48 = 0;
                  v53 = *((unsigned __int8 *)a3 + *v6);
                  goto LABEL_87;
                }
              }
              *((_BYTE *)a3 + *v6) = 1;
LABEL_85:
              v53 = *((unsigned __int8 *)a3 + *v6);
              if (*((_BYTE *)a3 + *v6))
                v48 = 0;
LABEL_87:
              v54 = v48 & 7;
              if (!v53 && v54 != 4)
              {
                if ((v48 >> 3) == 2)
                {
                  if (v54 == 2 && PBReaderPlaceMark() && GEOPlaceResultIsValid((char *)a3))
                  {
                    PBReaderRecallMark();
                    continue;
                  }
                }
                else
                {
                  if ((v48 >> 3) != 1)
                  {
                    if ((PBReaderSkipValueWithTag() & 1) == 0)
                      goto LABEL_138;
                    continue;
                  }
                  if ((v48 & 7) == 0)
                  {
                    v56 = 0;
                    do
                    {
                      v57 = *v4;
                      v58 = *(_QWORD *)((char *)a3 + v57);
                      v59 = v58 + 1;
                      if (v58 == -1 || v59 > *(_QWORD *)((char *)a3 + *v5))
                      {
                        *((_BYTE *)a3 + *v6) = 1;
                        goto LABEL_75;
                      }
                      v60 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v58);
                      *(_QWORD *)((char *)a3 + v57) = v59;
                      if ((v60 & 0x80000000) == 0)
                        break;
                      v25 = v56++ > 8;
                    }
                    while (!v25);
                    continue;
                  }
                }
                goto LABEL_138;
              }
            }
            break;
          }
LABEL_108:
          v61 = *((unsigned __int8 *)a3 + *v6);
          PBReaderRecallMark();
          if (v61)
            goto LABEL_139;
          PBReaderRecallMark();
LABEL_131:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_137;
          continue;
        case 4u:
          if ((v10 & 7) != 0)
            goto LABEL_139;
          v62 = 0;
          while (1)
          {
            v63 = *v4;
            v64 = *(_QWORD *)((char *)a3 + v63);
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_129;
            v66 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v64);
            *(_QWORD *)((char *)a3 + v63) = v65;
            if (v66 < 0)
            {
              v25 = v62++ > 8;
              if (!v25)
                continue;
            }
            goto LABEL_131;
          }
        case 5u:
          if (v18 == 2)
            goto LABEL_119;
          goto LABEL_139;
        case 6u:
          if ((v10 & 7) != 0)
            goto LABEL_139;
          v67 = 0;
          while (1)
          {
            v68 = *v4;
            v69 = *(_QWORD *)((char *)a3 + v68);
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)((char *)a3 + *v5))
              break;
            v71 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v69);
            *(_QWORD *)((char *)a3 + v68) = v70;
            if (v71 < 0)
            {
              v25 = v67++ > 8;
              if (!v25)
                continue;
            }
            goto LABEL_131;
          }
LABEL_129:
          v16 = *v6;
LABEL_130:
          *((_BYTE *)a3 + v16) = 1;
          goto LABEL_131;
        case 7u:
          if (v18 != 1)
            goto LABEL_139;
          v72 = *v4;
          v73 = *(_QWORD *)((char *)a3 + v72);
          if (v73 > 0xFFFFFFFFFFFFFFF7)
            goto LABEL_130;
          v74 = v73 + 8;
          if (v74 > *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_130;
          *(_QWORD *)((char *)a3 + v72) = v74;
          goto LABEL_131;
        default:
LABEL_119:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_139;
          goto LABEL_131;
      }
      break;
    }
  }
  return v75;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBatchRevGeocodeResponseReadAllFrom((uint64_t)self, a3);
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
  char flags;
  PBDataReader *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0xFu))
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOBatchRevGeocodeResponse readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_clusters;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_batchPlaceResults;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = self->_versionDomains;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteStringField();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v15);
    }

    flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  unint64_t v5;
  id *v6;
  id *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;

  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  if (-[NSMutableArray count](self->_clusters, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_clusters, "objectAtIndexedSubscript:", v5);
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        -[GEOCluster container](v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = GEOPlaceResultHasSensitiveFields(v8);

        if (v9)
        {
          v10 = (void *)objc_msgSend(v7, "copy");
          GEOClusterClearSensitiveFields((uint64_t)v10, a3, 0);
          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_clusters, "replaceObjectAtIndex:withObject:", v5, v10);

        }
        else
        {
          GEOClusterClearSensitiveFields((uint64_t)v7, a3, 1);
        }
      }

      ++v5;
    }
    while (v5 < -[NSMutableArray count](self->_clusters, "count"));
  }
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  if (-[NSMutableArray count](self->_batchPlaceResults, "count"))
  {
    v11 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_batchPlaceResults, "objectAtIndexedSubscript:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
      {
        if (GEOPlaceResultHasSensitiveFields(*(void **)(v12 + 8)))
        {
          v14 = (id *)objc_msgSend(v13, "copy");
          GEOBatchPlaceResultClearSensitiveFields(v14, a3, 0);
          -[NSMutableArray replaceObjectAtIndex:withObject:](self->_batchPlaceResults, "replaceObjectAtIndex:withObject:", v11, v14);

        }
        else
        {
          GEOBatchPlaceResultClearSensitiveFields((id *)v13, a3, 1);
        }
      }

      ++v11;
    }
    while (v11 < -[NSMutableArray count](self->_batchPlaceResults, "count"));
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[GEOBatchRevGeocodeResponse _readBatchPlaceResults]((uint64_t)self);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_batchPlaceResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
      if (v10)
      {
        if ((objc_msgSend(*(id *)(v10 + 8), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_20;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOBatchRevGeocodeResponse _readClusters]((uint64_t)self);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_clusters;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_12:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v5);
      v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
      if (v15)
      {
        -[GEOCluster _readContainer](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        if ((objc_msgSend(*(id *)(v15 + 40), "hasGreenTeaWithValue:", v3, (_QWORD)v18) & 1) != 0)
          break;
      }
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
          goto LABEL_12;
        goto LABEL_19;
      }
    }
LABEL_20:
    v16 = 1;
    goto LABEL_21;
  }
LABEL_19:
  v16 = 0;
LABEL_21:

  return v16;
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
  char flags;
  id *v17;

  v17 = (id *)a3;
  -[GEOBatchRevGeocodeResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 12) = self->_readerMarkPos;
  *((_DWORD *)v17 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v17 + 15) = self->_statusCode;
    *((_BYTE *)v17 + 72) |= 2u;
  }
  if (-[GEOBatchRevGeocodeResponse clustersCount](self, "clustersCount"))
  {
    objc_msgSend(v17, "clearClusters");
    v4 = -[GEOBatchRevGeocodeResponse clustersCount](self, "clustersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOBatchRevGeocodeResponse clusterAtIndex:](self, "clusterAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addCluster:", v7);

      }
    }
  }
  if (-[GEOBatchRevGeocodeResponse batchPlaceResultsCount](self, "batchPlaceResultsCount"))
  {
    objc_msgSend(v17, "clearBatchPlaceResults");
    v8 = -[GEOBatchRevGeocodeResponse batchPlaceResultsCount](self, "batchPlaceResultsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOBatchRevGeocodeResponse batchPlaceResultAtIndex:](self, "batchPlaceResultAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addBatchPlaceResult:", v11);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v17 + 16) = self->_ttl;
    *((_BYTE *)v17 + 72) |= 4u;
  }
  if (-[GEOBatchRevGeocodeResponse versionDomainsCount](self, "versionDomainsCount"))
  {
    objc_msgSend(v17, "clearVersionDomains");
    v12 = -[GEOBatchRevGeocodeResponse versionDomainsCount](self, "versionDomainsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOBatchRevGeocodeResponse versionDomainAtIndex:](self, "versionDomainAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addVersionDomain:", v15);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v17 + 17) = self->_version;
    *((_BYTE *)v17 + 72) |= 8u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v17[4] = *(id *)&self->_timestamp;
    *((_BYTE *)v17 + 72) |= 1u;
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
  char flags;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
      GEOBatchRevGeocodeResponseReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOBatchRevGeocodeResponse readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_statusCode;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = self->_clusters;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addCluster:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = self->_batchPlaceResults;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBatchPlaceResult:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_ttl;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_versionDomains;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addVersionDomain:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_version;
    *(_BYTE *)(v5 + 72) |= 8u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_timestamp;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *clusters;
  NSMutableArray *batchPlaceResults;
  char flags;
  char v8;
  NSMutableArray *versionDomains;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOBatchRevGeocodeResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 15))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_28;
  }
  clusters = self->_clusters;
  if ((unint64_t)clusters | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](clusters, "isEqual:"))
  {
    goto LABEL_28;
  }
  batchPlaceResults = self->_batchPlaceResults;
  if ((unint64_t)batchPlaceResults | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](batchPlaceResults, "isEqual:"))
      goto LABEL_28;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_ttl != *((_DWORD *)v4 + 16))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_28;
  }
  versionDomains = self->_versionDomains;
  if ((unint64_t)versionDomains | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](versionDomains, "isEqual:"))
    {
LABEL_28:
      v10 = 0;
      goto LABEL_29;
    }
    flags = (char)self->_flags;
    v8 = *((_BYTE *)v4 + 72);
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_version != *((_DWORD *)v4 + 17))
      goto LABEL_28;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_28;
  }
  v10 = (v8 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_timestamp != *((double *)v4 + 4))
      goto LABEL_28;
    v10 = 1;
  }
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double timestamp;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;

  -[GEOBatchRevGeocodeResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_statusCode;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_clusters, "hash");
  v5 = -[NSMutableArray hash](self->_batchPlaceResults, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v6 = 2654435761 * self->_ttl;
  else
    v6 = 0;
  v7 = -[NSMutableArray hash](self->_versionDomains, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v8 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_9;
LABEL_14:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_14;
LABEL_9:
  timestamp = self->_timestamp;
  v10 = -timestamp;
  if (timestamp >= 0.0)
    v10 = self->_timestamp;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v13;
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
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[GEOBatchRevGeocodeResponse addCluster:](self, "addCluster:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[GEOBatchRevGeocodeResponse addBatchPlaceResult:](self, "addBatchPlaceResult:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    self->_ttl = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = *((id *)v4 + 5);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[GEOBatchRevGeocodeResponse addVersionDomain:](self, "addVersionDomain:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  v20 = *((_BYTE *)v4 + 72);
  if ((v20 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 8u;
    v20 = *((_BYTE *)v4 + 72);
  }
  if ((v20 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionDomains, 0);
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_batchPlaceResults, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
