@implementation HDCloudSyncCachedZone

- (id)initForZoneIdentifier:(id)a3 repository:(id)a4 accessibilityAssertion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDCloudSyncCachedZone *v11;
  uint64_t v12;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncCachedZone;
  v11 = -[HDCloudSyncCachedZone init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    zoneIdentifier = v11->_zoneIdentifier;
    v11->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v12;

    v11->_zoneType = -[HDCloudSyncZoneIdentifier type](v11->_zoneIdentifier, "type");
    objc_storeWeak((id *)&v11->_repository, v9);
    objc_storeStrong((id *)&v11->_accessibilityAssertion, a5);
  }

  return v11;
}

- (id)serverChangeTokenWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v17;
  void *v18;
  void *v19;

  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "scope");
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone repository](self, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "legacyRepositoryProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCachedCKRecordZoneEntity serverChangeTokenForContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:](HDCachedCKRecordZoneEntity, "serverChangeTokenForContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:", v4, v5, v7, v10, v13, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)setServerChangeToken:(id)a3 fetchComplete:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "containerIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v25, "scope");
    -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "zoneIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "zoneName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "zoneIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ownerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCachedZone repository](self, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userRecordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCachedZone repository](self, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "legacyRepositoryProfile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[HDCachedCKRecordZoneEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:fetchComplete:profile:error:](HDCachedCKRecordZoneEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:fetchComplete:profile:error:", v20, v19, v18, v9, v11, v8, v12, v15, a5);

  }
  else
  {
    v16 = -[HDCloudSyncCachedZone resetZoneServerChangeTokenWithError:](self, "resetZoneServerChangeTokenWithError:", a5);
  }

  return v16;
}

- (BOOL)deleteZoneWithError:(id *)a3
{
  void *v5;
  void *v6;
  HDAssertion *accessibilityAssertion;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  _QWORD v15[5];

  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v5, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCachedZone repository](self, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke;
  v15[3] = &unk_1E6CEBC00;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke_2;
  v14[3] = &unk_1E6D0B198;
  v12 = objc_msgSend(v11, "performTransactionWithContext:error:block:inaccessibilityHandler:", v8, a3, v15, v14);

  return v12;
}

BOOL __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _deleteZoneWithError:](*(void **)(a1 + 32), a3);
}

- (BOOL)_deleteZoneWithError:(void *)a1
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];

  v2 = (_BOOL8)a1;
  if (a1)
  {
    objc_msgSend(a1, "zoneIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "containerIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "zoneIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v29, "scope");
    objc_msgSend((id)v2, "zoneIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "zoneIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "zoneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "zoneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "legacyRepositoryProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __46__HDCloudSyncCachedZone__deleteZoneWithError___block_invoke;
    v33[3] = &unk_1E6D0B318;
    v33[4] = v2;
    v11 = v22;
    v23 = a2;
    LODWORD(a2) = +[HDCachedCKRecordEntity enumerateRecordIDsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:enumerationHandler:](HDCachedCKRecordEntity, "enumerateRecordIDsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:enumerationHandler:", v24, v11, v4, v7, v10, a2, v33);

    if ((_DWORD)a2)
    {
      objc_msgSend((id)v2, "zoneIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "zoneIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v30, "scope");
      objc_msgSend((id)v2, "zoneIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "zoneIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "zoneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "zoneIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "zoneIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ownerName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "repository");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "profile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "legacyRepositoryProfile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = +[HDCachedCKRecordZoneEntity deleteZoneWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:](HDCachedCKRecordZoneEntity, "deleteZoneWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:", v12, v25, v14, v17, v20, v23);

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

BOOL __45__HDCloudSyncCachedZone_deleteZoneWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _deleteZoneWithError:](*(void **)(a1 + 32), a3);
}

- (void)handleCloudError:(id)a3 operation:(id)a4 container:(id)a5 database:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  id v33;
  _QWORD v34[6];
  id v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (objc_msgSend(v10, "hk_isHealthKitErrorWithCode:", 725))
    {
      v35 = 0;
      v14 = -[HDCloudSyncCachedZone resetZoneServerChangeTokenWithError:](self, "resetZoneServerChangeTokenWithError:", &v35);
      v32 = (uint64_t (*)(uint64_t, uint64_t))v35;
      if (!v14)
      {
        _HKInitializeLogging();
        v15 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v30 = v15;
          -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2114;
          v37 = v32;
          _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, " %{public}@ Failed to set serverChangeToken to nil for zone %{public}@, %{public}@", buf, 0x20u);

        }
      }
      -[HDCloudSyncCachedZone repository](self, "repository", v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "profile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "daemon");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "analyticsSubmissionCoordinator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HDCKDatabaseScopeToString(objc_msgSend(v13, "databaseScope"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v11, CFSTR("Unexpected cache discrepency"), v20, v21, v10);

    }
    else
    {
      objc_msgSend(v10, "domain");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C947D8]);

      if (v23)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v37 = __Block_byref_object_copy__169;
        v38 = __Block_byref_object_dispose__169;
        v39 = 0;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __71__HDCloudSyncCachedZone_handleCloudError_operation_container_database___block_invoke;
        v34[3] = &unk_1E6D0B1C0;
        v34[4] = self;
        v34[5] = buf;
        objc_msgSend(v10, "hd_enumerateCloudKitPartialErrorsWithHandler:", v34);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          -[HDCloudSyncCachedZone repository](self, "repository");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "profile");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "daemon");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "analyticsSubmissionCoordinator");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "containerIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HDCKDatabaseScopeToString(objc_msgSend(v13, "databaseScope"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudCache_reportCacheDiscrepancyForOperation:reason:containerIdentifier:databaseScope:error:", v11, &stru_1E6D11BB8, v28, v29, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

        }
        _Block_object_dispose(buf, 8);

      }
    }
  }

}

