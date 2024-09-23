@implementation BRCFileCoordinator

- (BRCFileCoordinator)initWithSession:(id)a3 forRead:(BOOL)a4 doneHandler:(id)a5
{
  id v9;
  id v10;
  BRCFileCoordinator *v11;
  BRCFileCoordinator *v12;
  BRCAccountSession **p_session;
  uint64_t v14;
  id doneHandler;
  void *v17;
  NSObject *v18;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BRCFileCoordinator;
  v11 = -[BRCFileCoordinator init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    p_session = &v11->_session;
    objc_storeStrong((id *)&v11->_session, a3);
    if (!*p_session)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCFileCoordinator initWithSession:forRead:doneHandler:].cold.1((uint64_t)v17, v18);

    }
    v14 = MEMORY[0x1D17A6DB0](v10);
    doneHandler = v12->_doneHandler;
    v12->_doneHandler = (id)v14;

    v12->_forRead = a4;
    v12->_startStamp = brc_current_date_nsec();
  }

  return v12;
}

- (void)cancel
{
  BRCFileCoordinator *v2;
  NSObject *timer;
  OS_dispatch_source *v4;
  objc_super v5;

  v2 = self;
  objc_sync_enter(v2);
  v2->_cancelled = 1;
  timer = v2->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = v2->_timer;
    v2->_timer = 0;

  }
  objc_sync_exit(v2);

  v5.receiver = v2;
  v5.super_class = (Class)BRCFileCoordinator;
  -[BRCFileCoordinator cancel](&v5, sel_cancel);
}

- (void)cancelAfterDelay:(double)a3
{
  BRCFileCoordinator *v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_time_t v7;
  dispatch_source_t v8;
  OS_dispatch_source *timer;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  _QWORD *v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  dispatch_block_t v17;
  _QWORD v18[5];

  if (a3 != 0.0)
  {
    v4 = self;
    objc_sync_enter(v4);
    if (!v4->_cancelled && !v4->_timer)
    {
      v5 = brc_current_date_nsec() - v4->_startStamp;
      v6 = (uint64_t)(a3 * 1000000000.0);
      if (v6 <= v5)
      {
        -[BRCFileCoordinator cancel](v4, "cancel");
      }
      else
      {
        v7 = dispatch_time(0, v6 - v5);
        v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
        timer = v4->_timer;
        v4->_timer = (OS_dispatch_source *)v8;

        v10 = v4->_timer;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __39__BRCFileCoordinator_cancelAfterDelay___block_invoke;
        v18[3] = &unk_1E875D500;
        v18[4] = v4;
        v11 = v10;
        v12 = v18;
        v13 = v11;
        v14 = v12;
        v15 = v14;
        v16 = v14;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v16);
        dispatch_source_set_event_handler(v13, v17);

        dispatch_source_set_timer((dispatch_source_t)v4->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6 / 10);
        dispatch_resume((dispatch_object_t)v4->_timer);
      }
    }
    objc_sync_exit(v4);

  }
}

uint64_t __39__BRCFileCoordinator_cancelAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_willRequestCoordinationWithContext:(id)a3 url1:(id)a4 url2:(id)a5
{
  NSURL *v8;
  NSURL *v9;
  NSURL *url1;
  NSURL *url2;
  NSURL *v12;

  v8 = (NSURL *)a4;
  v9 = (NSURL *)a5;
  objc_msgSend(a3, "startTracingCode");
  -[BRCFileCoordinator hash](self, "hash");
  kdebug_trace();
  url1 = self->_url1;
  self->_url1 = v8;
  v12 = v8;

  url2 = self->_url2;
  self->_url2 = v9;

}

- (void)_didObtainCoordination:(id)a3 context:(id)a4 url1:(id)a5 url2:(id)a6 handler:(id)a7 fcHandler:(id)a8 error:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  BRCFileCoordinator *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(v15, "tracker");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke;
  v35[3] = &unk_1E8761140;
  v36 = v15;
  v37 = v14;
  v38 = self;
  v39 = v20;
  v40 = v16;
  v41 = v17;
  v42 = v18;
  v43 = v19;
  v32[0] = v23;
  v32[1] = 3221225472;
  v32[2] = __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_49;
  v32[3] = &unk_1E875EAA8;
  v33 = v37;
  v34 = v43;
  v24 = v43;
  v25 = v37;
  v26 = v18;
  v27 = v17;
  v28 = v16;
  v29 = v20;
  v30 = v15;
  brc_task_tracker_async_with_logs_and_qos(v21, v22, DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, v35, v32);

}

