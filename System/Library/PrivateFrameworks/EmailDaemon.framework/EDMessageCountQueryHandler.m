@implementation EDMessageCountQueryHandler

void __45__EDMessageCountQueryHandler_didSyncMailbox___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = 0;

    }
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "initWithFormat:", CFSTR("Finished syncing mailbox %@"), v5);

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), v6);
  }
}

void __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFRunLoop *Main;
  _QWORD v17[4];
  id v18;
  _BYTE buf[12];
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 112);
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(v5, "label");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E94A4508;
    v9 = *(_QWORD *)(a1 + 40);
    if (v6)
      v8 = (const __CFString *)v6;
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v3;
    v20 = 2114;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Started syncing mailbox %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  v10 = *(_QWORD **)(a1 + 32);
  v11 = (void *)v10[4];
  if (v11)
  {
    objc_msgSend(v11, "invalidate");
    v10 = *(_QWORD **)(a1 + 32);
  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v10);
  v12 = (void *)MEMORY[0x1E0C99E88];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke_67;
  v17[3] = &unk_1E949DB28;
  objc_copyWeak(&v18, (id *)buf);
  objc_msgSend(v12, "timerWithTimeInterval:repeats:block:", 0, v17, 300.0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 32);
  *(_QWORD *)(v14 + 32) = v13;

  Main = CFRunLoopGetMain();
  CFRunLoopAddTimer(Main, *(CFRunLoopTimerRef *)(*(_QWORD *)(a1 + 32) + 32), (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  void *v12;
  _QWORD *v13;
  id v14;
  os_unfair_lock_s *v15;
  unint64_t *v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(void **)(v3 + 112);
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(v5, "label");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E94A4508;
    if (v6)
      v8 = (const __CFString *)v6;
    *(_DWORD *)buf = 134218242;
    v31 = v3;
    v32 = 2114;
    v33 = v8;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "<%p: %{public}@> Firing count calculation", buf, 0x16u);

  }
  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
    v9 = (_QWORD *)v9[19];
  v10 = v9;
  v11 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 72));
  -[EDMessageCountQueryHandler expandedQuery](*(os_unfair_lock_s **)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_49;
  v27[3] = &unk_1E949DAB0;
  v27[4] = *(_QWORD *)(a1 + 32);
  v13 = v10;
  v28 = v13;
  v14 = v12;
  v29 = v14;
  objc_msgSend(v13, "performDatabaseReadBlock:", v27);
  v15 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 96);
  os_unfair_lock_lock(v15);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllIndexes");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllIndexes");
  os_unfair_lock_unlock(v15);
  v16 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 72);
  do
  {
    v17 = __ldaxr(v16);
    v18 = v17 >= v11;
    v19 = v17 - v11;
  }
  while (__stlxr(v19, v16));
  if (v19 != 0 && v18)
    -[EDMessageCountQueryHandler _fireCountCalculation](*(_QWORD *)(a1 + 32));
  -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), CFSTR("full count"));
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      v22 = *(void **)(v21 + 112);
    else
      v22 = 0;
    v23 = v22;
    objc_msgSend(v23, "label");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    v26 = &stru_1E94A4508;
    if (v24)
      v26 = (const __CFString *)v24;
    *(_DWORD *)buf = 134218242;
    v31 = v21;
    v32 = 2114;
    v33 = v26;
    _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_INFO, "<%p: %{public}@> Finished count calculation", buf, 0x16u);

  }
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__EDMessageCountQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_49 != -1)
    dispatch_once(&log_onceToken_49, block);
  return (OS_os_log *)(id)log_log_49;
}

- (void)_notifyObserverWithLogMessage:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id WeakRetained;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  id v50;
  id v51;
  NSObject *log;
  id *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  NSObject *v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id location;
  uint64_t v69;
  _QWORD v70[7];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  const __CFString *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 216);
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v5 = *(void **)(a1 + 8);
    v6 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke;
    v70[3] = &unk_1E949DB00;
    v70[4] = &v79;
    v70[5] = &v75;
    v70[6] = &v71;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v70);
    v7 = v80[3];
    v8 = v76[3];
    v9 = v72[3];
    v10 = objc_msgSend(*(id *)(a1 + 16), "count");
    v11 = v7 + v4 + v8 - v9;
    if (v10)
    {
      +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v3;
        v60 = v4;
        v54 = v11;
        v53 = (id *)*(id *)(a1 + 112);
        objc_msgSend(v53, "label");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (const __CFString *)v13;
        else
          v15 = &stru_1E94A4508;
        v16 = v80[3];
        v17 = v76[3];
        v18 = (void *)v72[3];
        queryDescription((void *)a1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        mailboxScopeDescription((void *)a1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220547;
        v84 = a1;
        v85 = 2114;
        v86 = v15;
        v87 = 2114;
        v88 = v57;
        v89 = 2048;
        v90 = v10;
        v91 = 2048;
        v92 = v54;
        v93 = 2048;
        v94 = v60;
        v95 = 2048;
        v96 = v16;
        v97 = 2048;
        v98 = v17;
        v99 = 2048;
        v100 = v18;
        v3 = v57;
        v101 = 2113;
        v102 = v19;
        v103 = 2114;
        v104 = v20;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@ (%lu mailboxes being synced): %lld = %lld + %lld + (%lld - %lld)\n%{private}@\n%{public}@", buf, 0x70u);

      }
      goto LABEL_28;
    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    v69 = 0;
    objc_initWeak(&location, (id)a1);
    v21 = *(id *)(a1 + 176);
    v66[0] = v6;
    v66[1] = 3221225472;
    v66[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_61;
    v66[3] = &unk_1E949C4A8;
    objc_copyWeak(&v67, &location);
    objc_msgSend(v21, "updateWithBlock:unacknowledgedUpdatesCount:", v66, &v69);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "label");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v6;
      v63[1] = 3221225472;
      v63[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_65;
      v63[3] = &unk_1E949AD60;
      objc_copyWeak(&v65, &location);
      v61 = v4;
      v64 = v23;
      log = v64;
      objc_msgSend(v22, "addInvocationBlock:", v63);
      +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v22;
        v58 = v3;
        v25 = v11;
        v50 = *(id *)(a1 + 112);
        objc_msgSend(v50, "label");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v26)
          v28 = (const __CFString *)v26;
        else
          v28 = &stru_1E94A4508;
        v29 = v80[3];
        v30 = v76[3];
        v31 = v72[3];
        queryDescription((void *)a1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        mailboxScopeDescription((void *)a1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220547;
        v84 = a1;
        v85 = 2114;
        v86 = v28;
        v87 = 2114;
        v88 = v58;
        v89 = 2048;
        v90 = v25;
        v91 = 2048;
        v92 = v61;
        v93 = 2048;
        v94 = v29;
        v95 = 2048;
        v96 = v30;
        v11 = v25;
        v97 = 2048;
        v98 = v31;
        v3 = v58;
        v99 = 2114;
        v22 = v55;
        v100 = v55;
        v101 = 2113;
        v102 = v32;
        v103 = 2114;
        v104 = v33;
        _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@: %lld = %lld + %lld + (%lld - %lld), %{public}@\n%{private}@\n%{public}@", buf, 0x70u);

      }
      if (v11 < 0)
      {
        +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v46 = *(id *)(a1 + 112);
          objc_msgSend(v46, "label");
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (void *)v47;
          v49 = &stru_1E94A4508;
          if (v47)
            v49 = (const __CFString *)v47;
          *(_DWORD *)buf = 134218242;
          v84 = a1;
          v85 = 2114;
          v86 = v49;
          _os_log_error_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_ERROR, "<%p: %{public}@> Total count is negative.", buf, 0x16u);

        }
        v11 = 0;
      }
      if ((objc_msgSend(*(id *)(a1 + 168), "isCanceled") & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
        objc_msgSend(WeakRetained, "countDidChange:acknowledgementToken:", v11, v22);

      }
      objc_destroyWeak(&v65);
    }
    else
    {
      +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
      v36 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        objc_destroyWeak(&v67);
        objc_destroyWeak(&location);
LABEL_28:
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);
        goto LABEL_29;
      }
      v59 = v3;
      v62 = v4;
      v56 = v11;
      log = v36;
      v51 = *(id *)(a1 + 112);
      objc_msgSend(v51, "label");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (v37)
        v39 = (const __CFString *)v37;
      else
        v39 = &stru_1E94A4508;
      v40 = v69;
      v41 = v80[3];
      v42 = v76[3];
      v43 = (void *)v72[3];
      queryDescription((void *)a1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      mailboxScopeDescription((void *)a1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134220547;
      v84 = a1;
      v85 = 2114;
      v86 = v39;
      v87 = 2114;
      v88 = v59;
      v89 = 2048;
      v90 = v40;
      v3 = v59;
      v91 = 2048;
      v92 = v56;
      v93 = 2048;
      v94 = v62;
      v95 = 2048;
      v96 = v41;
      v97 = 2048;
      v98 = v42;
      v99 = 2048;
      v100 = v43;
      v101 = 2113;
      v102 = v44;
      v103 = 2114;
      v104 = v45;
      _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> %{public}@ (%lu unacknowledged updates): %lld = %lld + %lld + (%lld - %lld)\n%{private}@\n%{public}@", buf, 0x70u);

    }
    v36 = log;
    goto LABEL_27;
  }
