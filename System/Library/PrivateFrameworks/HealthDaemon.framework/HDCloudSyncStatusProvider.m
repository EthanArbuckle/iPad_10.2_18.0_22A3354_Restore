@implementation HDCloudSyncStatusProvider

- (HDCloudSyncStatusProvider)initWithCoordinator:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncStatusProvider *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  HDCloudSyncStatus *v11;
  HDCloudSyncStatus *lock_cloudSyncStatus;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncStatusProvider;
  v8 = -[HDCloudSyncStatusProvider init](&v14, sel_init);
  if (v8)
  {
    HKCreateSerialUtilityDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_coordinator, v6);
    objc_storeStrong((id *)&v8->_behavior, a4);
    v11 = objc_alloc_init(HDCloudSyncStatus);
    lock_cloudSyncStatus = v8->_lock_cloudSyncStatus;
    v8->_lock_cloudSyncStatus = v11;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)fetchSyncStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  id *v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[8];
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  char v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v28 = 0;
  v3 = objc_msgSend(WeakRetained, "canPerformCloudSyncWithError:", &v28);
  v4 = v28;

  if ((v3 & 1) != 0)
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__117;
    v26[4] = __Block_byref_object_dispose__117;
    v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__117;
    v24[4] = __Block_byref_object_dispose__117;
    v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__117;
    v22[4] = __Block_byref_object_dispose__117;
    v23 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v5 = (id *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = 0;
    v6 = objc_loadWeakRetained(v5);
    v7 = objc_msgSend(v6, "hasActiveSyncTask");

    v21 = v7;
    v8 = objc_alloc(MEMORY[0x1E0D29810]);
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_188;
    v13[3] = &unk_1E6CFCB18;
    v15 = v24;
    v16 = v26;
    v17 = v22;
    v10 = *(id *)(a1 + 40);
    v19 = v3;
    v14 = v10;
    v18 = v20;
    v11 = (void *)objc_msgSend(v8, "initWithDescription:completion:", CFSTR("Fetch cloud sync status"), v13);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_2;
    v12[3] = &unk_1E6CFCB68;
    v12[4] = *(_QWORD *)(a1 + 32);
    v12[5] = v26;
    v12[6] = v24;
    v12[7] = v22;
    objc_msgSend(v11, "addTask:", v12);
    objc_msgSend(v11, "begin");

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_188(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  HDCloudSyncStatus *v6;

  v5 = a4;
  v6 = objc_alloc_init(HDCloudSyncStatus);
  -[HDCloudSyncStatus setLastSuccessfulPullDate:](v6, "setLastSuccessfulPullDate:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  -[HDCloudSyncStatus setLastSuccessfulPushDate:](v6, "setLastSuccessfulPushDate:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  -[HDCloudSyncStatus setLastSuccessfulLitePushDate:](v6, "setLastSuccessfulLitePushDate:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  (*(void (**)(void))(a1[4] + 16))();

}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[6];
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v28 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetching cloud sync status for all profiles.", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allProfileIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16);
        v19[0] = v15;
        v19[1] = 3221225472;
        v19[2] = __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_190;
        v19[3] = &unk_1E6CFCB40;
        v19[4] = *(_QWORD *)(a1 + 32);
        v19[5] = v17;
        v20 = *(_OWORD *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v5, "addTask:", v19, v18);
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  (*((void (**)(id, _QWORD, _QWORD))v18 + 2))(v18, 0, 0);

}

void __59__HDCloudSyncStatusProvider_fetchSyncStatusWithCompletion___block_invoke_190(_QWORD *a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileForIdentifier:", a1[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)(a1[4] + 8));
    v9 = objc_msgSend(v8, "shouldSyncProfile:", v7);

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v7, "cloudSyncManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {
        (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);
        goto LABEL_19;
      }
      objc_msgSend(v10, "status");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastSuccessfulPushDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(_QWORD *)(a1[6] + 8);
      v15 = *(void **)(v14 + 40);
      if (v15)
      {
        if (!objc_msgSend(v15, "hk_isAfterDate:", v13))
          goto LABEL_8;
        v14 = *(_QWORD *)(a1[6] + 8);
      }
      objc_storeStrong((id *)(v14 + 40), v13);
LABEL_8:
      objc_msgSend(v11, "status");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastSuccessfulPullDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *(_QWORD *)(a1[7] + 8);
      v19 = *(void **)(v18 + 40);
      if (v19)
      {
        if (!objc_msgSend(v19, "hk_isAfterDate:", v17))
          goto LABEL_12;
        v18 = *(_QWORD *)(a1[7] + 8);
      }
      objc_storeStrong((id *)(v18 + 40), v17);
LABEL_12:
      objc_msgSend(v11, "status");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastSuccessfulLitePushDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *(_QWORD *)(a1[8] + 8);
      v23 = *(void **)(v22 + 40);
      if (v23)
      {
        if (!objc_msgSend(v23, "hk_isAfterDate:", v21))
        {
LABEL_16:
          (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);

LABEL_19:
          goto LABEL_20;
        }
        v22 = *(_QWORD *)(a1[8] + 8);
      }
      objc_storeStrong((id *)(v22 + 40), v21);
      goto LABEL_16;
    }
  }
  (*((void (**)(id, _QWORD, _QWORD))v24 + 2))(v24, 0, 0);
