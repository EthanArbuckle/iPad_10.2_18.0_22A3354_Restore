@implementation HDOntologyFeatureCoordinator

- (HDOntologyFeatureCoordinator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyFeatureCoordinator)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyFeatureCoordinator *v5;
  HDOntologyFeatureCoordinator *v6;
  uint64_t v7;
  OS_dispatch_queue *observationQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *observationQueue_isProfileReady;
  NSDictionary *lock_shardRequirementStatuses;
  id WeakRetained;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDOntologyFeatureCoordinator;
  v5 = -[HDOntologyFeatureCoordinator init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    observationQueue = v6->_observationQueue;
    v6->_observationQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observationQueue_isProfileReady = v6->_observationQueue_isProfileReady;
    v6->_observationQueue_isProfileReady = v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    lock_shardRequirementStatuses = v6->_lock_shardRequirementStatuses;
    v6->_lock_shardRequirementStatuses = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v6->_unitTesting_minimumTimeToLive = -1.0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_updateCoordinator);
    objc_msgSend(WeakRetained, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerDaemonReadyObserver:queue:", v6, v6->_observationQueue);

  }
  return v6;
}

- (BOOL)markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  HDOntologyFeatureCoordinator *v18;
  void *v19;
  void *v20;
  char v21;
  _QWORD *v22;
  char v23;
  id v25;
  id v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  HDOntologyFeatureCoordinator *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
    if (self)
    {
      v26 = v7;
      _HKInitializeLogging();
      HKLogHealthOntology();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HKStringFromOntologyFeatureRequestOptions();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = self;
        v35 = 2114;
        v36 = v10;
        v37 = 2114;
        v38 = v11;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: mark shards with identifiers \"%{public}@\" with options %{public}@", buf, 0x20u);

      }
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = v8;
      obj = v8;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, buf, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(obj);
            v17 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
            if ((HKIsKnownOntologyShardIdentifier() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("%@ is not a known shard identifier"), v17);

LABEL_21:
              v23 = 0;
              goto LABEL_22;
            }
            if ((a4 & 1) != 0
              && (v18 = self,
                  -[HDOntologyFeatureCoordinator _featureEvaluatorForIdentifier:]((uint64_t)self, v17),
                  (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {
              v20 = v19;
              v21 = objc_msgSend(v19, "canRequireShardWithError:", a5);

              self = v18;
              if ((v21 & 1) == 0)
                goto LABEL_21;
            }
            else
            {

            }
            v22 = -[_HDRequiredShardItem initWithShardIdentfier:options:]([_HDRequiredShardItem alloc], v17, a4);
            objc_msgSend(v12, "addObject:", v22);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, buf, 16);
          if (v14)
            continue;
          break;
        }
      }

      v23 = -[HDOntologyFeatureCoordinator _performOrJournalFeatureCoordinatorRequireOperationForItems:error:]((uint64_t)self, v12, (uint64_t)a5);
LABEL_22:

      v8 = v25;
      v7 = v26;
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 1;
  }

  return v23;
}

- (void)evaluteRequiredShardsForEvalulator:(id)a3 reason:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, v5);

}

