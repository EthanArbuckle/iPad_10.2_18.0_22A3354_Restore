@implementation HDCloudSyncCachedCloudState

- (HDCloudSyncCachedCloudState)init
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

- (HDCloudSyncCachedCloudState)initWithRepository:(id)a3 accessibilityAssertion:(id)a4
{
  id v7;
  id v8;
  HDCloudSyncCachedCloudState *v9;
  HDCloudSyncCachedCloudState *v10;
  uint64_t v11;
  HDProfile *profile;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id v27;
  objc_super v28;
  _BYTE buf[12];
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HDCloudSyncCachedCloudState;
  v9 = -[HDCloudSyncCachedCloudState init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_repository, a3);
    objc_msgSend(v7, "profile");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "legacyRepositoryProfile");
    v11 = objc_claimAutoreleasedReturnValue();
    profile = v10->_profile;
    v10->_profile = (HDProfile *)v11;

    objc_storeStrong((id *)&v10->_accessibilityAssertion, a4);
    v27 = 0;
    v13 = v7;
    objc_msgSend(v13, "userRecordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "legacyRepositoryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = +[HDCachedCKDatabaseEntity deleteDatabasesNotMatchingUserRecordName:profile:error:](HDCachedCKDatabaseEntity, "deleteDatabasesNotMatchingUserRecordName:profile:error:", v14, v16, &v27);

    if ((_DWORD)v17)
    {
      objc_msgSend(v13, "profile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "legacyRepositoryProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v20 = +[HDCachedSecureCKRecordEntity synchronizeRecordsWithProfile:error:](HDCachedSecureCKRecordEntity, "synchronizeRecordsWithProfile:error:", v19, buf);
      v21 = *(id *)buf;

      if (v20 || (objc_msgSend(v21, "hk_isDatabaseAccessibilityError") & 1) != 0)
      {
        LOBYTE(v17) = 1;
      }
      else
      {
        v23 = v21;
        v17 = (uint64_t)v23;
        if (v23)
          v27 = objc_retainAutorelease(v23);

        LOBYTE(v17) = 0;
      }

    }
  }
  else
  {
    v27 = 0;
    v22 = v7;
    LOBYTE(v17) = 0;
  }

  v24 = v27;
  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v10;
      v30 = 2114;
      v31 = v24;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error clearing and synchronizing cache %{public}@.", buf, 0x16u);
    }
  }

  return v10;
}

- (BOOL)addDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  HDCloudSyncRepository *repository;
  id v9;
  void *v10;
  void *v11;

  repository = self->_repository;
  v9 = a3;
  -[HDCloudSyncRepository userRecordName](repository, "userRecordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedCloudState profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDCachedCKDatabaseEntity insertIfDoesNotExistWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:profile:error:](HDCachedCKDatabaseEntity, "insertIfDoesNotExistWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:profile:error:", v9, a4, v10, 0, v11, a5);

  return (char)a5;
}

- (BOOL)setServerChangeToken:(id)a3 containerIdentifier:(id)a4 databaseScope:(int64_t)a5 error:(id *)a6
{
  HDCloudSyncRepository *repository;
  id v11;
  id v12;
  void *v13;
  void *v14;

  repository = self->_repository;
  v11 = a4;
  v12 = a3;
  -[HDCloudSyncRepository userRecordName](repository, "userRecordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedCloudState profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[HDCachedCKDatabaseEntity insertOrUpdateWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:profile:error:](HDCachedCKDatabaseEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:userRecordName:serverChangeToken:profile:error:", v11, a5, v13, v12, v14, a6);

  return (char)a6;
}

- (BOOL)resetServerChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  HDAssertion *accessibilityAssertion;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  _QWORD v23[5];
  id v24;
  int64_t v25;

  v8 = a3;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v9, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCachedCloudState repository](self, "repository");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke;
  v23[3] = &unk_1E6CE9280;
  v23[4] = self;
  v24 = v8;
  v25 = a4;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke_2;
  v20[3] = &unk_1E6CE92A8;
  v20[4] = self;
  v21 = v24;
  v22 = a4;
  v17 = v24;
  v18 = objc_msgSend(v15, "performTransactionWithContext:error:block:inaccessibilityHandler:", v12, a5, v23, v20);

  return v18;
}