LABEL_20:

}

- (id)currentSyncProgress
{
  HDCloudSyncCoordinator **p_coordinator;
  id WeakRetained;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  p_coordinator = &self->_coordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v4 = objc_msgSend(WeakRetained, "hasActiveSyncTask");

  v5 = (void *)MEMORY[0x1E0CB38A8];
  if (v4)
  {
    v6 = objc_loadWeakRetained((id *)p_coordinator);
    objc_msgSend(v6, "progressOfActiveSyncTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hd_progressMirroringProgress:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)checkLastSyncDate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  char v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  NSObject *v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  id v103;
  uint64_t v104;
  void *v105;
  id v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  _QWORD v115[4];
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  double v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[HDCloudSyncTapToRadar isTapToRadarAllowed](HDCloudSyncTapToRadar, "isTapToRadarAllowed"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v124 = 0;
    v4 = objc_msgSend(WeakRetained, "canPerformCloudSyncWithError:", &v124);
    v5 = v124;
    if ((v4 & 1) != 0)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "_shouldPerformLastSyncDateCheckInternalSetting");

      if ((v6 & 1) != 0)
      {
        v7 = *(void **)(a1 + 32);
        v123 = 0;
        objc_msgSend(v7, "_lastLongTimeWithoutSuccessfulCloudSyncReportDateKeyWithError:", &v123);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v123;
        if (!v8)
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v23 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v126 = v23;
            v127 = 2114;
            v128 = *(double *)&v9;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get create lastLongTimeWithoutSuccessfulCloudSyncReportDateKey: %{public}@", buf, 0x16u);
          }
          goto LABEL_65;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "hk_removeObjectsForKeysWithPrefix:", CFSTR("HDLastLongTimeWithoutSuccessfulCloudSyncReportDate"));

          _HKInitializeLogging();
          v25 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v26 = *(_QWORD *)(a1 + 32);
            v27 = v25;
            HKDiagnosticStringFromDate();
            v28 = v10;
            v29 = v8;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v126 = v26;
            v12 = 0;
            v127 = 2114;
            v128 = *(double *)&v30;
            _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: lastCloudSyncReportDate has never been set, set to %{public}@", buf, 0x16u);

            v8 = v29;
            v10 = v28;

          }
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v10, v8);

          goto LABEL_64;
        }
        objc_msgSend(v10, "timeIntervalSinceDate:", v12);
        if (v13 < 2419200.0)
        {
          v14 = v13;
          _HKInitializeLogging();
          v15 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v126 = v16;
            v127 = 2048;
            v128 = v14;
            v129 = 2048;
            v130 = 0x4142750000000000;
            v17 = "%{public}@: skip last sync date check, timeSinceLastCloudSyncReportDate (%f) < (%f)";
            v18 = v15;
            v19 = 32;
LABEL_27:
            _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
            goto LABEL_64;
          }
          goto LABEL_64;
        }
        v114 = v12;
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(unsigned __int8 *)(v32 + 44);
        os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 40));
        if (!v33)
        {
          _HKInitializeLogging();
          v43 = *MEMORY[0x1E0CB5370];
          v12 = v114;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v44 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v126 = v44;
            v17 = "%{public}@: skip last sync date check, cached sync dates haven't been updated yet";
            v18 = v43;
            v19 = 12;
            goto LABEL_27;
          }
