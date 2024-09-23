void sub_230F2202C(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x24BDD3068];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3068], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("Did not");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("Did");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_230F20000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ notify about account change %{public}@", (uint8_t *)&v9, 0x20u);
  }

}

void sub_230F22118(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    _HKInitializeLogging();
    v7 = (os_log_t *)MEMORY[0x24BDD3068];
    v8 = *MEMORY[0x24BDD3068];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3068], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v9;
      v19 = 2114;
      v20 = CFSTR("Did");
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_230F20000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ send new device added notification message successfully. Error: %{public}@", buf, 0x20u);
    }
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD4640];
    v16 = v6;
    v13 = objc_msgSend(v10, "setDate:forKey:error:", v11, v12, &v16);
    v14 = v16;

    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      v15 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        sub_230F22308(a1, (uint64_t)v14, v15);
    }
  }
  else
  {
    v14 = v5;
  }

}

void sub_230F22284(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_230F20000, log, OS_LOG_TYPE_ERROR, "%{public}@: Getting last notified of account change failed with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_230F22308(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_230F20000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to persist %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