- (void)_observationQueue_evaluteRequiredFeaturesWithReason:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  char v56;
  id v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
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
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[12];
  __int16 v82;
  void *v83;
  _BYTE buf[24];
  void *v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v61 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "daemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "behavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsOntologyFeatureEvaluation");

    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
      v7 = *(void **)(a1 + 16);
      v8 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v8, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "profileIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v61;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Re-evaluate required features due to %{public}@", buf, 0x16u);
        }

        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v15, "daemon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "profileManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        objc_msgSend(v17, "allProfileIdentifiers");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
        v66 = a1;
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v77;
          v62 = *(_QWORD *)v77;
          v63 = v17;
          do
          {
            v21 = 0;
            v64 = v19;
            do
            {
              if (*(_QWORD *)v77 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v21);
              objc_msgSend(v17, "profileForIdentifier:", v22, v61);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "BOOLValue");

                if (v25)
                {
                  v67 = v21;
                  v74 = 0u;
                  v75 = 0u;
                  v72 = 0u;
                  v73 = 0u;
                  v26 = *(id *)(a1 + 24);
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v73;
                    do
                    {
                      for (i = 0; i != v28; ++i)
                      {
                        if (*(_QWORD *)v73 != v29)
                          objc_enumerationMutation(v26);
                        v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                        objc_msgSend(v31, "featureIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v14, "objectForKeyedSubscript:", v32);
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v33)
                        {
                          v33 = &unk_1E6DFE630;
                          objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E6DFE630, v32);
                        }
                        v34 = objc_msgSend(v33, "integerValue");
                        if (v34 != 1)
                        {
                          v35 = v34;
                          v36 = objc_msgSend(v31, "requiresFeatureShardForProfile:", v23);
                          if (v36 == 1 || (!v35 ? (v37 = v36 == 2) : (v37 = 0), v37))
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v14, "setObject:forKeyedSubscript:", v38, v32);

                          }
                        }

                      }
                      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                    }
                    while (v28);
                  }

                  a1 = v66;
                  v21 = v67;
                  v20 = v62;
                  v17 = v63;
                  v19 = v64;
                }
              }

              ++v21;
            }
            while (v21 != v19);
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, buf, 16);
          }
          while (v19);
        }

        v39 = v14;
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
        objc_storeStrong((id *)(a1 + 40), v14);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));

        v40 = v39;
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("["));
        objc_msgSend(v40, "allKeys");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __63__HDOntologyFeatureCoordinator__logRequiredShardsByIdentifier___block_invoke;
        v85 = &unk_1E6CFBCE8;
        v43 = v40;
        v86 = v43;
        objc_msgSend(v41, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v42, buf);

        objc_msgSend(v41, "appendFormat:", CFSTR("]"));
        _HKInitializeLogging();
        HKLogHealthOntology();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v81 = 138543618;
          *(_QWORD *)&v81[4] = a1;
          v82 = 2112;
          v83 = v41;
          _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: underlying conditions require shards: %@", v81, 0x16u);
        }

        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v46 = v43;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v69;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v69 != v49)
                objc_enumerationMutation(v46);
              v51 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
              if ((HKIsKnownOntologyShardIdentifier() & 1) != 0)
              {
                objc_msgSend(v46, "objectForKeyedSubscript:", v51);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "integerValue");

                if (v53 == 2)
                  continue;
                v54 = -[_HDRequiredShardItem initWithShardIdentfier:options:]([_HDRequiredShardItem alloc], v51, v53 == 1);
                objc_msgSend(v45, "addObject:", v54);
              }
              else
              {
                _HKInitializeLogging();
                HKLogHealthOntology();
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v66;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v51;
                  _os_log_impl(&dword_1B7802000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot mark shard with identifier %@ because it's unknown", buf, 0x16u);
                }
              }

            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
          }
          while (v48);
        }

        v55 = v45;
        *(_QWORD *)v81 = 0;
        v56 = -[HDOntologyFeatureCoordinator _performOrJournalFeatureCoordinatorRequireOperationForItems:error:](v66, v55, (uint64_t)v81);
        v57 = *(id *)v81;
        if ((v56 & 1) == 0)
        {
          objc_msgSend(v55, "hk_map:", &__block_literal_global_231_0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          HKLogHealthOntology();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v58, "componentsJoinedByString:", CFSTR(", "));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v66;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2114;
            v85 = v60;
            _os_log_error_impl(&dword_1B7802000, v59, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ Unable to mark [%{public}@]", buf, 0x20u);

          }
        }

      }
    }
  }

}

- (NSDictionary)shardRequirementStatuses
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_lock_shardRequirementStatuses, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  if (v4)
    -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, CFSTR("protectedDataAvailable"));
}