uint64_t __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return -[HDCloudSyncCachedCloudState _resetServerChangeTokenForContainerIdentifier:databaseScope:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (uint64_t)_resetServerChangeTokenForContainerIdentifier:(uint64_t)a3 databaseScope:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  HDCloudSyncCachedZone *v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  id v36;
  _QWORD *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    v48 = 0;
    objc_msgSend((id)a1, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v7, a3, &v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v48;
    v10 = v9;
    if (v8 || !v9)
    {
      v37 = a4;
      v38 = v9;
      v39 = v8;
      v40 = v7;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v17 = [HDCloudSyncCachedZone alloc];
            objc_msgSend((id)a1, "repository");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v17, "initForZoneIdentifier:repository:accessibilityAssertion:", v16, v18, *(_QWORD *)(a1 + 64));

            v43 = 0;
            LOBYTE(v18) = objc_msgSend(v19, "deleteZoneWithError:", &v43);
            v20 = v43;
            if ((v18 & 1) == 0)
            {
              v30 = v20;
              v31 = v30;
              v8 = v39;
              v7 = v40;
              v10 = v38;
              if (v30)
              {
                if (v37)
                  *v37 = objc_retainAutorelease(v30);
                else
                  _HKLogDroppedError();
              }

              goto LABEL_26;
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v13)
            continue;
          break;
        }
      }

      v42 = 0;
      v7 = v40;
      v21 = objc_msgSend((id)a1, "setServerChangeToken:containerIdentifier:databaseScope:error:", 0, v40, a3, &v42);
      v22 = v42;
      v23 = v22;
      if ((v21 & 1) != 0)
      {
        v36 = v22;
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "repository");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "profile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "legacyRepositoryProfile");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v28 = HDSetCloudSyncAttachmentManagementUUID(v24, v27, (uint64_t)&v41);
        v29 = v41;

        if ((v28 & 1) != 0)
        {
          a1 = 1;
          v10 = v38;
          v8 = v39;
          v23 = v36;
        }
        else
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E0CB5370];
          v10 = v38;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v50 = a1;
            v51 = 2114;
            v52 = v29;
            _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to reset attachment UUID in response to a reset change token, %{public}@", buf, 0x16u);
          }
          v34 = v29;
          v29 = v34;
          a1 = v34 == 0;
          v8 = v39;
          v23 = v36;
          if (v34)
          {
            if (v37)
              *v37 = objc_retainAutorelease(v34);
            else
              _HKLogDroppedError();
          }

        }
      }
      else
      {
        v32 = v22;
        v29 = v32;
        if (v32)
        {
          v10 = v38;
          if (v37)
          {
            v29 = objc_retainAutorelease(v32);
            a1 = 0;
            *v37 = v29;
          }
          else
          {
            _HKLogDroppedError();
            a1 = 0;
          }
          v8 = v39;
        }
        else
        {
          a1 = 0;
          v10 = v38;
          v8 = v39;
        }
      }

    }
    else if (a4)
    {
      a1 = 0;
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
LABEL_26:
      a1 = 0;
    }

  }
  return a1;
}

