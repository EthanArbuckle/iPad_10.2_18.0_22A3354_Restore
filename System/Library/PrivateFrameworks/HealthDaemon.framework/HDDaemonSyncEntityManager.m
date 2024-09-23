@implementation HDDaemonSyncEntityManager

- (HDDaemonSyncEntityManager)initWithDaemon:(id)a3
{
  id v4;
  HDDaemonSyncEntityManager *v5;
  HDDaemonSyncEntityManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDaemonSyncEntityManager;
  v5 = -[HDDaemonSyncEntityManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_lock_loadSyncEntities
{
  id v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    if (!*(_QWORD *)(a1 + 24))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v42 = a1;
      v3 = (id *)(a1 + 8);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "behavior");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "futureMigrationsEnabled");
      HDBuiltinOrderedSyncEntities();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v56 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v13, "syncEntityIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        }
        while (v10);
      }
      v43 = v8;

      v15 = objc_loadWeakRetained(v3);
      objc_msgSend(v15, "pluginManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pluginsConformingToProtocol:", &unk_1EF1ADC10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v18;
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      if (v46)
      {
        v45 = *(_QWORD *)v52;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v52 != v45)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v19);
            objc_msgSend(v20, "orderedSyncEntities");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v23 = v21;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v48;
LABEL_17:
              v27 = 0;
              while (1)
              {
                if (*(_QWORD *)v48 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v27);
                objc_msgSend(v28, "syncEntityIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "objectForKeyedSubscript:", v29))
                  break;
                if (objc_msgSend(v2, "objectForKeyedSubscript:", v29))
                {
                  _HKInitializeLogging();
                  v35 = (void *)*MEMORY[0x1E0CB5370];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                    goto LABEL_28;
                  v31 = v35;
                  v36 = objc_msgSend(v2, "objectForKeyedSubscript:", v29);
                  *(_DWORD *)buf = 138544130;
                  v60 = v20;
                  v61 = 2114;
                  v62 = v28;
                  v63 = 2114;
                  v64 = (uint64_t)v29;
                  v65 = 2112;
                  v66 = v36;
                  v33 = v31;
                  v34 = "Plugin %{public}@ provides a sync entity %{public}@ with identifier %{public}@, but a sync entit"
                        "y already exists (%@) for that identifier. This plugin will be ignored for sync.";
                  goto LABEL_32;
                }
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

                if (v25 == ++v27)
                {
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
                  if (v25)
                    goto LABEL_17;
                  goto LABEL_24;
                }
              }
              _HKInitializeLogging();
              v30 = (void *)*MEMORY[0x1E0CB5370];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
LABEL_28:

                goto LABEL_29;
              }
              v31 = v30;
              v32 = objc_msgSend(v22, "objectForKeyedSubscript:", v29);
              *(_DWORD *)buf = 138544130;
              v60 = v20;
              v61 = 2114;
              v62 = v28;
              v63 = 2114;
              v64 = v32;
              v65 = 2114;
              v66 = (uint64_t)v29;
              v33 = v31;
              v34 = "Plugin %{public}@ provides multiple sync entities (%{public}@, %{public}@) for identifier %{public}@"
                    ". This plugin will be ignored for sync.";
LABEL_32:
              _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x2Au);

              goto LABEL_28;
            }
LABEL_24:

            objc_msgSend(v43, "addObjectsFromArray:", v23);
            objc_msgSend(v2, "addEntriesFromDictionary:", v22);
LABEL_29:

            ++v19;
          }
          while (v19 != v46);
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
          v46 = v37;
        }
        while (v37);
      }

      v38 = objc_msgSend(v43, "copy");
      v39 = *(void **)(v42 + 24);
      *(_QWORD *)(v42 + 24) = v38;

      v40 = objc_msgSend(v2, "copy");
      v41 = *(void **)(v42 + 32);
      *(_QWORD *)(v42 + 32) = v40;

    }
  }
}

- (NSArray)orderedSyncEntities
{
  os_unfair_lock_s *p_lock;
  NSArray *lock_allOrderedSyncEntities;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_allOrderedSyncEntities = self->_lock_allOrderedSyncEntities;
  if (!lock_allOrderedSyncEntities)
  {
    -[HDDaemonSyncEntityManager _lock_loadSyncEntities]((uint64_t)self);
    lock_allOrderedSyncEntities = self->_lock_allOrderedSyncEntities;
  }
  v5 = lock_allOrderedSyncEntities;
  os_unfair_lock_unlock(p_lock);
  if (v5)
    v6 = v5;
  else
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

- (NSDictionary)syncEntitiesByIdentifier
{
  os_unfair_lock_s *p_lock;
  NSDictionary *lock_allSyncEntitiesByIdentifier;
  void *v5;
  void *v6;
  NSDictionary *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_allSyncEntitiesByIdentifier = self->_lock_allSyncEntitiesByIdentifier;
  if (!lock_allSyncEntitiesByIdentifier)
  {
    -[HDDaemonSyncEntityManager _lock_loadSyncEntities]((uint64_t)self);
    lock_allSyncEntitiesByIdentifier = self->_lock_allSyncEntitiesByIdentifier;
  }
  v5 = (void *)-[NSDictionary copy](lock_allSyncEntitiesByIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_allSyncEntitiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_allOrderedSyncEntities, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

@end
