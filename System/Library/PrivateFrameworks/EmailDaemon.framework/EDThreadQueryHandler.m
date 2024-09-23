@implementation EDThreadQueryHandler

- (BOOL)start
{
  unsigned __int8 *p_state;
  BOOL v5;
  void *v6;

  p_state = (unsigned __int8 *)&self->_state;
  while (!__ldaxr(p_state))
  {
    v5 = 1;
    if (!__stlxr(1u, p_state))
    {
      -[EDThreadQueryHandler hookRegistry](self, "hookRegistry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerThreadChangeHookResponder:", self);

      -[EDThreadQueryHandler _createUnderlyingHandlerIfNeededAndStart](self, "_createUnderlyingHandlerIfNeededAndStart");
      return v5;
    }
  }
  v5 = 0;
  __clrex();
  return v5;
}

- (id)messageListItemForObjectID:(id)a3 isPersisted:(BOOL *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v16;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDThreadQueryHandler.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objectID isKindOfClass:[EMThreadObjectID class]]"));

  }
  EFContentProtectionValidateObservedStateIsUnlocked();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__39;
  v34 = __Block_byref_object_dispose__39;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__39;
  v28 = __Block_byref_object_dispose__39;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__39;
  v22 = __Block_byref_object_dispose__39;
  v23 = 0;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__EDThreadQueryHandler_messageListItemForObjectID_isPersisted_error___block_invoke;
  v17[3] = &unk_1E94A30D8;
  v17[4] = &v30;
  v17[5] = &v24;
  v17[6] = &v18;
  objc_msgSend(v10, "performWhileLocked:", v17);

  v11 = (void *)v25[5];
  if (!v11)
    goto LABEL_8;
  objc_msgSend(v11, "messageListItemForObjectID:error:", v9, a5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a4 && v12)
  {
    v14 = 1;
LABEL_10:
    *a4 = v14;
    goto LABEL_11;
  }
  if (!v12)
  {
LABEL_8:
    objc_msgSend((id)v31[5], "messageListItemForObjectID:error:", v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v14 = v19[5] != 0;
      goto LABEL_10;
    }
  }
LABEL_11:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v13;
}

- (EFLocked)underlyingHandler
{
  return self->_underlyingHandler;
}

void __53__EDThreadQueryHandler_observerDidFinishInitialLoad___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

void __72__EDThreadQueryHandler_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

- (BOOL)isStarted
{
  int v2;

  v2 = atomic_load((unsigned __int8 *)&self->_state);
  return v2 == 1;
}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void (**v7)(void *, _QWORD);
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  EDThreadMigrator *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t);
  void *v81;
  id v82;
  uint64_t v83;
  __int128 v84;
  _QWORD aBlock[4];
  id v86;
  uint64_t v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_2;
  aBlock[3] = &unk_1E94A3060;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v88 = *(_OWORD *)(a1 + 48);
  v86 = v5;
  v87 = v6;
  v7 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v78 = v4;
  v79 = 3221225472;
  v80 = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_3;
  v81 = &unk_1E94A3088;
  v8 = v5;
  v84 = *(_OWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v82 = v8;
  v83 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(&v78);
  objc_msgSend(*(id *)(a1 + 32), "query", v78, v79, v80, v81);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "queryOptions");

  if ((v12 & 0x22) != 0)
  {
LABEL_2:
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v90 = v14;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: use in-memory", buf, 0xCu);
    }

    v7[2](v7, 0);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "query");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "queryOptions");

  objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "threadScope");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "persistenceStateForThreadScope:wantsPrecomputed:", v31, (v29 >> 12) & 1);

  if (v32 == 2)
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v69 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v90 = v69;
      _os_log_impl(&dword_1D2F2C000, v68, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: perform migration", buf, 0xCu);
    }

    v7[2](v7, 1);
    v70 = [EDThreadMigrator alloc];
    objc_msgSend(*(id *)(a1 + 32), "threadScope");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "threadPersistence");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = -[EDThreadMigrator initWithThreadScope:threadPersistence:queryHandler:delegate:](v70, "initWithThreadScope:threadPersistence:queryHandler:delegate:", v71, v72, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
    v74 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v75 = *(void **)(v74 + 40);
    *(_QWORD *)(v74 + 40) = v73;

  }
  else
  {
    if (v32 != 1)
    {
      if (v32)
        goto LABEL_5;
      goto LABEL_2;
    }
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v90 = v77;
      _os_log_impl(&dword_1D2F2C000, v76, OS_LOG_TYPE_DEFAULT, "%p: thread scope state: use pre-computed", buf, 0xCu);
    }

    v10[2](v10);
  }