uint64_t __96__HDCloudSyncCachedCloudState_resetServerChangeTokenForContainerIdentifier_databaseScope_error___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return -[HDCloudSyncCachedCloudState _resetServerChangeTokenForContainerIdentifier:databaseScope:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (id)serverChangeTokenForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[HDCloudSyncCachedCloudState profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCachedCKDatabaseEntity serverChangeTokenForContainerIdentifier:databaseScope:profile:error:](HDCachedCKDatabaseEntity, "serverChangeTokenForContainerIdentifier:databaseScope:profile:error:", v8, a4, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)addZoneWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  HDCloudSyncCachedCloudState *v12;

  v6 = a3;
  -[HDProfile database](self->_profile, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HDCloudSyncCachedCloudState_addZoneWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E6CE7950;
  v11 = v6;
  v12 = self;
  v8 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performWriteTransactionWithHealthDatabase:error:block:", v7, a4, v10);

  return (char)a4;
}

BOOL __59__HDCloudSyncCachedCloudState_addZoneWithIdentifier_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v22;
  id v23;

  v23 = a2;
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "userRecordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a3;
  LODWORD(a3) = +[HDCachedCKRecordZoneEntity insertIfDoesNotExistWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:profile:error:](HDCachedCKRecordZoneEntity, "insertIfDoesNotExistWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:profile:error:", v5, v6, v8, v10, v11, 0, v12, a3);

  if ((_DWORD)a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(*(id *)(a1 + 32), "scope");
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "zoneName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ownerName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    v20 = +[HDCachedCKRecordZoneEntity setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "setRequiresFetch:containerIdentifier:databaseScope:zoneName:ownerName:transaction:error:", 1, v13, v14, v16, v18, v23, v22);

  }
  else
  {
    v20 = 0;
    v19 = v23;
  }

  return v20;
}

- (id)zoneIdentifiersForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  HDCloudSyncCachedCloudState *v19;
  id v20;
  int64_t v21;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncCachedCloudState repository](self, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__HDCloudSyncCachedCloudState_zoneIdentifiersForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E6CE92D0;
  v21 = a4;
  v18 = v8;
  v19 = self;
  v13 = v9;
  v20 = v13;
  v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:](HDCachedCKRecordZoneEntity, "enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:", v14, a4, v12, a5, v17);

  if ((_DWORD)a5)
    v15 = v13;
  else
    v15 = 0;

  return v15;
}

uint64_t __89__HDCloudSyncCachedCloudState_zoneIdentifiersForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  if (a4 == 1)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = v8;
      objc_msgSend(v7, "zoneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      HDCKDatabaseScopeToString(*(_QWORD *)(a1 + 56));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_debug_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; with state Identity Lost, container %{public}@, database %{public}@",
        (uint8_t *)&v15,
        0x2Au);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
  }

  return 1;
}

- (id)zoneIdentifiersRequiringFetchForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncCachedCloudState repository](self, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __103__HDCloudSyncCachedCloudState_zoneIdentifiersRequiringFetchForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E6CE92F8;
  v18 = v8;
  v20 = a4;
  v13 = v9;
  v19 = v13;
  v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:](HDCachedCKRecordZoneEntity, "enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:", v14, a4, v12, a5, v17);

  if ((_DWORD)a5)
    v15 = v13;
  else
    v15 = 0;

  return v15;
}

uint64_t __103__HDCloudSyncCachedCloudState_zoneIdentifiersRequiringFetchForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v5;
  id v6;

  if (a4 != 1 && a3)
  {
    v5 = a2;
    v6 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  return 1;
}

- (id)zoneIdentifiersWithIdentityLossForContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDCloudSyncCachedCloudState repository](self, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__HDCloudSyncCachedCloudState_zoneIdentifiersWithIdentityLossForContainerIdentifier_databaseScope_error___block_invoke;
  v17[3] = &unk_1E6CE92F8;
  v18 = v8;
  v20 = a4;
  v13 = v9;
  v19 = v13;
  v14 = v8;
  LODWORD(a5) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:](HDCachedCKRecordZoneEntity, "enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:", v14, a4, v12, a5, v17);

  if ((_DWORD)a5)
    v15 = v13;
  else
    v15 = 0;

  return v15;
}

uint64_t __105__HDCloudSyncCachedCloudState_zoneIdentifiersWithIdentityLossForContainerIdentifier_databaseScope_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5;
  id v6;

  if (a4 == 1)
  {
    v5 = a2;
    v6 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:]([HDCloudSyncZoneIdentifier alloc], "initForZone:container:scope:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  return 1;
}