LABEL_64:

LABEL_65:
          goto LABEL_14;
        }
        v113 = v10;
        v111 = v8;
        v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v34, "daemon");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "primaryProfile");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = 0;
        +[HDKeyValueEntity retrieveDatabaseIdentifierCreationDateFromProfile:error:](HDProtectedKeyValueEntity, "retrieveDatabaseIdentifierCreationDateFromProfile:error:", v36, &v122);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v122;

        if (!v37)
        {
          _HKInitializeLogging();
          v45 = *MEMORY[0x1E0CB5370];
          v8 = v111;
          v10 = v113;
          v12 = v114;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v46 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v126 = v46;
            v127 = 2114;
            v128 = *(double *)&v112;
            _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "%{public}@: unable to determine age of database, necessary for last sync date check %{public}@", buf, 0x16u);
          }
          goto LABEL_63;
        }
        v10 = v113;
        objc_msgSend(v113, "timeIntervalSinceDate:", v37);
        v12 = v114;
        if (v38 < 2419200.0)
        {
          v39 = v38;
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E0CB5370];
          v8 = v111;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v41 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v126 = v41;
            v127 = 2048;
            v128 = v39;
            v129 = 2048;
            v130 = 0x4142750000000000;
            v42 = "%{public}@: skip last sync date check, timeSinceDatabaseCreation (%f) < (%f)";
LABEL_33:
            _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x20u);
            goto LABEL_63;
          }
          goto LABEL_63;
        }
        v47 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v47, "periodicActivityScheduler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "periodicActivityErrorCount");

        if (v49 <= 27)
        {
          v50 = v49;
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E0CB5370];
          v8 = v111;
          v10 = v113;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v51 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v126 = v51;
            v127 = 2048;
            v128 = *(double *)&v50;
            v129 = 2048;
            v130 = 28;
            v42 = "%{public}@: skip last sync date check, periodicSyncErrorCount (%ld) < (%ld)";
            goto LABEL_33;
          }
