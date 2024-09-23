@implementation HDAuthorizationStoreReadServer

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
  v9 = v8 | objc_msgSend(v5, "hasRequiredArrayEntitlement:containing:error:", v6, *MEMORY[0x1E0CB4DB8], a4);

  return v9 & 1;
}

- (void)remote_fetchAuthorizationRecordsForSourceBundleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = (void (**)(id, void *, id))a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  +[HDAuthorizationEntity authorizationRecordsByTypeForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", v8, v9, v10, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  v7[2](v7, v11, v12);

}

- (void)remote_fetchAuthorizationRecordsForType:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  if (v7)
  {
    v8 = (void (**)(id, void *, id))a4;
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    +[HDAuthorizationEntity authorizationRecordsBySourceForType:profile:error:](HDAuthorizationEntity, "authorizationRecordsBySourceForType:profile:error:", v7, v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    v8[2](v8, v10, v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = a4;
    objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("type may not be nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a4 + 2))(v13, 0, v10);

  }
}

- (void)remote_fetchAuthorizationContextForPromptSession:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v9, "fetchAuthorizationContextForPromptSession:error:", v7, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  v6[2](v6, v10, v11);

}

- (void)remote_fetchSourcesRequestingAuthorizationForTypes:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDAuthorizationEntity allSourcesRequestingTypes:profile:error:](HDAuthorizationEntity, "allSourcesRequestingTypes:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_fetchAuthorizationStatusesForDocumentType:(id)a3 sourceBundleIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(id, _QWORD, id);
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  _BYTE v45[128];
  __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a5;
  if (v10)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v13, "localSourceForBundleIdentifier:error:", v10, &v44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v44;

    if (v14)
    {
      v43 = v15;
      +[HDObjectAuthorizationEntity authorizationStatusForSamplesOfType:sourceEntity:profile:error:](HDObjectAuthorizationEntity, "authorizationStatusForSamplesOfType:sourceEntity:profile:error:", v9, v14, v12, &v43);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v43;

      if (v16)
      {
        v33 = v14;
        v34 = v10;
        v31 = v11;
        v35 = v9;
        v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v46 = CFSTR("IncludeCDADocument");
        v47[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v32 = v16;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v40 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              if (objc_msgSend(v23, "status", v31))
              {
                objc_msgSend(v23, "objectUUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v17;
                v25 = v12;
                +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDCDASampleEntity, "objectWithUUID:encodingOptions:profile:error:", v24, v37, v12, &v38);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v38;

                if (!v26)
                {
                  v11 = v31;
                  v31[2](v31, 0, v27);

                  v17 = v27;
                  v12 = v25;
                  v29 = v36;
                  goto LABEL_19;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "status"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v28, v26);

                v17 = v27;
                v12 = v25;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
            if (v20)
              continue;
            break;
          }
        }

        v11 = v31;
        v29 = v36;
        ((void (**)(id, id, id))v31)[2](v31, v36, 0);
LABEL_19:

        v10 = v34;
        v9 = v35;
        v16 = v32;
        v14 = v33;
      }
      else
      {
        v11[2](v11, 0, v17);
      }

      v15 = v17;
    }
    else
    {
      v11[2](v11, 0, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("sourceBundleIdentifier may not be nil"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v30);

  }
}

- (void)remote_fetchAuthorizationStatusesForSampleUUID:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  void (**v30)(id, _QWORD, id);
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  if (v7)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    +[HDObjectAuthorizationEntity authorizationRecordsBySourceForSampleWithUUID:profile:error:](HDObjectAuthorizationEntity, "authorizationRecordsBySourceForSampleWithUUID:profile:error:", v7, v9, &v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v37;

    if (v10)
    {
      v28 = v11;
      v30 = v8;
      v31 = v7;
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[HDStandardTaskServer profile](self, "profile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sourceManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v29 = v10;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            v32 = 0;
            objc_msgSend(v14, "clientSourceForUUID:error:", v20, &v32, v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v32;
            if (v21)
            {
              v23 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v15, "objectForKeyedSubscript:", v20);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "status"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, v21);

            }
            else
            {
              _HKInitializeLogging();
              v26 = *MEMORY[0x1E0CB5280];
              v27 = *MEMORY[0x1E0CB5280];
              if (v22)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138543618;
                  v39 = v20;
                  v40 = 2114;
                  v41 = v22;
                  _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_INFO, "Failed to retrieve source for UUID %{public}@: %{public}@", buf, 0x16u);
                }
                v8 = v30;
                v30[2](v30, 0, v22);

                goto LABEL_21;
              }
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v39 = v20;
                _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "Found an authorization record for a source that does not exist (%{public}@); ignoring this record.",
                  buf,
                  0xCu);
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          if (v17)
            continue;
          break;
        }
      }

      v8 = v30;
      ((void (**)(id, id, id))v30)[2](v30, v12, 0);
LABEL_21:
      v7 = v31;
      v11 = v28;
      v10 = v29;

    }
    else
    {
      v8[2](v8, 0, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("sampleUUID may not be nil"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);
  }

}

- (void)remote_validateRecalibrateEstimatesRequestRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validateRecalibrateEstimatesRequestRecord:completion:", v7, v6);

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6330], "readTaskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