void __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[3];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  memset(v46, 0, sizeof(v46));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "sections");
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v28 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v48 = v46[0];
    v49 = 2112;
    v50 = v28;
    v51 = 2112;
    v52 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Got coordinated %@%@", buf, 0x20u);
  }

  brc_current_date_nsec();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(NSObject **)(v5 + 96);
  if (v6)
  {
    dispatch_source_cancel(v6);
    v5 = *(_QWORD *)(a1 + 48);
  }
  if (*(_BYTE *)(v5 + 112) || objc_msgSend(*(id *)(a1 + 56), "br_isCocoaErrorCode:", 3072))
  {
    brc_bread_crumbs();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v29 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "path");
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_interval_from_nsec();
      *(_DWORD *)buf = 138413058;
      v48 = v29;
      v49 = 2112;
      v50 = v30;
      v51 = 2048;
      v52 = v31;
      v53 = 2112;
      v54 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request at '%@' canceled after %0.06f seconds%@", buf, 0x2Au);

    }
  }
  else if (*(_QWORD *)(a1 + 56))
  {
    brc_bread_crumbs();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "path");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_interval_from_nsec();
      v13 = *(const __CFString **)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      v48 = v11;
      v49 = 2112;
      v50 = v12;
      v51 = 2048;
      v52 = v14;
      v53 = 2112;
      v54 = v13;
      v55 = 2112;
      v56 = v7;
      _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request failed at '%@' in %0.06f seconds: %@%@", buf, 0x34u);

    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(v15 + 80);
    if (v16 && !*(_QWORD *)(a1 + 64) || (v17 = *(_QWORD *)(v15 + 88)) != 0 && !*(_QWORD *)(a1 + 72))
    {
      brc_bread_crumbs();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        v32 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "path");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        brc_interval_from_nsec();
        *(_DWORD *)buf = 138413058;
        v48 = v32;
        v49 = 2112;
        v50 = v33;
        v51 = 2048;
        v52 = v34;
        v53 = 2112;
        v54 = v7;
        _os_log_error_impl(&dword_1CBD43000, v8, (os_log_type_t)0x90u, "[ERROR] Coordinated %@ request failed at '%@' in %0.06f seconds%@", buf, 0x2Au);

      }
    }
    else
    {
      if (v16)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 80), *(id *)(a1 + 64));
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88);
      }
      if (v17)
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 88), *(id *)(a1 + 72));
      brc_bread_crumbs();
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v45 = *(_QWORD *)(a1 + 40);
        v35 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(v35 + 88))
          v36 = CFSTR("from");
        else
          v36 = CFSTR("at");
        v43 = v36;
        objc_msgSend(*(id *)(v35 + 80), "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(*(_QWORD *)(a1 + 48) + 88);
        if (v38)
          v39 = CFSTR("' to '");
        else
          v39 = &stru_1E8769030;
        objc_msgSend(v38, "path");
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        brc_interval_from_nsec();
        v42 = &stru_1E8769030;
        if (v40)
          v42 = v40;
        *(_DWORD *)buf = 138413826;
        v48 = v45;
        v49 = 2112;
        v50 = v43;
        v51 = 2112;
        v52 = v37;
        v53 = 2112;
        v54 = v39;
        v55 = 2112;
        v56 = v42;
        v57 = 2048;
        v58 = v41;
        v59 = 2112;
        v60 = v18;
        _os_log_debug_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Obtained coordinated %@ %@ '%@%@%@' in %0.06f seconds%@", buf, 0x48u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "endTracingCode");
      objc_msgSend(*(id *)(a1 + 48), "hash");
      kdebug_trace();
      brc_current_date_nsec();
      brc_bread_crumbs();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v44 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(v20 + 88))
          v21 = CFSTR("from");
        else
          v21 = CFSTR("at");
        objc_msgSend(*(id *)(v20 + 80), "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(*(_QWORD *)(a1 + 48) + 88);
        if (v23)
          v24 = CFSTR("' to '");
        else
          v24 = &stru_1E8769030;
        objc_msgSend(v23, "path");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        brc_interval_from_nsec();
        if (v25)
          v27 = v25;
        else
          v27 = &stru_1E8769030;
        *(_DWORD *)buf = 138413826;
        v48 = v44;
        v49 = 2112;
        v50 = v21;
        v51 = 2112;
        v52 = v22;
        v53 = 2112;
        v54 = v24;
        v55 = 2112;
        v56 = v27;
        v57 = 2048;
        v58 = v26;
        v59 = 2112;
        v60 = v7;
        _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Releasing coordinated %@ %@ '%@%@%@' after %0.06f seconds%@", buf, 0x48u);

      }
    }
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
  v10 = *(_QWORD *)(a1 + 88);
  if (v10)
    (*(void (**)(void))(v10 + 16))();
  __brc_leave_section(v46);
}

