@implementation HDProfileStoreServer

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HDHealthStoreProviderServer _profileManager](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeProfileManagerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDProfileStoreServer;
  -[HDProfileStoreServer dealloc](&v4, sel_dealloc);
}

- (void)remote_createProfileOfType:(int64_t)a3 displayName:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, id))a5;
  v9 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a3;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Creating new profile of type %ld", buf, 0xCu);
  }

  -[HDHealthStoreProviderServer _profileManager](self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v11, "createProfileOfType:displayName:error:", a3, v9, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v14;
  if (v8)
    v8[2](v8, v12, v13);

}

- (void)remote_deleteProfile:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v7);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Delete profile called on health store of the same profile."));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }
  else
  {
    -[HDHealthStoreProviderServer _profileManager](self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "profileForIdentifier:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "profileType") == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Cannot delete primary profile."));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v12);
    }
    else
    {
      -[HDHealthStoreProviderServer _profileManager](self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v16 = objc_msgSend(v15, "deleteProfile:error:", v7, &v17);
      v12 = v17;

      if (v8)
        v8[2](v8, v16, v12);
    }

  }
}

- (void)remote_getAllProfilesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v5 = a3;
    -[HDHealthStoreProviderServer _profileManager](self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allProfileIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))a3 + 2))(v5, v6, 0);

  }
}

- (void)remote_setDisplayFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(void *, uint64_t, id);
  void (**v12)(void *, uint64_t, id);
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(void *, uint64_t, id))a5;
  if (v11)
    v12 = v11;
  else
    v12 = (void (**)(void *, uint64_t, id))&__block_literal_global_122;
  if (v9)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v14 = objc_msgSend(v13, "setDisplayFirstName:lastName:error:", v9, v10, &v17);
    v15 = v17;

    v12[2](v12, v14, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Display name must not be nil."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v16);

  }
}

- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 completion:(id)a4
{
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (v7)
  {
    if (v11)
    {
      -[HDHealthStoreProviderServer _profileManager](self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "profileAssociatedWithNRDeviceUUID:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v10 = v9;
      else
        v10 = 0;
      v7[2](v7, v10, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("NRDevice must not be nil."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v9);
    }

  }
}

- (void)remote_profileIdentifierForNRDeviceUUID:(id)a3 ownerAppleID:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  dispatch_semaphore_t v26;
  void *v27;
  void *v28;
  id v29;
  dispatch_time_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  dispatch_semaphore_t dsema;
  void *v55;
  id v56;
  uint64_t v57;
  void (**v58)(id, uint64_t, _QWORD);
  id v59;
  id v60;
  id obj;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  dispatch_semaphore_t v70;
  _BYTE *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[4];
  HDProfileStoreServer *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint8_t v83[128];
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v59 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v58 = (void (**)(id, uint64_t, _QWORD))v9;
    if (v60)
    {
      -[HDHealthStoreProviderServer _profileManager](self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allProfileIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = v12;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
      if (v13)
      {
        v14 = 0;
        v15 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v74 != v15)
              objc_enumerationMutation(obj);
            v17 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
            -[HDHealthStoreProviderServer _profileManager](self);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "profileForIdentifier:", v17);
            v19 = (id)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              if (objc_msgSend(v19, "profileType") == 3)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDProfileStoreServer.m"), 174, CFSTR("Profile %@ is of type Tinker but is not an instance of type HDTinkerProfile (#t0)"), v19);

                }
                v19 = v19;
                v72 = 0;
                objc_msgSend(v19, "pairedNRDeviceUUIDWithError:", &v72);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v72;
                if (v20)
                {
                  if ((objc_msgSend(v20, "isEqual:", v60) & 1) != 0)
                  {
                    v58[2](v58, v17, 0);

                    goto LABEL_51;
                  }
                }
                else
                {
                  v23 = v14;
                  if (!v14)
                    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v14 = v23;
                  objc_msgSend(v23, "addObject:", v19);
                }

              }
            }
            else
            {
              _HKInitializeLogging();
              v22 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v17;
                _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Profile is nil for profileIdentifier: %{public}@", buf, 0x16u);
              }
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        }
        while (v13);

        if (v14)
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Found profiles with missing NRDevice UUID. Fetch share owner participant email address.", buf, 0xCu);
          }
          if (!v59)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Owner appleID is nil."));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, uint64_t, void *))v58)[2](v58, 0, v51);

            goto LABEL_51;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v85 = __Block_byref_object_copy__113;
          v86 = __Block_byref_object_dispose__113;
          v87 = 0;
          v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithEmailAddress:", v59);
          v26 = dispatch_semaphore_create(0);
          -[HDStandardTaskServer profile](self, "profile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "cloudSyncManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __88__HDProfileStoreServer_remote_profileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke;
          v68[3] = &unk_1E6CFB8B0;
          v68[4] = self;
          v69 = v59;
          v71 = buf;
          dsema = v26;
          v70 = dsema;
          v29 = (id)objc_msgSend(v28, "lookupParticipantWithIdentityLookUpInfo:completion:", v55, v68);

          v30 = dispatch_time(0, 15000000000);
          if (dispatch_semaphore_wait(dsema, v30))
          {
            _HKInitializeLogging();
            v31 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v77 = 138543362;
              v78 = self;
              _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting for owner participant from CloudKit.", v77, 0xCu);
            }
          }
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v32 = v14;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
          if (v33)
          {
            v56 = v32;
            v57 = *(_QWORD *)v65;
            while (2)
            {
              v34 = v33;
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v65 != v57)
                  objc_enumerationMutation(v56);
                v36 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                objc_msgSend(v36, "cloudSyncManager");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = 0;
                objc_msgSend(v37, "shareOwnerParticipantWithError:", &v63);
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = v63;

                if (v38)
                  v40 = 1;
                else
                  v40 = v39 == 0;
                if (v40)
                {
                  -[NSObject userIdentity](v38, "userIdentity");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "lookupInfo");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "emailAddress");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "userIdentity");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "lookupInfo");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "emailAddress");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v43 && objc_msgSend(v43, "isEqualToString:", v46))
                  {
                    v62 = 0;
                    objc_msgSend(v36, "setPairedNRDeviceUUID:error:", v60, &v62);
                    v52 = v62;
                    objc_msgSend(v36, "profileIdentifier");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v58[2](v58, (uint64_t)v53, 0);

                    v49 = 0;
                    goto LABEL_55;
                  }

                }
                else
                {
                  _HKInitializeLogging();
                  v38 = (id)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v36, "profileIdentifier");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v77 = 138543874;
                    v78 = self;
                    v79 = 2114;
                    v80 = v48;
                    v81 = 2114;
                    v82 = v39;
                    _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving share owner participant for tinker profile %{public}@, %{public}@", v77, 0x20u);

                  }
                }

              }
              v33 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
              if (v33)
                continue;
              break;
            }
            v49 = 1;