void __71__HDCloudSyncCachedZone_handleCloudError_operation_container_database___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  char v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  _BYTE *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v4 = a2;
  v73 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *MEMORY[0x1E0C947D8];
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 26))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    v8 = *(void **)(a1 + 32);
    v66 = 0;
    v9 = objc_msgSend(v8, "deleteZoneWithError:", &v66);
    v10 = v66;
    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v68 = v43;
        v69 = 2114;
        v70 = v10;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zone after encountering zone-not-found error: %{public}@", buf, 0x16u);
      }
    }
    *a3 = 1;

  }
  v59 = v7;
  v60 = v4;
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 21))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    v12 = *(void **)(a1 + 32);
    v65 = 0;
    v13 = objc_msgSend(v12, "resetZoneServerChangeTokenWithError:", &v65);
    v14 = v65;
    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v44 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v44;
        v69 = 2114;
        v70 = v6;
        v71 = 2114;
        v72 = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset server change token after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "repository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "legacyRepositoryProfile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v14;
    v20 = HDSetCloudSyncAttachmentManagementUUID(v16, v19, (uint64_t)&v64);
    v21 = v64;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      v22 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v45 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v45;
        v69 = 2114;
        v70 = v6;
        v71 = 2114;
        v72 = v21;
        _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to reset attachment UUID after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    *a3 = 1;

    v7 = v59;
    v4 = v60;
  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 11))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    v23 = *(void **)(a1 + 32);
    v63 = 0;
    v24 = objc_msgSend(v23, "resetZoneServerChangeTokenWithError:", &v63);
    v25 = v63;
    if ((v24 & 1) == 0)
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v46 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v68 = v46;
        v69 = 2114;
        v70 = v6;
        v71 = 2114;
        v72 = v25;
        _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset server change token after encountering %{public}@: %{public}@", buf, 0x20u);
      }
    }
    *a3 = 1;

  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 112))
  {
    v57 = v6;
    v58 = a3;
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "containerIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v54, "scope");
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "zoneIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "zoneName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "zoneIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "ownerName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "repository");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "profile");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "legacyRepositoryProfile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v55 = a1;
    v35 = +[HDCachedCKRecordZoneEntity setZoneEntityState:containerIdentifier:databaseScope:zoneName:ownerName:profile:error:](HDCachedCKRecordZoneEntity, "setZoneEntityState:containerIdentifier:databaseScope:zoneName:ownerName:profile:error:", 1, v51, v52, v28, v31, v34, &v62);
    v36 = v62;

    v37 = v36;
    a1 = v55;

    if (!v35)
    {
      _HKInitializeLogging();
      v38 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v47 = *(void **)(v55 + 32);
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        v69 = 2114;
        v70 = v37;
        _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark zone as missing identity: %{public}@", buf, 0x16u);
      }
    }
    a3 = v58;
    *v58 = 1;

    v6 = v57;
    v7 = v59;
    v4 = v60;
  }
  if (objc_msgSend(v6, "hk_isErrorInDomain:code:", v7, 14))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    v39 = *(void **)(a1 + 32);
    v61 = 0;
    v40 = objc_msgSend(v39, "resetZoneServerChangeTokenWithError:", &v61);
    v41 = v61;
    if ((v40 & 1) == 0)
    {
      _HKInitializeLogging();
      v42 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v48 = *(void **)(a1 + 32);
        v49 = v42;
        objc_msgSend(v48, "zoneIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v68 = v48;
        v69 = 2114;
        v70 = v50;
        v71 = 2114;
        v72 = v41;
        _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, " %{public}@ Failed to set serverChangeToken to nil for zone %{public}@, %{public}@", buf, 0x20u);

      }
    }
    *a3 = 1;

  }
}

- (BOOL)resetZoneServerChangeTokenWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDAssertion *accessibilityAssertion;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[6];

  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "containerIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v28, "scope");
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "zoneIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone repository](self, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userRecordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone repository](self, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[HDCachedCKRecordZoneEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:fetchComplete:profile:error:](HDCachedCKRecordZoneEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:userRecordName:serverChangeToken:fetchComplete:profile:error:", v23, v22, v5, v7, v9, 0, MEMORY[0x1E0C9AAA0], v12, a3);

  if (!v25)
    return 0;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v13, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCachedZone repository](self, "repository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke;
  v31[3] = &unk_1E6CEBC00;
  v31[4] = self;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke_2;
  v30[3] = &unk_1E6D0B198;
  v30[4] = self;
  v20 = objc_msgSend(v19, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, a3, v31, v30);

  return v20;
}

BOOL __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _enumerateRecordsAndDeleteWithError:](*(void **)(a1 + 32), a3);
}

- (BOOL)_enumerateRecordsAndDeleteWithError:(void *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  if (!a1)
    return 0;
  objc_msgSend(a1, "zoneIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "zoneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v16, "scope");
  objc_msgSend(a1, "zoneIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyRepositoryProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__HDCloudSyncCachedZone__enumerateRecordsAndDeleteWithError___block_invoke;
  v19[3] = &unk_1E6D0B318;
  v19[4] = a1;
  v12 = +[HDCachedCKRecordEntity enumerateRecordIDsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:enumerationHandler:](HDCachedCKRecordEntity, "enumerateRecordIDsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:enumerationHandler:", v14, v3, v5, v8, v11, a2, v19);

  return v12;
}

BOOL __61__HDCloudSyncCachedZone_resetZoneServerChangeTokenWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[HDCloudSyncCachedZone _enumerateRecordsAndDeleteWithError:](*(void **)(a1 + 32), a3);
}

- (int64_t)needsFetchWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[HDCloudSyncCachedZone repository](self, "repository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__HDCloudSyncCachedZone_needsFetchWithError___block_invoke;
  v10[3] = &unk_1E6CEF700;
  v10[4] = self;
  v10[5] = &v11;
  LODWORD(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordZoneEntity, "performReadTransactionWithHealthDatabase:error:block:", v7, a3, v10);

  if ((_DWORD)a3)
    v8 = v12[3];
  else
    v8 = 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __45__HDCloudSyncCachedZone_needsFetchWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v17;
  void *v18;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "zoneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v17, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ownerName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HDCachedCKRecordZoneEntity requiresFetchForZoneWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:](HDCachedCKRecordZoneEntity, "requiresFetchForZoneWithContainerIdentifier:databaseScope:zoneName:ownerName:transaction:error:", v6, v7, v10, v13, v5, a3);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
  return 1;
}

- (id)zoneShareWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "containerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v21, "scope");
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C949F0];
  -[HDCloudSyncCachedZone repository](self, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyRepositoryProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  +[HDCachedCKRecordEntity recordDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedCKRecordEntity, "recordDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v18, v17, v4, v7, v8, v11, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12 || !v13)
  {
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C95110], "hd_shareWithSystemData:error:", v12, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
    _HKLogDroppedError();
    goto LABEL_8;
  }
  v14 = 0;
  *a3 = objc_retainAutorelease(v13);
LABEL_9:

  return v14;
}

- (id)recordsForClass:(Class)a3 error:(id *)a4
{
  return -[HDCloudSyncCachedZone recordsForClass:error:filter:](self, "recordsForClass:error:filter:", a3, a4, &__block_literal_global_207);
}

uint64_t __47__HDCloudSyncCachedZone_recordsForClass_error___block_invoke()
{
  return 1;
}

- (BOOL)recordsForClass:(Class)a3 epoch:(int64_t)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v11;
  void *v12;
  void *v13;
  HDAssertion *accessibilityAssertion;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  BOOL v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD aBlock[5];
  id v34;
  Class v35;
  int64_t v36;

  v11 = a6;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncCachedZone.m"), 312, CFSTR("recordsForClass must be called with the subclass of HDCloudSyncRecord"));

  }
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v12, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke;
  aBlock[3] = &unk_1E6D0B250;
  aBlock[4] = self;
  v35 = a3;
  v36 = a4;
  v17 = v11;
  v34 = v17;
  v18 = _Block_copy(aBlock);
  -[HDCloudSyncCachedZone repository](self, "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v30[0] = v16;
  v30[1] = 3221225472;
  v30[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_213;
  v30[3] = &unk_1E6CF1650;
  v31 = v18;
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2_214;
  v28[3] = &unk_1E6CEEAB8;
  v22 = v31;
  v29 = v22;
  LOBYTE(v16) = objc_msgSend(v21, "performTransactionWithContext:error:block:inaccessibilityHandler:", v15, &v32, v30, v28);
  v23 = v32;

  if ((v16 & 1) != 0)
  {
    v24 = 1;
  }
  else
  {
    v25 = v23;
    v24 = v25 == 0;
    if (v25)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v25);
      else
        _HKLogDroppedError();
    }

  }
  return v24;
}

