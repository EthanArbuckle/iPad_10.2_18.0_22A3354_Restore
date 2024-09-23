@implementation GEOTransitRouteUpdateResponse

- (GEOTransitRouteUpdateResponse)init
{
  GEOTransitRouteUpdateResponse *v2;
  GEOTransitRouteUpdateResponse *v3;
  GEOTransitRouteUpdateResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateResponse;
  v2 = -[GEOTransitRouteUpdateResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateResponse)initWithData:(id)a3
{
  GEOTransitRouteUpdateResponse *v3;
  GEOTransitRouteUpdateResponse *v4;
  GEOTransitRouteUpdateResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateResponse;
  v3 = -[GEOTransitRouteUpdateResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteUpdates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteUpdates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)routeUpdates
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  return self->_routeUpdates;
}

- (void)setRouteUpdates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeUpdates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeUpdates = self->_routeUpdates;
  self->_routeUpdates = v4;

}

- (void)clearRouteUpdates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_routeUpdates, "removeAllObjects");
}

- (void)addRouteUpdate:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  -[GEOTransitRouteUpdateResponse _addNoFlagsRouteUpdate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsRouteUpdate:(uint64_t)a1
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

- (unint64_t)routeUpdatesCount
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  return -[NSMutableArray count](self->_routeUpdates, "count");
}

- (id)routeUpdateAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeUpdates, "objectAtIndex:", a3);
}

+ (Class)routeUpdateType
{
  return (Class)objc_opt_class();
}

- (void)_readResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResponseId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasResponseId
{
  -[GEOTransitRouteUpdateResponse _readResponseId]((uint64_t)self);
  return self->_responseId != 0;
}

- (NSData)responseId
{
  -[GEOTransitRouteUpdateResponse _readResponseId]((uint64_t)self);
  return self->_responseId;
}

- (void)setResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_responseId, a3);
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 258;
  else
    v3 = 256;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
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

- (int)StringAsStatus:(id)a3
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

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDatasetAbStatus
{
  -[GEOTransitRouteUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOTransitRouteUpdateResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)_readRouteUpdateConfiguration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteUpdateConfiguration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasRouteUpdateConfiguration
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdateConfiguration]((uint64_t)self);
  return self->_routeUpdateConfiguration != 0;
}

- (GEOTransitRouteUpdateConfiguration)routeUpdateConfiguration
{
  -[GEOTransitRouteUpdateResponse _readRouteUpdateConfiguration]((uint64_t)self);
  return self->_routeUpdateConfiguration;
}

- (void)setRouteUpdateConfiguration:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_routeUpdateConfiguration, a3);
}

- (GEOTimepoint)timepointUsed
{
  *retstr = self[1];
  return self;
}

- (void)setTimepointUsed:(GEOTimepoint *)a3
{
  uint64_t v3;

  *(_WORD *)&self->_flags |= 0x101u;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(_QWORD *)&self->_timepointUsed._type = v3;
}

- (void)setHasTimepointUsed:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasTimepointUsed
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readTransitDataVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitDataVersion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitDataVersion
{
  -[GEOTransitRouteUpdateResponse _readTransitDataVersion]((uint64_t)self);
  return self->_transitDataVersion != 0;
}

- (NSString)transitDataVersion
{
  -[GEOTransitRouteUpdateResponse _readTransitDataVersion]((uint64_t)self);
  return self->_transitDataVersion;
}

- (void)setTransitDataVersion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_transitDataVersion, a3);
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
  v8.super_class = (Class)GEOTransitRouteUpdateResponse;
  -[GEOTransitRouteUpdateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteUpdateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 0);
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
  int v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = *(id *)(a1 + 72);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
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
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("routeUpdate");
    else
      v13 = CFSTR("route_update");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "responseId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("responseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("response_id"));
    }
  }

  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
    v17 = *(_DWORD *)(a1 + 100);
    if (v17 <= 29)
    {
      v18 = CFSTR("STATUS_SUCCESS");
      switch(v17)
      {
        case 0:
          goto LABEL_39;
        case 1:
          v18 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v18 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_34;
        case 5:
          v18 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v17 != 20)
            goto LABEL_34;
          v18 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_39;
    }
    if (v17 > 49)
    {
      if (v17 == 50)
      {
        v18 = CFSTR("STATUS_DEDUPED");
        goto LABEL_39;
      }
      if (v17 == 60)
      {
        v18 = CFSTR("VERSION_MISMATCH");
        goto LABEL_39;
      }
    }
    else
    {
      if (v17 == 30)
      {
        v18 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_39;
      }
      if (v17 == 40)
      {
        v18 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_39:
        objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("status"));

        goto LABEL_40;
      }
    }
