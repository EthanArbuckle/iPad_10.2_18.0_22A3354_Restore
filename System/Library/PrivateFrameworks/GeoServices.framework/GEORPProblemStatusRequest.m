@implementation GEORPProblemStatusRequest

- (GEORPProblemStatusRequest)init
{
  GEORPProblemStatusRequest *v2;
  GEORPProblemStatusRequest *v3;
  GEORPProblemStatusRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemStatusRequest;
  v2 = -[GEORPProblemStatusRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemStatusRequest)initWithData:(id)a3
{
  GEORPProblemStatusRequest *v3;
  GEORPProblemStatusRequest *v4;
  GEORPProblemStatusRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemStatusRequest;
  v3 = -[GEORPProblemStatusRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUserCredentials
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserCredentials_tags_2504);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasUserCredentials
{
  -[GEORPProblemStatusRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials != 0;
}

- (GEORPUserCredentials)userCredentials
{
  -[GEORPProblemStatusRequest _readUserCredentials]((uint64_t)self);
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void)_readStatusNotificationId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStatusNotificationId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStatusNotificationId
{
  -[GEORPProblemStatusRequest _readStatusNotificationId]((uint64_t)self);
  return self->_statusNotificationId != 0;
}

- (NSString)statusNotificationId
{
  -[GEORPProblemStatusRequest _readStatusNotificationId]((uint64_t)self);
  return self->_statusNotificationId;
}

- (void)setStatusNotificationId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_statusNotificationId, a3);
}

- (void)_readProblemIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)problemIds
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  return self->_problemIds;
}

- (void)setProblemIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *problemIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  problemIds = self->_problemIds;
  self->_problemIds = v4;

}

- (void)clearProblemIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_problemIds, "removeAllObjects");
}

- (void)addProblemId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  -[GEORPProblemStatusRequest _addNoFlagsProblemId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsProblemId:(uint64_t)a1
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

- (unint64_t)problemIdsCount
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  return -[NSMutableArray count](self->_problemIds, "count");
}

- (id)problemIdAtIndex:(unint64_t)a3
{
  -[GEORPProblemStatusRequest _readProblemIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_problemIds, "objectAtIndex:", a3);
}

+ (Class)problemIdType
{
  return (Class)objc_opt_class();
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_2505);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEORPProblemStatusRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEORPClientCapabilities)clientCapabilities
{
  -[GEORPProblemStatusRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readAnalyticMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticMetadata_tags_2506);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAnalyticMetadata
{
  -[GEORPProblemStatusRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata != 0;
}

- (GEOPDAnalyticMetadata)analyticMetadata
{
  -[GEORPProblemStatusRequest _readAnalyticMetadata]((uint64_t)self);
  return self->_analyticMetadata;
}

- (void)setAnalyticMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_analyticMetadata, a3);
}

- (void)_readAbAssignmentMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbAssignmentMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAbAssignmentMetadata
{
  -[GEORPProblemStatusRequest _readAbAssignmentMetadata]((uint64_t)self);
  return self->_abAssignmentMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abAssignmentMetadata
{
  -[GEORPProblemStatusRequest _readAbAssignmentMetadata]((uint64_t)self);
  return self->_abAssignmentMetadata;
}

- (void)setAbAssignmentMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  objc_storeStrong((id *)&self->_abAssignmentMetadata, a3);
}

- (void)_readServicesState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemStatusRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServicesState_tags_2507);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasServicesState
{
  -[GEORPProblemStatusRequest _readServicesState]((uint64_t)self);
  return self->_servicesState != 0;
}

- (GEOServicesState)servicesState
{
  -[GEORPProblemStatusRequest _readServicesState]((uint64_t)self);
  return self->_servicesState;
}

- (void)setServicesState:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_servicesState, a3);
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_suppressLogging = a3;
}