BOOL __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _BOOL8 v15;
  __int128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "zoneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "zoneName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2;
  v26[3] = &unk_1E6D0B228;
  v26[4] = *(_QWORD *)(a1 + 32);
  v27 = v5;
  v17 = *(_OWORD *)(a1 + 40);
  v13 = (id)v17;
  v28 = v17;
  v14 = v5;
  v15 = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:](HDCachedCKRecordEntity, "enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:", v20, v19, v18, v7, v8, 0, v9, v12, a3, v26);

  return v15;
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, _QWORD *a6)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = *(void **)(a1 + 56);
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v29 = 0;
  -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  v16 = v15;
  if (v14)
    v17 = 1;
  else
    v17 = v15 == 0;
  if (v17)
  {
    if (v14)
    {
      v18 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
          v25 = "protected";
        else
          v25 = "unprotected";
        v26 = v19;
        objc_msgSend(v10, "recordName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v24;
        v32 = 2080;
        v33 = v25;
        v34 = 2114;
        v35 = v27;
        v36 = 2114;
        v37 = v28;
        _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);

      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_error:format:", 118, CFSTR("No cloud sync record found during protected transaction for record name: %@"), v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v22 == 0;
      if (v22)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v22);
        else
          _HKLogDroppedError();
      }

    }
  }
  else if (a6)
  {
    v18 = 0;
    *a6 = objc_retainAutorelease(v15);
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }

  return v18;
}

- (id)_recordForEntity:(void *)a3 class:(void *)a4 unprotectedData:(void *)a5 transaction:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  void *v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (a1)
  {
    objc_msgSend(v13, "protectedDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      +[HDCachedSecureCKRecordEntity protectedRecordDataForUnprotectedEntity:transaction:error:](HDCachedSecureCKRecordEntity, "protectedRecordDataForUnprotectedEntity:transaction:error:", v11, v14, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HDCloudSyncCachedZone _serializedRecordForUnprotectedDBData:protectedDBData:error:]((uint64_t)a1, v12, v15, (uint64_t)a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (objc_msgSend(a3, "isEqual:", objc_opt_class()))
      {
        v46 = v12;
        v47 = v11;
        +[HDCloudSyncRecord initWithSerializedRecord:error:](HDCloudSyncStoreRecord, "initWithSerializedRecord:error:", v16, a6);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "zoneIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "type");

        switch(v19)
        {
          case 0:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for Master zone.");
            goto LABEL_18;
          case 1:
            objc_msgSend(a1, "zoneIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "zoneIdentifier");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            +[HDCloudSyncSequenceRecord recordIDsWithIndividualZoneID:](HDCloudSyncSequenceRecord, "recordIDsWithIndividualZoneID:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          case 2:
            objc_msgSend(v17, "ownerIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "storeIdentifier");
            v25 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "zoneIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "zoneIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDCloudSyncSequenceRecord recordIDsForOwnerIdentifier:storeIdentifier:zoneID:](HDCloudSyncSequenceRecord, "recordIDsForOwnerIdentifier:storeIdentifier:zoneID:", v24, v25, v27);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_24;
          case 3:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for Shared Summary zone.");
            goto LABEL_18;
          case 4:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for Private Metadata zone.");
            goto LABEL_18;
          case 5:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for Attachment zone.");
            goto LABEL_18;
          case 6:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for State Sync zone.");
            goto LABEL_18;
          case 7:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for Context sync zone.");
            goto LABEL_18;
          default:
            v20 = (void *)MEMORY[0x1E0CB35C8];
            v21 = objc_opt_class();
            v22 = CFSTR("Attempt to fetch sequence records for unknown zone type.");
LABEL_18:
            objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v21, sel__sequenceRecordIDsForStoreRecord_error_, v22);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v28;
            if (v28)
            {
              if (a6)
              {
                v25 = objc_retainAutorelease(v28);
                v26 = 0;
                *a6 = v25;
              }
              else
              {
                _HKLogDroppedError();
                v26 = 0;
              }
              v24 = v25;
            }
            else
            {
              v24 = 0;
              v26 = 0;
            }
LABEL_24:

            if (v26)
            {
              v43 = v14;
              v45 = v15;
              v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(a1, "repository");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "profile");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "database");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __64__HDCloudSyncCachedZone__addSequenceRecordsToStoreRecord_error___block_invoke;
              v52[3] = &unk_1E6CEB3F8;
              v42 = v26;
              v53 = v42;
              v54 = a1;
              v33 = v29;
              v55 = v33;
              v34 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDCachedCKRecordEntity, "performReadTransactionWithHealthDatabase:error:block:", v32, a6, v52);

              if (v34)
              {
                v50 = 0u;
                v51 = 0u;
                v48 = 0u;
                v49 = 0u;
                v35 = v33;
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                v12 = v46;
                v14 = v43;
                if (v36)
                {
                  v37 = v36;
                  v38 = *(_QWORD *)v49;
                  do
                  {
                    for (i = 0; i != v37; ++i)
                    {
                      if (*(_QWORD *)v49 != v38)
                        objc_enumerationMutation(v35);
                      objc_msgSend(v17, "addSequenceHeaderRecord:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
                    }
                    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
                  }
                  while (v37);
                }

                v40 = v17;
              }
              else
              {
                v40 = 0;
                v12 = v46;
                v14 = v43;
              }

              v15 = v45;
            }
            else
            {

              v40 = 0;
              v12 = v46;
            }
            v23 = v40;

            v11 = v47;
            break;
        }
      }
      else
      {
        objc_msgSend(a3, "initWithSerializedRecord:error:", v16, a6);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__HDCloudSyncCachedZone_recordsForClass_epoch_error_enumerationHandler___block_invoke_2_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)recordsForClass:(Class)a3 error:(id *)a4 filter:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  HDAssertion *accessibilityAssertion;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  Class v36;

  v9 = a5;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncCachedZone.m"), 372, CFSTR("recordsForClass must be called with the subclass of HDCloudSyncRecord"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v11, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke;
  aBlock[3] = &unk_1E6D0B2A0;
  aBlock[4] = self;
  v36 = a3;
  v16 = v9;
  v35 = v16;
  v17 = v10;
  v34 = v17;
  v18 = _Block_copy(aBlock);
  -[HDCloudSyncCachedZone repository](self, "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v30[0] = v15;
  v30[1] = 3221225472;
  v30[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_218;
  v30[3] = &unk_1E6CF1650;
  v31 = v18;
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2_219;
  v28[3] = &unk_1E6CEEAB8;
  v22 = v31;
  v29 = v22;
  LOBYTE(v15) = objc_msgSend(v21, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, &v32, v30, v28);
  v23 = v32;

  if ((v15 & 1) != 0)
  {
    v24 = v17;
  }
  else
  {
    v25 = v23;
    if (v25)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v25);
      else
        _HKLogDroppedError();
    }

    v24 = 0;
  }

  return v24;
}