LABEL_5:
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "query");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "observationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v90 = v16;
    v91 = 2114;
    v92 = v17;
    v93 = 2114;
    v94 = v18;
    _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "%p: Creating implementations for thread query handler; query: {%{public}@}, observation identifier: {%{public}@}",
      buf,
      0x20u);

  }
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v8, "inMemoryQueryHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v19 == v20;

  if ((v19 & 1) != 0)
  {
    objc_msgSend(v8, "inMemoryQueryHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(void **)(a1 + 32);
        objc_msgSend(v8, "inMemoryQueryHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v90 = v35;
        v91 = 2048;
        v92 = v36;
        _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "%p Keeping existing in-memory query handler %p", buf, 0x16u);

      }
    }
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(v8, "inMemoryQueryHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 134218496;
      v90 = v22;
      v91 = 2048;
      v92 = v23;
      v93 = 2048;
      v94 = v24;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "%p: Replacing in-memory query handler %p -> %p", buf, 0x20u);

    }
    objc_msgSend(v8, "inMemoryQueryHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = *(void **)(a1 + 40);
      objc_msgSend(v8, "inMemoryQueryHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v27);

    }
    objc_msgSend(v8, "setInMemoryQueryHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(v8, "setInMemoryObservationID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v8, "precomputedQueryHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = v37 == v38;

  if ((v37 & 1) != 0)
  {
    objc_msgSend(v8, "precomputedQueryHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(void **)(a1 + 32);
        objc_msgSend(v8, "precomputedQueryHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v90 = v48;
        v91 = 2048;
        v92 = v49;
        _os_log_impl(&dword_1D2F2C000, v47, OS_LOG_TYPE_DEFAULT, "%p: Keeping existing pre-computed query handler %p", buf, 0x16u);

      }
    }
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(void **)(a1 + 32);
      objc_msgSend(v8, "precomputedQueryHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 134218496;
      v90 = v40;
      v91 = 2048;
      v92 = v41;
      v93 = 2048;
      v94 = v42;
      _os_log_impl(&dword_1D2F2C000, v39, OS_LOG_TYPE_DEFAULT, "%p: Replacing pre-computed query handler %p -> %p", buf, 0x20u);

    }
    objc_msgSend(v8, "precomputedQueryHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = *(void **)(a1 + 40);
      objc_msgSend(v8, "precomputedQueryHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v45);

    }
    objc_msgSend(v8, "setPrecomputedQueryHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    objc_msgSend(v8, "setPrecomputedObservationID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    objc_msgSend(v8, "threadMigrator");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = *(void **)(a1 + 32);
        objc_msgSend(v8, "threadMigrator");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 134218496;
        v90 = v52;
        v91 = 2048;
        v92 = v53;
        v93 = 2048;
        v94 = v54;
        _os_log_impl(&dword_1D2F2C000, v51, OS_LOG_TYPE_DEFAULT, "%p: Replacing thread migrator %p -> %p", buf, 0x20u);

      }
      objc_msgSend(v8, "threadMigrator");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v57 = *(NSObject **)(v56 + 40);
      *(_QWORD *)(v56 + 40) = v55;
    }
    else
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v66 = *(void **)(a1 + 32);
        v67 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 134218240;
        v90 = v66;
        v91 = 2048;
        v92 = v67;
        _os_log_impl(&dword_1D2F2C000, v57, OS_LOG_TYPE_DEFAULT, "%p: Creating new thread migrator %p", buf, 0x16u);
      }
    }

    v65 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
LABEL_43:
    objc_msgSend(v8, "setThreadMigrator:", v65);
    goto LABEL_44;
  }
  objc_msgSend(v8, "threadMigrator");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = *(void **)(a1 + 32);
      objc_msgSend(v8, "threadMigrator");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v90 = v60;
      v91 = 2048;
      v92 = v61;
      _os_log_impl(&dword_1D2F2C000, v59, OS_LOG_TYPE_DEFAULT, "%p: Removing thread migrator %p", buf, 0x16u);

    }
    objc_msgSend(v8, "threadMigrator");
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v64 = *(void **)(v63 + 40);
    *(_QWORD *)(v63 + 40) = v62;

    v65 = 0;
    goto LABEL_43;
  }
LABEL_44:

}

void __69__EDThreadQueryHandler_messageListItemForObjectID_isPersisted_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "inMemoryQueryHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v12, "precomputedQueryHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v12, "threadMigrator");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  EDPrecomputedThreadQueryHandler *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "precomputedQueryHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "precomputedObservationID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "precomputedQueryHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2A8]), "initAsEphemeralID:", 1);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = [EDPrecomputedThreadQueryHandler alloc];
    objc_msgSend(*(id *)(a1 + 40), "query");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "threadScope");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "threadPersistence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hookRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "remindMeNotificationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v18, "observerResumer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[EDPrecomputedThreadQueryHandler initWithQuery:threadScope:messagePersistence:threadPersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:observationResumer:](v12, "initWithQuery:threadScope:messagePersistence:threadPersistence:hookRegistry:remindMeNotificationController:observer:observationIdentifier:observationResumer:", v24, v13, v14, v15, v16, v17, v18, v19, v20);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    v8 = (void *)v24;
  }

}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (EDThreadPersistence)threadPersistence
{
  return self->_threadPersistence;
}

