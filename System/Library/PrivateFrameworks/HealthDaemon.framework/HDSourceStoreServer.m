@implementation HDSourceStoreServer

- (void)remote_fetchAllSourcesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, _QWORD, id))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__50;
  v14 = __Block_byref_object_dispose__50;
  v15 = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HDSourceStoreServer_remote_fetchAllSourcesWithCompletion___block_invoke;
  v8[3] = &unk_1E6CF1500;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v6, "performHighPriorityTransactionsWithError:block:", &v9, v8);
  v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);

}

BOOL __60__HDSourceStoreServer_remote_fetchAllSourcesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSourcesWithError:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[4];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__HDSourceStoreServer_remote_fetchHasSampleWithBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E6CF1528;
  v15 = v17;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  v11 = objc_msgSend(v9, "performHighPriorityTransactionsWithError:block:", &v16, v13);
  v12 = v16;

  v7[2](v7, v11, v12);
  _Block_object_dispose(v17, 8);

}

BOOL __76__HDSourceStoreServer_remote_fetchHasSampleWithBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "hasSampleWithBundleIdentifier:error:", *(_QWORD *)(a1 + 40), a2);

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 1;
}

- (void)remote_deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = (void (**)(id, uint64_t, id))a4;
    -[HDStandardTaskServer profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v10, "deleteSourceWithBundleIdentifier:error:", v7, &v25);
    v12 = v25;

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB52B0];
    v14 = *MEMORY[0x1E0CB52B0];
    if ((_DWORD)v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v13;
        -[HDStandardTaskServer client](self, "client");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "process");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2114;
        v29 = v7;
        _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" deleted source %{public}@", buf, 0x16u);

      }
      -[HDStandardTaskServer profile](self, "profile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDCloudSyncStore samplesDeletedInProfile:byUser:intervals:](HDCloudSyncStore, "samplesDeletedInProfile:byUser:intervals:", v19, 1, 0);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v22 = v13;
      -[HDStandardTaskServer client](self, "client");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "process");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v24;
      v28 = 2114;
      v29 = v7;
      v30 = 2114;
      v31 = v12;
      _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Client \"%{public}@\" failed to deleted source %{public}@: %{public}@", buf, 0x20u);

    }
LABEL_9:
    v8[2](v8, v11, v12);

    goto LABEL_10;
  }
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = a4;
  objc_msgSend(v20, "hk_errorForNilArgument:class:selector:", CFSTR("bundleIdentifier"), objc_opt_class(), a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v21, 0, v12);

LABEL_10:
}

- (void)remote_fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4
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
  objc_msgSend(v8, "sourceOrderManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v9, "orderedSourcesForObjectType:error:", v7, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  v6[2](v6, v10, v11);

}

- (void)remote_updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = a4;
  v10 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceOrderManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v13 = objc_msgSend(v12, "updateOrderedSources:forObjectType:error:", v10, v9, &v15);

  v14 = v15;
  v8[2](v8, v13, v14);

}

- (void)remote_sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, id);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48[2];
  id v49;
  id v50;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, id))a7;
  if (v16)
  {
    v46 = v14;
    v47 = v13;
    -[HDStandardTaskServer client](self, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "process");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqual:", CFSTR("com.apple.HealthKitTests")) & 1) == 0)
    {
      v43 = v12;
      -[HDStandardTaskServer client](self, "client");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "process");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqual:", CFSTR("com.apple.HKTester")) & 1) == 0)
      {
        v44 = v15;
        -[HDStandardTaskServer client](self, "client");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "process");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "hasPrefix:", CFSTR("com.apple.internal.HealthUIAKit.")) & 1) == 0)
        {
          -[HDStandardTaskServer client](self, "client");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sourceBundleIdentifier");
          v40 = v23;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v38, "hasPrefix:", CFSTR("com.apple.internal.HealthUIAKit."));

          v12 = v43;
          v15 = v44;
          if ((v41 & 1) == 0)
          {
            v50 = 0;
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v50, 4, CFSTR("Client unauthorized; only specific bundle identifiers are allowed to call this method"));
            v28 = v50;
            v16[2](v16, 0, v28);
            v14 = v46;
            v13 = v47;
LABEL_14:

            goto LABEL_15;
          }
LABEL_8:
          -[HDStandardTaskServer client](self, "client");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *MEMORY[0x1E0CB5F20];
          v49 = 0;
          v27 = objc_msgSend(v25, "hasRequiredEntitlement:error:", v26, &v49);
          v28 = v49;

          v14 = v46;
          v13 = v47;
          if ((v27 & 1) != 0)
          {
            -[HDStandardTaskServer profile](self, "profile");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "sourceManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v15;
            v32 = v30;
            v48[1] = v28;
            v45 = v31;
            objc_msgSend(v30, "sourceForAppleDeviceWithUUID:identifier:name:productType:createIfNecessary:error:", v12, v47, v46);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v28;

            if (v33)
            {
              -[HDStandardTaskServer profile](self, "profile");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v48[0] = v34;
              objc_msgSend(v33, "sourceWithProfile:error:", v35, v48);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v48[0];

              v34 = v37;
            }
            else
            {
              v36 = 0;
            }
            v15 = v45;
            ((void (**)(id, void *, id))v16)[2](v16, v36, v34);

            v28 = v34;
          }
          else
          {
            v16[2](v16, 0, v28);
          }
          goto LABEL_14;
        }

        v15 = v44;
      }

      v12 = v43;
    }

    goto LABEL_8;
  }
LABEL_15:

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C38], "taskIdentifier");
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