- (void)daemonReady:(id)a3
{
  id v4;
  HDOntologyCHRFeatureEvaluator *v5;
  HDOntologyUpdateCoordinator **p_updateCoordinator;
  id WeakRetained;
  HDOntologyCHRFeatureEvaluator *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  HDOntologyFeatureCoordinator *v28;
  NSArray *featureEvaluators;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id *location;
  HDOntologyFeatureCoordinator *v35;
  id obj;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char *v43;
  id v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  HDOntologyFeatureCoordinator *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v5 = [HDOntologyCHRFeatureEvaluator alloc];
  v35 = self;
  p_updateCoordinator = &self->_updateCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  v8 = -[HDOntologyCHRFeatureEvaluator initWithOntologyUpdateCoordinator:](v5, "initWithOntologyUpdateCoordinator:", WeakRetained);
  v60[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithArray:", v9);

  location = (id *)p_updateCoordinator;
  v11 = objc_loadWeakRetained((id *)p_updateCoordinator);
  objc_msgSend(v11, "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v12;
  objc_msgSend(v12, "pluginManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pluginsConformingToProtocol:", &unk_1EF2525D8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v15;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v41)
  {
    v16 = MEMORY[0x1E0C809B0];
    v39 = *(_QWORD *)v51;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v51 != v39)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v17);
        v43 = v17;
        objc_msgSend(v42, "ontologyFeatureEvaluatorsForDaemon:", v40);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v47 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
              v45[0] = v16;
              v45[1] = 3221225472;
              v45[2] = __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke;
              v45[3] = &unk_1E6D09C98;
              v45[4] = v23;
              objc_msgSend(v10, "hk_firstObjectPassingTest:", v45);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "featureIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", sel__loadFeatureEvaluators, v35, CFSTR("HDOntologyFeatureCoordinator.m"), 233, CFSTR("%@ is attemping to register as evaluator for %@, but %@ is already registered."), v42, v37, v24);

              }
              objc_msgSend(v10, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v20);
        }

        v17 = v43 + 1;
      }
      while (v43 + 1 != (char *)v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v41);
  }

  _HKInitializeLogging();
  HKLogHealthOntology();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "hk_map:", &__block_literal_global_200);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v35;
    v56 = 2112;
    v57 = v26;
    _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: loaded feature evaluators: %@", buf, 0x16u);

  }
  v27 = objc_msgSend(v10, "copy");
  v28 = v35;
  featureEvaluators = v35->_featureEvaluators;
  v35->_featureEvaluators = (NSArray *)v27;

  v30 = objc_loadWeakRetained(location);
  objc_msgSend(v30, "daemon");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "profileManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addProfileManagerObserver:queue:", v28, v28->_observationQueue);

  v44 = objc_loadWeakRetained(location);
  objc_msgSend(v44, "profile");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerProfileReadyObserver:queue:", v28, v28->_observationQueue);

}

- (void)profileListDidChange
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSMutableDictionary *observationQueue_isProfileReady;
  void *v14;
  void *v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observationQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "allProfileIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "profileForIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          observationQueue_isProfileReady = self->_observationQueue_isProfileReady;
          objc_msgSend(v11, "profileIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](observationQueue_isProfileReady, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if ((v16 & 1) == 0)
            objc_msgSend(v12, "registerProfileReadyObserver:queue:", self, self->_observationQueue);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, CFSTR("profileListDidChange"));
}