LABEL_55:
            v32 = v56;
          }
          else
          {
            v49 = 1;
          }
          v14 = v32;

          _Block_object_dispose(buf, 8);
          if ((v49 & 1) == 0)
            goto LABEL_51;
        }
      }
      else
      {

        v14 = 0;
      }
      v58[2](v58, 0, 0);
LABEL_51:

      v10 = v58;
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("NRDevice must not be nil."));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v58;
    ((void (**)(id, uint64_t, void *))v58)[2](v58, 0, v50);

  }
LABEL_52:

}

void __88__HDProfileStoreServer_remote_profileIdentifierForNRDeviceUUID_ownerAppleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138543874;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        v18 = 2114;
        v19 = v7;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Error retrieving share owner participant for owner ID %{public}@, %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)remote_fetchDisplayNameWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, id);
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = (void (**)(id, uint64_t, uint64_t, id))a3;
  if (v4)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__113;
    v24 = __Block_byref_object_dispose__113;
    v25 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__113;
    v18 = __Block_byref_object_dispose__113;
    v19 = 0;
    -[HDStandardTaskServer profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HDProfileStoreServer_remote_fetchDisplayNameWithCompletion___block_invoke;
    v12[3] = &unk_1E6CF6E48;
    v12[4] = self;
    v12[5] = &v20;
    v12[6] = &v14;
    v7 = objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v13, v12);
    v8 = v13;

    if (v7)
    {
      v9 = 0;
      v10 = v21[5];
      v11 = v15[5];
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v9 = v8;
    }
    v4[2](v4, v10, v11, v9);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }

}

uint64_t __62__HDProfileStoreServer_remote_fetchDisplayNameWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  v8 = *(_QWORD *)(v5 + 8);
  v11 = *(id *)(v8 + 40);
  obj = v7;
  v9 = objc_msgSend(v4, "fetchDisplayFirstName:lastName:error:", &obj, &v11, a2);
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v11);

  return v9;
}

- (void)remote_fetchDisplayImageData:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "fetchDisplayImageDataWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)remote_setDisplayImageData:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "setDisplayImageData:error:", v7, &v11);

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_startObservingWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[HDHealthStoreProviderServer _profileManager](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProfileManagerObserver:", self);

  v5[2]();
}

- (void)remote_fetchSharingInformationForProfileIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, void *, _QWORD))a4;
  -[HDHealthStoreProviderServer _profileManager](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v19 = 0;
    +[HDKeyValueEntity retrieveDatabaseIdentifierCreationDateFromProfile:error:](HDProtectedKeyValueEntity, "retrieveDatabaseIdentifierCreationDateFromProfile:error:", v10, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    objc_msgSend(v10, "cloudSyncManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v13, "shareOwnerParticipantWithError:", &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;

    objc_msgSend(v14, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v17 = v12;
    else
      v17 = v15;
    ((void (**)(id, void *, void *, id))v8)[2](v8, v11, v16, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No profile for identifier %@"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v8)[2](v8, 0, 0, v11);

  }
}

- (void)profileListDidChange
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HDProfileStoreServer_profileListDidChange__block_invoke;
  v3[3] = &unk_1E6CE8030;
  v3[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client_remoteDidUpdateProfileList");

}

void __44__HDProfileStoreServer_profileListDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5358], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: failed to notify client of profile changes due to: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A18], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