- (EMQuery)query
{
  return self->_query;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EDRemindMeNotificationController)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (EDResumable)observerResumer
{
  return self->_observerResumer;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

void __27__EDThreadQueryHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_91;
  log_log_91 = (uint64_t)v1;

}

- (void)observerDidFinishInitialLoad:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  EDThreadQueryHandler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  EDThreadQueryHandler *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observerDidFinishInitialLoad:].cold.1();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__39;
  v29 = __Block_byref_object_dispose__39;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __53__EDThreadQueryHandler_observerDidFinishInitialLoad___block_invoke;
  v16 = &unk_1E94A3208;
  v19 = &v25;
  v20 = &v21;
  v17 = self;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v6, "performWhileLocked:", &v13);

  if (*((_BYTE *)v22 + 24))
  {
    if (v26[5])
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v13, v14, v15, v16, v17);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v26[5];
        *(_DWORD *)buf = 134218240;
        v32 = self;
        v33 = 2048;
        v34 = v9;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_INFO, "%p: Starting migrator %p.", buf, 0x16u);
      }

      v10 = (void *)v26[5];
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v10, "start", v13, v14, v15, v16, v17);
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v11 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observerDidFinishInitialLoad:](v11, "observerDidFinishInitialLoad:", v12);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v13, v14, v15, v16, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  EDThreadQueryHandler *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  EDThreadQueryHandler *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedAddedObjectIDs:before:extraInfo:].cold.1();

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__39;
  v37 = __Block_byref_object_dispose__39;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __72__EDThreadQueryHandler_observer_matchedAddedObjectIDs_before_extraInfo___block_invoke;
  v24 = &unk_1E94A3208;
  v27 = &v33;
  v28 = &v29;
  v25 = self;
  v16 = v10;
  v26 = v16;
  objc_msgSend(v15, "performWhileLocked:", &v21);

  if (*((_BYTE *)v30 + 24))
  {
    objc_msgSend((id)v34[5], "addObjectIDsToMigrate:", v11, v21, v22, v23, v24, v25);
    if (_os_feature_enabled_impl())
    {
      -[EDThreadQueryHandler _addSnippetHintsToExtraInfo:](self, "_addSnippetHintsToExtraInfo:", v13);
      v17 = objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "observer:matchedAddedObjectIDs:before:extraInfo:", v19, v11, v12, v17);

    }
    else
    {
      -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
      v17 = objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject observer:matchedAddedObjectIDs:before:extraInfo:](v17, "observer:matchedAddedObjectIDs:before:extraInfo:", v20, v11, v12, v13);

    }
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v21, v22, v23, v24, v25);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v40 = self;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__EDThreadQueryHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_91 != -1)
    dispatch_once(&log_onceToken_91, block);
  return (OS_os_log *)(id)log_log_91;
}

- (EMMessageListItemQueryResultsObserver)resultsObserver
{
  return self->_resultsObserver;
}

- (EMObjectID)observationIdentifier
{
  return self->_observationIdentifier;
}

- (id)_addSnippetHintsToExtraInfo:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  EDThreadQueryHandler *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D1DCE8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DCE8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "threadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v6);

  if (v29)
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v29;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "snippetHints");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "searchableItemIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v17);

          objc_msgSend(v15, "searchableItemIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }

    -[EDThreadQueryHandler messagePersistence](v27, "messagePersistence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "messageObjectIDsForSearchableItemIdentifiers:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "second");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __52__EDThreadQueryHandler__addSnippetHintsToExtraInfo___block_invoke;
    v30[3] = &unk_1E94A31E0;
    v23 = v21;
    v31 = v23;
    v24 = v22;
    v32 = v24;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v30);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v28);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v6);

  }
  else
  {
    v25 = v28;
  }

  return v25;
}