- (void)profileDidBecomeReady:(id)a3
{
  NSObject *observationQueue;
  id v5;
  NSMutableDictionary *observationQueue_isProfileReady;
  void *v7;
  id v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  observationQueue = self->_observationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(observationQueue);
  observationQueue_isProfileReady = self->_observationQueue_isProfileReady;
  objc_msgSend(v5, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](observationQueue_isProfileReady, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

  v8 = v5;
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addProtectedDataObserver:queue:", self, self->_observationQueue);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_featureEvaluators;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "registerRequiredObserversForProfile:queue:", v8, self->_observationQueue, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[HDOntologyFeatureCoordinator _observationQueue_evaluteRequiredFeaturesWithReason:]((uint64_t)self, CFSTR("profileDidBecomeReady"));
}

uint64_t __85__HDOntologyFeatureCoordinator__processRequiredShardItems_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id WeakRetained;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  _QWORD *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double Current;
  void *v75;
  double v76;
  double v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v87;
  void *v88;
  void *v89;
  void *v90;
  id obj;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  _QWORD *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  _BYTE v113[128];
  _QWORD v114[2];
  _BYTE buf[24];
  void *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v94 = a2;
  v95 = a1;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = *(id *)(a1 + 32);
  v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (!v92)
  {
    v85 = 1;
    goto LABEL_84;
  }
  v93 = *(_QWORD *)v109;
  *(_QWORD *)&v4 = 138544130;
  v87 = v4;
  do
  {
    v5 = 0;
    do
    {
      if (*(_QWORD *)v109 != v93)
        objc_enumerationMutation(obj);
      v96 = v5;
      v6 = *(_QWORD *)(v95 + 40);
      v7 = *(id *)(*((_QWORD *)&v108 + 1) + 8 * v5);
      v8 = v94;
      v102 = v6;
      if (!v6)
        goto LABEL_81;
      v9 = v7;
      v104 = v8;
      objc_opt_self();
      HKOntologyShardSchemaTypeForShardIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = HKCurrentSchemaVersionForShardIdentifier();
      v99 = v7;
      v12 = v9 ? v9[1] : 0;
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("identifier"), v12, v87);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D29840];
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("schema_type"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v15;
      v16 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithProperty:notEqualToValue:", CFSTR("schema_version"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[8] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "predicateMatchingAnyPredicates:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v13, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = CFSTR("desired_state");
      v114[1] = CFSTR("desired_state_date");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "graphDatabase");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "underlyingDatabase");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = +[HDSQLiteEntity updateProperties:predicate:database:error:bindingHandler:](HDOntologyShardRegistryEntity, "updateProperties:predicate:database:error:bindingHandler:", v22, v21, v24, a3, &__block_literal_global_219_1);

      v25 = v9;
      v7 = v99;
      if (!(_DWORD)v19)
      {
LABEL_81:

LABEL_83:
        v85 = 0;
        goto LABEL_84;
      }
      if (v9)
        v26 = (void *)v9[1];
      else
        v26 = 0;
      v112 = 0;
      v27 = v26;
      v28 = v104;
      v29 = v27;
      HKOntologyShardSchemaTypeForShardIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = HKCurrentSchemaVersionForShardIdentifier();
      WeakRetained = objc_loadWeakRetained((id *)(v102 + 64));
      objc_msgSend(WeakRetained, "shardRegistry");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v31) = objc_msgSend(v33, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v29, v30, v31, &v112, v28, a3);

      v34 = v112;
      if ((v31 & 1) == 0)
      {

        goto LABEL_83;
      }
      if (!v34)
      {
        v36 = v25;
        v55 = v28;
        HKOntologyShardSchemaTypeForShardIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69B0]), "initWithIdentifier:schemaType:schemaVersion:desiredState:", 0, v56, HKCurrentSchemaVersionForShardIdentifier(), 1);
          goto LABEL_30;
        }
        v57 = HKCurrentSchemaVersionForShardIdentifier();
        v58 = v36[2];
        v59 = objc_alloc(MEMORY[0x1E0CB69B0]);
        if ((v58 & 1) != 0)
          v60 = 3;
        else
          v60 = 1;
        v61 = (void *)objc_msgSend(v59, "initWithIdentifier:schemaType:schemaVersion:desiredState:", v36[1], v56, v57, v60);
        v62 = v61;
        if ((v58 & 1) == 0)
        {
LABEL_30:
          v63 = 2;
          goto LABEL_37;
        }
        if ((v58 & 2) != 0
          && (v37 = v55,
              !-[HDOntologyFeatureCoordinator _markFirstLaunchRequestForEntry:transaction:error:](v61, v55, a3)))
        {
          v54 = 0;
          v68 = v96;
        }
        else
        {
          v63 = 1;
LABEL_37:
          v68 = v96;
          if (-[HDOntologyFeatureCoordinator _insertEntry:transaction:error:](v102, v62, v55, a3))
            v54 = v63;
          else
            v54 = 0;
          v37 = v55;
        }

        goto LABEL_68;
      }
      if (v25)
        v35 = v25[2];
      else
        LOBYTE(v35) = 0;
      v36 = v34;
      v37 = v28;
      if ((v35 & 1) != 0)
        v38 = 3;
      else
        v38 = 1;
      if (objc_msgSend(v36, "desiredState") != v38)
      {
        v64 = v36;
        v65 = v37;
        v106 = v65;
        if ((~(_BYTE)v35 & 3) != 0)
        {
          if ((v35 & 5) != 0)
            goto LABEL_59;
          v101 = v37;
          v69 = v64;
          v67 = v69;
          v70 = *(double *)(v102 + 56);
          if (v70 < 0.0)
          {
            objc_msgSend(v69, "identifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDOntologyFeatureCoordinator _featureEvaluatorForIdentifier:](v102, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();

            if (v72 && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
            {
              objc_msgSend((id)objc_opt_class(), "minimumTimeToLive");
              v70 = v73;
            }
            else if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
            {
              v70 = 604800.0;
            }
            else
            {
              v70 = 2592000.0;
            }

          }
          Current = CFAbsoluteTimeGetCurrent();
          objc_msgSend(v67, "desiredStateDate");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "timeIntervalSinceReferenceDate");
          v77 = v70 + v76;

          if (Current > v77)
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v67, "desiredStateDate");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              HKDiagnosticStringFromDate();
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              HKDiagnosticStringFromDuration();
              v98 = v25;
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v87;
              *(_QWORD *)&buf[4] = v102;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v67;
              *(_WORD *)&buf[22] = 2114;
              v116 = v79;
              v117 = 2114;
              v118 = v80;
              _os_log_impl(&dword_1B7802000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ TTL has expired because %{public}@ is more than %{public}@ before now", buf, 0x2Au);

              v25 = v98;
            }

            v37 = v101;
            goto LABEL_59;
          }

          v54 = 2;
          v37 = v101;
LABEL_65:
          v81 = v106;
        }
        else
        {
          v66 = -[HDOntologyFeatureCoordinator _markFirstLaunchRequestForEntry:transaction:error:](v64, v65, a3);
          if (v66 != 1)
          {
            v54 = v66;
            v67 = v64;
            goto LABEL_65;
          }
LABEL_59:
          v67 = (void *)objc_msgSend(v64, "copyWithDesiredState:", v38);

          v81 = v106;
          v82 = -[HDOntologyFeatureCoordinator _insertEntry:transaction:error:](v102, v67, v106, a3);
          v83 = 1;
          if ((v35 & 1) == 0)
            v83 = 2;
          if (v82)
            v54 = v83;
          else
            v54 = 0;
        }

