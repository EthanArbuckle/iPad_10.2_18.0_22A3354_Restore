@implementation HDCloudSyncFetchSharesOperation

- (HDCloudSyncFetchSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncFetchSharesOperation *v4;
  HDCloudSyncFetchSharesOperation *v5;
  NSMutableArray *v6;
  NSMutableArray *shares;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncFetchSharesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v9, sel_initWithConfiguration_cloudState_, a3, 0);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    shares = v5->_shares;
    v5->_shares = v6;

  }
  return v5;
}

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  HDCloudSyncFetchSharesOperation *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allCKContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  -[HDCloudSyncOperation progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTotalUnitCount:", v8);

  if (self->_fetchAllShares)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v15, "privateCloudDatabase");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[HDCloudSyncFetchSharesOperation _fetchSharesForContainer:database:error:](self, v15, v16, a3);

          if (!v17)
          {
            LOBYTE(v19) = 0;
            goto LABEL_26;
          }
          objc_msgSend(v15, "sharedCloudDatabase");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[HDCloudSyncFetchSharesOperation _fetchSharesForContainer:database:error:](self, v15, v18, a3);

          if (!v19)
            goto LABEL_26;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        LOBYTE(v19) = 1;
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      LOBYTE(v19) = 1;
    }
  }
  else
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cachedCloudState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v21, "zonesByIdentifierWithError:", &v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;

    if (v22 || !v10)
    {
      if (v22)
      {
        objc_msgSend(v22, "allValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v19) = -[HDCloudSyncFetchSharesOperation _fetchSharesForZones:error:]((uint64_t)self, v24, a3);

      }
      else
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB5370];
        LOBYTE(v19) = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v33 = self;
          _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_INFO, "%{public}@ No zones fetched.", buf, 0xCu);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v10;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      if (a3)
      {
        LOBYTE(v19) = 0;
        *a3 = objc_retainAutorelease(v10);
      }
      else
      {
        _HKLogDroppedError();
        LOBYTE(v19) = 0;
      }
    }

  }
LABEL_26:

  return v19;
}

- (uint64_t)_fetchSharesForContainer:(void *)a3 database:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedCloudState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v10, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v11, objc_msgSend(v8, "databaseScope"), &v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26;

    if (v12 || !v13)
    {
      if (v12 && objc_msgSend(v12, "count"))
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __75__HDCloudSyncFetchSharesOperation__fetchSharesForContainer_database_error___block_invoke;
        v25[3] = &unk_1E6CF6690;
        v25[4] = a1;
        objc_msgSend(v12, "hk_map:", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HDCloudSyncFetchSharesOperation _fetchSharesForZones:error:]((uint64_t)a1, v16, a4);

      }
      else
      {
        _HKInitializeLogging();
        v17 = (void *)*MEMORY[0x1E0CB5370];
        v15 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          objc_msgSend(v7, "containerIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "databaseScope");
          CKDatabaseScopeString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = a1;
          v29 = 2114;
          v30 = v19;
          v31 = 2114;
          v32 = v20;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "%{public}@ No zones fetched for container %{public}@, database %{public}@", buf, 0x20u);

        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v22 = v14;
        objc_msgSend(v7, "containerIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "databaseScope");
        CKDatabaseScopeString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = a1;
        v29 = 2114;
        v30 = v23;
        v31 = 2114;
        v32 = v24;
        v33 = 2114;
        v34 = v13;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones for container %{public}@ ,database %{public}@, %{public}@", buf, 0x2Au);

      }
      if (a4)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v13);
      }
      else
      {
        _HKLogDroppedError();
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (uint64_t)_fetchSharesForZones:(_QWORD *)a3 error:
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  NSObject *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v22 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v23 = 0;
          objc_msgSend(v11, "zoneShareWithError:", &v23, v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v23;
          v14 = v13;
          if (v12)
            v15 = 1;
          else
            v15 = v13 == 0;
          if (!v15)
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v20 = v17;
              objc_msgSend(v11, "zoneIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v29 = a1;
              v30 = 2114;
              v31 = v21;
              v32 = 2114;
              v33 = v14;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", buf, 0x20u);

            }
            if (v22)
              *v22 = objc_retainAutorelease(v14);
            else
              _HKLogDroppedError();

            v16 = 0;
            goto LABEL_23;
          }
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v8)
          continue;
        break;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 112), "addObjectsFromArray:", v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    v16 = 1;
LABEL_23:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)shares
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_shares;
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

id __75__HDCloudSyncFetchSharesOperation__fetchSharesForContainer_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDCloudSyncCachedZone *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v4, "initForZoneIdentifier:repository:accessibilityAssertion:", v3, v6, v8);

  return v9;
}

- (BOOL)fetchAllShares
{
  return self->_fetchAllShares;
}

- (void)setFetchAllShares:(BOOL)a3
{
  self->_fetchAllShares = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shares, 0);
}

@end
