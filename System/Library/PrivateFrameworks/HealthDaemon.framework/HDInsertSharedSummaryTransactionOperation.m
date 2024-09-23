@implementation HDInsertSharedSummaryTransactionOperation

- (HDInsertSharedSummaryTransactionOperation)initWithZoneIdentifier:(id)a3
{
  id v4;
  HDInsertSharedSummaryTransactionOperation *v5;
  uint64_t v6;
  HDCloudSyncZoneIdentifier *zoneIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertSharedSummaryTransactionOperation;
  v5 = -[HDInsertSharedSummaryTransactionOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    zoneIdentifier = v5->_zoneIdentifier;
    v5->_zoneIdentifier = (HDCloudSyncZoneIdentifier *)v6;

  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v31;
  _BYTE *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  BOOL v44;
  id v47;
  _QWORD *v48;
  dispatch_semaphore_t dsema;
  id obj;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  HDInsertSharedSummaryTransactionOperation *v58;
  void *v59;
  _QWORD v60[2];
  void (*v61)(_QWORD *, char, id);
  void *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[2];
  void (*v81)(uint64_t, int, void *);
  void *v82;
  id v83;
  HDInsertSharedSummaryTransactionOperation *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  _QWORD *v90;
  _QWORD v91[4];
  dispatch_semaphore_t v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  id v107;
  id v108;
  uint8_t v109[4];
  HDInsertSharedSummaryTransactionOperation *v110;
  _BYTE buf[24];
  void *v112;
  HDInsertSharedSummaryTransactionOperation *v113;
  id v114;
  id v115;
  id v116;
  id v117;
  _QWORD *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__184;
  v78 = __Block_byref_object_dispose__184;
  v79 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v61 = __82__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_error___block_invoke;
  v62 = &unk_1E6D0D090;
  v63 = &v70;
  v64 = &v74;
  v65 = &v66;
  v53 = v7;
  v47 = v8;
  v48 = v60;
  v58 = self;
  if (self)
  {
    v101 = 0;
    v102 = &v101;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__184;
    v105 = __Block_byref_object_dispose__184;
    v106 = 0;
    v95 = 0;
    v96 = &v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__184;
    v99 = __Block_byref_object_dispose__184;
    v100 = 0;
    v9 = dispatch_semaphore_create(0);
    objc_msgSend(v53, "cloudSyncManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke;
    v91[3] = &unk_1E6CEE790;
    v93 = &v95;
    v94 = &v101;
    dsema = v9;
    v92 = dsema;
    objc_msgSend(v10, "cloudSyncRepositoriesForClient:completion:", 0, v91);

    v11 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(dsema, v11))
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v109 = 138543362;
        v110 = self;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Timed out waiting to complete journable operation", v109, 0xCu);
      }
    }
    if (v96[5])
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D298C8]);
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_185;
      v89[3] = &unk_1E6CEA1D8;
      v90 = v48;
      objc_msgSend(v13, "setDidFinish:", v89);
      objc_msgSend(v13, "beginTask");
      v57 = v13;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = (id)v96[5];
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
      if (v14)
      {
        v52 = *(_QWORD *)v86;
        do
        {
          v54 = v14;
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v86 != v52)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            objc_msgSend(v57, "beginTask");
            v17 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:]([HDCloudSyncCachedZone alloc], "initForZoneIdentifier:repository:accessibilityAssertion:", v58->_zoneIdentifier, v16, 0);
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v81 = __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_2;
            v82 = &unk_1E6CEB718;
            v83 = v57;
            v84 = v58;
            v56 = v53;
            v18 = v16;
            v19 = v17;
            v20 = v80;
            v21 = objc_opt_class();
            v108 = 0;
            objc_msgSend(v19, "recordsForClass:error:", v21, &v108);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v108;
            v59 = v23;
            if (v22)
              v24 = 1;
            else
              v24 = v23 == 0;
            if (v24)
            {
              objc_msgSend(v22, "hk_map:", &__block_literal_global_219);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_opt_class();
              v107 = 0;
              objc_msgSend(v19, "recordsForClass:error:", v25, &v107);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v107;

              if (v26 || !v27)
              {
                objc_msgSend(v26, "hk_map:", &__block_literal_global_194_2);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (v51)
                {
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_195;
                  v112 = &unk_1E6D0D188;
                  v118 = v20;
                  v113 = v58;
                  v114 = 0;
                  v31 = v18;
                  v115 = v31;
                  v116 = v55;
                  v117 = v51;
                  v32 = buf;
                  v33 = v31;
                  objc_msgSend(v33, "cloudSyncShimProvider");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "sharedSummariesShim");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "fetchAllSharedSummaryTransactionsWithRepository:completion:", v33, v32);

                }
                else
                {
                  _HKInitializeLogging();
                  v36 = *MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)&buf[4] = v58;
                    _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No Summary records found.", buf, 0xCu);
                  }
                  v81((uint64_t)v20, 1, 0);
                }

              }
              else
              {
                _HKInitializeLogging();
                v28 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v39 = v28;
                  objc_msgSend(v19, "zoneIdentifier");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v58;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v40;
                  *(_WORD *)&buf[22] = 2114;
                  v112 = v27;
                  _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get summary records for %{public}@, %{public}@", buf, 0x20u);

                }
                v81((uint64_t)v20, 0, v27);
              }

            }
            else
            {
              _HKInitializeLogging();
              v29 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v37 = v29;
                objc_msgSend(v19, "zoneIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v58;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v38;
                *(_WORD *)&buf[22] = 2114;
                v112 = v59;
                _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get transaction records for %{public}@, %{public}@", buf, 0x20u);

              }
              v81((uint64_t)v20, 0, v59);
            }

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v109, 16);
        }
        while (v14);
      }

      objc_msgSend(v57, "finishTask");
    }
    else
    {
      v61(v48, 0, (id)v102[5]);
    }

    _Block_object_dispose(&v95, 8);
    _Block_object_dispose(&v101, 8);

  }
  if (!*((_BYTE *)v67 + 24))
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v109 = 138543362;
      v110 = v58;
      _os_log_fault_impl(&dword_1B7802000, v41, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@ Completion block expected to be called synchronously was called asynchronously.", v109, 0xCu);
    }
  }
  v42 = (id)v75[5];
  v43 = v42;
  if (v42)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v42);
    else
      _HKLogDroppedError();
  }

  v44 = *((_BYTE *)v71 + 24) != 0;
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v44;
}

