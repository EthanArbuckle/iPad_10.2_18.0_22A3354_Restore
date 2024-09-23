@implementation HTInitializeHangTracerMonitor

void __HTInitializeHangTracerMonitor_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  pid_t pid;
  NSObject *v8;
  uint64_t v9;
  dispatch_source_t v10;
  dispatch_source_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  pid_t v16;
  _QWORD handler[4];
  pid_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1B5DFA0BC]();
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v6 = (_xpc_connection_s *)v3;
    pid = xpc_connection_get_pid(v6);
    xpc_connection_set_target_queue(v6, *(dispatch_queue_t *)(a1 + 32));
    shared_ht_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = pid;
      _os_log_impl(&dword_1AF62F000, v8, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor:New XPC connection from Application for pid: %d listening ", buf, 8u);
    }

    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __HTInitializeHangTracerMonitor_block_invoke_27;
    handler[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
    v18 = pid;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(v6);
    v10 = dispatch_source_create(MEMORY[0x1E0C80DB0], pid, 0xA0000000uLL, *(dispatch_queue_t *)(a1 + 32));
    v11 = v10;
    if (v10)
    {
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __HTInitializeHangTracerMonitor_block_invoke_32;
      v14[3] = &unk_1E5FAAFC0;
      v16 = pid;
      v12 = v10;
      v15 = v12;
      dispatch_source_set_event_handler(v12, v14);
      dispatch_resume(v12);
      v13 = v15;
    }
    else
    {
      shared_ht_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v20) = pid;
        _os_log_impl(&dword_1AF62F000, v13, OS_LOG_TYPE_DEFAULT, "HangTracerMonitor:Unable to setup up dispatch source to monitor PROC_EXIT for new proc %u", buf, 8u);
      }
    }

  }
  else
  {
    v5 = v4;
    shared_ht_log_handle();
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1AF62F000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor : xpc_get_type is not connection @%@ ", buf, 0xCu);
    }
  }

}

void __HTInitializeHangTracerMonitor_block_invoke()
{
  NSObject *v0;
  xpc_connection_t mach_service;
  void *v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _QWORD handler[4];
  NSObject *v6;

  v0 = dispatch_queue_create("com.apple.htmonitor.connectionqueue", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.hangtracermonitor", v0, 1uLL);
  v2 = (void *)HTInitializeHangTracerMonitor_htConnection;
  HTInitializeHangTracerMonitor_htConnection = (uint64_t)mach_service;

  v3 = (_xpc_connection_s *)HTInitializeHangTracerMonitor_htConnection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __HTInitializeHangTracerMonitor_block_invoke_2;
  handler[3] = &unk_1E5FAAFE8;
  v6 = v0;
  v4 = v0;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume((xpc_connection_t)HTInitializeHangTracerMonitor_htConnection);

}

void __HTInitializeHangTracerMonitor_block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  size_t v6;
  void *v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HTMonitorPidHangEvent *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  void *v25[2];
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1B5DFA0BC]() == MEMORY[0x1E0C81310])
  {
    shared_ht_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: XPC_TYPE_ERR for appConnection", (uint8_t *)v25, 2u);
    }
    goto LABEL_24;
  }
  if (MEMORY[0x1B5DFA0BC](v3) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_int64(v3, "command") == 1)
  {
    xpc_dictionary_get_value(v3, "shmem");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v25[0] = 0;
      v6 = xpc_shmem_map(v4, v25);
      v7 = v25[0];
      v8 = (void *)pidHangEventDict;
      v10 = *(_DWORD *)(a1 + 32);
      v9 = (unsigned int *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v6)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          shared_ht_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            __HTInitializeHangTracerMonitor_block_invoke_27_cold_1((int *)v9, v13);

          v14 = (void *)pidHangEventDict;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v15);

        }
        v16 = [HTMonitorPidHangEvent alloc];
        v17 = -[HTMonitorPidHangEvent initHTMonitorPidHangEvent:shmem_size:](v16, "initHTMonitorPidHangEvent:shmem_size:", v25[0], v6);
        v18 = (void *)pidHangEventDict;
        if (!pidHangEventDict)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v20 = (void *)pidHangEventDict;
          pidHangEventDict = (uint64_t)v19;

          v18 = (void *)pidHangEventDict;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v21);

        shared_ht_log_handle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = *v9;
          *(_DWORD *)buf = 67109120;
          v27 = v23;
          _os_log_impl(&dword_1AF62F000, v22, OS_LOG_TYPE_INFO, "HTInitializeHangTracerMonitor: Monitoring pid @%d", buf, 8u);
        }

      }
      else
      {
        objc_msgSend(v8, "removeObjectForKey:", v11);

        shared_ht_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF62F000, v17, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor: Something wrong with shmem", buf, 2u);
        }
      }

    }
    else
    {
      shared_ht_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25[0]) = 0;
        _os_log_impl(&dword_1AF62F000, v24, OS_LOG_TYPE_DEFAULT, "HTInitializeHangTracerMonitor:shmemObj is NULL ", (uint8_t *)v25, 2u);
      }

    }
LABEL_24:

  }
}

void __HTInitializeHangTracerMonitor_block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  shared_ht_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1AF62F000, v2, OS_LOG_TYPE_INFO, "HangTracerMonitor: Detected app exit (pid=%u)", (uint8_t *)v6, 8u);
  }

  v4 = (void *)pidHangEventDict;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __HTInitializeHangTracerMonitor_block_invoke_27_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1AF62F000, a2, OS_LOG_TYPE_FAULT, "HTInitializeHangTracerMonitor: pidHangEvent is present in dict for pid  %d ", (uint8_t *)v3, 8u);
}

@end