- (id)zonesByIdentifierWithError:(id *)a3
{
  return -[HDCloudSyncCachedCloudState zonesByIdentifierWithError:filter:](self, "zonesByIdentifierWithError:filter:", a3, &__block_literal_global_9);
}

uint64_t __58__HDCloudSyncCachedCloudState_zonesByIdentifierWithError___block_invoke()
{
  return 1;
}

- (id)zonesByIdentifierWithError:(id *)a3 filter:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[HDCloudSyncCachedCloudState repository](self, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allCKContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedCloudState zonesByIdentifierForContainers:error:filter:](self, "zonesByIdentifierForContainers:error:filter:", v8, a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)zonesByIdentifierForContainers:(id)a3 error:(id *)a4 filter:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  HDCloudSyncCachedCloudState *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  HDProfile *profile;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  id obj;
  uint64_t v41;
  id v43;
  void *v44;
  HDCloudSyncCachedCloudState *v45;
  _QWORD v46[5];
  id v47;
  HDCloudSyncCachedCloudState *v48;
  id v49;
  id v50;
  _BYTE *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  uint8_t v57[128];
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v43 = a5;
  v56 = 0;
  v45 = self;
  if (!self)
  {
    v17 = 0;
    v44 = 0;
    goto LABEL_17;
  }
  -[HDCloudSyncCachedCloudState profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_msgSend(v8, "shareOwnerParticipantWithError:", buf);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(id *)buf;
  objc_msgSend(v9, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (v10)
    {
      v44 = 0;
      v56 = objc_retainAutorelease(v10);
      goto LABEL_16;
    }
    -[HDCloudSyncCachedCloudState profile](v45, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "profileType");

    if (v16 > 3)
    {
      if (v16 != 100 && v16 != 4)
        goto LABEL_14;
    }
    else
    {
      if ((unint64_t)(v16 - 2) < 2)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v56, 729, CFSTR("Profile type %ld requires a zone owner name but none was present."), v16);
LABEL_15:
        v44 = 0;
        goto LABEL_16;
      }
      if (v16 != 1)
      {
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v56, 729, CFSTR("Unexpected profile type %ld; requiring zone owner to be safe."),
          v16);
        goto LABEL_15;
      }
    }
    v14 = (id)*MEMORY[0x1E0C94730];
    goto LABEL_4;
  }
  v14 = v13;
LABEL_4:
  v44 = v14;
LABEL_16:

  v17 = v56;
LABEL_17:
  v18 = v17;
  v39 = v18;
  if (v44 || !v18)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__9;
    v60 = __Block_byref_object_dispose__9;
    v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v38;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    v22 = v45;
    if (v21)
    {
      v41 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          -[HDCloudSyncCachedCloudState repository](v22, "repository");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "profileIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          HDDatabaseForContainer(v24, v26);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "containerIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend((id)v27, "databaseScope");
          -[HDCloudSyncCachedCloudState repository](v45, "repository");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "profile");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "legacyRepositoryProfile");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __75__HDCloudSyncCachedCloudState_zonesByIdentifierForContainers_error_filter___block_invoke;
          v46[3] = &unk_1E6CE9360;
          v46[4] = v24;
          v33 = (id)v27;
          v47 = v33;
          v48 = v45;
          v49 = v44;
          v50 = v43;
          v51 = buf;
          LOBYTE(v27) = +[HDCachedCKRecordZoneEntity enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:](HDCachedCKRecordZoneEntity, "enumerateCKRecordZoneIDsWithContainerIdentifier:databaseScope:profile:error:enumerationHandler:", v28, v29, v32, a4, v46);

          if ((v27 & 1) == 0)
          {

            v20 = 0;
            goto LABEL_33;
          }
          v22 = v45;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v21)
          continue;
        break;
      }
    }

    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