LABEL_67:
        v68 = v96;
        goto LABEL_68;
      }
      if ((~(_BYTE)v35 & 5) != 0)
      {
        v54 = 2;
        goto LABEL_67;
      }
      v97 = v25;
      v100 = v37;
      v88 = (void *)MEMORY[0x1E0D29840];
      v39 = (void *)MEMORY[0x1E0D29838];
      v105 = v37;
      v40 = v36;
      objc_msgSend(v40, "identifier");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "predicateWithProperty:equalToValue:", CFSTR("identifier"), v103);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v89;
      v41 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(v40, "schemaType");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "predicateWithProperty:equalToValue:", CFSTR("schema_type"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[8] = v43;
      v44 = (void *)MEMORY[0x1E0D29838];
      v45 = (void *)MEMORY[0x1E0CB37E8];
      v46 = objc_msgSend(v40, "schemaVersion");

      objc_msgSend(v45, "numberWithInteger:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "predicateWithProperty:equalToValue:", CFSTR("schema_version"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[16] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "predicateMatchingAllPredicates:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v114[0] = CFSTR("desired_state_date");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "graphDatabase");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "underlyingDatabase");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v42) = +[HDSQLiteEntity updateProperties:predicate:database:error:bindingHandler:](HDOntologyShardRegistryEntity, "updateProperties:predicate:database:error:bindingHandler:", v51, v50, v53, a3, &__block_literal_global_227);

      if ((_DWORD)v42)
      {
        if (objc_msgSend(v40, "currentVersion") < 1)
          v54 = 1;
        else
          v54 = 2;
      }
      else
      {
        v54 = 0;
      }
      v68 = v96;
      v25 = v97;
      v37 = v100;
LABEL_68:

      if (v54 == 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v95 + 48) + 8) + 24) = 1;
      }
      else if (!v54)
      {
        goto LABEL_83;
      }
      v5 = v68 + 1;
    }
    while (v92 != v5);
    v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    v85 = 1;
    v92 = v84;
  }
  while (v84);
LABEL_84:

  return v85;
}

uint64_t __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

uint64_t __54__HDOntologyFeatureCoordinator__loadFeatureEvaluators__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureIdentifier");
}

void __93__HDOntologyFeatureCoordinator__markNotCurrentEntriesAsNotRequiredForItem_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("desired_state"), 1);
  CFAbsoluteTimeGetCurrent();
  JUMPOUT(0x1BCCAB0F0);
}

