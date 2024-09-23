@implementation GEOExperimentConfiguration

+ (id)sharedConfiguration
{
  if (qword_1ECDBC748 != -1)
    dispatch_once(&qword_1ECDBC748, &__block_literal_global_162);
  return (id)_MergedGlobals_300;
}

- (id)clientConfigurationValueForKey:(id)a3
{
  os_unfair_lock_s *p_experimentsInfoLock;
  id v5;
  void *v6;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse _clientConfigValueForKey:](self->_experimentsInfo, "_clientConfigValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v6;
}

- (void)refreshDatasetABStatus:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "hasDatasetId");
    v5 = v7;
    if (v6)
    {
      -[GEOExperimentServerProxy refreshDatasetABStatus:](self->_serverProxy, "refreshDatasetABStatus:", v7);
      v5 = v7;
    }
  }

}

- (void)addExperimentObserver:(id)a3 queue:(id)a4
{
  -[GEOObserverHashTable registerObserver:queue:](self->_experimentObservers, "registerObserver:queue:", a3, a4);
}

- (void)updateURLComponents:(id)a3 forRequestKind:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4.var0 > 1279)
  {
    if (a4.var0 <= 2854)
    {
      if (a4.var0 != 1280 && a4.var0 != 1792)
        goto LABEL_34;
      goto LABEL_9;
    }
    if (a4.var0 == 2855)
    {
      v7 = 2;
      goto LABEL_18;
    }
    if (a4.var0 != 2857)
      goto LABEL_34;
LABEL_15:
    v7 = 0;
    v8 = 2;
    goto LABEL_19;
  }
  if (a4.var0 <= 671)
  {
    if (a4.var0 == 256)
    {
      v7 = 0;
      v8 = 3;
      goto LABEL_19;
    }
    if (a4.var0 != 512)
      goto LABEL_34;
    goto LABEL_15;
  }
  if ((a4.var0 - 672) < 2)
    goto LABEL_15;
  if (a4.var0 != 768)
    goto LABEL_34;
LABEL_9:
  v7 = HIDWORD(*(unint64_t *)&a4);
LABEL_18:
  v8 = 1;
LABEL_19:
  if (v5)
  {
    _GEOGetQueryForExperimentType(GeoServicesConfig_Experiment, (uint64_t)off_1EDF4DB78, v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      _GEOGetQueryForExperimentType(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1EDF4DB88, v8, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x1E0C99DE8];
      v24 = v6;
      objc_msgSend(v6, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = v9;
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("&"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "componentsSeparatedByString:", CFSTR("="));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "count") == 2)
            {
              v19 = (void *)MEMORY[0x1E0CB39D8];
              objc_msgSend(v18, "objectAtIndex:", 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectAtIndex:", 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "queryItemWithName:value:", v20, v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "addObject:", v22);
            }

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v15);
      }

      v6 = v24;
      objc_msgSend(v24, "setQueryItems:", v12);

      v9 = v23;
    }

  }
LABEL_34:

}

void __49__GEOExperimentConfiguration_sharedConfiguration__block_invoke()
{
  GEOExperimentConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(GEOExperimentConfiguration);
  v1 = (void *)_MergedGlobals_300;
  _MergedGlobals_300 = (uint64_t)v0;

}

- (GEOExperimentConfiguration)init
{
  GEOExperimentConfiguration *v2;
  GEOExperimentConfiguration *v3;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *experimentObservers;
  objc_class *v6;
  uint64_t v7;
  GEOExperimentServerProxy *serverProxy;
  uint64_t v9;
  GEOABAssignmentResponse *experimentsInfo;
  GEOExperimentConfiguration *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GEOExperimentConfiguration;
  v2 = -[GEOExperimentConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    v4 = -[GEOObserverHashTable initWithProtocol:queue:]([GEOObserverHashTable alloc], "initWithProtocol:queue:", &unk_1EDF55D88, 0);
    experimentObservers = v3->_experimentObservers;
    v3->_experimentObservers = v4;

    v6 = (objc_class *)_sServerProxyClass;
    if (!_sServerProxyClass)
      v6 = (objc_class *)objc_opt_class();
    v7 = objc_msgSend([v6 alloc], "initWithDelegate:", v3);
    serverProxy = v3->_serverProxy;
    v3->_serverProxy = (GEOExperimentServerProxy *)v7;

    os_unfair_lock_lock_with_options();
    -[GEOExperimentServerProxy experimentsInfo](v3->_serverProxy, "experimentsInfo");
    v9 = objc_claimAutoreleasedReturnValue();
    experimentsInfo = v3->_experimentsInfo;
    v3->_experimentsInfo = (GEOABAssignmentResponse *)v9;

    os_unfair_lock_unlock(&v3->_experimentsInfoLock);
    v11 = v3;
  }

  return v3;
}