LABEL_33:
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      profile = v45->_profile;
      v36 = v19;
      -[HDProfile profileIdentifier](profile, "profileIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2114;
      v59 = v39;
      _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Cannot get zone owner name for profile %{public}@ with error %{public}@", buf, 0x20u);

    }
    if (a4)
    {
      v20 = 0;
      *a4 = objc_retainAutorelease(v39);
    }
    else
    {
      _HKLogDroppedError();
      v20 = 0;
    }
  }

  return v20;
}

uint64_t __75__HDCloudSyncCachedCloudState_zonesByIdentifierForContainers_error_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  HDCloudSyncZoneIdentifier *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  HDCloudSyncCachedZone *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = [HDCloudSyncZoneIdentifier alloc];
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v7, "initForZone:container:scope:", v6, v8, objc_msgSend(*(id *)(a1 + 40), "databaseScope"));

  if (a4)
  {
    if (a4 == 1)
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(a1 + 48);
        v12 = v10;
        objc_msgSend(v9, "zoneIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HDCKDatabaseScopeToString(objc_msgSend(*(id *)(a1 + 40), "databaseScope"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138544130;
        v44 = v11;
        v45 = 2114;
        v46 = v13;
        v47 = 2114;
        v48 = v14;
        v49 = 2114;
        v50 = v15;
        _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; with state Identity Lost, container %{public}@, database %{public}@",
          (uint8_t *)&v43,
          0x2Au);

LABEL_16:
        goto LABEL_17;
      }
    }
    goto LABEL_17;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
LABEL_8:
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
    {
      v24 = [HDCloudSyncCachedZone alloc];
      objc_msgSend(*(id *)(a1 + 48), "repository");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 48);
      if (v26)
        v27 = *(_QWORD *)(v26 + 64);
      else
        v27 = 0;
      v28 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v24, "initForZoneIdentifier:repository:accessibilityAssertion:", v9, v25, v27);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:forKeyedSubscript:", v28, v9);
    }
    goto LABEL_17;
  }
  objc_msgSend(v9, "zoneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(a1 + 56));

  if ((v18 & 1) != 0)
  {
    objc_msgSend(v9, "zoneIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hd_syncCircleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "repository");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "syncCircleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqualToString:", v22);

    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
      {
        v36 = *(_QWORD *)(a1 + 48);
        v12 = v35;
        objc_msgSend(v9, "zoneIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "zoneIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hd_syncCircleIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "repository");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "syncCircleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138544130;
        v44 = v36;
        v45 = 2114;
        v46 = v37;
        v47 = 2114;
        v48 = v39;
        v49 = 2114;
        v50 = v41;
        _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; syncCircleIdentifier %{public}@ does not match our expected syncCircleId"
          "entifier %{public}@",
          (uint8_t *)&v43,
          0x2Au);

        goto LABEL_16;
      }
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v29 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    v30 = *(_QWORD *)(a1 + 48);
    v12 = v29;
    objc_msgSend(v9, "zoneIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zoneIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ownerName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(a1 + 56);
    v43 = 138544130;
    v44 = v30;
    v45 = 2114;
    v46 = v31;
    v47 = 2114;
    v48 = v33;
    v49 = 2114;
    v50 = v34;
    _os_log_debug_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring zone %{public}@; owner %{public}@ does not match our expected zone owner name %{public}@",
      (uint8_t *)&v43,
      0x2Au);

    goto LABEL_16;
  }
LABEL_17:

  return 1;
}