LABEL_29:

}

- (os_unfair_lock_s)expandedQuery
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 25;
    os_unfair_lock_lock(a1 + 25);
    v3 = *(void **)&v1[12]._os_unfair_lock_opaque;
    if (!v3)
    {
      -[EDMessageCountQueryHandler _locked_expandedQueryWithReason:]((uint64_t)v1, CFSTR("starting"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)&v1[12]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[12]._os_unfair_lock_opaque = v4;

      v3 = *(void **)&v1[12]._os_unfair_lock_opaque;
    }
    v1 = v3;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)_locked_expandedQueryWithReason:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 112);
    v5 = *(id *)(a1 + 152);
    objc_msgSend(v5, "queryWithExpandedMailboxesFromQuery:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "label");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicate");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = &stru_1E94A4508;
      v13 = 134218754;
      if (v8)
        v11 = v8;
      v14 = a1;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v3;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@ count handler with query: %@", (uint8_t *)&v13, 0x2Au);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7 refireDebounceInterval:(double)a8
{
  id v15;
  id v16;
  id v17;
  EDMessageCountQueryHandler *v18;
  void *v19;
  uint64_t v20;
  EFAssertableScheduler *scheduler;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSPredicate *predicateIgnoringFlags;
  NSMutableDictionary *v29;
  NSMutableDictionary *serverCounts;
  NSMutableSet *v31;
  NSMutableSet *mailboxesBeingSynced;
  void *v33;
  uint64_t v34;
  EMObjectID *mailboxObserverID;
  void *v36;
  EFMutableInt64Set *v37;
  EFMutableInt64Set *seenMessageIDs;
  EFMutableInt64Set *v39;
  EFMutableInt64Set *newMessageIDs;
  EDUpdateThrottler *v41;
  void *v42;
  uint64_t v43;
  EDUpdateThrottler *updateThrottler;
  EDMessageQueryEvaluator *v45;
  EDMessageQueryEvaluator *queryEvaluator;
  uint64_t v47;
  NSString *pendingFlagChangesKey;
  uint64_t v49;
  NSString *pendingCategorizationChangesKey;
  id v51;
  EDMessageCountQueryHandler *v52;
  uint64_t v53;
  EFDebouncer *refireDebouncer;
  void *v55;
  EDMessageCountQueryHandler *v56;
  uint64_t v57;
  EFCancelationToken *cancelationToken;
  id v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  EFListStateCapturer *stateCapturer;
  void *v64;
  void *v65;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  id v70;
  id v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  _QWORD v73[4];
  id v74;
  EDMessageCountQueryHandler *v75;
  _QWORD v76[4];
  uint64_t (*v77)(uint64_t, uint64_t);
  EDMessageCountQueryHandler *v78;
  objc_super v79;
  _QWORD v80[5];
  _QWORD v81[3];
  _BYTE buf[24];
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v70 = a4;
  v71 = a5;
  v16 = a6;
  v17 = a7;
  v79.receiver = self;
  v79.super_class = (Class)EDMessageCountQueryHandler;
  v18 = -[EDMessageCountQueryHandler init](&v79, sel_init);
  if (v18)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v83 = __Block_byref_object_copy__15;
    v84 = __Block_byref_object_dispose__15;
    v85 = 0;
    defaultSchedulers();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __checkOutScheduler_block_invoke;
    v80[3] = &unk_1E949DB50;
    v80[4] = buf;
    objc_msgSend(v19, "performWhileLocked:", v80);

    v72 = (uint64_t (*)(uint64_t, uint64_t))*(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    objc_msgSend(MEMORY[0x1E0D1F080], "assertableSchedulerWithScheduler:", v72);
    v20 = objc_claimAutoreleasedReturnValue();
    scheduler = v18->_scheduler;
    v18->_scheduler = (EFAssertableScheduler *)v20;

    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v15, "label");
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = (void *)v67;
      v69 = &stru_1E94A4508;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v18;
      if (v67)
        v69 = (const __CFString *)v67;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2112;
      v83 = v72;
      _os_log_debug_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEBUG, "<%p: %{public}@> Checking out scheduler %@", buf, 0x20u);

    }
    objc_storeStrong((id *)&v18->_query, a3);
    v18->_expandedQueryLock._os_unfair_lock_opaque = 0;
    v23 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v15, "predicate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0D1DDC8];
    v81[0] = *MEMORY[0x1E0D1DD80];
    v81[1] = v25;
    v81[2] = *MEMORY[0x1E0D1DD78];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predicateFromPredicate:ignoringKeyPaths:", v24, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    predicateIgnoringFlags = v18->_predicateIgnoringFlags;
    v18->_predicateIgnoringFlags = (NSPredicate *)v27;

    objc_storeStrong((id *)&v18->_serverCountMailboxScope, a4);
    objc_storeWeak((id *)&v18->_resultsObserver, v17);
    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serverCounts = v18->_serverCounts;
    v18->_serverCounts = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    mailboxesBeingSynced = v18->_mailboxesBeingSynced;
    v18->_mailboxesBeingSynced = v31;

    objc_storeStrong((id *)&v18->_messagePersistence, a5);
    objc_storeStrong((id *)&v18->_hookRegistry, a6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MailboxObserver-%@"), objc_opt_class(), v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2A8]), "initWithRepresentedObjectID:", v33);
    mailboxObserverID = v18->_mailboxObserverID;
    v18->_mailboxObserverID = (EMObjectID *)v34;

    -[EDMessagePersistence mailboxPersistence](v18->_messagePersistence, "mailboxPersistence");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addChangeObserver:withIdentifier:", v18, v18->_mailboxObserverID);

    v18->_seenMessageIDsLock._os_unfair_lock_opaque = 0;
    v37 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E0D1EF08]);
    seenMessageIDs = v18->_seenMessageIDs;
    v18->_seenMessageIDs = v37;

    v39 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E0D1EF08]);
    newMessageIDs = v18->_newMessageIDs;
    v18->_newMessageIDs = v39;

    v41 = [EDUpdateThrottler alloc];
    objc_msgSend(v15, "label");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[EDUpdateThrottler initWithName:delayInterval:scalingFactor:](v41, "initWithName:delayInterval:scalingFactor:", v42, 10, 1.0);
    updateThrottler = v18->_updateThrottler;
    v18->_updateThrottler = (EDUpdateThrottler *)v43;

    v45 = -[EDMessageQueryEvaluator initWithQuery:messagePersistence:]([EDMessageQueryEvaluator alloc], "initWithQuery:messagePersistence:", v15, v18->_messagePersistence);
    queryEvaluator = v18->_queryEvaluator;
    v18->_queryEvaluator = v45;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingFlagChangesKey-%p"), objc_opt_class(), v18);
    v47 = objc_claimAutoreleasedReturnValue();
    pendingFlagChangesKey = v18->_pendingFlagChangesKey;
    v18->_pendingFlagChangesKey = (NSString *)v47;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-MessagesPendingCategorizationChangesKey-%p"), objc_opt_class(), v18);
    v49 = objc_claimAutoreleasedReturnValue();
    pendingCategorizationChangesKey = v18->_pendingCategorizationChangesKey;
    v18->_pendingCategorizationChangesKey = (NSString *)v49;

    if (a8 > 0.0)
    {
      v51 = objc_alloc(MEMORY[0x1E0D1EEA0]);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke;
      v76[3] = &unk_1E949DA60;
      v77 = v72;
      v52 = v18;
      v78 = v52;
      v53 = objc_msgSend(v51, "initWithTimeInterval:scheduler:startAfter:block:", v77, 1, v76, a8);
      refireDebouncer = v52->_refireDebouncer;
      v52->_refireDebouncer = (EFDebouncer *)v53;

    }
    -[EDPersistenceHookRegistry registerMailboxChangeHookResponder:](v18->_hookRegistry, "registerMailboxChangeHookResponder:", v18);
    -[EDPersistenceHookRegistry registerMessageChangeHookResponder:](v18->_hookRegistry, "registerMessageChangeHookResponder:", v18);
    -[EDPersistenceHookRegistry registerCategoryChangeHookResponder:](v18->_hookRegistry, "registerCategoryChangeHookResponder:", v18);
    v55 = (void *)MEMORY[0x1E0D1EE90];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_3;
    v73[3] = &unk_1E949B6D0;
    v74 = v16;
    v56 = v18;
    v75 = v56;
    objc_msgSend(v55, "tokenWithCancelationBlock:", v73);
    v57 = objc_claimAutoreleasedReturnValue();
    cancelationToken = v56->_cancelationToken;
    v56->_cancelationToken = (EFCancelationToken *)v57;

    v59 = objc_alloc(MEMORY[0x1E0D1EEE8]);
    v60 = (objc_class *)objc_opt_class();
    NSStringFromClass(v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v59, "initWithTitle:itemName:headLimit:tailLimit:delegate:", v61, CFSTR("Messages"), 20, 0, v56);
    stateCapturer = v56->_stateCapturer;
    v56->_stateCapturer = (EFListStateCapturer *)v62;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addObserver:selector:name:object:", v56, sel_willSyncMailbox_, CFSTR("EDNotificationWillSyncMailbox"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObserver:selector:name:object:", v56, sel_didSyncMailbox_, CFSTR("EDNotificationDidSyncMailbox"), 0);

    -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:]((uint64_t)v56, CFSTR("Initialization"));
  }

  return v18;
}