- (void)_createUnderlyingHandlerIfNeededAndStart
{
  void *v3;
  void *v4;
  id v5;
  atomic_flag *p_isRunning;
  unsigned __int8 v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  int v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint8_t buf[4];
  EDThreadQueryHandler *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  _BYTE v77[14];
  __int16 v78;
  int v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__39;
  v70 = __Block_byref_object_dispose__39;
  v71 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__39;
  v64 = __Block_byref_object_dispose__39;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__39;
  v58 = __Block_byref_object_dispose__39;
  v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__39;
  v52[4] = __Block_byref_object_dispose__39;
  v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__39;
  v50[4] = __Block_byref_object_dispose__39;
  v51 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__39;
  v48 = __Block_byref_object_dispose__39;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke;
  v31[3] = &unk_1E94A30B0;
  v33 = v52;
  v34 = &v66;
  v31[4] = self;
  v35 = v50;
  v36 = &v60;
  v37 = &v54;
  v5 = v3;
  v32 = v5;
  v38 = &v40;
  v39 = &v44;
  objc_msgSend(v4, "performWhileLocked:", v31);

  if (!*((_BYTE *)v41 + 24))
    goto LABEL_5;
  p_isRunning = &self->_isRunning;
  do
    v7 = __ldaxr((unsigned __int8 *)p_isRunning);
  while (__stlxr(1u, (unsigned __int8 *)p_isRunning));
  if ((v7 & 1) != 0)
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v73 = self;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "%p: Notifying observer about restart.", buf, 0xCu);
    }

    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observerWillRestart:", v11);

    v8 = 1;
  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v80, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "tearDown", (_QWORD)v27);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v80, 16);
    }
    while (v13);
  }

  objc_msgSend((id)v45[5], "cancel");
  v16 = objc_msgSend((id)v67[5], "start");
  v17 = objc_msgSend((id)v61[5], "start");
  if (v8)
  {
    v18 = v17;
    if ((v16 | v17) == 1)
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v67[5];
        v21 = v61[5];
        *(_DWORD *)buf = 134219008;
        v73 = self;
        v74 = 2048;
        v75 = v20;
        v76 = 1024;
        *(_DWORD *)v77 = v16;
        *(_WORD *)&v77[4] = 2048;
        *(_QWORD *)&v77[6] = v21;
        v78 = 1024;
        v79 = v18;
        _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "%p: didRestartObservers - didStart inMemoryQueryHandler(%p):%{BOOL}d precomputedQueryHandler(%p):%{BOOL}d", buf, 0x2Cu);
      }
    }
    else
    {
      +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v25 = v67[5];
        v26 = v61[5];
        *(_DWORD *)buf = 134219008;
        v73 = self;
        v74 = 2048;
        v75 = v25;
        v76 = 1024;
        *(_DWORD *)v77 = 0;
        *(_WORD *)&v77[4] = 2048;
        *(_QWORD *)&v77[6] = v26;
        v78 = 1024;
        v79 = 0;
        _os_log_fault_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_FAULT, "%p: called didRestartObservers but neither handler started - inMemoryQueryHandler(%p):%{BOOL}d precomputedQueryHandler(%p):%{BOOL}d", buf, 0x2Cu);
      }
    }

  }
  if (v55[5])
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v55[5];
      v24 = v67[5];
      *(_DWORD *)buf = 134218496;
      v73 = self;
      v74 = 2048;
      v75 = v23;
      v76 = 2048;
      *(_QWORD *)v77 = v24;
      _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "%p: Migrator %p will be started by in-memory query handler %p.", buf, 0x20u);
    }

  }
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v52, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
}

- (EDThreadQueryHandler)initWithQuery:(id)a3 messagePersistence:(id)a4 threadPersistence:(id)a5 hookRegistry:(id)a6 vipManager:(id)a7 searchProvider:(id)a8 remindMeNotificationController:(id)a9 observer:(id)a10 observationIdentifier:(id)a11 helperObserver:(id)a12 delegate:(id)a13 observationResumer:(id)a14
{
  EDThreadQueryHandler *v19;
  EDThreadQueryHandler *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  EMThreadScope *threadScope;
  id v26;
  _EDThreadQueryUnderlyingHandlers *v27;
  uint64_t v28;
  EFLocked *underlyingHandler;
  id v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  objc_super v48;

  v47 = a3;
  v31 = a4;
  v46 = a4;
  v32 = a5;
  v43 = a5;
  v33 = a6;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v37 = a11;
  v36 = a12;
  v45 = a13;
  v35 = a14;
  v48.receiver = self;
  v48.super_class = (Class)EDThreadQueryHandler;
  v19 = -[EDThreadQueryHandler init](&v48, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_query, a3);
    v21 = (void *)MEMORY[0x1E0D1E248];
    objc_msgSend(v47, "predicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "mailboxPersistence");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "threadScopeForPredicate:withMailboxTypeResolver:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    threadScope = v20->_threadScope;
    v20->_threadScope = (EMThreadScope *)v24;

    objc_storeStrong((id *)&v20->_messagePersistence, v31);
    objc_storeStrong((id *)&v20->_threadPersistence, v32);
    objc_storeStrong((id *)&v20->_hookRegistry, v33);
    objc_storeStrong((id *)&v20->_vipManager, a7);
    objc_storeStrong((id *)&v20->_searchProvider, a8);
    objc_storeStrong((id *)&v20->_remindMeNotificationController, a9);
    objc_storeStrong((id *)&v20->_resultsObserver, a10);
    objc_storeStrong((id *)&v20->_observationIdentifier, a11);
    objc_storeStrong((id *)&v20->_helperObserver, a12);
    v26 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v27 = objc_alloc_init(_EDThreadQueryUnderlyingHandlers);
    v28 = objc_msgSend(v26, "initWithObject:", v27);
    underlyingHandler = v20->_underlyingHandler;
    v20->_underlyingHandler = (EFLocked *)v28;

    objc_storeWeak((id *)&v20->_delegate, v45);
    objc_storeStrong((id *)&v20->_observerResumer, a14);
  }

  return v20;
}

