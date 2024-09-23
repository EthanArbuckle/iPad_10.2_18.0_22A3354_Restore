uint64_t sub_230EE66E8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v4)
    v6 = v4;
  else
    v6 = v5;
  v7 = v6;
  if (objc_msgSend(v7, "ams_isiTunesAccount"))
  {
    objc_msgSend(v7, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_msgSend(v7, "ams_isLocalAccount") & 1) == 0)
      v9 = objc_msgSend(v7, "ams_isSandboxAccount") ^ 1;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_230EE6798(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASDLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543618;
      v10 = (id)objc_opt_class();
      v11 = 2112;
      v12 = v5;
      v8 = v10;
      _os_log_error_impl(&dword_230EE5000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] sbsync finished with error: %{pubic}@", (uint8_t *)&v9, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 1024;
    LODWORD(v12) = a2;
    v8 = v10;
    _os_log_impl(&dword_230EE5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: sbsync finished with result: %d", (uint8_t *)&v9, 0x12u);
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t ASDLogHandleForCategory()
{
  return MEMORY[0x24BE044B0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