- (id)_singletonZoneOfType:(void *)a1 containerID:(unint64_t)a2 error:(void *)a3 filter:(_QWORD *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD *, void *);
  void *v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a1)
  {
    v25 = a2;
    v26 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __77__HDCloudSyncCachedCloudState__singletonZoneOfType_containerID_error_filter___block_invoke;
    v22 = &unk_1E6CE9388;
    v9 = v7;
    v23 = v9;
    v24 = 0;
    objc_msgSend(a1, "zonesByIdentifierWithError:filter:", &v26, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    v12 = v11;
    if (v10 || !v11)
    {
      objc_msgSend(v10, "allValues", v19, v20, v21, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          v16 = v14;
          HDCloudSyncZoneTypeToString(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "profile");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v28 = a1;
          v29 = 2114;
          v30 = v17;
          v31 = 2114;
          v32 = v18;
          v33 = 2114;
          v34 = v9;
          v35 = 2112;
          v36 = v13;
          _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple cached zones of type %{public}@ for profile %{public}@, container %{public}@. This is unexpected. (%@)", buf, 0x34u);

        }
      }
      objc_msgSend(v13, "firstObject");
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (a4)
    {
      a1 = 0;
      *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      _HKLogDroppedError();
      a1 = 0;
    }

  }
  return a1;
}

uint64_t __77__HDCloudSyncCachedCloudState__singletonZoneOfType_containerID_error_filter___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == a1[6])
  {
    objc_msgSend(v3, "containerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", a1[4]))
    {
      v5 = a1[5];
      if (v5)
        v6 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v3);
      else
        v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)masterZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 0, a3, a4);
}

- (id)unifiedSyncZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 2uLL, a3, a4);
}

- (id)privateMetadataZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 4uLL, a3, a4);
}

- (id)attachmentZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 5uLL, a3, a4);
}

- (id)contextSyncZoneForContainerID:(id)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedCloudState _singletonZoneOfType:containerID:error:filter:](self, 7uLL, a3, a4);
}

- (id)zoneForRecordID:(id)a3 containerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __73__HDCloudSyncCachedCloudState_zoneForRecordID_containerIdentifier_error___block_invoke;
  v19 = &unk_1E6CE93B0;
  v20 = v8;
  v21 = v9;
  v10 = v9;
  v11 = v8;
  -[HDCloudSyncCachedCloudState zonesByIdentifierWithError:filter:](self, "zonesByIdentifierWithError:filter:", a5, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __73__HDCloudSyncCachedCloudState_zoneForRecordID_containerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v3, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)zonesForContainerID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v15 = 0;
  -[HDCloudSyncCachedCloudState zonesByIdentifierWithError:](self, "zonesByIdentifierWithError:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7 || !v8)
  {
    objc_msgSend(v7, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__HDCloudSyncCachedCloudState_zonesForContainerID_error___block_invoke;
    v13[3] = &unk_1E6CE93D8;
    v14 = v6;
    objc_msgSend(v11, "hk_filter:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v10 = 0;
    *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    _HKLogDroppedError();
    v10 = 0;
  }

  return v10;
}

uint64_t __57__HDCloudSyncCachedCloudState_zonesForContainerID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)detailedDescription
{
  HDCloudSyncCachedCloudState *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  int v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v53;
  void *v54;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;
  id obj;
  id obja;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  HDCloudSyncCachedCloudState *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint8_t v90[4];
  HDCloudSyncCachedCloudState *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v2 = self;
  v96 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  if (self)
  {
    v81 = 0;
    -[HDCloudSyncCachedCloudState zonesByIdentifierWithError:](self, "zonesByIdentifierWithError:", &v81);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v81;
    v6 = v5;
    if (v4 || !v5)
    {
      v56 = v5;
      v57 = v4;
      v59 = v3;
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      objc_msgSend(v4, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v78;
        v8 = 1;
        do
        {
          v12 = 0;
          v63 = v10;
          do
          {
            if (*(_QWORD *)v78 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v12);
            v14 = objc_opt_class();
            v76 = 0;
            objc_msgSend(v13, "recordsForClass:error:", v14, &v76);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v76;
            v17 = v16;
            if (v15)
              v18 = 1;
            else
              v18 = v16 == 0;
            if (v18)
            {
              v19 = v11;
              v75 = 0u;
              v73 = 0u;
              v74 = 0u;
              v72 = 0u;
              v20 = v15;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v73;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v73 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                    if (v25)
                    {
                      v26 = objc_msgSend(v25, "supportedProtocolVersion");
                      if (v8 >= v26)
                        v8 = v26;
                    }
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
                }
                while (v22);
              }

              v11 = v19;
              v10 = v63;
            }
            else
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v29 = v27;
                objc_msgSend(v13, "zoneIdentifier");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v85 = self;
                v86 = 2114;
                v87 = v30;
                v88 = 2114;
                v89 = v17;
                _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

              }
            }

            ++v12;
          }
          while (v12 != v10);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        }
        while (v10);
      }
      else
      {
        v8 = 1;
      }

      v2 = self;
      v4 = v57;
      v3 = v59;
      v6 = v56;
    }
    else
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138543618;
        v91 = v2;
        v92 = 2114;
        v93 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating push targets, %{public}@", v90, 0x16u);
      }
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nMinimum supported protocol: %ld\n\n"), v2, v8);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  -[HDCloudSyncCachedCloudState zonesByIdentifierWithError:](v2, "zonesByIdentifierWithError:", &v71);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v71;
  v33 = v32;
  if (!v31)
  {
    if (v32)
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v90 = 138543618;
        v91 = v2;
        v92 = 2114;
        v93 = v33;
        _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve zone identifiers for cached cloud state description, %{public}@", v90, 0x16u);
      }
    }
  }
  objc_msgSend(v31, "allValues");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hk_filter:", &__block_literal_global_201);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v36, "count"))
  {
    v60 = v33;
    v61 = v31;
    objc_msgSend(obja, "appendFormat:", CFSTR("Master Records (%ld):\n"), objc_msgSend(v36, "count"));
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v58 = v36;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v68 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          v43 = objc_opt_class();
          v66 = 0;
          objc_msgSend(v42, "recordsForClass:error:", v43, &v66);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v66;
          v46 = v45;
          if (v44)
            v47 = 1;
          else
            v47 = v45 == 0;
          if (v47)
          {
            objc_msgSend(v44, "firstObject");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "description");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "hk_stringIndentedBy:", 4);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obja, "appendFormat:", CFSTR("%@\n\n"), v50);

          }
          else
          {
            _HKInitializeLogging();
            v51 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v53 = v51;
              objc_msgSend(v42, "zoneIdentifier");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v90 = 138543874;
              v91 = self;
              v92 = 2114;
              v93 = v54;
              v94 = 2114;
              v95 = v46;
              _os_log_error_impl(&dword_1B7802000, v53, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", v90, 0x20u);

            }
          }

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
      }
      while (v39);
    }

    v33 = v60;
    v31 = v61;
    v36 = v58;
  }

  return obja;
}