void __64__EDThreadQueryHandler__createUnderlyingHandlerIfNeededAndStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  EDInMemoryThreadQueryHandler *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  if (a2
    || (objc_msgSend(*(id *)(a1 + 32), "inMemoryQueryHandler"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        !v18))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2A8]), "initAsEphemeralID:", 1);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = [EDInMemoryThreadQueryHandler alloc];
    objc_msgSend(*(id *)(a1 + 40), "query");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "messagePersistence");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hookRegistry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "remindMeNotificationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "vipManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "searchProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v11, "observerResumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "helperObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EDInMemoryThreadQueryHandler initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:vipManager:searchProvider:observer:observationIdentifier:observationResumer:helperObserver:](v6, "initWithQuery:messagePersistence:hookRegistry:remindMeNotificationController:vipManager:searchProvider:observer:observationIdentifier:observationResumer:helperObserver:", v25, v24, v7, v8, v9, v10, v11, v12, v13, v14);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "inMemoryObservationID");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    objc_msgSend(*(id *)(a1 + 32), "inMemoryQueryHandler");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v25 = *(id *)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
  }

}

- (void)cancel
{
  void *v3;

  -[EDThreadQueryHandler hookRegistry](self, "hookRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterHookResponder:", self);

  -[EDThreadQueryHandler tearDown](self, "tearDown");
}

- (void)_tearDownWithQueryHandlerBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  unsigned __int8 *p_state;
  int v6;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = (void (**)(id, _QWORD))a3;
  p_state = (unsigned __int8 *)&self->_state;
  do
    v6 = __ldaxr(p_state);
  while (__stlxr(2u, p_state));
  if (v6 != 2)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__39;
    v25 = __Block_byref_object_dispose__39;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__39;
    v19 = __Block_byref_object_dispose__39;
    v20 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__39;
    v13 = __Block_byref_object_dispose__39;
    v14 = 0;
    -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__EDThreadQueryHandler__tearDownWithQueryHandlerBlock___block_invoke;
    v8[3] = &unk_1E94A30D8;
    v8[4] = &v21;
    v8[5] = &v15;
    v8[6] = &v9;
    objc_msgSend(v7, "performWhileLocked:", v8);

    v4[2](v4, v22[5]);
    v4[2](v4, v16[5]);
    objc_msgSend((id)v10[5], "cancel");
    _Block_object_dispose(&v9, 8);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);

  }
}

void __55__EDThreadQueryHandler__tearDownWithQueryHandlerBlock___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "inMemoryQueryHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v12, "precomputedQueryHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v12, "threadMigrator");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(v12, "setInMemoryQueryHandler:", 0);
  objc_msgSend(v12, "setPrecomputedQueryHandler:", 0);
  objc_msgSend(v12, "setThreadMigrator:", 0);

}

- (void)test_tearDown
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDThreadQueryHandler.m"), 314, CFSTR("%s can only be called from unit tests"), "-[EDThreadQueryHandler test_tearDown]");

  }
  -[EDThreadQueryHandler _tearDownWithQueryHandlerBlock:](self, "_tearDownWithQueryHandlerBlock:", &__block_literal_global_80);
}

uint64_t __37__EDThreadQueryHandler_test_tearDown__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "test_tearDown");
}

- (void)tearDown
{
  -[EDThreadQueryHandler _tearDownWithQueryHandlerBlock:](self, "_tearDownWithQueryHandlerBlock:", &__block_literal_global_52);
}

uint64_t __32__EDThreadQueryHandler_tearDown__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tearDown");
}