- (id)_mapsAbClientMetadata
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPassABClientMetadata, (uint64_t)off_1EDF4E498))
  {
    p_experimentsInfoLock = &self->_experimentsInfoLock;
    os_unfair_lock_lock_with_options();
    -[GEOABAssignmentResponse mapsAbClientMetadata](self->_experimentsInfo, "mapsAbClientMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_experimentsInfoLock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (GEOABAssignmentResponse)experimentsInfo
{
  os_unfair_lock_s *p_experimentsInfoLock;
  GEOABAssignmentResponse *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (id)_parsecClientMetadata
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse parsecClientMetadata](self->_experimentsInfo, "parsecClientMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

+ (void)useProxy:(Class)a3
{
  _sServerProxyClass = (uint64_t)a3;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOExperimentServerProxy setDelegate:](self->_serverProxy, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GEOExperimentConfiguration;
  -[GEOExperimentConfiguration dealloc](&v3, sel_dealloc);
}

- (id)detailedDescription
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse description](self->_experimentsInfo, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (id)detailedDescriptionDictionaryRepresentation
{
  os_unfair_lock_s *p_experimentsInfoLock;
  id v4;
  void *v5;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GEOABAssignmentResponse dictionaryRepresentation](self->_experimentsInfo, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("GEOExperimentConfiguration"));
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (id)experimentAssignments
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse assignments](self->_experimentsInfo, "assignments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (id)clientConfig
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse clientConfig](self->_experimentsInfo, "clientConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (void)abAssignUUIDWithCompletionHandler:(id)a3
{
  -[GEOExperimentServerProxy abAssignUUIDWithCompletionHandler:](self->_serverProxy, "abAssignUUIDWithCompletionHandler:", a3);
}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
  -[GEOExperimentServerProxy abAssignUUIDWithSyncCompletionHandler:](self->_serverProxy, "abAssignUUIDWithSyncCompletionHandler:", a3);
}

- (id)_siriClientMetadata
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse siriClientMetadata](self->_experimentsInfo, "siriClientMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (id)_reportAProblemClientMetadata
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  -[GEOABAssignmentResponse rapClientMetadata](self->_experimentsInfo, "rapClientMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v4;
}

- (id)experimentURLForURL:(id)a3 requestKind:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = v6;
  if (a4.var0 > 1279)
  {
    if (a4.var0 > 2854)
    {
      if (a4.var0 != 2857 && a4.var0 != 2855)
        goto LABEL_17;
    }
    else if (a4.var0 != 1280 && a4.var0 != 1792)
    {
      goto LABEL_17;
    }
  }
  else if (a4.var0 <= 671)
  {
    if (a4.var0 != 256 && a4.var0 != 512)
      goto LABEL_17;
  }
  else if ((a4.var0 - 672) >= 2 && a4.var0 != 768)
  {
    goto LABEL_17;
  }
  if (!v6)
  {
LABEL_17:
    v9 = v6;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOExperimentConfiguration updateURLComponents:forRequestKind:](self, "updateURLComponents:forRequestKind:", v8, a4);
  objc_msgSend(v8, "URL");
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v9;
}

- (void)removeExperimentObserver:(id)a3
{
  -[GEOObserverHashTable unregisterObserver:](self->_experimentObservers, "unregisterObserver:", a3);
}

- (void)serverProxy:(id)a3 didChangeExperimentsInfo:(id)a4
{
  GEOABAssignmentResponse *v5;
  GEOABAssignmentResponse *experimentsInfo;
  GEOABAssignmentResponse *v7;

  v5 = (GEOABAssignmentResponse *)a4;
  os_unfair_lock_lock_with_options();
  experimentsInfo = self->_experimentsInfo;
  self->_experimentsInfo = v5;
  v7 = v5;

  os_unfair_lock_unlock(&self->_experimentsInfoLock);
  -[GEOObserverHashTable experimentConfigurationDidChange:](self->_experimentObservers, "experimentConfigurationDidChange:", self);

}

- (void)forceUpdate:(id)a3
{
  -[GEOExperimentServerProxy forceUpdate:](self->_serverProxy, "forceUpdate:", a3);
}

- (void)submitBackgroundTasksNeededDuringDaemonStart
{
  -[GEOExperimentServerProxy submitBackgroundTasksNeededDuringDaemonStart](self->_serverProxy, "submitBackgroundTasksNeededDuringDaemonStart");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentObservers, 0);
  objc_storeStrong((id *)&self->_experimentsInfo, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

- (void)_debug_forceUpdate
{
  -[GEOExperimentServerProxy forceUpdate](self->_serverProxy, "forceUpdate");
}

- (id)_debug_configurationDate
{
  os_unfair_lock_s *p_experimentsInfoLock;
  void *v4;
  void *v5;

  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  if (-[GEOABAssignmentResponse hasTimestamp](self->_experimentsInfo, "hasTimestamp"))
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[GEOABAssignmentResponse timestamp](self->_experimentsInfo, "timestamp");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_experimentsInfoLock);
  return v5;
}

- (id)_debug_customQuerySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4
{
  return _GEOGetQueryForExperimentType(GeoServicesConfig_Experiment, (uint64_t)off_1EDF4DB78, a3, *(uint64_t *)&a4);
}

- (void)_debug_setCustomQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
  -[GEOExperimentServerProxy _debug_setQuerySubstring:forExperimentType:dispatcherRequestType:](self->_serverProxy, "_debug_setQuerySubstring:forExperimentType:dispatcherRequestType:", a3, a4, *(_QWORD *)&a5);
}

