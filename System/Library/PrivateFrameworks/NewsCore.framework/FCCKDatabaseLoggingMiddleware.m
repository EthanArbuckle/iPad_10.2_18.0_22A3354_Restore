@implementation FCCKDatabaseLoggingMiddleware

- (_BYTE)initAllowingNilDesiredKeys:(_BYTE *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)FCCKDatabaseLoggingMiddleware;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[8] = a2;
  }
  return result;
}

- (FCCKDatabaseLoggingMiddleware)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKDatabaseLoggingMiddleware init]";
    v9 = 2080;
    v10 = "FCCKDatabaseLoggingMiddleware.m";
    v11 = 1024;
    v12 = 35;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKDatabaseLoggingMiddleware init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id location;
  _QWORD v82[4];
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  int v87;
  _BYTE aBlock[24];
  __int128 v89;
  id v90;
  uint64_t *v91;
  id v92[5];

  v92[2] = *(id *)MEMORY[0x1E0C80C00];
  v56 = a3;
  v7 = a4;
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = v7;
    if (!self || !self->_allowNilDesiredKeys)
    {
      objc_msgSend(v51, "desiredKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No desired keys given for CKQueryOperation: %@"), v51);
        *(_DWORD *)aBlock = 136315906;
        *(_QWORD *)&aBlock[4] = "-[FCCKDatabaseLoggingMiddleware database:willEnqueueOperation:error:]";
        *(_WORD *)&aBlock[12] = 2080;
        *(_QWORD *)&aBlock[14] = "FCCKDatabaseLoggingMiddleware.m";
        *(_WORD *)&aBlock[22] = 1024;
        LODWORD(v89) = 56;
        WORD2(v89) = 2114;
        *(_QWORD *)((char *)&v89 + 6) = v48;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", aBlock, 0x26u);

      }
    }
    objc_opt_class();
  }
  else
  {
    objc_opt_class();
    v51 = 0;
    if (!v7)
    {
LABEL_14:
      v50 = 0;
      goto LABEL_15;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v9 = v7;
  if (self && self->_allowNilDesiredKeys)
  {
    v50 = v9;
    v10 = v56;
    objc_opt_class();
    goto LABEL_17;
  }
  v50 = v9;
  objc_msgSend(v9, "desiredKeys");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45 == 0;

  if (v46 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No desired keys given for CKFetchRecordsOperation: %@"), v50);
    *(_DWORD *)aBlock = 136315906;
    *(_QWORD *)&aBlock[4] = "-[FCCKDatabaseLoggingMiddleware database:willEnqueueOperation:error:]";
    *(_WORD *)&aBlock[12] = 2080;
    *(_QWORD *)&aBlock[14] = "FCCKDatabaseLoggingMiddleware.m";
    *(_WORD *)&aBlock[22] = 1024;
    LODWORD(v89) = 62;
    WORD2(v89) = 2114;
    *(_QWORD *)((char *)&v89 + 6) = v47;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", aBlock, 0x26u);

  }
LABEL_15:
  v11 = v7;
  v12 = v56;
  if (!self)
    goto LABEL_81;
  objc_opt_class();
  if (!v7)
  {
    v13 = 0;
    goto LABEL_21;
  }
LABEL_17:
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v7;
  else
    v13 = 0;
LABEL_21:
  v54 = v13;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v7;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v7;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v53 = v16;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v7;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v52 = v17;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v7;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v7;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v55 = v20;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v7;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v7;
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v26 = v25;
  v84 = 0;
  v85 = &v84;
  v86 = 0x2020000000;
  v87 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();
  v29 = MEMORY[0x1E0C809B0];
  if ((v28 & 1) != 0)
  {
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke;
    v82[3] = &unk_1E4643350;
    v83 = v27;
    objc_msgSend(v7, "setRequestCompletedBlock:", v82);

  }
  objc_initWeak(&location, v7);
  *(_QWORD *)aBlock = v29;
  *(_QWORD *)&aBlock[8] = 3221225472;
  *(_QWORD *)&aBlock[16] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2;
  *(_QWORD *)&v89 = &unk_1E46433A0;
  objc_copyWeak(v92, &location);
  v92[1] = v26;
  v49 = v27;
  *((_QWORD *)&v89 + 1) = v49;
  v91 = &v84;
  v90 = v56;
  v30 = _Block_copy(aBlock);
  if (v54)
  {
    *((_DWORD *)v85 + 6) = 1;
    objc_msgSend(v54, "fetchRecordsCompletionBlock");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v29;
    v78[1] = 3221225472;
    v78[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_26;
    v78[3] = &unk_1E46433C8;
    v79 = v30;
    v32 = v31;
    v80 = v32;
    objc_msgSend(v54, "setFetchRecordsCompletionBlock:", v78);

  }
  if (v15)
  {
    *((_DWORD *)v85 + 6) = 2;
    objc_msgSend(v15, "modifyRecordsCompletionBlock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v29;
    v75[1] = 3221225472;
    v75[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2_28;
    v75[3] = &unk_1E46433F0;
    v76 = v30;
    v34 = v33;
    v77 = v34;
    objc_msgSend(v15, "setModifyRecordsCompletionBlock:", v75);

  }
  if (v53)
  {
    *((_DWORD *)v85 + 6) = 3;
    objc_msgSend(v53, "fetchRecordZonesCompletionBlock");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v29;
    v72[1] = 3221225472;
    v72[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3_30;
    v72[3] = &unk_1E46433C8;
    v73 = v30;
    v36 = v35;
    v74 = v36;
    objc_msgSend(v53, "setFetchRecordZonesCompletionBlock:", v72);

  }
  if (v52)
  {
    *((_DWORD *)v85 + 6) = 7;
    objc_msgSend(v52, "fetchRecordZoneChangesCompletionBlock");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v29;
    v69[1] = 3221225472;
    v69[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_4;
    v69[3] = &unk_1E4643418;
    v70 = v30;
    v38 = v37;
    v71 = v38;
    objc_msgSend(v52, "setFetchRecordZoneChangesCompletionBlock:", v69);

  }
  if (v19)
  {
    *((_DWORD *)v85 + 6) = 4;
    objc_msgSend(v19, "modifyRecordZonesCompletionBlock");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v29;
    v66[1] = 3221225472;
    v66[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_5;
    v66[3] = &unk_1E4643440;
    v67 = v30;
    v40 = v39;
    v68 = v40;
    objc_msgSend(v19, "setModifyRecordZonesCompletionBlock:", v66);

  }
  if (v55)
  {
    *((_DWORD *)v85 + 6) = 8;
    objc_msgSend(v55, "fetchDatabaseChangesCompletionBlock");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v63[0] = v29;
      v63[1] = 3221225472;
      v63[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_6;
      v63[3] = &unk_1E4643468;
      v64 = v30;
      v65 = v41;
      objc_msgSend(v55, "setFetchDatabaseChangesCompletionBlock:", v63);

    }
  }
  if (v22)
  {
    *((_DWORD *)v85 + 6) = 5;
    objc_msgSend(v22, "fetchSubscriptionCompletionBlock");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v60[0] = v29;
      v60[1] = 3221225472;
      v60[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_7;
      v60[3] = &unk_1E4642E10;
      v61 = v30;
      v62 = v42;
      objc_msgSend(v22, "setFetchSubscriptionCompletionBlock:", v60);

    }
  }
  if (v24)
  {
    *((_DWORD *)v85 + 6) = 6;
    objc_msgSend(v24, "modifySubscriptionsCompletionBlock");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v57[0] = v29;
      v57[1] = 3221225472;
      v57[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_8;
      v57[3] = &unk_1E4643440;
      v58 = v30;
      v59 = v43;
      objc_msgSend(v24, "setModifySubscriptionsCompletionBlock:", v57);

    }
  }

  objc_destroyWeak(v92);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v84, 8);
LABEL_81:

  return 0;
}

uint64_t __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3;
  v8[3] = &unk_1E4643378;
  v12 = *(_QWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v11 = v7;
  v6 = v3;
  FCPerformIfNonNil(WeakRetained, v8);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  FCNetworkEvent *v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  FCNetworkEvent *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id v38;
  double *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  double v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 - *(double *)(a1 + 64);
  v39 = (double *)a1;
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)FCOperationLog;
    if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (void *)objc_opt_class();
      v8 = v7;
      objc_msgSend(v38, "operationID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v45 = v7;
      v46 = 2114;
      v47 = v9;
      v48 = 2114;
      v49 = v12;
      v50 = 2048;
      v51 = v4;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ ran against %{public}@ with no requests, total time: %f", buf, 0x2Au);

    }
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(a1 + 32);
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v15 = [FCNetworkEvent alloc];
        v16 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)v39 + 7) + 8) + 24);
        objc_msgSend(v38, "operationID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v39[8];
        objc_msgSend(v38, "database");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "container");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "containerIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FCNetworkEvent initWithType:ckRequestInfo:operationID:startTime:containerName:error:](v15, "initWithType:ckRequestInfo:operationID:startTime:containerName:error:", v16, v14, v17, v21, *((_QWORD *)v39 + 5), v18);

        v23 = (void *)FCOperationLog;
        if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          v25 = (void *)objc_opt_class();
          v26 = v25;
          objc_msgSend(v38, "operationID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "database");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "container");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "containerIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "requestUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCNetworkEvent totalDuration](v22, "totalDuration");
          *(_DWORD *)buf = 138544642;
          v45 = v25;
          v46 = 2114;
          v47 = v27;
          v48 = 2114;
          v49 = v30;
          v50 = 2114;
          v51 = *(double *)&v31;
          v52 = 2048;
          v53 = v32;
          v54 = 2048;
          v55 = v4;
          _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ ran against %{public}@ with request UUID %{public}@, network time: %f, total time: %f", buf, 0x3Eu);

        }
        v33 = (_QWORD *)*((_QWORD *)v39 + 6);
        if (v33)
          v33 = (_QWORD *)v33[3];
        v34 = v33;
        objc_msgSend(v34, "logNetworkEvent:", v22);

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v37);
  }

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_2_28(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_3_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v7 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, uint64_t, id))(v8 + 16))(v8, v9, a3, v7);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __65__FCCKDatabaseLoggingMiddleware__addLoggersToOperation_database___block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);

}

@end