- (EDMessageCountQueryHandler)initWithQuery:(id)a3 serverCountMailboxScope:(id)a4 messagePersistence:(id)a5 hookRegistry:(id)a6 observer:(id)a7
{
  return -[EDMessageCountQueryHandler initWithQuery:serverCountMailboxScope:messagePersistence:hookRegistry:observer:refireDebounceInterval:](self, "initWithQuery:serverCountMailboxScope:messagePersistence:hookRegistry:observer:refireDebounceInterval:", a3, a4, a5, a6, a7, 0.0);
}

- (void)_scheduleCountCalculationWithReason:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    if (*(_QWORD *)(a1 + 192))
      objc_msgSend(*(id *)(a1 + 192), "debounceResult:", v3);
    else
      -[EDMessageCountQueryHandler _reallyScheduleCountCalculationWithReason:](a1, v3);
    v3 = v4;
  }

}

- (void)_reallyScheduleCountCalculationWithReason:(uint64_t)a1
{
  id v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (unint64_t *)(a1 + 72);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    if (!v5)
    {
      +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(id *)(a1 + 112);
        objc_msgSend(v7, "label");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = &stru_1E94A4508;
        v11 = 134218498;
        if (v8)
          v10 = (const __CFString *)v8;
        v12 = a1;
        v13 = 2114;
        v14 = v10;
        v15 = 2112;
        v16 = v3;
        _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Scheduling count calculation with reason %@", (uint8_t *)&v11, 0x20u);

      }
      -[EDMessageCountQueryHandler _fireCountCalculation](a1);
    }
  }

}

- (void)_fireCountCalculation
{
  id v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = *(id *)(a1 + 104);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke;
    v3[3] = &unk_1E949AEB8;
    v3[4] = a1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

- (void)willSyncMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMMailboxScope *v7;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v9;
  void *v10;
  int v11;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EDNotificationKeyMailbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    v7 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    v7 = 0;
    messagePersistence = 0;
  }
  v9 = messagePersistence;
  -[EDMessagePersistence mailboxPersistence](v9, "mailboxPersistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EMMailboxScope scopeContainsMailboxObjectID:mailboxTypeResolver:](v7, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v6, v10);

  if (v11)
  {
    if (self)
      scheduler = self->_scheduler;
    else
      scheduler = 0;
    v13 = scheduler;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke;
    v14[3] = &unk_1E949B6D0;
    v14[4] = self;
    v15 = v6;
    -[EFAssertableScheduler performBlock:](v13, "performBlock:", v14);

  }
}

- (void)didSyncMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EDNotificationKeyMailbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    scheduler = self->_scheduler;
  else
    scheduler = 0;
  v8 = scheduler;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__EDMessageCountQueryHandler_didSyncMailbox___block_invoke;
  v10[3] = &unk_1E949B6D0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[EFAssertableScheduler performBlock:](v8, "performBlock:", v10);

}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v4[1];
    v6 = v4[2];
    v5 = v4[3];
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  if (v6 != *MEMORY[0x1E0D1DC58] && v5 != *MEMORY[0x1E0D1DC58])
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += v6;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v5;
  }

}

uint64_t __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterHookResponder:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  EFAssertableScheduler *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  EMQuery *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  uint8_t buf[4];
  EDMessageCountQueryHandler *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSTimer invalidate](self->_mailboxSyncTimer, "invalidate");
  v3 = self->_scheduler;
  -[EFAssertableScheduler scheduler](v3, "scheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = self->_query;
    -[EMQuery label](v10, "label");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_1E94A4508;
    *(_DWORD *)buf = 134218498;
    if (v11)
      v13 = (const __CFString *)v11;
    v16 = self;
    v17 = 2114;
    v18 = v13;
    v19 = 2112;
    v20 = v4;
    _os_log_debug_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEBUG, "<%p: %{public}@> Checking in scheduler %@", buf, 0x20u);

  }
  if (v4)
    checkInScheduler(v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[EDMessagePersistence mailboxPersistence](self->_messagePersistence, "mailboxPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeChangeObserverWithIdentifier:", self->_mailboxObserverID);

  v8 = (id)EFAtomicObjectRelease();
  v9 = (id)EFAtomicObjectRelease();

  v14.receiver = self;
  v14.super_class = (Class)EDMessageCountQueryHandler;
  -[EDMessageCountQueryHandler dealloc](&v14, sel_dealloc);
}

- (void)cancel
{
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v4;
  void *v5;
  _QWORD v6[5];

  if (self)
    scheduler = self->_scheduler;
  else
    scheduler = 0;
  v4 = scheduler;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__EDMessageCountQueryHandler_cancel__block_invoke;
  v6[3] = &unk_1E949AEB8;
  v6[4] = self;
  -[EFAssertableScheduler performBlock:](v4, "performBlock:", v6);

  -[EDMessagePersistence mailboxPersistence](self->_messagePersistence, "mailboxPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeChangeObserverWithIdentifier:", self->_mailboxObserverID);

  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCategorizationChangesKey, 0);
  objc_storeStrong((id *)&self->_pendingFlagChangesKey, 0);
  objc_storeStrong((id *)&self->_refireDebouncer, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_updateThrottler, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_destroyWeak((id *)&self->_resultsObserver);
  objc_storeStrong((id *)&self->_queryEvaluator, 0);
  objc_storeStrong((id *)&self->_serverCountMailboxScope, 0);
  objc_storeStrong((id *)&self->_predicateIgnoringFlags, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_newMessageIDs, 0);
  objc_storeStrong((id *)&self->_seenMessageIDs, 0);
  objc_storeStrong((id *)&self->_expandedQuery, 0);
  objc_storeStrong((id *)&self->_mailboxObserverID, 0);
  objc_storeStrong((id *)&self->_mailboxSyncTimer, 0);
  objc_storeStrong((id *)&self->_mailboxesBeingSynced, 0);
  objc_storeStrong((id *)&self->_serverCounts, 0);
}