- (void)_debug_forEachExperimentType:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD, void *);
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  v3 = (void (**)(id, uint64_t, _QWORD, void *))a3;
  if (v3)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = objc_msgSend(&unk_1E1E85708, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(&unk_1E1E85708);
          v20 = v4;
          v5 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v4), "integerValue");
          if (v5 == 1)
          {
            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v8 = objc_msgSend(&unk_1E1E85720, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v9; ++i)
                {
                  if (*(_QWORD *)v22 != v10)
                    objc_enumerationMutation(&unk_1E1E85720);
                  v12 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "intValue");
                  v13 = v12;
                  v14 = (void *)MEMORY[0x1E0CB3940];
                  if (v12 >= 0x3F)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
                    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v15 = off_1E1C13670[(int)v12];
                  }
                  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ - %@"), CFSTR("Dispatcher"), v15);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v3[2](v3, 1, v13, v16);

                }
                v9 = objc_msgSend(&unk_1E1E85720, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              }
              while (v9);
            }
          }
          else
          {
            v6 = CFSTR("Routing");
            if (v5 != 2)
              v6 = 0;
            if (v5 == 3)
              v7 = CFSTR("Tiles");
            else
              v7 = v6;
            v3[2](v3, v5, 0, (void *)v7);
          }
          v4 = v20 + 1;
        }
        while (v20 + 1 != v19);
        v17 = objc_msgSend(&unk_1E1E85708, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v19 = v17;
      }
      while (v17);
    }
  }

}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke;
    v6[3] = &unk_1E1C13650;
    v7 = v4;
    -[GEOExperimentConfiguration _fetchAllAvailableExperimentsResponse:](self, "_fetchAllAvailableExperimentsResponse:", v6);

  }
}

