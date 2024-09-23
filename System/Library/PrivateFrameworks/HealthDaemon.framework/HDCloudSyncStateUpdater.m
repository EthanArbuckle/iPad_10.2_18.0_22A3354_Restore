@implementation HDCloudSyncStateUpdater

- (HDCloudSyncStateUpdater)init
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

+ (BOOL)updateDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v16;
  id v17;
  id v18;
  id v19;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v10 = v19;
  v11 = v18;
  v12 = v17;
  v13 = v16;
  v14 = HKWithAutoreleasePool();

  return v14;
}

uint64_t __87__HDCloudSyncStateUpdater_updateDataWithStateStore_delegate_profile_transaction_error___block_invoke(uint64_t a1, HDCodableSyncState **a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  HDCodableSyncState *v15;
  id v16;
  uint64_t v17;
  void *v18;
  HDCodableSyncState *v19;
  id v20;
  HDCodableSyncState *v21;
  id v22;
  unint64_t v23;
  id v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  HDCodableSyncState *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  HDCodableSyncState *v46;
  id v47;
  HDCodableSyncState *v48;
  HDCodableSyncState *v49;
  id v51;
  void *v52;
  void *v53;
  char v54;
  HDCodableSyncState *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  HDCodableSyncState *v65;
  HDCodableSyncState *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  HDCodableSyncState *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  HDCodableSyncState **v81;
  HDCodableSyncState **v82;
  id v83;
  HDCodableSyncState *v84;
  id v85;
  id v86;
  HDCodableSyncState *v87;
  id v88;
  id v89;
  HDCodableSyncState *v90;
  HDCodableSyncState *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = objc_opt_self();
  v101 = 0;
  v102 = 0;
  v11 = objc_msgSend(v7, "fetchLocalState:profile:transaction:error:", &v102, v8, v9, &v101);
  v12 = v102;
  v13 = v101;
  if ((v11 & 1) != 0)
  {
    v99 = 0;
    v100 = 0;
    v14 = +[HDCloudSyncStateUpdater _fetchCloudState:codableSyncState:stateStore:profile:delegate:error:](v10, (uint64_t)&v100, &v99, v6, v8, v7, a2);
    v15 = (HDCodableSyncState *)v100;
    v16 = v99;
    if (!v14)
    {
      v17 = 0;
      goto LABEL_54;
    }
    if (v14 == 2)
    {
      v17 = 1;
LABEL_54:

      goto LABEL_55;
    }
    v83 = v13;
    v20 = v6;
    v86 = v16;
    v21 = v15;
    v22 = v12;
    v94 = v8;
    v89 = v9;
    v97 = v7;
    v92 = v22;
    v85 = v12;
    v87 = v21;
    v77 = objc_opt_self();
    if (v22)
    {
      if (v21)
      {
        v104 = 0;
        v103 = 0;
        v23 = objc_msgSend(v97, "shouldUpdateWithMergedState:cloudState:localState:profile:transaction:error:", &v104, v21, v22, v94, v89, &v103);
        v24 = v104;
        v75 = v103;
        v6 = v20;
        v81 = a2;
        if (v23)
        {
          _HKInitializeLogging();
          v72 = (void *)*MEMORY[0x1E0CB5370];
          v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
          v13 = v83;
          if (v24)
          {
            if (v25)
            {
              v73 = v24;
              v26 = v72;
              +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              HKStringFromStateSyncMergeResult(v23);
              v27 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v106 = v78;
              v107 = 2114;
              v108 = v27;
              v28 = (void *)v27;
              _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ merge result \"%{public}@\", buf, 0x16u);

              v24 = v73;
            }
            v29 = v24;
            v30 = (HDCodableSyncState *)objc_retainAutorelease(v24);
            goto LABEL_42;
          }
          v74 = 0;
          if (v25)
          {
            v44 = v72;
            +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v106 = v45;
            _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ merge state is nil, no update required", buf, 0xCu);

          }
          v30 = 0;
          v23 = 1;
        }
        else
        {
          v74 = v24;
          _HKInitializeLogging();
          v40 = (void *)*MEMORY[0x1E0CB5370];
          v13 = v83;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v67 = v40;
            +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v106 = v68;
            v107 = 2114;
            v108 = (uint64_t)v75;
            _os_log_error_impl(&dword_1B7802000, v67, OS_LOG_TYPE_ERROR, "%{public}@ merge error: %{public}@", buf, 0x16u);

          }
          v41 = v75;
          if (v41)
          {
            if (a2)
              *a2 = (HDCodableSyncState *)objc_retainAutorelease(v41);
            else
              _HKLogDroppedError();
          }

          v30 = 0;
          v23 = 0;
        }
        v29 = v74;
LABEL_42:

        a2 = v81;
        goto LABEL_43;
      }
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E0CB5370];
      v6 = v20;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v106 = v37;
        _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ local state not nil and cloud state is nil, update cloud state", buf, 0xCu);

      }
      v30 = (HDCodableSyncState *)objc_retainAutorelease(v92);
      v23 = 3;
      v13 = v83;
    }
    else
    {
      v82 = a2;
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E0CB5370];
      v32 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
      v6 = v20;
      if (v21)
      {
        if (v32)
        {
          v33 = v31;
          +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v106 = v34;
          _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ local state nil and cloud state not nil, persist cloud state", buf, 0xCu);

        }
        v30 = objc_retainAutorelease(v87);
        v23 = 2;
      }
      else
      {
        if (v32)
        {
          v42 = v31;
          +[HDCloudSyncStateUpdater _descriptionForDelegate:](v77, v97);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v106 = v43;
          _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ local state and cloud state are nil, no merge required", buf, 0xCu);

        }
        v30 = 0;
        v23 = 1;
      }
      a2 = v82;
      v13 = v83;
    }