LABEL_34:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 100));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
LABEL_40:
  objc_msgSend((id)a1, "datasetAbStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("datasetAbStatus");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("dataset_ab_status");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "routeUpdateConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("routeUpdateConfiguration");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("route_update_configuration");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    if (a2)
      v27 = CFSTR("timepointUsed");
    else
      v27 = CFSTR("timepoint_used");
    _GEOTimepointDictionaryRepresentation(a1 + 24, a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, v27);

  }
  objc_msgSend((id)a1, "transitDataVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    if (a2)
      v30 = CFSTR("transitDataVersion");
    else
      v30 = CFSTR("transit_data_version");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __59__GEOTransitRouteUpdateResponse__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitRouteUpdateResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitRouteUpdateResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdateResponse)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateResponse *)-[GEOTransitRouteUpdateResponse _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOTransitRouteUpdate *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  GEOPDDatasetABStatus *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOTransitRouteUpdateConfiguration *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_76;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_76;
  if (a3)
    v6 = CFSTR("routeUpdate");
  else
    v6 = CFSTR("route_update");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v5;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEOTransitRouteUpdate alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEOTransitRouteUpdate initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEOTransitRouteUpdate initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addRouteUpdate:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v10);
    }

    v5 = v39;
  }

  if (a3)
    v17 = CFSTR("responseId");
  else
    v17 = CFSTR("response_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v18, 0);
    objc_msgSend(a1, "setResponseId:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v22 = 1;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v22 = 2;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v22 = 5;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v22 = 20;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v22 = 30;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v22 = 40;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v22 = 50;
    }
    else if (objc_msgSend(v21, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v22 = 60;
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v20, "intValue");
LABEL_48:
    objc_msgSend(a1, "setStatus:", v22);
  }

  if (a3)
    v23 = CFSTR("datasetAbStatus");
  else
    v23 = CFSTR("dataset_ab_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEOPDDatasetABStatus alloc];
    if ((a3 & 1) != 0)
      v26 = -[GEOPDDatasetABStatus initWithJSON:](v25, "initWithJSON:", v24);
    else
      v26 = -[GEOPDDatasetABStatus initWithDictionary:](v25, "initWithDictionary:", v24);
    v27 = (void *)v26;
    objc_msgSend(a1, "setDatasetAbStatus:", v26);

  }
  if (a3)
    v28 = CFSTR("routeUpdateConfiguration");
  else
    v28 = CFSTR("route_update_configuration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOTransitRouteUpdateConfiguration alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOTransitRouteUpdateConfiguration initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOTransitRouteUpdateConfiguration initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setRouteUpdateConfiguration:", v31);

  }
  if (a3)
    v33 = CFSTR("timepointUsed");
  else
    v33 = CFSTR("timepoint_used");
  objc_msgSend(v5, "objectForKeyedSubscript:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = 0uLL;
    v43 = 0;
    _GEOTimepointFromDictionaryRepresentation(v34, (uint64_t)&v42, a3);
    v40 = v42;
    v41 = v43;
    objc_msgSend(a1, "setTimepointUsed:", &v40);
  }

  if (a3)
    v35 = CFSTR("transitDataVersion");
  else
    v35 = CFSTR("transit_data_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(v36, "copy");
    objc_msgSend(a1, "setTransitDataVersion:", v37);

  }
LABEL_76:

  return a1;
}