LABEL_63:

          goto LABEL_64;
        }
        v108 = v37;
        v52 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v52, "daemon");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "primaryProfile");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = 0;
        +[HDCloudSyncStoreEntity persistedMostRecentLastSyncDateForProfile:error:](HDCloudSyncStoreEntity, "persistedMostRecentLastSyncDateForProfile:error:", v54, &v121);
        v110 = objc_claimAutoreleasedReturnValue();
        v55 = v121;

        if (v55)
        {
          _HKInitializeLogging();
          v56 = *MEMORY[0x1E0CB5370];
          v109 = v55;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v57 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v126 = v57;
            v127 = 2114;
            v128 = *(double *)&v55;
            _os_log_impl(&dword_1B7802000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not get most recent successful push %{public}@", buf, 0x16u);
          }
          v58 = (void *)v110;
          v8 = v111;
          v10 = v113;
          v12 = v114;
          v37 = v108;
          goto LABEL_62;
        }
        v59 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(v59, "daemon");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "primaryProfile");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = 0;
        HDMostRecentSuccessfulPullDateForProfile(v61, &v120);
        v107 = objc_claimAutoreleasedReturnValue();
        v62 = v120;

        v109 = v62;
        if (v62)
        {
          _HKInitializeLogging();
          v63 = *MEMORY[0x1E0CB5370];
          v8 = v111;
          v12 = v114;
          v64 = (void *)v107;
          v37 = v108;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v65 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v126 = v65;
            v127 = 2114;
            v128 = *(double *)&v109;
            v66 = "%{public}@: Could not get most recent successful pull %{public}@";
            v67 = v63;
            v68 = 22;
LABEL_51:
            _os_log_impl(&dword_1B7802000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v68);
          }
        }
        else
        {
          v8 = v111;
          v37 = v108;
          if (v110)
          {
            objc_msgSend(v113, "timeIntervalSinceDate:");
            v70 = v69;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "timeIntervalSinceDate:", v71);
            v70 = v72;

          }
          v64 = (void *)v107;
          if (v107)
          {
            objc_msgSend(v113, "timeIntervalSinceDate:", v107);
            v74 = v73;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "timeIntervalSinceDate:", v75);
            v74 = v76;

            v64 = 0;
          }
          v12 = v114;
          if (v70 >= 2419200.0 || v74 >= 2419200.0)
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
            v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            if (v70 >= 2419200.0)
            {
              v79 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v2, "lastSuccessfulPushDate");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              HKDiagnosticStringFromDate();
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "stringWithFormat:", CFSTR("push: %@"), v81);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v82);

              objc_msgSend(v2, "lastSuccessfulPushDate");
              v83 = (void *)objc_claimAutoreleasedReturnValue();

              if (v83)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f seconds ago"), *(_QWORD *)&v70);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "addObject:", v84);

              }
            }
            if (v74 >= 2419200.0)
            {
              v85 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v2, "lastSuccessfulPullDate");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              HKDiagnosticStringFromDate();
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringWithFormat:", CFSTR("pull: %@"), v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v88);

              objc_msgSend(v2, "lastSuccessfulPullDate");
              v89 = (void *)objc_claimAutoreleasedReturnValue();

              if (v89)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f seconds ago"), *(_QWORD *)&v74);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "addObject:", v90);

              }
            }
            os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "stringArrayForKey:", CFSTR("HDLongTimeWithoutSuccessfulCloudSyncPeriodicSyncErrorStrings"));
            v92 = objc_claimAutoreleasedReturnValue();

            v93 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
            objc_msgSend(v93, "accountProvider");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "getPersistedAccountInfo");
            v95 = objc_claimAutoreleasedReturnValue();

            v96 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v106, "componentsJoinedByString:", CFSTR(", "));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = (void *)v92;
            v98 = (void *)v92;
            v99 = (void *)v95;
            objc_msgSend(v98, "componentsJoinedByString:", CFSTR("\n"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "stringWithFormat:", CFSTR("Date of last successful Health data sync (%@) was too long ago and periodic sync has failed (%ld) times, pop the alert!\nPlease file a bug against \"Health (New Bugs) | All\"\nAccount Info: (%@)\nRecent Periodic Sync Errors: %@"), v97, v49, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            _HKInitializeLogging();
            v102 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v104 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              v126 = v104;
              v127 = 2114;
              v128 = *(double *)&v101;
              _os_log_error_impl(&dword_1B7802000, v102, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
            }
            v118[0] = MEMORY[0x1E0C809B0];
            v118[1] = 3221225472;
            v118[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_217;
            v118[3] = &unk_1E6CE80E8;
            v119 = v101;
            v115[0] = MEMORY[0x1E0C809B0];
            v115[1] = 3221225472;
            v115[2] = __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_3;
            v115[3] = &unk_1E6CEF7C8;
            v116 = v113;
            v8 = v111;
            v117 = v111;
            v103 = v101;
            +[HDCloudSyncTapToRadar showTapToRadarRequestWithTitle:message:proceed:disable:completion:](HDCloudSyncTapToRadar, "showTapToRadarRequestWithTitle:message:proceed:disable:completion:", CFSTR("Health Not Cloud Syncing"), CFSTR("It has been a long time since your Health data has fully synced to iCloud. Please file a radar with Tap-to-Radar against 'Health'"), v118, &__block_literal_global_137, v115);

            v12 = v114;
            v64 = (void *)v107;
            v37 = v108;
            goto LABEL_61;
          }
          _HKInitializeLogging();
          v77 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v78 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            v126 = v78;
            v127 = 2048;
            v128 = v70;
            v129 = 2048;
            v130 = *(_QWORD *)&v74;
            v131 = 2048;
            v132 = 0x4142750000000000;
            v66 = "%{public}@: skip last sync date check, time since last successful sync push (%f) and pull (%f) are less than (%f)";
            v67 = v77;
            v68 = 42;
            goto LABEL_51;
          }
        }
LABEL_61:

        v58 = (void *)v110;
        v10 = v113;
LABEL_62:

        goto LABEL_63;
      }
    }
    else
    {

    }
  }
  else
  {
    v5 = 0;
  }
  _HKInitializeLogging();
  v20 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v126 = v21;
    _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: check for last sync date is disabled", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_removeObjectsForKeysWithPrefix:", CFSTR("HDLastLongTimeWithoutSuccessfulCloudSyncReportDate"));
LABEL_14:

}

uint64_t __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_217(uint64_t a1)
{
  return +[HDCloudSyncTapToRadar openTapToRadarWithTitle:description:](HDCloudSyncTapToRadar, "openTapToRadarWithTitle:description:", CFSTR("[Cloud Sync] Long Time Without Successful Health Sync"), *(_QWORD *)(a1 + 32));
}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CB7720]);

}

