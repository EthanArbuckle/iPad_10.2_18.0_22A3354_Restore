@implementation HDCloudSyncUpdateSharingStatusOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  __int128 v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  HDCloudSyncUpdateSharingStatusOperation *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "shouldSyncSummarySharingPull") & 1) != 0
    || (objc_msgSend(v5, "shouldSyncSummarySharingPush") & 1) != 0)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedCloudState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v7, "zonesByIdentifierWithError:", &v49);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v49;

    if (v8 || !v9)
    {
      objc_msgSend(v8, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        obj = v11;
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v38)
        {
          v37 = *(_QWORD *)v46;
          *(_QWORD *)&v13 = 138543874;
          v33 = v13;
          v35 = v9;
          v36 = v8;
          v34 = v12;
          do
          {
            v14 = 0;
            v15 = v37;
            v16 = v38;
            do
            {
              if (*(_QWORD *)v46 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
              v44 = 0;
              objc_msgSend(v17, "zoneShareWithError:", &v44, v33);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v44;
              v20 = v19;
              if (v18)
                v21 = 1;
              else
                v21 = v19 == 0;
              if (v21)
              {
                if (v18)
                {
                  v42 = 0u;
                  v43 = 0u;
                  v40 = 0u;
                  v41 = 0u;
                  objc_msgSend(v18, "participants");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
                  if (v23)
                  {
                    v24 = v23;
                    v25 = *(_QWORD *)v41;
                    while (2)
                    {
                      for (i = 0; i != v24; ++i)
                      {
                        if (*(_QWORD *)v41 != v25)
                          objc_enumerationMutation(v22);
                        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                        if (objc_msgSend(v27, "acceptanceStatus") == 2 || objc_msgSend(v27, "acceptanceStatus") == 1)
                        {
                          -[HDCloudSyncUpdateSharingStatusOperation _finishOperationWithParticipantSharingStatus:](self, 1);

                          v9 = v35;
                          v8 = v36;
                          v12 = v34;
                          goto LABEL_40;
                        }
                      }
                      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
                      v15 = v37;
                      if (v24)
                        continue;
                      break;
                    }
                  }

                  v16 = v38;
                }
              }
              else
              {
                _HKInitializeLogging();
                v28 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v30 = v28;
                  objc_msgSend(v17, "zoneIdentifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v33;
                  v52 = self;
                  v53 = 2114;
                  v54 = v31;
                  v55 = 2114;
                  v56 = v20;
                  _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);

                }
              }

              ++v14;
            }
            while (v14 != v16);
            v9 = v35;
            v8 = v36;
            v12 = v34;
            v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v38);
        }

      }
      -[HDCloudSyncUpdateSharingStatusOperation _finishOperationWithParticipantSharingStatus:](self, 2);
LABEL_40:

    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v52 = self;
        v53 = 2114;
        v54 = v9;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v9);
    }

  }
  else
  {
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v52 = self;
      _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping operation because platform/profile does not support summary sharing", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

- (void)_finishOperationWithParticipantSharingStatus:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HDTinkerProtectedKeyValueDomainWithProfile(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v7 = objc_msgSend(v5, "setNumber:forKey:error:", v6, CFSTR("HDCloudSyncSharingStatusKey"), &v9);
    v8 = v9;

    objc_msgSend(a1, "finishWithSuccess:error:", v7, v8);
  }
}

@end