- (void)setHasSuppressLogging:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasSuppressLogging
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
  v8.super_class = (Class)GEORPProblemStatusRequest;
  -[GEORPProblemStatusRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemStatusRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatusRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "userCredentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("userCredentials");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("user_credentials");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    objc_msgSend((id)a1, "statusNotificationId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("statusNotificationId");
      else
        v10 = CFSTR("status_notification_id");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend((id)a1, "problemIds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("problemId");
      else
        v12 = CFSTR("problem_id");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "clientCapabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("clientCapabilities");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("client_capabilities");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

    }
    objc_msgSend((id)a1, "analyticMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v17, "jsonRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("analyticMetadata");
      }
      else
      {
        objc_msgSend(v17, "dictionaryRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("analytic_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

    }
    objc_msgSend((id)a1, "abAssignmentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v21, "jsonRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("abAssignmentMetadata");
      }
      else
      {
        objc_msgSend(v21, "dictionaryRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("ab_assignment_metadata");
      }
      objc_msgSend(v4, "setObject:forKey:", v23, v24);

    }
    objc_msgSend((id)a1, "servicesState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v25, "jsonRepresentation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("servicesState");
      }
      else
      {
        objc_msgSend(v25, "dictionaryRepresentation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("services_state");
      }
      objc_msgSend(v4, "setObject:forKey:", v27, v28);

    }
    if ((*(_WORD *)(a1 + 88) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 84));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v30 = CFSTR("suppressLogging");
      else
        v30 = CFSTR("suppress_logging");
      objc_msgSend(v4, "setObject:forKey:", v29, v30);

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
  return -[GEORPProblemStatusRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatusRequest)initWithDictionary:(id)a3
{
  return (GEORPProblemStatusRequest *)-[GEORPProblemStatusRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPUserCredentials *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEORPClientCapabilities *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDAnalyticMetadata *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEOABSecondPartyPlaceRequestClientMetaData *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEOServicesState *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("userCredentials");
      else
        v6 = CFSTR("user_credentials");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPUserCredentials alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPUserCredentials initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPUserCredentials initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setUserCredentials:", v9);

      }
      if (a3)
        v11 = CFSTR("statusNotificationId");
      else
        v11 = CFSTR("status_notification_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setStatusNotificationId:", v13);

      }
      if (a3)
        v14 = CFSTR("problemId");
      else
        v14 = CFSTR("problem_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v47 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = (void *)objc_msgSend(v21, "copy", (_QWORD)v46);
                objc_msgSend(a1, "addProblemId:", v22);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          }
          while (v18);
        }

      }
      if (a3)
        v23 = CFSTR("clientCapabilities");
      else
        v23 = CFSTR("client_capabilities");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23, (_QWORD)v46);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEORPClientCapabilities alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEORPClientCapabilities initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEORPClientCapabilities initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setClientCapabilities:", v26);

      }
      if (a3)
        v28 = CFSTR("analyticMetadata");
      else
        v28 = CFSTR("analytic_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEOPDAnalyticMetadata alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEOPDAnalyticMetadata initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEOPDAnalyticMetadata initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setAnalyticMetadata:", v31);

      }
      if (a3)
        v33 = CFSTR("abAssignmentMetadata");
      else
        v33 = CFSTR("ab_assignment_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setAbAssignmentMetadata:", v36);

      }
      if (a3)
        v38 = CFSTR("servicesState");
      else
        v38 = CFSTR("services_state");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOServicesState alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEOServicesState initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEOServicesState initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setServicesState:", v41);

      }
      if (a3)
        v43 = CFSTR("suppressLogging");
      else
        v43 = CFSTR("suppress_logging");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSuppressLogging:", objc_msgSend(v44, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPProblemStatusRequest)initWithJSON:(id)a3
{
  return (GEORPProblemStatusRequest *)-[GEORPProblemStatusRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2521;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2522;
    GEORPProblemStatusRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPProblemStatusRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusRequestReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPProblemStatusRequestIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPProblemStatusRequest readAll:](self, "readAll:", 0);
    if (self->_userCredentials)
      PBDataWriterWriteSubmessage();
    if (self->_statusNotificationId)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_problemIds;
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
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    if (self->_analyticMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_abAssignmentMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_servicesState)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
  }

}