- (void)requestSummaryForMessageObjectID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__39;
  v17 = __Block_byref_object_dispose__39;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__39;
  v11 = __Block_byref_object_dispose__39;
  v12 = 0;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EDThreadQueryHandler_requestSummaryForMessageObjectID___block_invoke;
  v6[3] = &unk_1E94A3140;
  v6[4] = &v13;
  v6[5] = &v7;
  objc_msgSend(v5, "performWhileLocked:", v6);

  objc_msgSend((id)v14[5], "requestSummaryForMessageObjectID:", v4);
  objc_msgSend((id)v8[5], "requestSummaryForMessageObjectID:", v4);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __57__EDThreadQueryHandler_requestSummaryForMessageObjectID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "inMemoryQueryHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v9, "precomputedQueryHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)inMemoryMessageObjectIDsForThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__39;
  v17 = __Block_byref_object_dispose__39;
  v18 = 0;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__EDThreadQueryHandler_inMemoryMessageObjectIDsForThread___block_invoke;
  v12[3] = &unk_1E94A3168;
  v12[4] = &v13;
  objc_msgSend(v5, "performWhileLocked:", v12);

  objc_msgSend((id)v14[5], "messagesForThread:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ef_mapSelector:", sel_objectID);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __58__EDThreadQueryHandler_inMemoryMessageObjectIDsForThread___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "inMemoryQueryHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)messagesInConversationIDs:(id)a3 limit:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__39;
  v19 = __Block_byref_object_dispose__39;
  v20 = 0;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__EDThreadQueryHandler_messagesInConversationIDs_limit___block_invoke;
  v14[3] = &unk_1E94A3168;
  v14[4] = &v15;
  objc_msgSend(v8, "performWhileLocked:", v14);

  v9 = (void *)v16[5];
  if (v9)
  {
    objc_msgSend(v9, "messagesInConversationIDs:limit:", v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler messagesInConversationIDs:limit:].cold.1((uint64_t)self, v12, buf, v11);
    }

    v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __56__EDThreadQueryHandler_messagesInConversationIDs_limit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "inMemoryQueryHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)threadMigratorDidComplete:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  EDThreadQueryHandler *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50__EDThreadQueryHandler_threadMigratorDidComplete___block_invoke;
  v12 = &unk_1E94A3190;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v5, "performWhileLocked:", &v9);

  if (*((_BYTE *)v16 + 24))
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v20 = self;
      v21 = 2048;
      v22 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "%p: Thread migrator %p did complete.", buf, 0x16u);
    }

    -[EDThreadQueryHandler _createUnderlyingHandlerIfNeededAndStart](self, "_createUnderlyingHandlerIfNeededAndStart");
    -[EDThreadQueryHandler delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject threadQueryHandlerStateDidChange:](v8, "threadQueryHandlerStateDidChange:", self);
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v9, v10, v11, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v20 = self;
      v21 = 2048;
      v22 = v6;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Unknown thread migrator %p did complete.", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __50__EDThreadQueryHandler_threadMigratorDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "threadMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == v5;

}

- (void)observer:(id)a3 wasUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  EDThreadQueryHandler *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:wasUpdated:].cold.1();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__EDThreadQueryHandler_observer_wasUpdated___block_invoke;
  v14[3] = &unk_1E94A31B8;
  v16 = &v17;
  v14[4] = self;
  v10 = v6;
  v15 = v10;
  objc_msgSend(v9, "performWhileLocked:", v14);

  if (*((_BYTE *)v18 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "observer:wasUpdated:", v12, v7);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v22 = self;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler for %{public}@: %{public}@.", buf, 0x20u);
    }

    objc_msgSend(v7, "invoke");
  }

  _Block_object_dispose(&v17, 8);
}

void __44__EDThreadQueryHandler_observer_wasUpdated___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

void __52__EDThreadQueryHandler__addSnippetHintsToExtraInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)observer:(id)a3 matchedAddedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  EDThreadQueryHandler *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  EDThreadQueryHandler *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedAddedObjectIDs:after:extraInfo:].cold.1();

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__39;
  v37 = __Block_byref_object_dispose__39;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __71__EDThreadQueryHandler_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke;
  v24 = &unk_1E94A3208;
  v27 = &v33;
  v28 = &v29;
  v25 = self;
  v16 = v10;
  v26 = v16;
  objc_msgSend(v15, "performWhileLocked:", &v21);

  if (*((_BYTE *)v30 + 24))
  {
    objc_msgSend((id)v34[5], "addObjectIDsToMigrate:", v11, v21, v22, v23, v24, v25);
    if (_os_feature_enabled_impl())
    {
      -[EDThreadQueryHandler _addSnippetHintsToExtraInfo:](self, "_addSnippetHintsToExtraInfo:", v13);
      v17 = objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "observer:matchedAddedObjectIDs:after:extraInfo:", v19, v11, v12, v17);

    }
    else
    {
      -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
      v17 = objc_claimAutoreleasedReturnValue();
      -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject observer:matchedAddedObjectIDs:after:extraInfo:](v17, "observer:matchedAddedObjectIDs:after:extraInfo:", v20, v11, v12, v13);

    }
  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v21, v22, v23, v24, v25);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v40 = self;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

}