BOOL __50__HDCloudSyncCachedCloudState_detailedDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "zoneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 0;

  return v3;
}

- (BOOL)unitTest_deleteDatabaseWithContainerIdentifier:(id)a3 databaseScope:(int64_t)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;

  HDPredicateForContainerIdentifierAndDatabaseScope((uint64_t)a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedCloudState profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDCachedCKDatabaseEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v7, v9, a5);

  return (char)a5;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (int64_t)changedZonesCount
{
  return self->_changedZonesCount;
}

- (void)setChangedZonesCount:(int64_t)a3
{
  self->_changedZonesCount = a3;
}

- (int64_t)deletedZonesCount
{
  return self->_deletedZonesCount;
}

- (void)setDeletedZonesCount:(int64_t)a3
{
  self->_deletedZonesCount = a3;
}

- (int64_t)changedRecordsCount
{
  return self->_changedRecordsCount;
}

- (void)setChangedRecordsCount:(int64_t)a3
{
  self->_changedRecordsCount = a3;
}

- (int64_t)deletedRecordsCount
{
  return self->_deletedRecordsCount;
}

- (void)setDeletedRecordsCount:(int64_t)a3
{
  self->_deletedRecordsCount = a3;
}

- (int64_t)operationCountForAnalytics
{
  return self->_operationCountForAnalytics;
}

- (void)setOperationCountForAnalytics:(int64_t)a3
{
  self->_operationCountForAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