uint64_t __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_49(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t result;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_49_cold_1(a1, (uint64_t)v2, v3);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)scheduleReadOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BRCFileCoordinatorContext *v15;
  void *v16;
  NSObject *v17;
  id v18;
  BRCFileCoordinatorContext *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[5];
  BRCFileCoordinatorContext *v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_1CBD43000, "coord-read", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  v15 = -[BRCFileCoordinatorContext initWithTracker:queue:startCode:endCode:]([BRCFileCoordinatorContext alloc], "initWithTracker:queue:startCode:endCode:", v12, v11, 24, 25);
  v27 = 0uLL;
  v28 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleReadOfItemAtURL:queue:taskTracker:accessor:]", 224, &v27);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v21 = v27;
    objc_msgSend(v10, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v31 = v21;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated read at '%@'%@", buf, 0x20u);

  }
  v25 = v27;
  v26 = v28;
  -[BRCFileCoordinatorContext setSections:](v15, "setSections:", &v25);
  -[BRCFileCoordinator _willRequestCoordinationWithContext:url1:url2:](self, "_willRequestCoordinationWithContext:url1:url2:", v15, v10, 0);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v22[3] = &unk_1E8761168;
  v18 = v13;
  v24 = v18;
  v22[4] = self;
  v19 = v15;
  v23 = v19;
  -[BRCFileCoordinator __coordinateReadingItemAtURL:options:purposeID:byAccessor:](self, "__coordinateReadingItemAtURL:options:purposeID:byAccessor:", v10, 65537, CFSTR("com.apple.bird"), v22);

  os_activity_scope_leave(&state);
}

void __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E875F7C0;
  v8 = *(id *)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v9 = v7;
  v10 = a4;
  v11 = a3;
  v12 = (void *)MEMORY[0x1D17A6DB0](v13);
  objc_msgSend(*(id *)(a1 + 32), "_didObtainCoordination:context:url1:url2:handler:fcHandler:error:", CFSTR("read"), *(_QWORD *)(a1 + 40), v9, 0, v12, v10, v11);

}

uint64_t __73__BRCFileCoordinator_scheduleReadOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)scheduleDeleteOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BRCFileCoordinatorContext *v15;
  void *v16;
  NSObject *v17;
  NSURL *url1;
  id v19;
  BRCFileCoordinatorContext *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[5];
  BRCFileCoordinatorContext *v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_1CBD43000, "coord-delete", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  v15 = -[BRCFileCoordinatorContext initWithTracker:queue:startCode:endCode:]([BRCFileCoordinatorContext alloc], "initWithTracker:queue:startCode:endCode:", v12, v11, 26, 27);
  v28 = 0uLL;
  v29 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleDeleteOfItemAtURL:queue:taskTracker:accessor:]", 244, &v28);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v22 = v28;
    objc_msgSend(v10, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v32 = v22;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated delete at '%@'%@", buf, 0x20u);

  }
  v26 = v28;
  v27 = v29;
  -[BRCFileCoordinatorContext setSections:](v15, "setSections:", &v26);
  -[BRCFileCoordinator _willRequestCoordinationWithContext:url1:url2:](self, "_willRequestCoordinationWithContext:url1:url2:", v15, v10, 0);
  url1 = self->_url1;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v23[3] = &unk_1E8761168;
  v19 = v13;
  v25 = v19;
  v23[4] = self;
  v20 = v15;
  v24 = v20;
  -[BRCFileCoordinator __coordinateWritingItemAtURL:options:purposeID:byAccessor:](self, "__coordinateWritingItemAtURL:options:purposeID:byAccessor:", url1, 1, CFSTR("com.apple.bird"), v23);

  os_activity_scope_leave(&state);
}

void __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E875F7C0;
  v8 = *(id *)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v9 = v7;
  v10 = a4;
  v11 = a3;
  v12 = (void *)MEMORY[0x1D17A6DB0](v13);
  objc_msgSend(*(id *)(a1 + 32), "_didObtainCoordination:context:url1:url2:handler:fcHandler:error:", CFSTR("delete"), *(_QWORD *)(a1 + 40), v9, 0, v12, v10, v11);

}