void __33__EDMessageCountQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_49;
  log_log_49 = (uint64_t)v1;

}

uint64_t __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_2(uint64_t a1)
{
  return -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), CFSTR("All updates acknowledged"));
}

void __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_2;
  v6[3] = &unk_1E949B6D0;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void __132__EDMessageCountQueryHandler_initWithQuery_serverCountMailboxScope_messagePersistence_hookRegistry_observer_refireDebounceInterval___block_invoke_2(uint64_t a1)
{
  -[EDMessageCountQueryHandler _reallyScheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __36__EDMessageCountQueryHandler_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

- (void)test_tearDown
{
  EFAssertableScheduler *scheduler;
  void *v5;
  EFAssertableScheduler *v6;
  EDMessagePersistence *messagePersistence;
  void *v8;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMessageCountQueryHandler.m"), 252, CFSTR("%s can only be called from unit tests"), "-[EDMessageCountQueryHandler test_tearDown]");

  }
  -[EDMessageCountQueryHandler cancel](self, "cancel");
  if (self)
    scheduler = self->_scheduler;
  else
    scheduler = 0;
  -[EFAssertableScheduler scheduler](scheduler, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  checkInScheduler(v5);

  if (self)
    v6 = self->_scheduler;
  else
    v6 = 0;
  -[EFAssertableScheduler stopAndWait](v6, "stopAndWait");
  messagePersistence = self->_messagePersistence;
  self->_messagePersistence = 0;

}

- (void)_resetExpandedQuery
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 100);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 100));
    -[EDMessageCountQueryHandler _locked_expandedQueryWithReason:](a1, CFSTR("resetting"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v3;

    os_unfair_lock_unlock(v2);
  }
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_49(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = mach_absolute_time();
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 112);
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "label");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E94A4508;
    *(_DWORD *)buf = 134218498;
    if (v9)
      v11 = (const __CFString *)v9;
    v28 = v6;
    v29 = 2114;
    v30 = v11;
    v31 = 2048;
    v32 = *(double *)&a2;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> recalculating unread counts (generation %lld)", buf, 0x20u);

  }
  v12 = objc_msgSend(*(id *)(a1 + 40), "countOfMessagesMatchingQuery:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = v12;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(void **)(v14 + 112);
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v16, "label");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = mach_absolute_time();
    if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_0 != -1)
      dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_0, &__block_literal_global_332);
    v19 = &stru_1E94A4508;
    if (v17)
      v19 = v17;
    *(_DWORD *)buf = 134218754;
    v28 = v14;
    v29 = 2114;
    v30 = v19;
    v31 = 2048;
    v32 = (double)((v18 - v4)
                 * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_0
                 / *(unsigned int *)algn_1ED11C72C)
        / 1000000000.0;
    v33 = 2048;
    v34 = v12;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_INFO, "<%p: %{public}@> query took %.04fs localCount:%ld", buf, 0x2Au);

  }
  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    v21 = *(id *)(v20 + 128);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)(a1 + 32);
      if (v23)
        v24 = *(void **)(v23 + 152);
      else
        v24 = 0;
      objc_msgSend(v24, "mailboxPersistence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_50;
      v26[3] = &unk_1E949DA88;
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v25, "serverCountsForMailboxScope:block:", v22, v26);

    }
  }
}

void __51__EDMessageCountQueryHandler__fireCountCalculation__block_invoke_50(uint64_t a1, void *a2, int64_t a3, int64_t a4, int64_t a5)
{
  _EDMailboxServerCount *v9;
  _EDMailboxServerCount *v10;
  id v11;

  v11 = a2;
  v9 = objc_alloc_init(_EDMailboxServerCount);
  v10 = v9;
  if (v9)
  {
    v9->_serverCount = a3;
    v9->_mostRecentStatusCount = a4;
    v9->_lastSyncStatusCount = a5;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v9, v11);

}

- (void)_incrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1 && a2)
  {
    v10 = objc_msgSend(v8, "earliestGeneration");
    v11 = objc_msgSend(v9, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(id *)(a1 + 112);
      objc_msgSend(v13, "label");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219266;
      if (v14)
        v16 = (const __CFString *)v14;
      v24 = a1;
      v25 = 2114;
      v26 = v16;
      v27 = 2114;
      v28 = v7;
      v29 = 2048;
      v30 = a2;
      v31 = 2048;
      v32 = v10;
      v33 = 2048;
      v34 = v11;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@: Scheduling increment of %lld (window: %llu:%llu)", buf, 0x3Eu);

    }
    v17 = *(id *)(a1 + 104);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__EDMessageCountQueryHandler__incrementLocalCount_logMessage_generationWindow___block_invoke;
    v18[3] = &unk_1E949DAD8;
    v20 = v11;
    v21 = a2;
    v18[4] = a1;
    v19 = v7;
    v22 = v10;
    objc_msgSend(v17, "performBlock:", v18);

  }
}

void __79__EDMessageCountQueryHandler__incrementLocalCount_logMessage_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(a1 + 48) <= v3)
  {
    v4 = *(_QWORD *)(a1 + 64) > v3;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (v7)
          v8 = *(void **)(v7 + 112);
        else
          v8 = 0;
        v9 = v8;
        objc_msgSend(v9, "label");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = &stru_1E94A4508;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v10)
          v12 = (const __CFString *)v10;
        v14 = *(_QWORD *)(a1 + 64);
        v15 = *(_QWORD *)(a1 + 48);
        v25 = 134219010;
        v26 = v7;
        v27 = 2114;
        v28 = v12;
        v29 = 2048;
        v30 = v13;
        v31 = 2048;
        v32 = v14;
        v33 = 2048;
        v34 = v15;
        _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> increment occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", (uint8_t *)&v25, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Incrementing local counts"));
    }
    else
    {
      if (v6)
      {
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
          v17 = *(void **)(v16 + 112);
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v18, "label");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = &stru_1E94A4508;
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v19)
          v21 = (const __CFString *)v19;
        v23 = *(_QWORD *)(a1 + 64);
        v24 = *(_QWORD *)(a1 + 48);
        v25 = 134219010;
        v26 = v16;
        v27 = 2114;
        v28 = v21;
        v29 = 2048;
        v30 = v22;
        v31 = 2048;
        v32 = v23;
        v33 = 2048;
        v34 = v24;
        _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> increment ignored due to newer resync generation (ours: %llu, window: %llu:%llu)", (uint8_t *)&v25, 0x34u);

      }
    }
  }
  else
  {
    *(_QWORD *)(v2 + 216) += *(_QWORD *)(a1 + 56);
    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (void)_decrementLocalCount:(void *)a3 logMessage:(void *)a4 generationWindow:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1 && a2)
  {
    v10 = objc_msgSend(v8, "earliestGeneration");
    v11 = objc_msgSend(v9, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(id *)(a1 + 112);
      objc_msgSend(v13, "label");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219266;
      if (v14)
        v16 = (const __CFString *)v14;
      v24 = a1;
      v25 = 2114;
      v26 = v16;
      v27 = 2114;
      v28 = v7;
      v29 = 2048;
      v30 = a2;
      v31 = 2048;
      v32 = v10;
      v33 = 2048;
      v34 = v11;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@: Scheduling decrement of %lld (window: %llu:%llu)", buf, 0x3Eu);

    }
    v17 = *(id *)(a1 + 104);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__EDMessageCountQueryHandler__decrementLocalCount_logMessage_generationWindow___block_invoke;
    v18[3] = &unk_1E949DAD8;
    v20 = v11;
    v21 = a2;
    v18[4] = a1;
    v19 = v7;
    v22 = v10;
    objc_msgSend(v17, "performBlock:", v18);

  }
}