BOOL __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _BOOL8 v15;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "containerIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v23, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "zoneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2;
  v25[3] = &unk_1E6D0B278;
  v25[4] = *(_QWORD *)(a1 + 32);
  v26 = v5;
  v17 = *(_OWORD *)(a1 + 48);
  v13 = (id)v17;
  v28 = v17;
  v27 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:](HDCachedCKRecordEntity, "enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:", v19, v18, v6, v8, v9, 0, 0, v12, a3, v25);

  return v15;
}

BOOL __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, _QWORD *a6)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = *(void **)(a1 + 64);
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v29 = 0;
  -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v29);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v29;
  v16 = v15;
  if (v14)
    v17 = 1;
  else
    v17 = v15 == 0;
  if (v17)
  {
    if (v14)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      v18 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
          v25 = "protected";
        else
          v25 = "unprotected";
        v26 = v19;
        objc_msgSend(v10, "recordName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v24;
        v32 = 2080;
        v33 = v25;
        v34 = 2114;
        v35 = v27;
        v36 = 2114;
        v37 = v28;
        _os_log_fault_impl(&dword_1B7802000, v26, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);

      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_error:format:", 118, CFSTR("No cloud sync record found during protected transaction for record name: %@"), v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v22 == 0;
      if (v22)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v22);
        else
          _HKLogDroppedError();
      }

    }
  }
  else if (a6)
  {
    v18 = 0;
    *a6 = objc_retainAutorelease(v15);
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }

  return v18;
}

uint64_t __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__HDCloudSyncCachedZone_recordsForClass_error_filter___block_invoke_2_219(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)recordForRecordID:(id)a3 class:(Class)a4 error:(id *)a5
{
  id v9;
  void *v10;
  HDAssertion *accessibilityAssertion;
  HDAssertion *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD aBlock[5];
  id v33;
  uint64_t *v34;
  Class v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v9 = a3;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncCachedZone.m"), 438, CFSTR("recordForRecordID must be called with the subclass of HDCloudSyncRecord"));

  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__169;
  v40 = __Block_byref_object_dispose__169;
  v41 = 0;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  v12 = accessibilityAssertion;
  objc_msgSend(v10, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke;
  aBlock[3] = &unk_1E6D0B2F0;
  aBlock[4] = self;
  v35 = a4;
  v15 = v9;
  v33 = v15;
  v34 = &v36;
  v16 = _Block_copy(aBlock);
  -[HDCloudSyncCachedZone repository](self, "repository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v29[0] = v14;
  v29[1] = 3221225472;
  v29[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_226;
  v29[3] = &unk_1E6CF1650;
  v30 = v16;
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2_227;
  v27[3] = &unk_1E6CEEAB8;
  v20 = v30;
  v28 = v20;
  LOBYTE(v14) = objc_msgSend(v19, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, &v31, v29, v27);
  v21 = v31;

  if ((v14 & 1) != 0)
  {
    v22 = (id)v37[5];
  }
  else
  {
    v23 = v21;
    v24 = v23;
    if (v23)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v23);
      else
        _HKLogDroppedError();
    }

    v22 = 0;
  }

  _Block_object_dispose(&v36, 8);
  return v22;
}

BOOL __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "containerIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v23, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "zoneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "zoneName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2;
  v25[3] = &unk_1E6D0B2C8;
  v13 = *(_QWORD *)(a1 + 32);
  v27 = *(_OWORD *)(a1 + 48);
  v25[4] = v13;
  v26 = v5;
  v14 = v5;
  v19 = +[HDCachedCKRecordEntity enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:](HDCachedCKRecordEntity, "enumerateRecordIDAndDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordType:recordName:epoch:profile:error:enumerationHandler:", v18, v17, v16, v7, v8, v9, 0, v12, a3, v25);

  return v19;
}