LABEL_43:

    v46 = v30;
    if (v23)
    {
      if (v23 == 1)
      {
LABEL_50:
        v17 = 1;
LABEL_52:
        v12 = v85;
LABEL_53:

        v16 = v86;
        goto LABEL_54;
      }
      if ((v23 & 0xFFFFFFFFFFFFFFFELL) != 2
        || +[HDCloudSyncStateUpdater _persistCloudState:delegate:profile:error:](v10, v46, v97, v94, a2))
      {
        if (v23 == 3)
        {
          v93 = v6;
          v47 = v86;
          v98 = v97;
          v95 = v94;
          v84 = v46;
          v48 = v46;
          v88 = v47;
          v79 = objc_opt_self();
          if (v47)
          {
            v49 = (HDCodableSyncState *)v47;
          }
          else
          {
            v90 = v48;
            v51 = v98;
            objc_opt_self();
            v49 = objc_alloc_init(HDCodableSyncState);
            objc_msgSend(v51, "domain");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCodableSyncState setDomain:](v49, "setDomain:", v52);

            objc_msgSend(v51, "key");
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = v90;
            -[HDCodableSyncState setKey:](v49, "setKey:", v53);

          }
          v91 = v49;
          -[HDCodableSyncState setVersionRange:](v49, "setVersionRange:", objc_msgSend(v98, "supportedSyncVersionRange"));
          v104 = 0;
          v54 = objc_msgSend(v98, "updateCodableSyncState:withMergeState:profile:error:", v49, v48, v95, &v104);

          v96 = v104;
          if ((v54 & 1) != 0)
          {
            -[HDCodableSyncState data](v91, "data");
            v55 = (HDCodableSyncState *)objc_claimAutoreleasedReturnValue();
            _HKInitializeLogging();
            v56 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v57 = v56;
              +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = -[HDCodableSyncState length](v55, "length");
              *(_DWORD *)buf = 138543618;
              v106 = v58;
              v107 = 2048;
              v108 = v59;
              _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ update cloud state with %ld bytes of data", buf, 0x16u);

            }
            objc_msgSend(v98, "key");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = 0;
            v76 = v55;
            v17 = objc_msgSend(v93, "setData:forKey:error:", v55, v60, &v103);
            v61 = v103;

            if ((v17 & 1) == 0)
            {
              _HKInitializeLogging();
              v62 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v71 = v62;
                +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v106 = v80;
                v107 = 2114;
                v108 = (uint64_t)v61;
                _os_log_error_impl(&dword_1B7802000, v71, OS_LOG_TYPE_ERROR, "%{public}@ state store data set error: %{public}@", buf, 0x16u);

              }
              v63 = v61;
              if (v63)
              {
                if (a2)
                  *a2 = (HDCodableSyncState *)objc_retainAutorelease(v63);
                else
                  _HKLogDroppedError();
              }

            }
            v46 = v84;
            v12 = v85;
            v65 = v76;
          }
          else
          {
            _HKInitializeLogging();
            v64 = (void *)*MEMORY[0x1E0CB5370];
            v12 = v85;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v69 = v64;
              +[HDCloudSyncStateUpdater _descriptionForDelegate:](v79, v98);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v106 = v70;
              v107 = 2114;
              v108 = (uint64_t)v96;
              _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "%{public}@ update codable sync state error: %{public}@", buf, 0x16u);

              v12 = v85;
            }
            v65 = (HDCodableSyncState *)v96;
            if (v65)
            {
              v46 = v84;
              if (a2)
              {
                v65 = objc_retainAutorelease(v65);
                v17 = 0;
                *a2 = v65;
              }
              else
              {
                v66 = v65;
                _HKLogDroppedError();
                v65 = v66;
                v17 = 0;
              }
            }
            else
            {
              v17 = 0;
              v46 = v84;
            }
          }

          goto LABEL_53;
        }
        goto LABEL_50;
      }
    }
    v17 = 0;
    goto LABEL_52;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v38 = v18;
    +[HDCloudSyncStateUpdater _descriptionForDelegate:](v10, v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v106 = v39;
    v107 = 2114;
    v108 = (uint64_t)v13;
    _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "%{public}@ fetch local state error: %{public}@", buf, 0x16u);

  }
  v19 = (HDCodableSyncState *)v13;
  v15 = v19;
  if (!v19)
    goto LABEL_19;
  if (!a2)
  {
    _HKLogDroppedError();
LABEL_19:
    v17 = 0;
    goto LABEL_55;
  }
  v15 = objc_retainAutorelease(v19);
  v17 = 0;
  *a2 = v15;
