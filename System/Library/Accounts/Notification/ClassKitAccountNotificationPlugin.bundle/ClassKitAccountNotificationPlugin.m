void sub_230EF118C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_230EF1250(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  CLSInitLog();
  v2 = (void *)*MEMORY[0x24BDB8520];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDB8520], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned int *)(a1 + 56);
    v4 = v2;
    if ((v3 - 1) >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown changeType: %lu"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_24FFA7D80 + (int)v3 - 1);
    }
    objc_msgSend(*(id *)(a1 + 32), "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v18 = v5;
    v19 = 2160;
    v20 = 1752392040;
    v21 = 2112;
    v22 = v6;
    v23 = 2160;
    v24 = 1752392040;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_230EF0000, v4, OS_LOG_TYPE_DEFAULT, "ClassKitAccountNotificationPlugin: Account changed: [type: %{public}@, newAccount.username.hash: %{mask.hash}@, oldAccount.username.hash: %{mask.hash}@]", buf, 0x34u);

  }
  CLSLogDebugCurrentPersona();
  v8 = *(_DWORD *)(a1 + 56);
  if (v8 != 3)
  {
    if (v8 == 1)
    {
      v9 = *(void **)(a1 + 32);
      if (!v9)
        return;
      objc_msgSend(v9, "accountType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB3FD8]) & 1) == 0)
      {

        goto LABEL_15;
      }
      objc_msgSend(*(id *)(a1 + 32), "aa_cloudKitAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        return;
    }
LABEL_14:
    objc_msgSend(*(id *)(a1 + 48), "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountChanged");
LABEL_15:

    return;
  }
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    objc_msgSend(v13, "accountType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB3FD8]);

    if (v16)
      goto LABEL_14;
  }
}

uint64_t CLSInitLog()
{
  return MEMORY[0x24BDB8510]();
}

uint64_t CLSLogDebugCurrentPersona()
{
  return MEMORY[0x24BDB8518]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

