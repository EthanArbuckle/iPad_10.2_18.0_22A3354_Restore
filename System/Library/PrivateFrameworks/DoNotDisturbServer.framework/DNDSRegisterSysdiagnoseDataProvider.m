@implementation DNDSRegisterSysdiagnoseDataProvider

_DWORD *__DNDSRegisterSysdiagnoseDataProvider_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  do
    v3 = __ldaxr((unsigned int *)&_sysdiagnoseInProgress);
  while (__stlxr(v3 + 1, (unsigned int *)&_sysdiagnoseInProgress));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseDataIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DNDSLogSysdiagnose;
  if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    v23 = 2114;
    v24 = v4;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Capturing state from %{public}@; date=%{public}@",
      buf,
      0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseDataForDate:redacted:", v4, DNDSRedactSysdiagnose());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = DNDSLogSysdiagnose;
  if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v5;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Packing sysdiagnose state data from %{public}@...", buf, 0xCu);
  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  v11 = objc_msgSend(v9, "length");
  if (v9)
  {
    v12 = v11;
    if ((unint64_t)(v11 + 200) <= 0x8000)
    {
      v13 = malloc_type_calloc(1uLL, v11 + 200, 0x6D348980uLL);
      objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseDataIdentifier");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v14, "cStringUsingEncoding:", 1);
      __strlcpy_chk();

      *v13 = 1;
      v13[1] = v12;
      objc_msgSend(v9, "getBytes:length:", v13 + 50, v12);
      v15 = DNDSLogSysdiagnose;
      if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v5;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Sysdiagnose captured from %{public}@", buf, 0xCu);
      }
      goto LABEL_17;
    }
    v17 = DNDSLogSysdiagnose;
    if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_ERROR))
      __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_2((uint64_t)v5, v17);
  }
  else
  {
    v16 = DNDSLogSysdiagnose;
    if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_ERROR))
      __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_1((uint64_t)v5, (uint64_t)v10, v16);
  }
  v13 = 0;
  do
LABEL_17:
    v18 = __ldaxr((unsigned int *)&_sysdiagnoseInProgress);
  while (__stlxr(v18 - 1, (unsigned int *)&_sysdiagnoseInProgress));

  return v13;
}

void __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Could not capture sysdiagnose from %{public}@ due to unable to make Plist: error=%{public}@", (uint8_t *)&v3, 0x16u);
}

void __DNDSRegisterSysdiagnoseDataProvider_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Could not capture sysdiagnose from %{public}@ due to too much data", (uint8_t *)&v2, 0xCu);
}

@end