- (GEOTransitRouteUpdateResponse)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateResponse *)-[GEOTransitRouteUpdateResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_396;
    else
      v8 = (int *)&readAll__nonRecursiveTag_397;
    GEOTransitRouteUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitRouteUpdateResponseCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateResponseReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
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
    -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_routeUpdates;
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
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_responseId)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    if (self->_routeUpdateConfiguration)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepointUsed);
      PBDataWriterRecallMark();
    }
    if (self->_transitDataVersion)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  void *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 22) = self->_readerMarkPos;
  *((_DWORD *)v10 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitRouteUpdateResponse routeUpdatesCount](self, "routeUpdatesCount"))
  {
    objc_msgSend(v10, "clearRouteUpdates");
    v4 = -[GEOTransitRouteUpdateResponse routeUpdatesCount](self, "routeUpdatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitRouteUpdateResponse routeUpdateAtIndex:](self, "routeUpdateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRouteUpdate:", v7);

      }
    }
  }
  if (self->_responseId)
    objc_msgSend(v10, "setResponseId:");
  v8 = v10;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v10 + 25) = self->_status;
    *((_WORD *)v10 + 52) |= 2u;
  }
  if (self->_datasetAbStatus)
  {
    objc_msgSend(v10, "setDatasetAbStatus:");
    v8 = v10;
  }
  if (self->_routeUpdateConfiguration)
  {
    objc_msgSend(v10, "setRouteUpdateConfiguration:");
    v8 = v10;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v9 = *(void **)&self->_timepointUsed._type;
    *(_OWORD *)(v8 + 3) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    v8[5] = v9;
    *((_WORD *)v8 + 52) |= 1u;
  }
  if (self->_transitDataVersion)
  {
    objc_msgSend(v10, "setTransitDataVersion:");
    v8 = v10;
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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PBUnknownFields *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitRouteUpdateResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_routeUpdates;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addRouteUpdate:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  v14 = -[NSData copyWithZone:](self->_responseId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_status;
    *(_WORD *)(v5 + 104) |= 2u;
  }
  v16 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3, (_QWORD)v25);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  v18 = -[GEOTransitRouteUpdateConfiguration copyWithZone:](self->_routeUpdateConfiguration, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v20 = *(_QWORD *)&self->_timepointUsed._type;
    *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_timepointUsed._currentUserTime;
    *(_QWORD *)(v5 + 40) = v20;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v21 = -[NSString copyWithZone:](self->_transitDataVersion, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v21;

  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *routeUpdates;
  NSData *responseId;
  __int16 v7;
  GEOPDDatasetABStatus *datasetAbStatus;
  GEOTransitRouteUpdateConfiguration *routeUpdateConfiguration;
  __int16 v10;
  BOOL v11;
  char v13;
  NSString *transitDataVersion;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeUpdates = self->_routeUpdates;
  if ((unint64_t)routeUpdates | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](routeUpdates, "isEqual:"))
      goto LABEL_26;
  }
  responseId = self->_responseId;
  if ((unint64_t)responseId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](responseId, "isEqual:"))
      goto LABEL_26;
  }
  v7 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_status != *((_DWORD *)v4 + 25))
      goto LABEL_26;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_26;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((_QWORD *)v4 + 6)
    && !-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
  {
    goto LABEL_26;
  }
  routeUpdateConfiguration = self->_routeUpdateConfiguration;
  if ((unint64_t)routeUpdateConfiguration | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTransitRouteUpdateConfiguration isEqual:](routeUpdateConfiguration, "isEqual:"))
      goto LABEL_26;
  }
  v10 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v10 & 1) == 0)
      goto LABEL_26;
    v11 = *(_QWORD *)&self->_timepointUsed._currentUserTime == *((_QWORD *)v4 + 3)
       && *(_QWORD *)&self->_timepointUsed._time == *((_QWORD *)v4 + 4);
    if (!v11 || *(_QWORD *)&self->_timepointUsed._type != *((_QWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((v10 & 1) != 0)
  {
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  transitDataVersion = self->_transitDataVersion;
  if ((unint64_t)transitDataVersion | *((_QWORD *)v4 + 10))
    v13 = -[NSString isEqual:](transitDataVersion, "isEqual:");
  else
    v13 = 1;
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_routeUpdates, "hash");
  v4 = -[NSData hash](self->_responseId, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_status;
  else
    v5 = 0;
  v6 = -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  v7 = -[GEOTransitRouteUpdateConfiguration hash](self->_routeUpdateConfiguration, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v8 = PBHashBytes();
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_transitDataVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v11;
  GEOTransitRouteUpdateConfiguration *routeUpdateConfiguration;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v4 + 9);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitRouteUpdateResponse addRouteUpdate:](self, "addRouteUpdate:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 7))
    -[GEOTransitRouteUpdateResponse setResponseId:](self, "setResponseId:");
  if ((*((_WORD *)v4 + 52) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 2u;
  }
  datasetAbStatus = self->_datasetAbStatus;
  v11 = *((_QWORD *)v4 + 6);
  if (datasetAbStatus)
  {
    if (v11)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOTransitRouteUpdateResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  routeUpdateConfiguration = self->_routeUpdateConfiguration;
  v13 = *((_QWORD *)v4 + 8);
  if (routeUpdateConfiguration)
  {
    if (v13)
      -[GEOTransitRouteUpdateConfiguration mergeFrom:](routeUpdateConfiguration, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOTransitRouteUpdateResponse setRouteUpdateConfiguration:](self, "setRouteUpdateConfiguration:");
  }
  if ((*((_WORD *)v4 + 52) & 1) != 0)
  {
    v14 = *((_QWORD *)v4 + 5);
    *(_OWORD *)&self->_timepointUsed._currentUserTime = *(_OWORD *)(v4 + 24);
    *(_QWORD *)&self->_timepointUsed._type = v14;
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v4 + 10))
    -[GEOTransitRouteUpdateResponse setTransitDataVersion:](self, "setTransitDataVersion:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteUpdateResponseReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_400);
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
  *(_WORD *)&self->_flags |= 0x104u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitRouteUpdateResponse readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_routeUpdates;
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

    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1);
    -[GEOTransitRouteUpdateConfiguration clearUnknownFields:](self->_routeUpdateConfiguration, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitDataVersion, 0);
  objc_storeStrong((id *)&self->_routeUpdates, 0);
  objc_storeStrong((id *)&self->_routeUpdateConfiguration, 0);
  objc_storeStrong((id *)&self->_responseId, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