void __79__EDMessageCountQueryHandler__decrementLocalCount_logMessage_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(a1 + 48) <= v3)
  {
    v4 = *(_QWORD *)(a1 + 64) > v3;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (v7)
          v8 = *(void **)(v7 + 112);
        else
          v8 = 0;
        v9 = v8;
        objc_msgSend(v9, "label");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = &stru_1E94A4508;
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v10)
          v12 = (const __CFString *)v10;
        v14 = *(_QWORD *)(a1 + 64);
        v15 = *(_QWORD *)(a1 + 48);
        v25 = 134219010;
        v26 = v7;
        v27 = 2114;
        v28 = v12;
        v29 = 2048;
        v30 = v13;
        v31 = 2048;
        v32 = v14;
        v33 = 2048;
        v34 = v15;
        _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> decrement occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", (uint8_t *)&v25, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Decrementing local counts"));
    }
    else
    {
      if (v6)
      {
        v16 = *(_QWORD *)(a1 + 32);
        if (v16)
          v17 = *(void **)(v16 + 112);
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v18, "label");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        v21 = &stru_1E94A4508;
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v19)
          v21 = (const __CFString *)v19;
        v23 = *(_QWORD *)(a1 + 64);
        v24 = *(_QWORD *)(a1 + 48);
        v25 = 134219010;
        v26 = v16;
        v27 = 2114;
        v28 = v21;
        v29 = 2048;
        v30 = v22;
        v31 = 2048;
        v32 = v23;
        v33 = 2048;
        v34 = v24;
        _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "<%p: %{public}@> decrement ignored due to newer resync generation (ours: %llu, window: %llu:%llu)", (uint8_t *)&v25, 0x34u);

      }
    }
  }
  else
  {
    *(_QWORD *)(v2 + 216) -= *(_QWORD *)(a1 + 56);
    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_61(uint64_t a1, int a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  _QWORD v6[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && a2)
  {
    v5 = WeakRetained[13];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_2;
    v6[3] = &unk_1E949AEB8;
    v6[4] = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

void __60__EDMessageCountQueryHandler__notifyObserverWithLogMessage___block_invoke_65(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (WeakRetained)
      v4 = (void *)WeakRetained[14];
    else
      v4 = 0;
    v5 = v4;
    objc_msgSend(v5, "label");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E94A4508;
    v9 = *(_QWORD *)(a1 + 32);
    if (v6)
      v8 = (const __CFString *)v6;
    v10 = 134218498;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "<%p: %{public}@> Acknowledged update %{public}@", (uint8_t *)&v10, 0x20u);

  }
}

void __46__EDMessageCountQueryHandler_willSyncMailbox___block_invoke_67(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    -[EDMessageCountQueryHandler _forceUnfreezeAfterMailboxSyncTimeout]((uint64_t)WeakRetained);

}

- (void)_forceUnfreezeAfterMailboxSyncTimeout
{
  id v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = *(id *)(a1 + 104);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67__EDMessageCountQueryHandler__forceUnfreezeAfterMailboxSyncTimeout__block_invoke;
    v3[3] = &unk_1E949AEB8;
    v3[4] = a1;
    objc_msgSend(v2, "performBlock:", v3);

  }
}

void __67__EDMessageCountQueryHandler__forceUnfreezeAfterMailboxSyncTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      v7 = *(void **)(v6 + 112);
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "label");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E94A4508;
    if (v9)
      v11 = (const __CFString *)v9;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v13 = 134218498;
    v14 = v6;
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_fault_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_FAULT, "<%p: %{public}@> Mailbox sync timed out for %{public}@", (uint8_t *)&v13, 0x20u);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(v4 + 16), "removeAllObjects");
  v5 = *(void **)(*v3 + 32);
  *(_QWORD *)(*v3 + 32) = 0;

  -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*v3, CFSTR("Mailbox sync timed out"));
}

- (id)_originalMessagesKeyForKey:(void *)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("Original"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (void)_prepareForChangeWithMessages:(void *)a3 changeKey:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a2;
  v32 = a3;
  if (a1)
  {
    if ((unint64_t)objc_msgSend(v33, "count") >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prepare for change. changesKey:%@"), v32);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](a1, v5);

      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 136), "transformMessages:", v33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v42 = 0;
    v30 = v6;
    -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:](a1, v6, &v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v42;
    v8 = objc_msgSend(v7, "count");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(a1 + 56);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addIndex:", objc_msgSend(v14, "globalMessageID"));

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v10);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v31;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (!v16)
    {
LABEL_22:

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "threadDictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, v32);

      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "threadDictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageCountQueryHandler _originalMessagesKeyForKey:]((void *)a1, v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v33, v29);

      goto LABEL_23;
    }
    v17 = *(_QWORD *)v35;
LABEL_13:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v17)
        objc_enumerationMutation(v15);
      v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
      objc_msgSend(v19, "objectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "globalMessageID");

      if (objc_msgSend(*(id *)(a1 + 56), "containsIndex:", v21))
        goto LABEL_19;
      objc_msgSend(v19, "objectID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, objc_msgSend(v22, "globalMessageID"));

      if (v23)
        break;
LABEL_20:
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (!v16)
          goto LABEL_22;
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", v21);
LABEL_19:
    ++v8;
    goto LABEL_20;
  }
LABEL_23:

}

- (id)_filterMessages:(_QWORD *)a3 potentiallyMatchingMessages:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  if (a1)
  {
    v6 = *(id *)(a1 + 136);
    v14 = 0;
    objc_msgSend(v6, "filterMessages:unmatchedMessages:", v5, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    v9 = *(id *)(a1 + 120);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__EDMessageCountQueryHandler__filterMessages_potentiallyMatchingMessages___block_invoke;
    v12[3] = &unk_1E949B4A0;
    v13 = v9;
    v10 = v9;
    objc_msgSend(v8, "ef_filter:", v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_moreThan:(uint64_t)a3 messagesExistWithGlobalMessageID:
{
  id v6;
  void *v7;
  _BOOL8 v8;

  if (!a1)
    return 0;
  v6 = *(id *)(a1 + 152);
  -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "countOfMessagesWithGlobalMessageID:matchingQuery:", a3, v7) > a2;

  return v8;
}

- (void)_processChangedMessages:(void *)a3 changeKey:(void *)a4 generationWindow:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v36 = a3;
  v33 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _originalMessagesKeyForKey:]((void *)a1, v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v36);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v35);
    if (v37 && (unint64_t)objc_msgSend(v37, "count") < 6)
    {
      objc_msgSend(*(id *)(a1 + 136), "transformMessages:", v37);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      v47 = 0;
      v31 = v11;
      -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:](a1, v11, &v47);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v47;
      v13 = objc_msgSend(v12, "count");
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v44 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(a1 + 56);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "objectID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addIndex:", objc_msgSend(v19, "globalMessageID"));

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        }
        while (v15);
      }

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = v32;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v40;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v40 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
            objc_msgSend(v24, "objectID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "globalMessageID");

            if (objc_msgSend(*(id *)(a1 + 56), "containsIndex:", v26))
            {
              objc_msgSend(v24, "objectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, objc_msgSend(v27, "globalMessageID"));

              if (v28)
              {
                ++v13;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 56), "removeIndex:", v26);
                objc_msgSend(*(id *)(a1 + 64), "removeIndex:", v26);
              }
            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v21);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      v29 = objc_msgSend(v34, "integerValue");
      if (v13 != v29)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Changed messages from %lld matches to %lld matches"), v29, v13);
        if (v13 <= v29)
          -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:](a1, v29 - v13, v30, v33);
        else
          -[EDMessageCountQueryHandler _incrementLocalCount:logMessage:generationWindow:](a1, v13 - v29, v30, v33);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process change. changesKey:%@"), v36);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](a1, v10);

    }
  }
  else
  {
    v37 = v7;
  }

}

uint64_t __74__EDMessageCountQueryHandler__filterMessages_potentiallyMatchingMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

- (void)persistenceDidAddMessages:(id)a3 generationWindow:(id)a4
{
  EDMessageQueryEvaluator *queryEvaluator;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    if (self)
      queryEvaluator = self->_queryEvaluator;
    else
      queryEvaluator = 0;
    -[EDMessageQueryEvaluator transformMessages:](queryEvaluator, "transformMessages:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    -[EDMessageCountQueryHandler _filterMessages:potentiallyMatchingMessages:]((uint64_t)self, v6, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:]((uint64_t)self, CFSTR("Persistence did add messages"));

  }
}

- (void)persistenceWillChangeFlags:(id)a3 messages:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  id Property;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!objc_msgSend(v12, "deletedChanged") || (objc_msgSend(v12, "deleted") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0D1E248];
    -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "predicate:appliesToFlagChange:", v9, v12);

    if ((_DWORD)v7)
    {
      if (self)
        Property = objc_getProperty(self, v10, 200, 1);
      else
        Property = 0;
      -[EDMessageCountQueryHandler _prepareForChangeWithMessages:changeKey:]((uint64_t)self, v6, Property);
    }
  }

}