void __71__EDThreadQueryHandler_observer_matchedAddedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 before:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  EDThreadQueryHandler *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedMovedObjectIDs:before:extraInfo:].cold.1();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__EDThreadQueryHandler_observer_matchedMovedObjectIDs_before_extraInfo___block_invoke;
  v19[3] = &unk_1E94A31B8;
  v21 = &v22;
  v19[4] = self;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v15, "performWhileLocked:", v19);

  if (*((_BYTE *)v23 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v17 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:matchedMovedObjectIDs:before:extraInfo:](v17, "observer:matchedMovedObjectIDs:before:extraInfo:", v18, v11, v12, v13);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = self;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __72__EDThreadQueryHandler_observer_matchedMovedObjectIDs_before_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)observer:(id)a3 matchedMovedObjectIDs:(id)a4 after:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  EDThreadQueryHandler *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedMovedObjectIDs:after:extraInfo:].cold.1();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__EDThreadQueryHandler_observer_matchedMovedObjectIDs_after_extraInfo___block_invoke;
  v19[3] = &unk_1E94A31B8;
  v21 = &v22;
  v19[4] = self;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v15, "performWhileLocked:", v19);

  if (*((_BYTE *)v23 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v17 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:matchedMovedObjectIDs:after:extraInfo:](v17, "observer:matchedMovedObjectIDs:after:extraInfo:", v18, v11, v12, v13);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = self;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __71__EDThreadQueryHandler_observer_matchedMovedObjectIDs_after_extraInfo___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)observer:(id)a3 matchedChangesForObjectIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  EDThreadQueryHandler *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  EDThreadQueryHandler *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedChangesForObjectIDs:].cold.1();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__39;
  v31 = __Block_byref_object_dispose__39;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __60__EDThreadQueryHandler_observer_matchedChangesForObjectIDs___block_invoke;
  v18 = &unk_1E94A3208;
  v21 = &v27;
  v22 = &v23;
  v19 = self;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v9, "performWhileLocked:", &v15);

  if (*((_BYTE *)v24 + 24))
  {
    v11 = (void *)v28[5];
    objc_msgSend(v7, "allKeys", v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changeObjectIDsToMigrate:", v12);

    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v13 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:matchedChangesForObjectIDs:](v13, "observer:matchedChangesForObjectIDs:", v14, v7);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v15, v16, v17, v18, v19);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

}

void __60__EDThreadQueryHandler_observer_matchedChangesForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

- (void)observer:(id)a3 matchedDeletedObjectIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  EDThreadQueryHandler *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  EDThreadQueryHandler *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedDeletedObjectIDs:].cold.1();

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__39;
  v29 = __Block_byref_object_dispose__39;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__EDThreadQueryHandler_observer_matchedDeletedObjectIDs___block_invoke;
  v16 = &unk_1E94A3208;
  v19 = &v25;
  v20 = &v21;
  v17 = self;
  v10 = v6;
  v18 = v10;
  objc_msgSend(v9, "performWhileLocked:", &v13);

  if (*((_BYTE *)v22 + 24))
  {
    objc_msgSend((id)v26[5], "deleteObjectIDsToMigrate:", v7, v13, v14, v15, v16, v17);
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v11 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:matchedDeletedObjectIDs:](v11, "observer:matchedDeletedObjectIDs:", v12, v7);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v13, v14, v15, v16, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v32 = self;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

void __57__EDThreadQueryHandler_observer_matchedDeletedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

- (void)observerDidFinishRemoteSearch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  EDThreadQueryHandler *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observerDidFinishRemoteSearch:].cold.1();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__EDThreadQueryHandler_observerDidFinishRemoteSearch___block_invoke;
  v10[3] = &unk_1E94A31B8;
  v12 = &v13;
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "performWhileLocked:", v10);

  if (*((_BYTE *)v14 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v8 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observerDidFinishRemoteSearch:](v8, "observerDidFinishRemoteSearch:", v9);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v13, 8);
}