BOOL __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, _QWORD *a6)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = *(void **)(a1 + 56);
  v12 = *(void **)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v31 = 0;
  -[HDCloudSyncCachedZone _recordForEntity:class:unprotectedData:transaction:error:](v12, a2, v11, a4, v13, &v31);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v31;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v18)
    v19 = 1;
  else
    v19 = v15 == 0;
  if (v19)
  {
    if (v18)
    {
      v20 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v26 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
          v27 = "protected";
        else
          v27 = "unprotected";
        v28 = v21;
        objc_msgSend(v10, "recordName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v26;
        v34 = 2080;
        v35 = v27;
        v36 = 2114;
        v37 = v29;
        v38 = 2114;
        v39 = v30;
        _os_log_fault_impl(&dword_1B7802000, v28, OS_LOG_TYPE_FAULT, "%{public}@ No cloud sync record found during %s transaction for record name: %{public}@, zone: %{public}@", buf, 0x2Au);

      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v10, "recordName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_error:format:", 118, CFSTR("No cloud sync record found during transaction for record name: %@"), v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v24 == 0;
      if (v24)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }

    }
  }
  else if (a6)
  {
    v20 = 0;
    *a6 = objc_retainAutorelease(v15);
  }
  else
  {
    _HKLogDroppedError();
    v20 = 0;
  }

  return v20;
}

uint64_t __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_226(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__HDCloudSyncCachedZone_recordForRecordID_class_error___block_invoke_2_227(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)cloudSyncRecordForCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  id v34;

  v6 = a3;
  v7 = HDCloudSyncRecordClassForRecord(v6, a4);
  if (v7)
  {
    if (self)
    {
      v34 = 0;
      objc_msgSend(v7, "recordWithCKRecord:error:", v6, &v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      v10 = v9;
      if (v8)
      {

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_22;
        v11 = v8;
        -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "type"))
        {
          -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "type");

          if (v14 != 3)
          {
            -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "type") == 1)
            {
              objc_msgSend(v11, "storeIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[HDCloudSyncZoneIdentifier zoneIdentifier](self->_zoneIdentifier, "zoneIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "hd_storeIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v16, "isEqual:", v18);

              if ((v19 & 1) == 0)
              {
                v20 = (void *)MEMORY[0x1E0CB35C8];
                zoneIdentifier = self->_zoneIdentifier;
                objc_msgSend(v11, "storeIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Store record for zone %@ has unexpected store identifier %@"), self, zoneIdentifier, v22);
LABEL_16:

LABEL_35:
                goto LABEL_36;
              }
            }
            else
            {

            }
LABEL_22:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_26;
            v11 = v8;
            -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "type"))
            {
              -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "type");

              if (v28 != 3)
              {

LABEL_26:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v11 = v8;
                  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v29, "type"))
                  {
                    -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = objc_msgSend(v30, "type");

                    if (v31 != 3)
                    {

                      goto LABEL_30;
                    }
                  }
                  else
                  {

                  }
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected change record %@ in master zone."), self, v11);
                  goto LABEL_35;
                }
LABEL_30:
                v11 = v8;
                v23 = v11;
LABEL_37:

                goto LABEL_38;
              }
            }
            else
            {

            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected sequence record %@ in master zone."), self, v11);
            goto LABEL_35;
          }
        }
        else
        {

        }
        v25 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v11, "storeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hk_assignError:code:format:", a4, 719, CFSTR("%@: Unexpected store record %@ in master zone."), self, v22, v33);
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 709, CFSTR("Record initialization failed."), v9);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }

    }
    v11 = 0;
LABEL_36:
    v23 = 0;
    goto LABEL_37;
  }
  v23 = 0;
LABEL_38:

  return v23;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id *v48;
  char v49;
  id *v50;
  _QWORD v51[5];
  id v52;
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  HDCloudSyncCachedZone *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "hd_isCKShare"))
  {
    v48 = a4;
    if (self)
    {
      v7 = v6;
      -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "containerIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v43, "scope");
      -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "zoneIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "zoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "zoneIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ownerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hd_systemData");
      v46 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncCachedZone repository](self, "repository");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "legacyRepositoryProfile");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:](HDCachedCKRecordEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:", v38, v37, v8, v9, v10, v11, v13, v16, v48);

      v6 = v46;
      goto LABEL_20;
    }