LABEL_55:

  return v17;
}

+ (BOOL)persistDataWithStateStore:(id)a3 delegate:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v13;
  id v14;
  id v15;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v8 = v15;
  v9 = v14;
  v10 = v13;
  v11 = HKWithAutoreleasePool();

  return v11;
}

uint64_t __76__HDCloudSyncStateUpdater_persistDataWithStateStore_delegate_profile_error___block_invoke(uint64_t a1, HDCodableSyncState **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  v6 = v4;
  v7 = v3;
  v8 = objc_opt_self();
  v17 = 0;
  v9 = +[HDCloudSyncStateUpdater _fetchCloudState:codableSyncState:stateStore:profile:delegate:error:](v8, (uint64_t)&v17, 0, v7, v6, v5, a2);

  v10 = v17;
  v11 = v10;
  if (v9 == 1)
  {
    if (v10)
    {
      v12 = +[HDCloudSyncStateUpdater _persistCloudState:delegate:profile:error:](v8, v10, v5, v6, a2);
    }
    else
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        +[HDCloudSyncStateUpdater _descriptionForDelegate:](v8, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ no cloud state to perist", buf, 0xCu);

      }
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_descriptionForDelegate:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%@:%p (%@, %@)]"), v4, v5, v2, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)_fetchCloudState:(_QWORD *)a3 codableSyncState:(void *)a4 stateStore:(void *)a5 profile:(void *)a6 delegate:(HDCodableSyncState *)a7 error:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  HDCodableSyncState *v20;
  HDCodableSyncState *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  HDCodableSyncState *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  _BYTE v59[10];
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = objc_opt_self();
  objc_msgSend(v11, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "supportedSyncVersionRange");
  v54 = 0;
  v55 = 0;
  v17 = objc_msgSend(v12, "data:forKey:error:", &v55, v15, &v54);

  v18 = v55;
  v19 = v54;
  if ((v17 & 1) == 0)
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v41 = v27;
      +[HDCloudSyncStateUpdater _descriptionForDelegate:](v13, v11);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = (uint64_t)v42;
      v58 = 2114;
      *(_QWORD *)v59 = v19;
      _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@ state store data fetch error: %{public}@", buf, 0x16u);

    }
    v28 = (HDCodableSyncState *)v19;
    v21 = v28;
    if (v28)
    {
      if (a7)
      {
        v21 = objc_retainAutorelease(v28);
        v29 = 0;
        *a7 = v21;
LABEL_42:

        goto LABEL_43;
      }
      _HKLogDroppedError();
    }
    v29 = 0;
    goto LABEL_42;
  }
  if (v18)
  {
    v48 = v13;
    v20 = -[HDCodableSyncState initWithData:]([HDCodableSyncState alloc], "initWithData:", v18);
    v21 = v20;
    v50 = v10;
    if (!v20)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v11, "domain");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "key");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "hk_assignError:code:format:", a7, 129, CFSTR("Unable to decode state sync data for domain %@ key %@"), v31, v32);