void __54__EDThreadQueryHandler_observerDidFinishRemoteSearch___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)observer:(id)a3 replacedExistingObjectID:(id)a4 withNewObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  EDThreadQueryHandler *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:replacedExistingObjectID:withNewObjectID:].cold.1();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__EDThreadQueryHandler_observer_replacedExistingObjectID_withNewObjectID___block_invoke;
  v16[3] = &unk_1E94A31B8;
  v18 = &v19;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v12, "performWhileLocked:", v16);

  if (*((_BYTE *)v20 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v14 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:replacedExistingObjectID:withNewObjectID:](v14, "observer:replacedExistingObjectID:withNewObjectID:", v15, v9, v10);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __74__EDThreadQueryHandler_observer_replacedExistingObjectID_withNewObjectID___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)observerWillRestart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  EDThreadQueryHandler *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  EDThreadQueryHandler *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observerWillRestart:].cold.1();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__39;
  v26 = __Block_byref_object_dispose__39;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __44__EDThreadQueryHandler_observerWillRestart___block_invoke;
  v13 = &unk_1E94A3208;
  v16 = &v22;
  v17 = &v18;
  v14 = self;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v6, "performWhileLocked:", &v10);

  if (*((_BYTE *)v19 + 24))
  {
    objc_msgSend((id)v23[5], "reset", v10, v11, v12, v13, v14);
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v8 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observerWillRestart:](v8, "observerWillRestart:", v9);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log", v10, v11, v12, v13, v14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = self;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __44__EDThreadQueryHandler_observerWillRestart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "threadMigrator");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;

}

- (void)observer:(id)a3 matchedOldestItemsUpdatedForMailboxes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  EDThreadQueryHandler *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[EDThreadQueryHandler observer:matchedOldestItemsUpdatedForMailboxes:].cold.1();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = -86;
  -[EDThreadQueryHandler underlyingHandler](self, "underlyingHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__EDThreadQueryHandler_observer_matchedOldestItemsUpdatedForMailboxes___block_invoke;
  v13[3] = &unk_1E94A31B8;
  v15 = &v16;
  v13[4] = self;
  v10 = v6;
  v14 = v10;
  objc_msgSend(v9, "performWhileLocked:", v13);

  if (*((_BYTE *)v17 + 24))
  {
    -[EDThreadQueryHandler resultsObserver](self, "resultsObserver");
    v11 = objc_claimAutoreleasedReturnValue();
    -[EDThreadQueryHandler observationIdentifier](self, "observationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject observer:matchedOldestItemsUpdatedForMailboxes:](v11, "observer:matchedOldestItemsUpdatedForMailboxes:", v12, v7);

  }
  else
  {
    +[EDThreadQueryHandler log](EDThreadQueryHandler, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = self;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%p: Observer callback from unknown (old?) underlying handler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __71__EDThreadQueryHandler_observer_matchedOldestItemsUpdatedForMailboxes___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isStarted");
  if (v3)
    LOBYTE(v3) = objc_msgSend(v4, "_isCurrentObservationToken:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (void)persistenceDidResetThreadScope:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[EDThreadQueryHandler threadScope](self, "threadScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if (v5)
    -[EDThreadQueryHandler triggerMigration](self, "triggerMigration");

}

- (id)threadReconciliationQueries
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[EDThreadQueryHandler query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryOptions");

  if ((v4 & 8) == 0)
    return 0;
  -[EDThreadQueryHandler query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)messageReconciliationQueries
{
  return 0;
}

- (EMMessageQueryHelperObserver_xpc)helperObserver
{
  return self->_helperObserver;
}

- (EDVIPManager)vipManager
{
  return self->_vipManager;
}

- (EDSearchProvider)searchProvider
{
  return self->_searchProvider;
}

- (EDThreadQueryHandlerDelegate)delegate
{
  return (EDThreadQueryHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerResumer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlyingHandler, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_helperObserver, 0);
  objc_storeStrong((id *)&self->_observationIdentifier, 0);
  objc_storeStrong((id *)&self->_resultsObserver, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_threadScope, 0);
}

- (void)messagesInConversationIDs:(uint8_t *)buf limit:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "%p: Only in-memory threads are supported for %{public}@", buf, 0x16u);

}

- (void)observer:wasUpdated:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ was updated.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedAddedObjectIDs:before:extraInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched added object IDs before.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedAddedObjectIDs:after:extraInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched added object IDs after.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedMovedObjectIDs:before:extraInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched moved object IDs before.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedMovedObjectIDs:after:extraInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched moved object IDs after.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedChangesForObjectIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched changes for object IDs.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedDeletedObjectIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched deleted object IDs.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observerDidFinishInitialLoad:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ finished initial load.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observerDidFinishRemoteSearch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ finished remote search.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:replacedExistingObjectID:withNewObjectID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ replaced existing object ID.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observerWillRestart:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ will restart.");
  OUTLINED_FUNCTION_1_0();
}

- (void)observer:matchedOldestItemsUpdatedForMailboxes:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1D2F2C000, v0, v1, "%p: ID %{public}@ matched oldest items updated for mailboxes.");
  OUTLINED_FUNCTION_1_0();
}

@end
