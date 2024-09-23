@implementation ACHBackCompatLegacyAchievementSyncEntity

+ (void)setEarnedInstanceStore:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&ivarLock);
  objc_storeWeak(&_earnedInstanceStore, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&ivarLock);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return objc_msgSend(a3, "syncStoreType") == 1;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE40C70]);
  return (HDSyncEntityIdentifier *)(id)objc_msgSend(v2, "initWithEntityIdentifier:schemaIdentifier:", *MEMORY[0x24BE012A0], 0);
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE01800];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:", v4);

  return v5;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  objc_msgSend(a6, "sendCodableChange:resultAnchor:sequence:done:error:", MEMORY[0x24BDBD1A8], a4.var1, 0, 1, 0, a7);
  return 1;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  return 0;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id WeakRetained;
  NSObject *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  ACHLogSync();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v13;
    _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects, count: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v9, "count"))
  {
    v51 = v10;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v55;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v19);
          objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ACHEarnedInstanceFromBackCompatCodableAchievement();
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[NSObject addObject:](v14, "addObject:", v22);
          }
          else
          {
            ACHLogDatabase();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v20;
              _os_log_error_impl(&dword_21407B000, v23, OS_LOG_TYPE_ERROR, "Failed to create earned instance for legacy achievement: %{public}@", buf, 0xCu);
            }

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v17);
    }

    v24 = -[NSObject count](v14, "count");
    ACHLogSync();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      v10 = v51;
      if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v14, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v60 = v27;
        _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "Decoded %{public}@ legacy achievement instances from sync.", buf, 0xCu);

      }
      os_unfair_lock_lock((os_unfair_lock_t)&ivarLock);
      WeakRetained = objc_loadWeakRetained(&_earnedInstanceStore);

      ACHLogSync();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects and earned instance store is set, passing to the store", buf, 2u);
        }

        v31 = objc_loadWeakRetained(&_earnedInstanceStore);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v14);
        v52 = 0;
        v33 = objc_msgSend(v31, "addEarnedInstances:error:", v32, &v52);
        v34 = v52;

        if ((v33 & 1) != 0)
          goto LABEL_38;
        ACHLogDatabase();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          +[ACHBackCompatLegacyAchievementSyncEntity receiveSyncObjects:version:syncStore:profile:error:].cold.2((uint64_t)v34, v35, v44, v45, v46, v47, v48, v49);
      }
      else
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21407B000, v29, OS_LOG_TYPE_DEFAULT, "Legacy Achievement Entity received sync objects, but earned instance store is not registered yet. Writing directly to database.", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v14);
        v35 = objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v36 = (id)objc_msgSend((id)objc_opt_class(), "insertEarnedInstances:provenance:useLegacySyncIdentity:profile:databaseContext:error:", v35, objc_msgSend(v51, "syncProvenance"), 1, v11, 0, &v53);
        v34 = v53;
        if (v34)
        {
          ACHLogSync();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            +[ACHBackCompatLegacyAchievementSyncEntity receiveSyncObjects:version:syncStore:profile:error:].cold.1((uint64_t)v34, v37, v38, v39, v40, v41, v42, v43);

        }
      }

LABEL_38:
      os_unfair_lock_unlock((os_unfair_lock_t)&ivarLock);
      goto LABEL_39;
    }
    v10 = v51;
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "Received zero decodable legacy achievement instances from sync, nothing to do.", buf, 2u);
    }

  }
  else
  {
    ACHLogSync();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v14, OS_LOG_TYPE_DEFAULT, "Received zero Legacy Achievement sync objects, nothing to do.", buf, 2u);
    }
  }
LABEL_39:

  return 0;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return 0;
}

+ (int)nanoSyncObjectType
{
  return 5;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 2 * (a3 < 8);
}

+ (void)receiveSyncObjects:(uint64_t)a3 version:(uint64_t)a4 syncStore:(uint64_t)a5 profile:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error directly applying legacy achievement sync objects to database (doesn't fail sync though): %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)receiveSyncObjects:(uint64_t)a3 version:(uint64_t)a4 syncStore:(uint64_t)a5 profile:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error adding synced legacy achievements (but that doesn't fail sync): %{public}@", a5, a6, a7, a8, 2u);
}

@end