- (void)persistenceDidChangeFlags:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  id Property;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v15, "deletedChanged") && objc_msgSend(v15, "deleted"))
  {
    -[EDMessageCountQueryHandler _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:generationWindow:]((uint64_t)self, v8, 1, v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D1E248];
    -[EDMessageCountQueryHandler expandedQuery]((os_unfair_lock_s *)self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "predicate:appliesToFlagChange:", v12, v15);

    if ((_DWORD)v10)
    {
      if (self)
        Property = objc_getProperty(self, v13, 200, 1);
      else
        Property = 0;
      -[EDMessageCountQueryHandler _processChangedMessages:changeKey:generationWindow:]((uint64_t)self, v8, Property, v9);
    }
  }

}

- (void)_persistenceDidDeleteMessages:(uint64_t)a3 includeMessagesWithDeletedFlag:(void *)a4 generationWindow:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v18 = a4;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 136), "transformAndFilterMessages:includeDeleted:", v7, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") < 6)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v19;
      v9 = 0;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v13, "objectID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "globalMessageID");

            objc_msgSend(v13, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v14) = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:](a1, 0, objc_msgSend(v16, "globalMessageID"));

            if ((_DWORD)v14)
            {
              objc_msgSend(*(id *)(a1 + 56), "addIndex:", v15);
            }
            else
            {
              if (objc_msgSend(*(id *)(a1 + 64), "containsIndex:", v15))
                objc_msgSend(*(id *)(a1 + 64), "removeIndex:", v15);
              else
                ++v9;
              objc_msgSend(*(id *)(a1 + 56), "removeIndex:", v15);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        }
        while (v10);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      if (v9)
      {
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Deleted %lld messages"), v9);
        -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:](a1, v9, v17, v18);
      }
      else
      {
        +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v25 = 0;
          _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Count: %lld is less 1, did not decrementLocalCount. nonmatchingMessages:", buf, 0xCu);
        }
      }

    }
    else
    {
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](a1, CFSTR("Persistence did delete messages"));
    }

  }
}

- (void)persistenceDidUpdateProperties:(id)a3 message:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMQuery *query;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  EDMessageQueryEvaluator *queryEvaluator;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0D1E640]) & 1) != 0 && objc_msgSend(v9, "numberOfAttachments"))
  {
    if (self)
      query = self->_query;
    else
      query = 0;
    v12 = (void *)MEMORY[0x1E0D1E248];
    -[EMQuery predicate](query, "predicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "predicateFromPredicate:ignoringKeyPaths:", v13, MEMORY[0x1E0C9AA60]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0D1E248];
    v24[0] = *MEMORY[0x1E0D1DDC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateFromPredicate:ignoringKeyPaths:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "isEqual:", v17) & 1) != 0)
      goto LABEL_12;
    os_unfair_lock_lock(&self->_seenMessageIDsLock);
    v18 = objc_msgSend(v9, "globalMessageID");
    if ((-[EFMutableInt64Set containsIndex:](self->_seenMessageIDs, "containsIndex:", v18) & 1) == 0)
    {
      queryEvaluator = self->_queryEvaluator;
      v23 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDMessageQueryEvaluator transformAndFilterMessages:](queryEvaluator, "transformAndFilterMessages:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count"))
      {
        -[EFMutableInt64Set addIndex:](self->_seenMessageIDs, "addIndex:", v18);
        v22 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:]((uint64_t)self, 1, objc_msgSend(v9, "globalMessageID"));

        os_unfair_lock_unlock(&self->_seenMessageIDsLock);
        if (!v22)
          -[EDMessageCountQueryHandler _incrementLocalCount:logMessage:generationWindow:]((uint64_t)self, 1, CFSTR("New match after changing number of attachments"), v10);
        goto LABEL_12;
      }

    }
    os_unfair_lock_unlock(&self->_seenMessageIDsLock);
LABEL_12:

  }
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  -[EDMessageCountQueryHandler _persistenceDidDeleteMessages:includeMessagesWithDeletedFlag:generationWindow:]((uint64_t)self, a3, 0, a4);
}

- (void)persistenceDidChangeGlobalMessageID:(int64_t)a3 orConversationID:(int64_t)a4 message:(id)a5 generationWindow:(id)a6
{
  id v9;
  id v10;
  EDMessageQueryEvaluator *queryEvaluator;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  os_unfair_lock_lock(&self->_seenMessageIDsLock);
  if (-[EFMutableInt64Set containsIndex:](self->_seenMessageIDs, "containsIndex:", a3))
  {
    -[EFMutableInt64Set removeIndex:](self->_seenMessageIDs, "removeIndex:", a3);
  }
  else
  {
    queryEvaluator = self->_queryEvaluator;
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    -[EDMessageQueryEvaluator transformAndFilterMessages:](queryEvaluator, "transformAndFilterMessages:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v12) = objc_msgSend(v13, "count") == 0;
    if ((v12 & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_seenMessageIDsLock);
      goto LABEL_9;
    }
  }
  v14 = objc_msgSend(v9, "globalMessageID");
  if ((-[EFMutableInt64Set containsIndex:](self->_seenMessageIDs, "containsIndex:", v14) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_seenMessageIDsLock);
LABEL_7:
    -[EDMessageCountQueryHandler _decrementLocalCount:logMessage:generationWindow:]((uint64_t)self, 1, CFSTR("Changed message ID to one we've already counted"), v10);
    goto LABEL_9;
  }
  -[EFMutableInt64Set addIndex:](self->_seenMessageIDs, "addIndex:", v14);
  v15 = -[EDMessageCountQueryHandler _moreThan:messagesExistWithGlobalMessageID:]((uint64_t)self, 1, objc_msgSend(v9, "globalMessageID"));
  os_unfair_lock_unlock(&self->_seenMessageIDsLock);
  if (v15)
    goto LABEL_7;
LABEL_9:

}

- (void)_scheduleCountForNotificationWithReason:(id *)a1
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && (objc_msgSend(a1[21], "isCanceled") & 1) == 0)
  {
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[14];
      objc_msgSend(v5, "label");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &stru_1E94A4508;
      *(_DWORD *)buf = 134218498;
      if (v6)
        v8 = (const __CFString *)v6;
      v13 = a1;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v3;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "<%p: %{public}@> %{public}@, refreshing query", buf, 0x20u);

    }
    v9 = a1[13];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__EDMessageCountQueryHandler__scheduleCountForNotificationWithReason___block_invoke;
    v10[3] = &unk_1E949B6D0;
    v10[4] = a1;
    v11 = v3;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

void __70__EDMessageCountQueryHandler__scheduleCountForNotificationWithReason___block_invoke(uint64_t a1)
{
  -[EDMessageCountQueryHandler _resetExpandedQuery](*(_QWORD *)(a1 + 32));
  -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_shouldObserveChangeVIPStatus
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E248], "predicateForIsVIP:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v2, "containsString:", v4);
  return v5;
}

- (void)persistenceDidChangeVIPStatus:(BOOL)a3 messages:(id)a4
{
  id v6;

  if (-[EDMessageCountQueryHandler _shouldObserveChangeVIPStatus]((uint64_t)self))
  {
    NSStringFromSelector(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, v6);

  }
}

- (uint64_t)_shouldObserveDidUpdateReadLaterDate
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DE28]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DE30]);

  return v2;
}

- (uint64_t)_shouldObserveDidUpdateSendLaterDate
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DE48]);

  return v2;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  id v8;

  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateReadLaterDate]((uint64_t)self))
  {
    NSStringFromSelector(a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, v8);

  }
}

- (void)persistenceDidUpdateSendLaterDate:(id)a3 messages:(id)a4 generationWindow:(id)a5
{
  id v7;

  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateSendLaterDate]((uint64_t)self))
  {
    NSStringFromSelector(a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, v7);

  }
}

- (uint64_t)_shouldObserveDidUpdateFollowUp
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DD98]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DD90]);

  return v2;
}