- (uint64_t)_markFirstLaunchRequestForEntry:(void *)a1 transaction:(void *)a2 error:(uint64_t)a3
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v21;

  v5 = a2;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a1;
  v8 = [v6 alloc];
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schemaType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "schemaVersion");

  v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("firstLaunch-%@:%@:%ld"), v9, v10, v11);
  objc_msgSend(v5, "graphDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  LODWORD(v9) = objc_msgSend(v13, "metadataValueForKey:valueOut:error:", v12, &v21, a3);
  v14 = v21;

  v15 = 0;
  if ((_DWORD)v9)
  {
    if (v14)
    {
      v15 = 2;
    }
    else
    {
      objc_msgSend(v5, "graphDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HKDiagnosticStringFromDate();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "setMetadataValue:forKey:error:", v18, v12, a3);

      v15 = v19;
    }
  }

  return v15;
}

- (BOOL)_insertEntry:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a2;
  v9 = v7;
  v10 = _Block_copy(*(const void **)(a1 + 48));
  if (v10)
  {
    objc_msgSend(v9, "graphDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__HDOntologyFeatureCoordinator__callDidInsertEntryTestHookForEntry_transaction___block_invoke;
    v14[3] = &unk_1E6CEBCA0;
    v16 = v10;
    v14[4] = a1;
    v15 = v8;
    objc_msgSend(v11, "onCommit:orRollback:", v14, 0);

  }
  v12 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v8, v9, a4);

  return v12;
}

- (id)_featureEvaluatorForIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HDOntologyFeatureCoordinator__featureEvaluatorForIdentifier___block_invoke;
  v8[3] = &unk_1E6D09C98;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "hk_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __82__HDOntologyFeatureCoordinator__updateDesiredStateDateForEntry_transaction_error___block_invoke()
{
  CFAbsoluteTimeGetCurrent();
  JUMPOUT(0x1BCCAB0F0);
}

- (uint64_t)_performOrJournalFeatureCoordinatorRequireOperationForItems:(uint64_t)a3 error:
{
  id v6;
  _HDOntologyFeatureCoordinatorRequireOperation *v7;
  id v8;
  _HDOntologyFeatureCoordinatorRequireOperation *v9;
  id *v10;
  id WeakRetained;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v6 = a2;
  v7 = [_HDOntologyFeatureCoordinatorRequireOperation alloc];
  v8 = v6;
  if (v7)
  {
    v17.receiver = v7;
    v17.super_class = (Class)_HDOntologyFeatureCoordinatorRequireOperation;
    v9 = (_HDOntologyFeatureCoordinatorRequireOperation *)objc_msgSendSuper2(&v17, sel_init);
    v7 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_items, a2);
  }

  v10 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "lockUpdateLock");

  v12 = objc_loadWeakRetained(v10);
  objc_msgSend(v12, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDJournalableOperation performOrJournalWithProfile:error:](v7, "performOrJournalWithProfile:error:", v13, a3);

  v15 = objc_loadWeakRetained(v10);
  objc_msgSend(v15, "unlockUpdateLock");

  return v14;
}

uint64_t __63__HDOntologyFeatureCoordinator__markEntriesOrLogErrorForItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __63__HDOntologyFeatureCoordinator__featureEvaluatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "featureIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "featureIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "featureIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

void __59__HDOntologyFeatureCoordinator__triggerGatedOntologyUpdate__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_self();
  _HKInitializeLogging();
  HKLogHealthOntology();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v11 = 138543362;
      v12 = v5;
      v8 = "%{public}@: Success triggered ontology update";
      v9 = v6;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v4;
    v8 = "%{public}@: Failure triggered ontology update: %{public}@";
    v9 = v6;
    v10 = 22;
    goto LABEL_6;
  }

}

id __63__HDOntologyFeatureCoordinator__logRequiredShardsByIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerValue");
  HKStringFromOptionalBooleanResult();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@, %@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __80__HDOntologyFeatureCoordinator__callDidInsertEntryTestHookForEntry_transaction___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)unitTesting_didInsertEntry
{
  return self->_unitTesting_didInsertEntry;
}

- (void)setUnitTesting_didInsertEntry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)unitTesting_minimumTimeToLive
{
  return self->_unitTesting_minimumTimeToLive;
}

- (void)setUnitTesting_minimumTimeToLive:(double)a3
{
  self->_unitTesting_minimumTimeToLive = a3;
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong(&self->_unitTesting_didInsertEntry, 0);
  objc_storeStrong((id *)&self->_lock_shardRequirementStatuses, 0);
  objc_storeStrong((id *)&self->_featureEvaluators, 0);
  objc_storeStrong((id *)&self->_observationQueue_isProfileReady, 0);
  objc_storeStrong((id *)&self->_observationQueue, 0);
}

@end