uint64_t __75__BRCFileCoordinator_scheduleDeleteOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 1);
}

- (void)scheduleUpdateOfItemAtURL:(id)a3 queue:(id)a4 taskTracker:(id)a5 accessor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  BRCFileCoordinatorContext *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSURL *url1;
  id v20;
  BRCFileCoordinatorContext *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  BRCFileCoordinatorContext *v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _os_activity_create(&dword_1CBD43000, "coord-write", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  v15 = -[BRCFileCoordinatorContext initWithTracker:queue:startCode:endCode:]([BRCFileCoordinatorContext alloc], "initWithTracker:queue:startCode:endCode:", v12, v11, 22, 23);
  v29 = 0uLL;
  v30 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleUpdateOfItemAtURL:queue:taskTracker:accessor:]", 264, &v29);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v23 = v29;
    objc_msgSend(v10, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v33 = v23;
    v34 = 2112;
    v35 = v22;
    v36 = 2112;
    v37 = v16;
    _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting coordinated write at '%@'%@", buf, 0x20u);

  }
  v27 = v29;
  v28 = v30;
  -[BRCFileCoordinatorContext setSections:](v15, "setSections:", &v27);
  -[BRCFileCoordinator _willRequestCoordinationWithContext:url1:url2:](self, "_willRequestCoordinationWithContext:url1:url2:", v15, v10, 0);
  if (self->_isUpdateForReconnecting)
    v18 = 0x20000;
  else
    v18 = 4;
  url1 = self->_url1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke;
  v24[3] = &unk_1E8761168;
  v20 = v13;
  v26 = v20;
  v24[4] = self;
  v21 = v15;
  v25 = v21;
  -[BRCFileCoordinator __coordinateWritingItemAtURL:options:purposeID:byAccessor:](self, "__coordinateWritingItemAtURL:options:purposeID:byAccessor:", url1, v18, CFSTR("com.apple.bird"), v24);

  os_activity_scope_leave(&state);
}

void __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke_2;
  v13[3] = &unk_1E875F7C0;
  v8 = *(id *)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v9 = v7;
  v10 = a4;
  v11 = a3;
  v12 = (void *)MEMORY[0x1D17A6DB0](v13);
  objc_msgSend(*(id *)(a1 + 32), "_didObtainCoordination:context:url1:url2:handler:fcHandler:error:", CFSTR("update"), *(_QWORD *)(a1 + 40), v9, 0, v12, v10, v11);

}

uint64_t __75__BRCFileCoordinator_scheduleUpdateOfItemAtURL_queue_taskTracker_accessor___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

- (void)scheduleRenameOfItemAtURL:(id)a3 toItemAtURL:(id)a4 contentUpdate:(BOOL)a5 queue:(id)a6 taskTracker:(id)a7 accessor:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  BRCFileCoordinatorContext *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  BRCFileCoordinatorContext *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  BRCFileCoordinatorContext *v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v11 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v29 = a8;
  v18 = _os_activity_create(&dword_1CBD43000, "coord-rename", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v18, &state);
  v19 = -[BRCFileCoordinatorContext initWithTracker:queue:startCode:endCode:]([BRCFileCoordinatorContext alloc], "initWithTracker:queue:startCode:endCode:", v17, v16, 28, 29);
  v35 = 0uLL;
  v36 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCFileCoordinator scheduleRenameOfItemAtURL:toItemAtURL:contentUpdate:queue:taskTracker:accessor:]", 294, &v35);
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v27 = v35;
    objc_msgSend(v14, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v39 = v27;
    v40 = 2112;
    v41 = v28;
    v42 = 2112;
    v43 = v25;
    v44 = 2112;
    v45 = v20;
    v26 = (void *)v25;
    _os_log_debug_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx Requesting rename from '%@' to '%@'%@", buf, 0x2Au);

  }
  v33 = v35;
  v34 = v36;
  -[BRCFileCoordinatorContext setSections:](v19, "setSections:", &v33);
  -[BRCFileCoordinator _willRequestCoordinationWithContext:url1:url2:](self, "_willRequestCoordinationWithContext:url1:url2:", v19, v14, v15);
  if (v11)
    v22 = 6;
  else
    v22 = 2;
  if ((objc_msgSend(v14, "br_isInTrash", v26) & 1) == 0)
    v22 |= objc_msgSend(v15, "br_isInTrash");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke;
  v30[3] = &unk_1E87611B8;
  v23 = v29;
  v32 = v23;
  v30[4] = self;
  v24 = v19;
  v31 = v24;
  -[BRCFileCoordinator __coordinateWritingItemAtURL:options:writingItemAtURL:options:purposeID:byAccessor:](self, "__coordinateWritingItemAtURL:options:writingItemAtURL:options:purposeID:byAccessor:", v14, v22, v15, 8, CFSTR("com.apple.bird"), v30);

  os_activity_scope_leave(&state);
}