- (void)persistenceDidUpdateFollowUpForMessages:(id)a3 generationWindow:(id)a4
{
  id v6;

  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateFollowUp]((uint64_t)self))
  {
    NSStringFromSelector(a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, v6);

  }
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  if (-[EDMessageCountQueryHandler _shouldObserveDidUpdateReadLaterDate]((uint64_t)self))
    -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, CFSTR("Remind Me timer fired"));
}

- (uint64_t)_shouldObserveCategorization
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 112), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ef_containsKeyPath:", *MEMORY[0x1E0D1DD30]);

  return v2;
}

- (void)persistenceDidChangeCategorizationForMessages:(id)a3 generationWindow:(id)a4
{
  id v6;
  const char *v7;
  id Property;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[EDMessageCountQueryHandler _shouldObserveCategorization]((uint64_t)self))
  {
    if (self)
      Property = objc_getProperty(self, v7, 208, 1);
    else
      Property = 0;
    -[EDMessageCountQueryHandler _processChangedMessages:changeKey:generationWindow:]((uint64_t)self, v9, Property, v6);
  }

}

- (void)persistenceIsAddingMailboxWithDatabaseID:(int64_t)a3 objectID:(id)a4 generationWindow:(id)a5
{
  id v7;
  id v8;
  EMMailboxScope *v9;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  EMQuery *query;
  EMQuery *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  EDMessageCountQueryHandler *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (self)
  {
    v9 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    v9 = 0;
    messagePersistence = 0;
  }
  v11 = messagePersistence;
  -[EDMessagePersistence mailboxPersistence](v11, "mailboxPersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EMMailboxScope scopeContainsMailboxObjectID:mailboxTypeResolver:](v9, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v7, v12);

  if ((v13 & 1) != 0)
  {
    v14 = objc_msgSend(v8, "earliestGeneration");
    v15 = objc_msgSend(v8, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (self)
        query = self->_query;
      else
        query = 0;
      v18 = query;
      -[EMQuery label](v18, "label");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219010;
      if (v19)
        v21 = (const __CFString *)v19;
      v29 = self;
      v30 = 2114;
      v31 = v21;
      v32 = 2114;
      v33 = v7;
      v34 = 2048;
      v35 = v14;
      v36 = 2048;
      v37 = v15;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_INFO, "<%p: %{public}@> Adding mailbox %{public}@ (window: %llu:%llu)", buf, 0x34u);

    }
    if (self)
      scheduler = self->_scheduler;
    else
      scheduler = 0;
    v23 = scheduler;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __97__EDMessageCountQueryHandler_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke;
    v24[3] = &unk_1E949C610;
    v26 = v15;
    v24[4] = self;
    v25 = v7;
    v27 = v14;
    -[EFAssertableScheduler performBlock:](v23, "performBlock:", v24);

  }
}

void __97__EDMessageCountQueryHandler_persistenceIsAddingMailboxWithDatabaseID_objectID_generationWindow___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  BOOL v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _EDMailboxServerCount *osloga;
  NSObject *oslog;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1[4] + 24);
  if (a1[6] <= v2)
  {
    v3 = a1[7] > v2;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    oslog = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(oslog, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v4)
      {
        v5 = a1[4];
        if (v5)
          v6 = *(void **)(v5 + 112);
        else
          v6 = 0;
        v7 = v6;
        objc_msgSend(v7, "label");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = &stru_1E94A4508;
        v11 = *(_QWORD *)(a1[4] + 24);
        if (v8)
          v10 = (const __CFString *)v8;
        v13 = a1[6];
        v12 = a1[7];
        *(_DWORD *)buf = 134219010;
        v26 = v5;
        v27 = 2114;
        v28 = v10;
        v29 = 2048;
        v30 = v11;
        v31 = 2048;
        v32 = v12;
        v33 = 2048;
        v34 = v13;
        _os_log_impl(&dword_1D2F2C000, oslog, OS_LOG_TYPE_INFO, "<%p: %{public}@> add-mailbox occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](a1[4], CFSTR("Persistence is adding mailbox"));
    }
    else
    {
      if (v4)
      {
        v14 = a1[4];
        if (v14)
          v15 = *(void **)(v14 + 112);
        else
          v15 = 0;
        v16 = v15;
        objc_msgSend(v16, "label");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        v19 = &stru_1E94A4508;
        v20 = *(_QWORD *)(a1[4] + 24);
        if (v17)
          v19 = (const __CFString *)v17;
        v22 = a1[6];
        v21 = a1[7];
        *(_DWORD *)buf = 134219010;
        v26 = v14;
        v27 = 2114;
        v28 = v19;
        v29 = 2048;
        v30 = v20;
        v31 = 2048;
        v32 = v21;
        v33 = 2048;
        v34 = v22;
        _os_log_impl(&dword_1D2F2C000, oslog, OS_LOG_TYPE_INFO, "<%p: %{public}@> add-mailbox notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
    }
  }
  else
  {
    osloga = objc_alloc_init(_EDMailboxServerCount);
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:");

  }
}

- (void)persistenceDidUpdateServerCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  EMMailboxScope *v10;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  EMQuery *query;
  EMQuery *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  EDMessageCountQueryHandler *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    v10 = 0;
    messagePersistence = 0;
  }
  v12 = messagePersistence;
  -[EDMessagePersistence mailboxPersistence](v12, "mailboxPersistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EMMailboxScope scopeContainsMailboxObjectID:mailboxTypeResolver:](v10, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v8, v13);

  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(v9, "earliestGeneration");
    v16 = objc_msgSend(v9, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self)
        query = self->_query;
      else
        query = 0;
      v19 = query;
      -[EMQuery label](v19, "label");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219266;
      if (v20)
        v23 = v20;
      v32 = self;
      v33 = 2114;
      v34 = v23;
      v35 = 2048;
      v36 = a3;
      v37 = 2114;
      v38 = v21;
      v39 = 2048;
      v40 = v15;
      v41 = 2048;
      v42 = v16;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);

    }
    if (self)
      scheduler = self->_scheduler;
    else
      scheduler = 0;
    v25 = scheduler;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __102__EDMessageCountQueryHandler_persistenceDidUpdateServerCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E949DAD8;
    v28 = v16;
    v26[4] = self;
    v27 = v8;
    v29 = a3;
    v30 = v15;
    -[EFAssertableScheduler performBlock:](v25, "performBlock:", v26);

  }
}

void __102__EDMessageCountQueryHandler_persistenceDidUpdateServerCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_t loga;
  NSObject *log;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(a1 + 48) <= v3)
  {
    v9 = *(_QWORD *)(a1 + 64) > v3;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    log = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v12 = *(void **)(v11 + 112);
        else
          v12 = 0;
        v13 = v12;
        objc_msgSend(v13, "label");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = &stru_1E94A4508;
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v14)
          v16 = (const __CFString *)v14;
        v18 = *(_QWORD *)(a1 + 64);
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v11;
        v33 = 2114;
        v34 = v16;
        v35 = 2048;
        v36 = v17;
        v37 = 2048;
        v38 = v18;
        v39 = 2048;
        v40 = v19;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Persistence did update server count"));
    }
    else
    {
      if (v10)
      {
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
          v21 = *(void **)(v20 + 112);
        else
          v21 = 0;
        v22 = v21;
        objc_msgSend(v22, "label");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = &stru_1E94A4508;
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v23)
          v25 = (const __CFString *)v23;
        v27 = *(_QWORD *)(a1 + 64);
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v20;
        v33 = 2114;
        v34 = v25;
        v35 = 2048;
        v36 = v26;
        v37 = 2048;
        v38 = v27;
        v39 = 2048;
        v40 = v28;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> server-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(a1 + 56);
    loga = (os_log_t)v4;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("server-count set to %lld for %@"), v6, v7);

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), v8);
  }
}