void __46__HDCloudSyncStatusProvider_checkLastSyncDate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (id)lastSuccessfulPullDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDCloudSyncStatus lastSuccessfulPullDate](self->_lock_cloudSyncStatus, "lastSuccessfulPullDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)lastSuccessfulPushDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDCloudSyncStatus lastSuccessfulPushDate](self->_lock_cloudSyncStatus, "lastSuccessfulPushDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)lastSuccessfulLitePushDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDCloudSyncStatus lastSuccessfulLitePushDate](self->_lock_cloudSyncStatus, "lastSuccessfulLitePushDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDataUploadRequestStatus:(int64_t)a3 profileType:(int64_t)a4
{
  HDCloudSyncCoordinator **p_coordinator;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_coordinator = &self->_coordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allProfileIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v15, "type") == a4)
        {
          v16 = objc_loadWeakRetained((id *)p_coordinator);
          objc_msgSend(v16, "daemon");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "profileManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "profileForIdentifier:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "cloudSyncManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "updateDataUploadRequestStatus:", a3);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (id)_lastLongTimeWithoutSuccessfulCloudSyncReportDateKeyWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromProfile:error:", v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "UUIDString");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("HDLastLongTimeWithoutSuccessfulCloudSyncReportDate"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v12 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Unable to get the database UUID"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v8 = 0;
        v13 = 0;
        goto LABEL_11;
      }
    }
    if (a3)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a3 = v12;
    }
    else
    {
      _HKLogDroppedError();
      v13 = 0;
    }
    v8 = v12;
  }

LABEL_11:
  return v13;
}

- (BOOL)_shouldPerformLastSyncDateCheckInternalSetting
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB7720]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)updateCachedLastSyncDatesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__HDCloudSyncStatusProvider_updateCachedLastSyncDatesWithCompletion___block_invoke;
  v6[3] = &unk_1E6CFCBB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDCloudSyncStatusProvider fetchSyncStatusWithCompletion:](self, "fetchSyncStatusWithCompletion:", v6);

}

void __69__HDCloudSyncStatusProvider_updateCachedLastSyncDatesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (!a5)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 1;
  objc_msgSend(v13, "lastSuccessfulPullDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v13, "lastSuccessfulPullDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLastSuccessfulPullDate:", v8);

  }
  objc_msgSend(v13, "lastSuccessfulPushDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v13, "lastSuccessfulPushDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLastSuccessfulPushDate:", v10);

  }
  objc_msgSend(v13, "lastSuccessfulLitePushDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v13, "lastSuccessfulLitePushDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLastSuccessfulLitePushDate:", v12);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (HDCloudSyncStatus)syncStatus
{
  os_unfair_lock_s *p_lock;
  HDCloudSyncStatus *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(HDCloudSyncStatus);
  -[HDCloudSyncStatus lastSuccessfulPullDate](self->_lock_cloudSyncStatus, "lastSuccessfulPullDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[HDCloudSyncStatus setLastSuccessfulPullDate:](v4, "setLastSuccessfulPullDate:", v6);

  -[HDCloudSyncStatus lastSuccessfulPushDate](self->_lock_cloudSyncStatus, "lastSuccessfulPushDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[HDCloudSyncStatus setLastSuccessfulPushDate:](v4, "setLastSuccessfulPushDate:", v8);

  -[HDCloudSyncStatus lastSuccessfulLitePushDate](self->_lock_cloudSyncStatus, "lastSuccessfulLitePushDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[HDCloudSyncStatus setLastSuccessfulLitePushDate:](v4, "setLastSuccessfulLitePushDate:", v10);

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)unitTest_setLastSuccessfulPullDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDCloudSyncStatus setLastSuccessfulPullDate:](self->_lock_cloudSyncStatus, "setLastSuccessfulPullDate:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_setLastSuccessfulPushDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDCloudSyncStatus setLastSuccessfulPushDate:](self->_lock_cloudSyncStatus, "setLastSuccessfulPushDate:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unitTest_setLastSuccessfulLitePushDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDCloudSyncStatus setLastSuccessfulLitePushDate:](self->_lock_cloudSyncStatus, "setLastSuccessfulLitePushDate:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cloudSyncStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
