@implementation DEBUG

void __DEBUG_CACHE_MISS_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 136447490;
    v17 = a4;
    v18 = 2082;
    v19 = a6;
    v20 = 2082;
    v21 = a7;
    v22 = 2082;
    v23 = a8;
    v24 = 1024;
    v25 = a9;
    v26 = 2082;
    v27 = v15;
    _os_log_debug_impl(&dword_182A8C000, v14, OS_LOG_TYPE_DEBUG, "no cache for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, loading from %{public}s", (uint8_t *)&v16, 0x3Au);
  }
}

void __DEBUG_NOTIFY_OBSERVERS_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136447234;
    v15 = a4;
    v16 = 2082;
    v17 = a6;
    v18 = 2082;
    v19 = a7;
    v20 = 2082;
    v21 = a8;
    v22 = 1024;
    v23 = a9;
    _os_log_debug_impl(&dword_182A8C000, v13, OS_LOG_TYPE_DEBUG, "Notifying observers of { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)&v14, 0x30u);
  }
}

void __DEBUG_CACHE_EVICT_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v14 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 136447490;
    v17 = a4;
    v18 = 2082;
    v19 = a6;
    v20 = 2082;
    v21 = a7;
    v22 = 2082;
    v23 = a8;
    v24 = 1024;
    v25 = a9;
    v26 = 2114;
    v27 = v15;
    _os_log_debug_impl(&dword_182A8C000, v14, OS_LOG_TYPE_DEBUG, "flushing cache for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } because %{public}@", (uint8_t *)&v16, 0x3Au);
  }
}

void __DEBUG_BEGAN_OBSERVING_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67241730;
    v16[1] = a2;
    v17 = 2082;
    v18 = a3;
    v19 = 2082;
    v20 = a4;
    v21 = 2082;
    v22 = a6;
    v23 = 2082;
    v24 = a7;
    v25 = 2082;
    v26 = a8;
    v27 = 1024;
    v28 = a9;
    _os_log_debug_impl(&dword_182A8C000, v15, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) began observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)v16, 0x40u);
  }
}

void __DEBUG_STOPPED_OBSERVING_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  const char *v20;
  int v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v16 = *(_QWORD *)(a1 + 32);
  v17 = _CFPrefsDaemonLog();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18)
    {
      v19 = *(_DWORD *)(a1 + 40);
      v21 = 67241730;
      v22 = v19;
      v23 = 2082;
      v24 = a3;
      v25 = 2082;
      v26 = a4;
      v27 = 2082;
      v28 = a6;
      v29 = 2082;
      v30 = a7;
      v31 = 2082;
      v32 = a8;
      v33 = 1024;
      v34 = a9;
      v20 = "Process %{public}d (%{public}s) requested to stop observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }";
LABEL_7:
      _os_log_debug_impl(&dword_182A8C000, v17, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v21, 0x40u);
    }
  }
  else if (v18)
  {
    v21 = 67241730;
    v22 = a2;
    v23 = 2082;
    v24 = a3;
    v25 = 2082;
    v26 = a4;
    v27 = 2082;
    v28 = a6;
    v29 = 2082;
    v30 = a7;
    v31 = 2082;
    v32 = a8;
    v33 = 1024;
    v34 = a9;
    v20 = "Process %{public}d (%{public}s) stopped observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }";
    goto LABEL_7;
  }
}

void __DEBUG_REQUEST_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  uint64_t v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    v19 = 2082;
    v20 = a3;
    v21 = 2082;
    v22 = a4;
    v23 = 2082;
    v24 = a6;
    v25 = 2082;
    v26 = a7;
    v27 = 2082;
    v28 = a8;
    v29 = 1024;
    v30 = a9;
    v31 = 2048;
    v32 = v17;
    _os_log_debug_impl(&dword_182A8C000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) sent a request related to { %{public}s, user: %{public}s, %{public}s, %{public}s, managed: %d } (%p)", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_WRITE_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17[0] = 67241986;
    v17[1] = a2;
    v18 = 2082;
    v19 = a3;
    v20 = 2082;
    v21 = a5;
    v22 = 2082;
    v23 = a4;
    v24 = 2082;
    v25 = a6;
    v26 = 2082;
    v27 = a7;
    v28 = 2082;
    v29 = a8;
    v30 = 1024;
    v31 = a9;
    _os_log_debug_impl(&dword_182A8C000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) wrote the key(s) %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)v17, 0x4Au);
  }
}

void __DEBUG_READ_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  uint64_t v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    v19 = 2082;
    v20 = a3;
    v21 = 2082;
    v22 = a4;
    v23 = 2082;
    v24 = a6;
    v25 = 2082;
    v26 = a7;
    v27 = 2082;
    v28 = a8;
    v29 = 1024;
    v30 = a9;
    v31 = 2082;
    v32 = v17;
    _os_log_debug_impl(&dword_182A8C000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) read data for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, backed by %{public}s", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_READ_EMPTY_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  uint64_t v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    v19 = 2082;
    v20 = a3;
    v21 = 2082;
    v22 = a4;
    v23 = 2082;
    v24 = a6;
    v25 = 2082;
    v26 = a7;
    v27 = 2082;
    v28 = a8;
    v29 = 1024;
    v30 = a9;
    v31 = 2082;
    v32 = v17;
    _os_log_debug_impl(&dword_182A8C000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) read nothing for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, backed by %{public}s", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_NEEDS_TOKEN_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (*(_BYTE *)(a1 + 32))
      v17 = "write";
    else
      v17 = "read";
    v18 = 136448002;
    v19 = v17;
    v20 = 2082;
    v21 = a4;
    v22 = 2082;
    v23 = a6;
    v24 = 2082;
    v25 = a7;
    v26 = 2082;
    v27 = a8;
    v28 = 1024;
    v29 = a9;
    v30 = 1026;
    v31 = a2;
    v32 = 2082;
    v33 = a3;
    _os_log_debug_impl(&dword_182A8C000, v16, OS_LOG_TYPE_DEBUG, "temporarily rejecting %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because an access token is needed", (uint8_t *)&v18, 0x4Au);
  }
}

@end