- (void)persistenceDidUpdateMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  EMMailboxScope *v10;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  EMQuery *query;
  EMQuery *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  EDMessageCountQueryHandler *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    v10 = 0;
    messagePersistence = 0;
  }
  v12 = messagePersistence;
  -[EDMessagePersistence mailboxPersistence](v12, "mailboxPersistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EMMailboxScope scopeContainsMailboxObjectID:mailboxTypeResolver:](v10, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v8, v13);

  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(v9, "earliestGeneration");
    v16 = objc_msgSend(v9, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self)
        query = self->_query;
      else
        query = 0;
      v19 = query;
      -[EMQuery label](v19, "label");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219266;
      if (v20)
        v23 = v20;
      v32 = self;
      v33 = 2114;
      v34 = v23;
      v35 = 2048;
      v36 = a3;
      v37 = 2114;
      v38 = v21;
      v39 = 2048;
      v40 = v15;
      v41 = 2048;
      v42 = v16;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);

    }
    if (self)
      scheduler = self->_scheduler;
    else
      scheduler = 0;
    v25 = scheduler;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __112__EDMessageCountQueryHandler_persistenceDidUpdateMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E949DAD8;
    v28 = v16;
    v26[4] = self;
    v27 = v8;
    v29 = a3;
    v30 = v15;
    -[EFAssertableScheduler performBlock:](v25, "performBlock:", v26);

  }
}

void __112__EDMessageCountQueryHandler_persistenceDidUpdateMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_t loga;
  NSObject *log;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(a1 + 48) <= v3)
  {
    v9 = *(_QWORD *)(a1 + 64) > v3;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    log = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v12 = *(void **)(v11 + 112);
        else
          v12 = 0;
        v13 = v12;
        objc_msgSend(v13, "label");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = &stru_1E94A4508;
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v14)
          v16 = (const __CFString *)v14;
        v18 = *(_QWORD *)(a1 + 64);
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v11;
        v33 = 2114;
        v34 = v16;
        v35 = 2048;
        v36 = v17;
        v37 = 2048;
        v38 = v18;
        v39 = 2048;
        v40 = v19;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Persistence did update most recent status count"));
    }
    else
    {
      if (v10)
      {
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
          v21 = *(void **)(v20 + 112);
        else
          v21 = 0;
        v22 = v21;
        objc_msgSend(v22, "label");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = &stru_1E94A4508;
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v23)
          v25 = (const __CFString *)v23;
        v27 = *(_QWORD *)(a1 + 64);
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v20;
        v33 = 2114;
        v34 = v25;
        v35 = 2048;
        v36 = v26;
        v37 = 2048;
        v38 = v27;
        v39 = 2048;
        v40 = v28;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> most-recent-status-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
      *(_QWORD *)(v4 + 16) = *(_QWORD *)(a1 + 56);
    loga = (os_log_t)v4;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("most-recent-status-count set to %lld for %@"), v6, v7);

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), v8);
  }
}

- (void)persistenceDidUpdateLastSyncAndMostRecentStatusCount:(int64_t)a3 forMailboxWithObjectID:(id)a4 generationWindow:(id)a5
{
  id v8;
  id v9;
  EMMailboxScope *v10;
  EDMessagePersistence *messagePersistence;
  EDMessagePersistence *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  EMQuery *query;
  EMQuery *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  EFAssertableScheduler *scheduler;
  EFAssertableScheduler *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  EDMessageCountQueryHandler *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self)
  {
    v10 = self->_serverCountMailboxScope;
    messagePersistence = self->_messagePersistence;
  }
  else
  {
    v10 = 0;
    messagePersistence = 0;
  }
  v12 = messagePersistence;
  -[EDMessagePersistence mailboxPersistence](v12, "mailboxPersistence");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[EMMailboxScope scopeContainsMailboxObjectID:mailboxTypeResolver:](v10, "scopeContainsMailboxObjectID:mailboxTypeResolver:", v8, v13);

  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(v9, "earliestGeneration");
    v16 = objc_msgSend(v9, "latestGeneration");
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      if (self)
        query = self->_query;
      else
        query = 0;
      v19 = query;
      -[EMQuery label](v19, "label");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ef_publicDescription");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = &stru_1E94A4508;
      *(_DWORD *)buf = 134219266;
      if (v20)
        v23 = v20;
      v32 = self;
      v33 = 2114;
      v34 = v23;
      v35 = 2048;
      v36 = a3;
      v37 = 2114;
      v38 = v21;
      v39 = 2048;
      v40 = v15;
      v41 = 2048;
      v42 = v16;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync + most-recent-status-count set %lld for %{public}@ (window: %llu:%llu)", buf, 0x3Eu);

    }
    if (self)
      scheduler = self->_scheduler;
    else
      scheduler = 0;
    v25 = scheduler;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __123__EDMessageCountQueryHandler_persistenceDidUpdateLastSyncAndMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke;
    v26[3] = &unk_1E949DAD8;
    v28 = v16;
    v26[4] = self;
    v27 = v8;
    v29 = a3;
    v30 = v15;
    -[EFAssertableScheduler performBlock:](v25, "performBlock:", v26);

  }
}

void __123__EDMessageCountQueryHandler_persistenceDidUpdateLastSyncAndMostRecentStatusCount_forMailboxWithObjectID_generationWindow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_t loga;
  NSObject *log;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(a1 + 48) <= v3)
  {
    v9 = *(_QWORD *)(a1 + 64) > v3;
    +[EDMessageCountQueryHandler log](EDMessageCountQueryHandler, "log");
    log = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v10)
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v12 = *(void **)(v11 + 112);
        else
          v12 = 0;
        v13 = v12;
        objc_msgSend(v13, "label");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = &stru_1E94A4508;
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v14)
          v16 = (const __CFString *)v14;
        v18 = *(_QWORD *)(a1 + 64);
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v11;
        v33 = 2114;
        v34 = v16;
        v35 = 2048;
        v36 = v17;
        v37 = 2048;
        v38 = v18;
        v39 = 2048;
        v40 = v19;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync and most-recent-status-count occured during generation window, scheduling full fetch (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
      -[EDMessageCountQueryHandler _scheduleCountCalculationWithReason:](*(_QWORD *)(a1 + 32), CFSTR("Persistence did update last sync and most recent status count"));
    }
    else
    {
      if (v10)
      {
        v20 = *(_QWORD *)(a1 + 32);
        if (v20)
          v21 = *(void **)(v20 + 112);
        else
          v21 = 0;
        v22 = v21;
        objc_msgSend(v22, "label");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = &stru_1E94A4508;
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        if (v23)
          v25 = (const __CFString *)v23;
        v27 = *(_QWORD *)(a1 + 64);
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134219010;
        v32 = v20;
        v33 = 2114;
        v34 = v25;
        v35 = 2048;
        v36 = v26;
        v37 = 2048;
        v38 = v27;
        v39 = 2048;
        v40 = v28;
        _os_log_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_INFO, "<%p: %{public}@> last-sync and most-recent-status-count notification expired by new generation (ours: %llu, window: %llu:%llu)", buf, 0x34u);

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      *(_QWORD *)(v4 + 16) = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(v4 + 24) = *(_QWORD *)(a1 + 56);
    }
    loga = (os_log_t)v4;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("last-sync and most-recent-status-count to %lld for %@"), v6, v7);

    -[EDMessageCountQueryHandler _notifyObserverWithLogMessage:](*(_QWORD *)(a1 + 32), v8);
  }
}

- (void)mailboxListChanged:(id)a3
{
  -[EDMessageCountQueryHandler _scheduleCountForNotificationWithReason:]((id *)&self->super.isa, CFSTR("Mailbox list changed"));
}

- (id)labelForStateCapture
{
  if (self)
    self = (EDMessageCountQueryHandler *)self->_query;
  -[EDMessageCountQueryHandler label](self, "label");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemsForStateCaptureWithErrorString:(id *)a3
{
  EDMessagePersistence *v4;
  EMQuery *query;
  void *v6;

  if (self)
  {
    v4 = self->_messagePersistence;
    query = self->_query;
  }
  else
  {
    v4 = 0;
    query = 0;
  }
  -[EDMessagePersistence messagesMatchingQuery:limit:](v4, "messagesMatchingQuery:limit:", query, 20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = objc_msgSend(v5, "globalMessageID");
    v9 = objc_msgSend(v6, "read");
    v10 = objc_msgSend(v6, "flagged");
    v11 = CFSTR("unread");
    if (v9)
      v11 = CFSTR("read");
    v12 = CFSTR("not flagged");
    if (v10)
      v12 = CFSTR("flagged");
    v13 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("GlobalMessageID:%lld - %@, %@"), v8, v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