LABEL_9:
    v49 = 0;
    goto LABEL_20;
  }
  v17 = HDCloudSyncRecordClassForRecord(v6, a4);
  if (!v17)
    goto LABEL_9;
  if (objc_msgSend(v17, "hasFutureSchema:", v6))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v60 = self;
      v61 = 2114;
      v62 = v6;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Record: %{public}@ is from the future", buf, 0x16u);
    }
    v49 = 1;
  }
  else
  {
    -[HDCloudSyncCachedZone cloudSyncRecordForCKRecord:error:](self, "cloudSyncRecordForCKRecord:error:", v6, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "serialize");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!self)
        goto LABEL_15;
      v23 = (objc_class *)MEMORY[0x1E0CB36F8];
      v24 = v21;
      v25 = (void *)objc_msgSend([v23 alloc], "initRequiringSecureCoding:", 1);
      objc_msgSend(v24, "systemData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "encodeObject:forKey:", v26, CFSTR("CloudSyncCacheSystemFieldsKey"));

      objc_msgSend(v24, "unprotectedDBData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "encodeObject:forKey:", v27, CFSTR("CloudSyncCacheUnprotectedDataKey"));
      objc_msgSend(v25, "finishEncoding");
      objc_msgSend(v25, "encodedData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "contextWithAccessibilityAssertion:", self->_accessibilityAssertion);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        -[HDCloudSyncCachedZone repository](self, "repository");
        v50 = a4;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "profile");
        v47 = v22;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "database");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = MEMORY[0x1E0C809B0];
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __41__HDCloudSyncCachedZone_addRecord_error___block_invoke;
        v55[3] = &unk_1E6CF26F8;
        v55[4] = self;
        v56 = v28;
        v57 = v20;
        v58 = v24;
        v51[0] = v33;
        v51[1] = 3221225472;
        v51[2] = __41__HDCloudSyncCachedZone_addRecord_error___block_invoke_2;
        v51[3] = &unk_1E6CF2720;
        v51[4] = self;
        v34 = v56;
        v52 = v34;
        v53 = v57;
        v54 = v58;
        v49 = objc_msgSend(v32, "performTransactionWithContext:error:block:inaccessibilityHandler:", v45, v50, v55, v51);

        v22 = v47;
      }
      else
      {
LABEL_15:
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v60 = self;
          v61 = 2114;
          v62 = v20;
          _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Unable to cache cloud sync record '%{public}@' because no serialized data was generated.", buf, 0x16u);
        }
        v34 = 0;
        v49 = 0;
      }

    }
    else
    {
      v49 = 0;
    }

  }
LABEL_20:

  return v49;
}

uint64_t __41__HDCloudSyncCachedZone_addRecord_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v38, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "zoneIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "zoneName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "zoneIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ownerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "record");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyRepositoryProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a3;
  LODWORD(v27) = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:](HDCachedCKRecordEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:", v28, v27, v25, v5, v24, v6, v8, v11, a3);

  if (!(_DWORD)v27)
    return 0;
  objc_msgSend(*(id *)(a1 + 56), "protectedDBData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "containerIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v39, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "zoneIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "zoneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ownerName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "protectedDBData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyRepositoryProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = +[HDCachedSecureCKRecordEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordName:profile:error:](HDCachedSecureCKRecordEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordName:profile:error:", v31, v29, v13, v15, v16, v18, v21, v23);

  return v29;
}

uint64_t __41__HDCloudSyncCachedZone_addRecord_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v38, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "zoneIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "zoneName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "zoneIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ownerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "record");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "legacyRepositoryProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a3;
  LODWORD(v27) = +[HDCachedCKRecordEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:](HDCachedCKRecordEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordType:recordName:profile:error:", v28, v27, v25, v5, v24, v6, v8, v11, a3);

  if (!(_DWORD)v27)
    return 0;
  objc_msgSend(*(id *)(a1 + 56), "protectedDBData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "containerIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v39, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "zoneIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "zoneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ownerName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "protectedDBData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyRepositoryProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = +[HDCachedSecureCKRecordEntity insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordName:profile:error:](HDCachedSecureCKRecordEntity, "insertOrUpdateWithContainerIdentifier:databaseScope:zoneName:ownerName:recordData:recordName:profile:error:", v31, v29, v13, v15, v16, v18, v21, v23);

  return v29;
}

- (int64_t)containsRecordsWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v17;
  void *v18;
  void *v19;

  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "scope");
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone repository](self, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "legacyRepositoryProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[HDCachedCKRecordEntity containsRecordsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:](HDCachedCKRecordEntity, "containsRecordsWithContainerIdentifier:databaseScope:zoneName:ownerName:profile:error:", v4, v5, v7, v10, v13, a3);

  return v14;
}