void __82__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_error___block_invoke(_QWORD *a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_185(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2F70];
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_error:userInfo:", 100, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __87__HDInsertSharedSummaryTransactionOperation_performWithProfile_transaction_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishTask");
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to save shared summary transaction, %{public}@", (uint8_t *)&v8, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "failTaskWithError:", v5);
  }

}

id __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_193(uint64_t a1, void *a2)
{
  return a2;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_195(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[6];
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  _QWORD v95[5];
  id v96;
  uint8_t v97[128];
  _BYTE buf[24];
  void *v99;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  _QWORD v104[8];

  v104[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_197);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (!v6)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v62 = *(_QWORD *)(a1 + 32);
        v63 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v63;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error fetching committed transactions %{public}@.", buf, 0x16u);
      }
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D298C8]);
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_199;
    v89[3] = &unk_1E6D0D160;
    v64 = v6;
    v90 = v6;
    v75 = v8;
    v91 = v75;
    v94 = *(id *)(a1 + 72);
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v92 = v11;
    v93 = v12;
    objc_msgSend(v10, "setDidFinish:", v89);
    v67 = v10;
    objc_msgSend(v10, "beginTask");
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = *(id *)(a1 + 56);
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    if (v79)
    {
      v78 = *(_QWORD *)v86;
      v65 = a1;
      v66 = v7;
      do
      {
        for (i = 0; i != v79; ++i)
        {
          if (*(_QWORD *)v86 != v78)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v14, "record");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "recordID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zoneID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0;
          v84 = 0;
          v18 = objc_msgSend(v17, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v84, &v83);
          v19 = v84;
          v20 = v83;

          if ((v18 & 1) != 0)
          {
            objc_msgSend(v14, "UUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "addObject:", v21);

            v22 = *(void **)(a1 + 64);
            v82[0] = MEMORY[0x1E0C809B0];
            v82[1] = 3221225472;
            v82[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_202;
            v82[3] = &unk_1E6CEA480;
            v82[4] = v14;
            objc_msgSend(v22, "hk_filter:", v82);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");
            objc_msgSend(v14, "summaryIdentifiers");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v24 == v26)
            {
              if (v7
                && (objc_msgSend(v14, "UUID"),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(),
                    v28 = objc_msgSend(v7, "containsObject:", v27),
                    v27,
                    v28))
              {
                _HKInitializeLogging();
                v29 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                {
                  v30 = *(_QWORD *)(a1 + 32);
                  v31 = v29;
                  objc_msgSend(v14, "UUID");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v30;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v32;
                  _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Transaction with UUID is already committed %{public}@. Skipping...", buf, 0x16u);

                }
              }
              else
              {
                objc_msgSend(v67, "beginTask");
                v37 = v23;
                v38 = *(_QWORD *)(a1 + 32);
                v39 = *(void **)(a1 + 48);
                v80[0] = MEMORY[0x1E0C809B0];
                v80[1] = 3221225472;
                v80[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_204;
                v80[3] = &unk_1E6CE7DB8;
                v80[4] = v38;
                v80[5] = v14;
                v81 = v67;
                v40 = v39;
                v41 = v14;
                v73 = v37;
                v76 = v37;
                v42 = v80;
                v43 = v42;
                if (v38)
                {
                  v71 = v42;
                  v72 = v40;
                  objc_msgSend(v41, "metadata");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v44)
                  {
                    v45 = (void *)MEMORY[0x1E0C99E60];
                    v104[0] = objc_opt_class();
                    v104[1] = objc_opt_class();
                    v104[2] = objc_opt_class();
                    v104[3] = objc_opt_class();
                    v104[4] = objc_opt_class();
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 5);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "setWithArray:", v46);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    v48 = (void *)MEMORY[0x1E0CB3710];
                    objc_msgSend(v41, "metadata");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v96 = 0;
                    objc_msgSend(v48, "unarchivedObjectOfClasses:fromData:error:", v47, v49, &v96);
                    v50 = objc_claimAutoreleasedReturnValue();
                    v74 = v96;

                    v69 = (void *)v50;
                    if (!v50)
                    {
                      _HKInitializeLogging();
                      v51 = *MEMORY[0x1E0CB5370];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        *(_QWORD *)&buf[4] = v38;
                        *(_WORD *)&buf[12] = 2114;
                        *(_QWORD *)&buf[14] = v74;
                        _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error unarchiving metadata %{public}@", buf, 0x16u);
                      }
                    }

                  }
                  else
                  {
                    v69 = 0;
                    v74 = 0;
                  }
                  v70 = v19;
                  v95[0] = MEMORY[0x1E0C809B0];
                  v95[1] = 3221225472;
                  v95[2] = __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke;
                  v95[3] = &unk_1E6CEA4A8;
                  v95[4] = v38;
                  objc_msgSend(v76, "hk_map:", v95);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  _HKInitializeLogging();
                  v52 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    v53 = v52;
                    objc_msgSend(v41, "UUID");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "UUIDString");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "sourceDeviceIdentifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v38;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v55;
                    *(_WORD *)&buf[22] = 2114;
                    v99 = v56;
                    _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Saving transaction with UUID %{public}@ and source device identifier %{public}@.", buf, 0x20u);

                  }
                  v40 = v72;
                  objc_msgSend(v72, "cloudSyncShimProvider");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "sharedSummariesShim");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "UUID");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "sourceDeviceIdentifier");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke_213;
                  v99 = &unk_1E6CEFB70;
                  v43 = v71;
                  v103 = v71;
                  v100 = v38;
                  v61 = v72;
                  v101 = v61;
                  v102 = v41;
                  objc_msgSend(v58, "prepareAndCommitRepository:transactionWithUUID:sourceDeviceIdentifier:metadata:sharedSummaries:completion:", v61, v59, v60, v69, v68, buf);

                  a1 = v65;
                  v7 = v66;
                  v19 = v70;
                }

                v23 = v73;
              }
            }
            else
            {
              _HKInitializeLogging();
              v35 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v36 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v36;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v14;
                _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Not all summary records were found for transaction %{public}@. Skipping...", buf, 0x16u);
              }
            }

          }
          else
          {
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v34 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v34;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v14;
              _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error: Zone is not a shared summary zone for transaction %{public}@", buf, 0x16u);
            }
          }

        }
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      }
      while (v79);
    }

    objc_msgSend(v67, "finishTask");
    v6 = v64;
  }

}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_199(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2_200;
  v11[3] = &unk_1E6D0D138;
  v3 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v3, "hk_filter:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "cloudSyncShimProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedSummariesShim");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_3;
    v7[3] = &unk_1E6CEFBC0;
    v7[4] = *(_QWORD *)(a1 + 56);
    v8 = v4;
    v9 = 0;
    v10 = *(id *)(a1 + 64);
    objc_msgSend(v6, "deleteTransactions:completion:", v8, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_2_200(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_3(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v7 = (void *)a1[5];
      v9 = v6;
      v10 = objc_msgSend(v7, "count");
      v11 = a1[6];
      v12 = 138543874;
      v13 = v8;
      v14 = 2048;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to prune %ld non-present transactions after insertion from cloud: %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_202(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "summaryIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

void __105__HDInsertSharedSummaryTransactionOperation__saveRecordsAndFinishWithProfile_repository_zone_completion___block_invoke_204(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v8;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error saving transaction %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "finishTask");

}

id __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
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
  void *v16;
  id v17;
  id v18;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (objc_class *)MEMORY[0x1E0CB6B58];
    v3 = a2;
    v17 = [v2 alloc];
    objc_msgSend(v3, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "package");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "compatibilityVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "authorizationIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v3, "objectTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "summaryData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (id)objc_msgSend(v17, "_initWithUUID:package:name:version:compatibilityVersion:authorizationIdentifiers:objectTypes:summaryData:", v16, v4, v5, v6, v7, v10, v13, v14);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

uint64_t __119__HDInsertSharedSummaryTransactionOperation__persistRecordsWithRepository_transactionRecord_summaryRecords_completion___block_invoke_213(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v4)(void);
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    v8 = v6;
    if (v5 && objc_msgSend(v7, "profileType") == 2)
    {
      objc_msgSend(v7, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "legacyRepositoryProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      HDCloudSyncLastPulledUpdateDate(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11 || objc_msgSend(v13, "hk_isAfterDate:", v11))
      {
        HDCloudSyncDidPullUpdateWithDate(v13, v10);
        objc_msgSend(v10, "cloudSyncManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "didCompleteSuccessfulPullOfUpdateWithDate:", v13);

      }
    }

    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v4();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertSharedSummaryTransactionOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDInsertSharedSummaryTransactionOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSummaryTransactionOperationZoneIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HDInsertSharedSummaryTransactionOperation initWithZoneIdentifier:](self, "initWithZoneIdentifier:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_zoneIdentifier, CFSTR("SharedSummaryTransactionOperationZoneIdentifierKey"));
}

- (HDCloudSyncZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
}

@end
