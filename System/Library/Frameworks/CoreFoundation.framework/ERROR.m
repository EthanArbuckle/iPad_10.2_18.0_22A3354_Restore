@implementation ERROR

void __ERROR_READ_REJECTED_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = 136448002;
    v19 = a4;
    v20 = 2082;
    v21 = a6;
    v22 = 2082;
    v23 = a7;
    v24 = 2082;
    v25 = a8;
    v26 = 1024;
    v27 = a9;
    v28 = 1026;
    v29 = a2;
    v30 = 2082;
    v31 = a3;
    v32 = 2082;
    v33 = v17;
    _os_log_error_impl(&dword_182A8C000, v16, OS_LOG_TYPE_ERROR, "rejecting read of { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because %{public}s", (uint8_t *)&v18, 0x4Au);
  }
}

void __ERROR_LOG_PREUNLOCK_ACCESS_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136446722;
    v9 = v7;
    v10 = 2082;
    v11 = a3;
    v12 = 1024;
    v13 = a2;
    _os_log_error_impl(&dword_182A8C000, v6, OS_LOG_TYPE_ERROR, "#prefsbeforeunlock Attempt to access %{public}s by %{public}s(%d)", (uint8_t *)&v8, 0x1Cu);
  }
}

void __ERROR_WRITE_REJECTED_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  NSObject *v17;
  uint64_t v18;
  int v19;
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
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v17 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = 136448258;
    v20 = a5;
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
    v31 = 1026;
    v32 = a2;
    v33 = 2082;
    v34 = a3;
    v35 = 2082;
    v36 = v18;
    _os_log_error_impl(&dword_182A8C000, v17, OS_LOG_TYPE_ERROR, "rejecting write of key(s) %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because %{public}s", (uint8_t *)&v19, 0x54u);
  }
}

@end
