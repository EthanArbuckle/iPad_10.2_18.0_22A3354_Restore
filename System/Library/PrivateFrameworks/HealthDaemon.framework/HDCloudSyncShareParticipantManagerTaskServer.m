@implementation HDCloudSyncShareParticipantManagerTaskServer

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6440], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "hasRequiredArrayEntitlement:containing:error:", *MEMORY[0x1E0CB59C0], *MEMORY[0x1E0CB4D98], a4);
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6440], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6440], "serverInterface");
}

- (void)remote_fetchSharingParticipantStatus:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  HDCloudSyncShareParticipantManagerTaskServer *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDTinkerProtectedKeyValueDomainWithProfile(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__124;
  v22 = __Block_byref_object_dispose__124;
  v23 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchSharingParticipantStatus___block_invoke;
  v14[3] = &unk_1E6CF1500;
  v16 = &v18;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "performHighPriorityTransactionsWithError:block:", &v17, v14);
  v10 = v17;

  v11 = (void *)v19[5];
  if (v11)
  {
    v12 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v10;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch participant share status. Error: %{public}@", buf, 0x16u);
    }
    v12 = 0;
  }
  v4[2](v4, v12);

  _Block_object_dispose(&v18, 8);
}

uint64_t __85__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchSharingParticipantStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "numberForKey:error:", CFSTR("HDCloudSyncSharingStatusKey"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (void)remote_fetchAllShareParticipantEmailAddressesForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  HDCloudSyncShareParticipantManagerTaskServer *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudSyncManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __119__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke;
  v15[3] = &unk_1E6CF28F8;
  v15[4] = self;
  v16 = v7;
  v13 = v7;
  v14 = (id)objc_msgSend(v12, "fetchShareParticipantsForSharingType:completion:", a3, v15);

}

void __119__HDCloudSyncShareParticipantManagerTaskServer_remote_fetchAllShareParticipantEmailAddressesForSharingType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 || !v5)
  {
    v32 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v11)
    {
      v12 = v11;
      v10 = 0;
      v13 = *(_QWORD *)v35;
      v14 = 0x1E0C99000uLL;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v4);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v16, "role") != 1)
          {
            if (!v10)
              v10 = objc_alloc_init(*(Class *)(v14 + 3616));
            objc_msgSend(v16, "userIdentity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lookupInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "emailAddress");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v16, "userIdentity");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "lookupInfo");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "emailAddress");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v22);

            }
            else
            {
              _HKInitializeLogging();
              v23 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
              {
                v24 = *(_QWORD *)(a1 + 32);
                v25 = v23;
                objc_msgSend(v16, "userIdentity");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "lookupInfo");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v39 = v24;
                v14 = 0x1E0C99000;
                v40 = 2114;
                v41 = v16;
                v42 = 2114;
                v43 = v27;
                _os_log_fault_impl(&dword_1B7802000, v25, OS_LOG_TYPE_FAULT, "%{public}@ Received nil email address for fetched share participant %{public}@ with lookup info %{public}@", buf, 0x20u);

              }
            }
          }
        }
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v12);
    }
    else
    {
      v10 = 0;
    }
    v28 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "allObjects");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v29, 0);

    v6 = v32;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v31 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v39 = v31;
      v40 = 2114;
      v41 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch participants from cloud zones, error: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      v10 = (id)v8;
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v9 + 16))(*(_QWORD *)(a1 + 40), 0, v8);
    }
    else
    {
      objc_msgSend(v6, "hk_sanitizedError");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v30);

      v10 = 0;
    }
  }

}

- (void)remote_revokeAccessForAllShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  HDCloudSyncShareParticipantManagerTaskServer *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, void *))a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5370];
  v9 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v20, 0x16u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "profileType");

  if (v13 == 1)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudSyncManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "removeAllParticipantsForSharingType:completion:", a3, v7);

  }
  else
  {
    _HKInitializeLogging();
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Called on non-primary profile. Abort.", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, CFSTR("Revoke access for all share participants called on non-primary profile."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
  }

}

- (void)remote_tearDownHealthSharingForProfile:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  uint64_t v21;
  os_log_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  HDCloudSyncShareParticipantManagerTaskServer *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = self;
    v36 = 2114;
    v37 = v12;
    v38 = 2114;
    v39 = v7;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ called for profile %{public}@", buf, 0x20u);

  }
  -[HDStandardTaskServer profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "profileType");

  if (v14 == 1)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "profileManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "profileForIdentifier:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "profileType") != 1)
      {
        objc_msgSend(v19, "cloudSyncManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __98__HDCloudSyncShareParticipantManagerTaskServer_remote_tearDownHealthSharingForProfile_completion___block_invoke;
        v30[3] = &unk_1E6CE7868;
        v31 = v17;
        v32 = v7;
        v33 = v8;
        v25 = (id)objc_msgSend(v24, "leaveSharesWithCompletion:", v30);

        v23 = v31;
        goto LABEL_15;
      }
      _HKInitializeLogging();
      v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        v28 = v20;
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = self;
        v36 = 2114;
        v37 = v29;
        _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Called for primary profile. Abort.", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, CFSTR("Tear down health sharing called for primary profile."));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No profile for identifier %@."), v7);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v21;
    (*((void (**)(id, _QWORD, uint64_t))v8 + 2))(v8, 0, v21);
LABEL_15:

    goto LABEL_16;
  }
  _HKInitializeLogging();
  v22 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    v26 = v22;
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = self;
    v36 = 2114;
    v37 = v27;
    _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ Must be called on primary profile participant manager. Abort.", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, CFSTR("Tear down health sharing not called on primary profile participant manager."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v17);
LABEL_16:

}

void __98__HDCloudSyncShareParticipantManagerTaskServer_remote_tearDownHealthSharingForProfile_completion___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (void *)a1[4];
    v8 = a1[5];
    v13 = 0;
    objc_msgSend(v7, "deleteProfile:error:", v8, &v13);
    v9 = v13;
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[6];
    if (v10)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
    }
    else
    {
      objc_msgSend(v6, "hk_sanitizedError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

@end
