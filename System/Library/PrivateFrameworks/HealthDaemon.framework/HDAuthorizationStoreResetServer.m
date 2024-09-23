@implementation HDAuthorizationStoreResetServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  char v9;

  v5 = a3;
  v6 = *MEMORY[0x1E0CB4800];
  if (objc_msgSend(v5, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB4800], a4))
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  v9 = v8 | objc_msgSend(v5, "hasRequiredArrayEntitlement:containing:error:", v6, *MEMORY[0x1E0CB4DC0], a4);

  return v9 & 1;
}

- (void)remote_resetObjectAuthorizationStatusForBundleIdentifier:(id)a3 objectType:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _BOOL8, id);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _BOOL8, id))a5;
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "localSourceForBundleIdentifier:error:", v7, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v11)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v14 = +[HDObjectAuthorizationEntity resetObjectAuthorizationRecordsForSource:profile:error:](HDObjectAuthorizationEntity, "resetObjectAuthorizationRecordsForSource:profile:error:", v11, v13, &v17);
    v15 = v17;

    v8[2](v8, v14, v15);
    v12 = v15;
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Failed to look up source for bundle identifier '%@' when reseting object authorization: %{public}@", buf, 0x16u);
    }
    v8[2](v8, 0, v12);
  }

}

- (void)remote_resetAuthorizationStatusesForObjects:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, id);
  void *v8;
  void *v9;
  id v10;
  id v11;
  _BOOL8 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  HDAuthorizationStoreResetServer *v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke;
  v14[3] = &unk_1E6CEB3F8;
  v15 = v6;
  v16 = v8;
  v17 = self;
  v10 = v8;
  v11 = v6;
  v12 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDObjectAuthorizationEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, &v18, v14);
  v13 = v18;

  v7[2](v7, v12, v13);
}

BOOL __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "hk_map:", &__block_literal_global_24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HDObjectAuthorizationEntity resetAuthorizationForObjects:profile:error:](HDObjectAuthorizationEntity, "resetAuthorizationForObjects:profile:error:", v5, a1[5], a3))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(a1[5], "sourceManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = a1[4];
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v25 = *(_QWORD *)v28;
      v23 = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v10, "sourceRevision", v23);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "source");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "localSourceForBundleIdentifier:error:", v13, a3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14
            || (objc_msgSend(v14, "sourceUUIDWithProfile:error:", a1[5], a3),
                (v16 = objc_claimAutoreleasedReturnValue()) == 0))
          {

            v21 = 0;
            v5 = v23;
            v20 = obj;
            goto LABEL_14;
          }
          v17 = (void *)v16;
          v18 = objc_alloc_init(MEMORY[0x1E0CB6970]);
          objc_msgSend(v10, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObjectUUID:", v19);

          objc_msgSend(v18, "setSourceUUID:", v17);
          objc_msgSend(v18, "setModificationDate:", CFAbsoluteTimeGetCurrent());
          objc_msgSend(v18, "setStatus:", 0);
          objc_msgSend(v6, "addObject:", v18);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v5 = v23;
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(a1[6], "profile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v6, 0, objc_msgSend(v20, "currentSyncIdentityPersistentID"), a1[5], a3);
LABEL_14:

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __90__HDAuthorizationStoreResetServer_remote_resetAuthorizationStatusesForObjects_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (void)remote_resetAuthorizationStatusForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _BOOL8, id);
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _BOOL8, id))a4;
  if (v7)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = +[HDAuthorizationEntity resetAuthorizationStatusesForBundleIdentifier:profile:error:](HDAuthorizationEntity, "resetAuthorizationStatusesForBundleIdentifier:profile:error:", v7, v9, &v24);
    v11 = v24;

    if (v10)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sourceManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      objc_msgSend(v13, "localSourceForBundleIdentifier:error:", v7, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v23;

      if (v14)
      {
        -[HDStandardTaskServer profile](self, "profile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v15;
        v17 = +[HDObjectAuthorizationEntity resetObjectAuthorizationRecordsForSource:profile:error:](HDObjectAuthorizationEntity, "resetObjectAuthorizationRecordsForSource:profile:error:", v14, v16, &v22);
        v11 = v22;

        if (!v17)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB5280];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v26 = v7;
            v27 = 2114;
            v28 = v11;
            _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (object authorization records failure: %{public}@)", buf, 0x16u);
          }
        }
        v8[2](v8, v17, v11);
      }
      else
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5280];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = v7;
          v27 = 2114;
          v28 = v15;
          _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (local source failure: %{public}@)", buf, 0x16u);
        }
        v8[2](v8, 0, v15);
        v11 = v15;
      }

    }
    else
    {
      _HKInitializeLogging();
      v20 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v7;
        v27 = 2114;
        v28 = v11;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Failed to reset status for %{public}@ (authorization entity failure: %{public}@)", buf, 0x16u);
      }
      v8[2](v8, 0, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("bundleIdentifier may not be nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v19);

  }
}

- (void)remote_recalibrateEstimatesForSampleType:(id)a3 effectiveDate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "compare:", v10);

  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Effective date (%@) cannot be in the future."), v8);
LABEL_6:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "code") != 183)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Estimate recalibration is not supported for %@."), v7);
    goto LABEL_6;
  }
  v15 = 0;
  v12 = objc_msgSend(MEMORY[0x1E0CA56B0], "resetPredictedWalkDistanceOnDate:error:", v8, &v15);
  v13 = v15;
  v9[2](v9, v12, v13);

LABEL_7:
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6330], "resetTaskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