LABEL_24:
      v29 = 0;
LABEL_41:

      v10 = v50;
      goto LABEL_42;
    }
    -[HDCodableSyncState domain](v20, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v19;
    if (v22 == v14)
    {

    }
    else
    {
      v23 = v22;
      if (!v14)
      {

LABEL_23:
        v38 = (void *)MEMORY[0x1E0CB35C8];
        -[HDCodableSyncState key](v21, "key");
        v31 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hk_assignError:code:format:", a7, 129, CFSTR("Serialized domain %@ does not matched expected value %@"), v31, v14);
        goto LABEL_24;
      }
      -[HDCodableSyncState domain](v21, "domain");
      v24 = v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v24);

      v14 = v24;
      v19 = v49;

      if ((v26 & 1) == 0)
        goto LABEL_23;
    }
    -[HDCodableSyncState key](v21, "key");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 == v15)
    {
      v35 = v14;

    }
    else
    {
      v34 = v33;
      v35 = v14;
      if (!v15)
      {

LABEL_38:
        v43 = (void *)MEMORY[0x1E0CB35C8];
        -[HDCodableSyncState key](v21, "key");
        v31 = objc_claimAutoreleasedReturnValue();
        v14 = v35;
        objc_msgSend(v43, "hk_assignError:code:format:", a7, 129, CFSTR("Serialized key %@ does not matched %@ for domain %@"), v31, v15, v35);
        v29 = 0;
        goto LABEL_40;
      }
      -[HDCodableSyncState key](v21, "key");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", v15);

      if ((v37 & 1) == 0)
        goto LABEL_38;
    }
    if ((int)-[HDCodableSyncState versionRange](v21, "versionRange") <= SHIDWORD(v16))
    {
      if (a3)
        *a3 = objc_retainAutorelease(v21);
      v53 = 0;
      v29 = objc_msgSend(v11, "fetchCloudState:codableSyncState:profile:error:", a2, v21, v50, &v53);
      v31 = v53;
      v14 = v35;
      if (!v29)
      {
        _HKInitializeLogging();
        v40 = (void *)*MEMORY[0x1E0CB5370];
        v19 = v49;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v45 = v40;
          +[HDCloudSyncStateUpdater _descriptionForDelegate:](v48, v11);
          v46 = v14;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = (uint64_t)v47;
          v58 = 2114;
          *(_QWORD *)v59 = v31;
          _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "%{public}@ decode cloud state error: %{public}@", buf, 0x16u);

          v14 = v46;
          v19 = v49;

        }
        v31 = v31;
        if (v31)
        {
          if (a7)
            *a7 = (HDCodableSyncState *)objc_retainAutorelease(v31);
          else
            _HKLogDroppedError();
        }

        goto LABEL_24;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (int)-[HDCodableSyncState versionRange](v21, "versionRange");
        *(_DWORD *)buf = 138544386;
        v57 = v48;
        v58 = 1024;
        *(_DWORD *)v59 = v39;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = HIDWORD(v16);
        v60 = 2114;
        v14 = v35;
        v61 = v35;
        v62 = 2114;
        v63 = v15;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Codable state has minimum version %d but current version for OS is %d for (%{public}@, %{public}@) ", buf, 0x2Cu);
        v29 = 2;
      }
      else
      {
        v29 = 2;
        v14 = v35;
      }
    }
LABEL_40:
    v19 = v49;
    goto LABEL_41;
  }
  v29 = 1;
LABEL_43:

  return v29;
}

+ (uint64_t)_persistCloudState:(void *)a3 delegate:(void *)a4 profile:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  os_log_t *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  os_log_t v18;
  id v19;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E0CB5370];
  v13 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    +[HDCloudSyncStateUpdater _descriptionForDelegate:](v11, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v15;
    v26 = 2114;
    v27 = objc_opt_class();
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ persist cloud state %{public}@", buf, 0x16u);

  }
  v23 = 0;
  v16 = objc_msgSend(v9, "persistCloudState:profile:error:", v8, v10, &v23);

  v17 = v23;
  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    v18 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      v21 = v18;
      +[HDCloudSyncStateUpdater _descriptionForDelegate:](v11, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v22;
      v26 = 2114;
      v27 = (uint64_t)v17;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ perist cloud state error: %{public}@", buf, 0x16u);

    }
    v19 = v17;
    if (v19)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

  }
  return v16;
}

@end
