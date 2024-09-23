void sub_230EEBC70(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[2];
  __int16 v18;
  __int16 v19;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "accountType");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
      goto LABEL_11;
    v8 = objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

    if (!v8)
      return;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v18 = 0;
    v5 = MEMORY[0x24BDACB70];
    v6 = "[BluetoothUserAccountPlugin] Primary Apple Account deleted";
    v7 = (uint8_t *)&v18;
LABEL_16:
    _os_log_impl(&dword_230EEA000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_17;
  }
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountType");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB3FD8]))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

      if (!v4)
        return;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v19 = 0;
      v5 = MEMORY[0x24BDACB70];
      v6 = "[BluetoothUserAccountPlugin] Primary Apple Account added";
      v7 = (uint8_t *)&v19;
      goto LABEL_16;
    }
LABEL_11:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB4080]);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "securityLevelForAccount:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "securityLevelForAccount:", *(_QWORD *)(a1 + 48));

    if (v13 != v15)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        objc_msgSend(*(id *)(a1 + 56), "accountModified");
        return;
      }
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x24BDACB70];
      v6 = "[BluetoothUserAccountPlugin] IDMS account security level changed, signaling primaryAccountModified";
      v7 = buf;
      goto LABEL_16;
    }
  }
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