- (int64_t)containsRecordWithRecordID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "containerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v21, "scope");
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCachedZone zoneIdentifier](self, "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCachedZone repository](self, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "legacyRepositoryProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[HDCachedCKRecordEntity containsRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedCKRecordEntity, "containsRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v17, v18, v7, v10, v11, v14, a4);

  return v15;
}

- (BOOL)deleteRecordID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HDAssertion *accessibilityAssertion;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self)
    accessibilityAssertion = self->_accessibilityAssertion;
  else
    accessibilityAssertion = 0;
  objc_msgSend(v7, "contextWithAccessibilityAssertion:", accessibilityAssertion);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCachedZone repository](self, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke;
  v20[3] = &unk_1E6CE7950;
  v20[4] = self;
  v21 = v6;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke_2;
  v18[3] = &unk_1E6CECEC8;
  v18[4] = self;
  v19 = v21;
  v15 = v21;
  v16 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, a4, v20, v18);

  return v16;
}

BOOL __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "containerIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v33, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "zoneIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a3;
  v28 = +[HDCachedSecureCKRecordEntity deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedSecureCKRecordEntity, "deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v26, v25, v5, v8, v9, v12, a3);

  if (!v28)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "containerIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v34, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "zoneIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyRepositoryProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[HDCachedCKRecordEntity deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedCKRecordEntity, "deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v27, v29, v14, v17, v18, v21, v24);

  return v22;
}

BOOL __46__HDCloudSyncCachedZone_deleteRecordID_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "containerIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v33, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "zoneIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ownerName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a3;
  v28 = +[HDCachedSecureCKRecordEntity deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedSecureCKRecordEntity, "deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v26, v25, v5, v8, v9, v12, a3);

  if (!v28)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "containerIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v34, "scope");
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "zoneIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "profile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyRepositoryProfile");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[HDCachedCKRecordEntity deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedCKRecordEntity, "deleteRecordWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v27, v29, v14, v17, v18, v21, v24);

  return v22;
}

- (HDCloudSyncSerializedRecord)_serializedRecordForUnprotectedDBData:(void *)a3 protectedDBData:(uint64_t)a4 error:
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HDCloudSyncSerializedRecord *v13;

  v7 = a3;
  if (a1)
  {
    v8 = (objc_class *)MEMORY[0x1E0CB3710];
    v9 = a2;
    v10 = (void *)objc_msgSend([v8 alloc], "initForReadingFromData:error:", v9, a4);

    if (v10)
    {
      objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CloudSyncCacheSystemFieldsKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CloudSyncCacheUnprotectedDataKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishDecoding");
      v13 = -[HDCloudSyncSerializedRecord initWithEncodedSystemData:unprotectedDBData:protectedDBData:]([HDCloudSyncSerializedRecord alloc], "initWithEncodedSystemData:unprotectedDBData:protectedDBData:", v11, v12, v7);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __64__HDCloudSyncCachedZone__addSequenceRecordsToStoreRecord_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v4 = a1;
  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v27)
  {
    v25 = *(_QWORD *)v37;
    v26 = a3;
    v24 = v4;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(*(id *)(v4 + 40), "zoneIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "containerIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 40), "zoneIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v33, "scope");
        objc_msgSend(*(id *)(v4 + 40), "zoneIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "zoneIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "zoneName");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 40), "zoneIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "zoneIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ownerName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 40), "repository");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "legacyRepositoryProfile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v14 = (void *)v7;
        +[HDCachedCKRecordEntity recordDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:](HDCachedCKRecordEntity, "recordDataWithContainerIdentifier:databaseScope:zoneName:ownerName:recordName:profile:error:", v29, v28, v7, v9, v10, v13, &v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v35;

        if (!v15 && v16)
        {
          if (v26)
            *v26 = objc_retainAutorelease(v16);
          else
            _HKLogDroppedError();
          goto LABEL_21;
        }
        v4 = v24;
        if (v15)
        {
          -[HDCloudSyncCachedZone _serializedRecordForUnprotectedDBData:protectedDBData:error:](*(_QWORD *)(v24 + 40), v15, 0, (uint64_t)v26);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_19;
          v18 = (void *)v17;
          +[HDCloudSyncRecord initWithSerializedRecord:error:](HDCloudSyncSequenceRecord, "initWithSerializedRecord:error:", v17, v26);
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19)
          {

LABEL_19:
LABEL_21:

            v21 = 0;
            goto LABEL_22;
          }
          v20 = (void *)v19;
          objc_msgSend(*(id *)(v24 + 48), "addObject:", v19);

        }
      }
      v21 = 1;
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v21 = 1;
  }
LABEL_22:

  return v21;
}

uint64_t __46__HDCloudSyncCachedZone__deleteZoneWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteRecordID:error:", a2, a3);
}

uint64_t __61__HDCloudSyncCachedZone__enumerateRecordsAndDeleteWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteRecordID:error:", a2, a3);
}

- (HDCloudSyncRepository)repository
{
  return (HDCloudSyncRepository *)objc_loadWeakRetained((id *)&self->_repository);
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (int64_t)zoneType
{
  return self->_zoneType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_destroyWeak((id *)&self->_repository);
}

@end