void __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *);
  void *v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke_2;
  v20 = &unk_1E8761190;
  v11 = *(id *)(a1 + 48);
  v22 = v10;
  v23 = v11;
  v21 = v9;
  v12 = v10;
  v13 = v9;
  v14 = a5;
  v15 = a4;
  v16 = (void *)MEMORY[0x1D17A6DB0](&v17);
  objc_msgSend(*(id *)(a1 + 32), "_didObtainCoordination:context:url1:url2:handler:fcHandler:error:", CFSTR("rename"), *(_QWORD *)(a1 + 40), v13, v12, v16, v14, v15, v17, v18, v19, v20);

}

uint64_t __101__BRCFileCoordinator_scheduleRenameOfItemAtURL_toItemAtURL_contentUpdate_queue_taskTracker_accessor___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

+ (void)itemDidChangeAtPath:(id)a3 logicalFilename:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "logicalURLWithLogicalName:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[BRCFileCoordinator itemDidChangeAtPath:logicalFilename:].cold.1(v4);

  objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didChangeWithPurposeID:", v4, CFSTR("com.apple.bird"));
}

+ (void)itemDidAppearAtPath:(id)a3 logicalFilename:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "logicalURLWithLogicalName:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[BRCFileCoordinator itemDidAppearAtPath:logicalFilename:].cold.1(v4);

  objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didReconnectWithPurposeID:", v4, CFSTR("com.apple.bird"));
}

+ (void)itemDidDisappearAtPath:(id)a3 logicalFilename:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a3, "logicalURLWithLogicalName:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[BRCFileCoordinator itemDidDisappearAtPath:logicalFilename:].cold.1(v4);

    objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didDisappearWithPurposeID:", v4, CFSTR("com.apple.bird"));
  }

}

+ (void)itemAtPath:(id)a3 origLogicalName:(id)a4 didBounceToNewLogicalName:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "logicalURLWithLogicalName:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "br_addPhysicalProperty");
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v13;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v11;
    _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] hinting file coordinator of a bounce\n    from '%@'\n      to '%@'%@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didMoveToURL:purposeID:", v8, v10, CFSTR("com.apple.bird"));

}

+ (void)itemAtPath:(id)a3 logicalFilename:(id)a4 didMoveToPath:(id)a5 logicalFilename:(id)a6 hasContentUpdate:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v7 = a7;
  v28 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a5;
  objc_msgSend(a3, "logicalURLWithLogicalName:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logicalURLWithLogicalName:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (v7)
      v17 = " and content update";
    else
      v17 = "";
    objc_msgSend(v13, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315906;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v15;
    _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] hinting file coordinator of a move%s\n    from '%@'\n      to '%@'%@", (uint8_t *)&v20, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didMoveToURL:purposeID:", v13, v14, CFSTR("com.apple.bird"));
  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3600], "__itemAtURL:didChangeWithPurposeID:", v14, CFSTR("com.apple.bird"));

}

- (BOOL)isUpdateForReconnecting
{
  return self->_isUpdateForReconnecting;
}

- (void)setIsUpdateForReconnecting:(BOOL)a3
{
  self->_isUpdateForReconnecting = a3;
}

- (BOOL)forRead
{
  return self->_forRead;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_url2, 0);
  objc_storeStrong((id *)&self->_url1, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithSession:(uint64_t)a1 forRead:(NSObject *)a2 doneHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _session%@", (uint8_t *)&v2, 0xCu);
}

void __87__BRCFileCoordinator__didObtainCoordination_context_url1_url2_handler_fcHandler_error___block_invoke_49_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Canceling coordinated %@ because task tracker is cancelled%@", (uint8_t *)&v4, 0x16u);
}

+ (void)itemDidChangeAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] hinting file coordinator of a change\n    at '%@'%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)itemDidAppearAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] hinting file coordinator of a reconnect\n    at '%@'%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

+ (void)itemDidDisappearAtPath:(void *)a1 logicalFilename:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v2, v3, "[DEBUG] hinting file coordinator of delete\n    at '%@'%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

@end