void __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  GEOAvailableExperiment *v15;
  GEOAvailableExperiment *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  GEOAvailableExperimentBranch *v21;
  GEOAvailableExperimentBranch *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  GEOAvailableExperiment *v36;
  GEOAvailableExperiment *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  GEOAvailableExperimentBranch *v42;
  GEOAvailableExperimentBranch *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id obj;
  id obja;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v48 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v49 = v5;
    objc_msgSend(v5, "assignments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    v52 = v6;
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v61;
      v50 = v7;
      do
      {
        v11 = 0;
        obj = (id)v9;
        do
        {
          if (*(_QWORD *)v61 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v11);
          objc_msgSend(v12, "debugExperimentBranch");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "hasExperimentId"))
          {
            objc_msgSend(v13, "experimentId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v14);
            v15 = (GEOAvailableExperiment *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              v16 = [GEOAvailableExperiment alloc];
              objc_msgSend(v13, "experimentId");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "experimentName");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = -[GEOAvailableExperiment initWithIdentifier:name:](v16, "initWithIdentifier:name:", v17, v18);

              objc_msgSend(v13, "experimentId");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v19);

              objc_msgSend(v53, "addObject:", v15);
            }
            objc_msgSend(v13, "branchLabel");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOAvailableExperiment _branchForLabel:](v15, "_branchForLabel:", v20);
            v21 = (GEOAvailableExperimentBranch *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              v22 = [GEOAvailableExperimentBranch alloc];
              objc_msgSend(v13, "branchLabel");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "branchName");
              v24 = v10;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOAvailableExperiment identifier](v15, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[GEOAvailableExperimentBranch initWithLabel:name:experimentIdentifier:](v22, "initWithLabel:name:experimentIdentifier:", v23, v25, v26);

              v6 = v52;
              v10 = v24;
              v9 = (uint64_t)obj;

              v7 = v50;
              -[GEOAvailableExperiment _addBranch:](v15, "_addBranch:", v21);
            }
            -[GEOAvailableExperimentBranch _addAssignment:](v21, "_addAssignment:", v12);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v9);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v49, "clientConfig");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "debugExperimentBranchs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    obja = v28;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v57;
      v51 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v57 != v31)
            objc_enumerationMutation(obja);
          v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v33, "debugExperimentBranch");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "hasExperimentId"))
          {
            objc_msgSend(v34, "experimentId");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v35);
            v36 = (GEOAvailableExperiment *)objc_claimAutoreleasedReturnValue();

            if (!v36)
            {
              v37 = [GEOAvailableExperiment alloc];
              objc_msgSend(v34, "experimentId");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "experimentName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[GEOAvailableExperiment initWithIdentifier:name:](v37, "initWithIdentifier:name:", v38, v39);

              v31 = v51;
              objc_msgSend(v34, "experimentId");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, v40);

              objc_msgSend(v53, "addObject:", v36);
            }
            objc_msgSend(v34, "branchLabel");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOAvailableExperiment _branchForLabel:](v36, "_branchForLabel:", v41);
            v42 = (GEOAvailableExperimentBranch *)objc_claimAutoreleasedReturnValue();

            if (!v42)
            {
              v43 = [GEOAvailableExperimentBranch alloc];
              objc_msgSend(v34, "branchLabel");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "branchName");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOAvailableExperiment identifier](v36, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = -[GEOAvailableExperimentBranch initWithLabel:name:experimentIdentifier:](v43, "initWithLabel:name:experimentIdentifier:", v44, v45, v46);

              v6 = v52;
              v31 = v51;
              -[GEOAvailableExperiment _addBranch:](v36, "_addBranch:", v42);
            }
            objc_msgSend(v33, "configKeyValues");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[GEOAvailableExperimentBranch _setClientConfig:](v42, "_setClientConfig:", v47);

          }
        }
        v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v30);
    }

    objc_msgSend(v53, "sortUsingComparator:", &__block_literal_global_131_0);
    (*(void (**)(void))(*(_QWORD *)(v48 + 32) + 16))();

    v5 = v49;
  }

}

uint64_t __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_debug_setActiveExperimentBranch:(id)a3
{
  id v4;

  objc_msgSend(a3, "_dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GEOExperimentServerProxy _debug_setActiveExperimentBranchDictionaryRepresentation:](self->_serverProxy, "_debug_setActiveExperimentBranchDictionaryRepresentation:", v4);

}

- (id)_debug_bucketId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOExperimentConfiguration _mapsAbClientMetadata](self, "_mapsAbClientMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDatasetMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v4, "bucketId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
  -[GEOExperimentServerProxy _debug_setBucketIdDictionaryRepresentation:](self->_serverProxy, "_debug_setBucketIdDictionaryRepresentation:", a3);
}

- (id)_debug_datasetId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOExperimentConfiguration _mapsAbClientMetadata](self, "_mapsAbClientMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDatasetMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v4, "datasetId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
  -[GEOExperimentServerProxy _debug_setActiveExperimentBranchDictionaryRepresentation:](self->_serverProxy, "_debug_setActiveExperimentBranchDictionaryRepresentation:", a3);
}

- (void)_fetchAllAvailableExperimentsResponse:(id)a3
{
  if (a3)
    -[GEOExperimentServerProxy _debug_fetchAllAvailableExperiments:](self->_serverProxy, "_debug_fetchAllAvailableExperiments:");
}

@end