- (unsigned)requestTypeCode
{
  return 1010;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEORPProblemStatusRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 18) = self->_readerMarkPos;
  *((_DWORD *)v9 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_userCredentials)
    objc_msgSend(v9, "setUserCredentials:");
  if (self->_statusNotificationId)
    objc_msgSend(v9, "setStatusNotificationId:");
  if (-[GEORPProblemStatusRequest problemIdsCount](self, "problemIdsCount"))
  {
    objc_msgSend(v9, "clearProblemIds");
    v4 = -[GEORPProblemStatusRequest problemIdsCount](self, "problemIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPProblemStatusRequest problemIdAtIndex:](self, "problemIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addProblemId:", v7);

      }
    }
  }
  if (self->_clientCapabilities)
    objc_msgSend(v9, "setClientCapabilities:");
  v8 = v9;
  if (self->_analyticMetadata)
  {
    objc_msgSend(v9, "setAnalyticMetadata:");
    v8 = v9;
  }
  if (self->_abAssignmentMetadata)
  {
    objc_msgSend(v9, "setAbAssignmentMetadata:");
    v8 = v9;
  }
  if (self->_servicesState)
  {
    objc_msgSend(v9, "setServicesState:");
    v8 = v9;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v8 + 84) = self->_suppressLogging;
    *((_WORD *)v8 + 44) |= 1u;
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
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
      GEORPProblemStatusRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemStatusRequest readAll:](self, "readAll:", 0);
  v9 = -[GEORPUserCredentials copyWithZone:](self->_userCredentials, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_statusNotificationId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = self->_problemIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addProblemId:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v18 = -[GEORPClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  v20 = -[GEOPDAnalyticMetadata copyWithZone:](self->_analyticMetadata, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  v22 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_abAssignmentMetadata, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  v24 = -[GEOServicesState copyWithZone:](self->_servicesState, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v24;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 84) = self->_suppressLogging;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPUserCredentials *userCredentials;
  NSString *statusNotificationId;
  NSMutableArray *problemIds;
  GEORPClientCapabilities *clientCapabilities;
  GEOPDAnalyticMetadata *analyticMetadata;
  GEOABSecondPartyPlaceRequestClientMetaData *abAssignmentMetadata;
  GEOServicesState *servicesState;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEORPProblemStatusRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  userCredentials = self->_userCredentials;
  if ((unint64_t)userCredentials | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPUserCredentials isEqual:](userCredentials, "isEqual:"))
      goto LABEL_18;
  }
  statusNotificationId = self->_statusNotificationId;
  if ((unint64_t)statusNotificationId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](statusNotificationId, "isEqual:"))
      goto LABEL_18;
  }
  problemIds = self->_problemIds;
  if ((unint64_t)problemIds | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](problemIds, "isEqual:"))
      goto LABEL_18;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_18;
  }
  analyticMetadata = self->_analyticMetadata;
  if ((unint64_t)analyticMetadata | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDAnalyticMetadata isEqual:](analyticMetadata, "isEqual:"))
      goto LABEL_18;
  }
  abAssignmentMetadata = self->_abAssignmentMetadata;
  if ((unint64_t)abAssignmentMetadata | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abAssignmentMetadata, "isEqual:"))
      goto LABEL_18;
  }
  servicesState = self->_servicesState;
  if ((unint64_t)servicesState | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOServicesState isEqual:](servicesState, "isEqual:"))
      goto LABEL_18;
  }
  v12 = *((_WORD *)v4 + 44);
  v13 = (v12 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) == 0)
    {
LABEL_18:
      v13 = 0;
      goto LABEL_19;
    }
    if (self->_suppressLogging)
    {
      if (!*((_BYTE *)v4 + 84))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 84))
    {
      goto LABEL_18;
    }
    v13 = 1;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  -[GEORPProblemStatusRequest readAll:](self, "readAll:", 1);
  v3 = -[GEORPUserCredentials hash](self->_userCredentials, "hash");
  v4 = -[NSString hash](self->_statusNotificationId, "hash");
  v5 = -[NSMutableArray hash](self->_problemIds, "hash");
  v6 = -[GEORPClientCapabilities hash](self->_clientCapabilities, "hash");
  v7 = -[GEOPDAnalyticMetadata hash](self->_analyticMetadata, "hash");
  v8 = -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_abAssignmentMetadata, "hash");
  v9 = -[GEOServicesState hash](self->_servicesState, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v10 = 2654435761 * self->_suppressLogging;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPUserCredentials *userCredentials;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORPClientCapabilities *clientCapabilities;
  uint64_t v13;
  GEOPDAnalyticMetadata *analyticMetadata;
  uint64_t v15;
  GEOABSecondPartyPlaceRequestClientMetaData *abAssignmentMetadata;
  uint64_t v17;
  GEOServicesState *servicesState;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  userCredentials = self->_userCredentials;
  v6 = *((_QWORD *)v4 + 8);
  if (userCredentials)
  {
    if (v6)
      -[GEORPUserCredentials mergeFrom:](userCredentials, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPProblemStatusRequest setUserCredentials:](self, "setUserCredentials:");
  }
  if (*((_QWORD *)v4 + 7))
    -[GEORPProblemStatusRequest setStatusNotificationId:](self, "setStatusNotificationId:");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        -[GEORPProblemStatusRequest addProblemId:](self, "addProblemId:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  clientCapabilities = self->_clientCapabilities;
  v13 = *((_QWORD *)v4 + 4);
  if (clientCapabilities)
  {
    if (v13)
      -[GEORPClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPProblemStatusRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  analyticMetadata = self->_analyticMetadata;
  v15 = *((_QWORD *)v4 + 3);
  if (analyticMetadata)
  {
    if (v15)
      -[GEOPDAnalyticMetadata mergeFrom:](analyticMetadata, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPProblemStatusRequest setAnalyticMetadata:](self, "setAnalyticMetadata:");
  }
  abAssignmentMetadata = self->_abAssignmentMetadata;
  v17 = *((_QWORD *)v4 + 2);
  if (abAssignmentMetadata)
  {
    if (v17)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abAssignmentMetadata, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPProblemStatusRequest setAbAssignmentMetadata:](self, "setAbAssignmentMetadata:");
  }
  servicesState = self->_servicesState;
  v19 = *((_QWORD *)v4 + 6);
  if (servicesState)
  {
    if (v19)
      -[GEOServicesState mergeFrom:](servicesState, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEORPProblemStatusRequest setServicesState:](self, "setServicesState:");
  }
  if ((*((_WORD *)v4 + 44) & 1) != 0)
  {
    self->_suppressLogging = *((_BYTE *)v4 + 84);
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_statusNotificationId, 0);
  objc_storeStrong((id *)&self->_servicesState, 0);
  objc_storeStrong((id *)&self->_problemIds, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_analyticMetadata, 0);
  objc_storeStrong((id *)&self->_abAssignmentMetadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)populateAnalyticsMetadata
{
  GEOPDAnalyticMetadata *v3;
  void *v4;
  GEOPDAnalyticMetadata *v5;
  id v6;

  v3 = [GEOPDAnalyticMetadata alloc];
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPDAnalyticMetadata initWithTraits:](v3, "initWithTraits:", v4);
  -[GEORPProblemStatusRequest setAnalyticMetadata:](self, "setAnalyticMetadata:", v5);

}

@end
