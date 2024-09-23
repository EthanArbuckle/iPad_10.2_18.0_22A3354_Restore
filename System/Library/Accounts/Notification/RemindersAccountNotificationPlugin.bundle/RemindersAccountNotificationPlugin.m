void sub_230F571B0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accountType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)(a1 + 72);
    v30 = 138412802;
    v31 = v3;
    v32 = 2112;
    v33 = v5;
    v34 = 1024;
    v35 = v6;
    _os_log_impl(&dword_230F56000, v2, OS_LOG_TYPE_DEFAULT, "RemindersANP: Account changed %@ %@, type: %d", (uint8_t *)&v30, 0x1Cu);

  }
  v7 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "dirtyProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_230F57D1C();

    objc_msgSend(*v7, "dirtyProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", *MEMORY[0x24BDB42D0]);

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_230F57C68(a1 + 32, v13);

    }
  }
  objc_msgSend(*v7, "dirtyAccountProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_230F57BD8();

  }
  objc_msgSend(*v7, "dirtyDataclassProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_230F57B48();

  }
  v20 = *MEMORY[0x24BDB4620];
  v21 = objc_msgSend(*(id *)(a1 + 40), "isEnabledForDataclass:", *MEMORY[0x24BDB4620]);
  v22 = *(_DWORD *)(a1 + 72);
  switch(v22)
  {
    case 3:
      if (v21)
        objc_msgSend(*(id *)(a1 + 48), "deleteAccountForACAccount:", *(_QWORD *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(*v7, "dirtyProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", *MEMORY[0x24BDB42D0]);

      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "enabledDataclasses");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 56);
        if (!v26)
          v26 = *(void **)(a1 + 64);
        objc_msgSend(v26, "enabledDataclasses");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "mutableCopy");
        objc_msgSend(v28, "minusSet:", v27);
        if (objc_msgSend(v28, "containsObject:", v20))
        {
          objc_msgSend(*(id *)(a1 + 48), "updateAccountForACAccount:", *(_QWORD *)(a1 + 40));
        }
        else
        {
          v29 = (void *)objc_msgSend(v27, "mutableCopy");
          objc_msgSend(v29, "minusSet:", v25);
          if (objc_msgSend(v29, "containsObject:", v20))
            objc_msgSend(*(id *)(a1 + 48), "deleteAccountForACAccount:", *(_QWORD *)(a1 + 40));

        }
      }
      break;
    case 1:
      if (v21)
        objc_msgSend(*(id *)(a1 + 48), "updateAccountForACAccount:", *(_QWORD *)(a1 + 40));
      break;
  }
}

void sub_230F57550()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB3FD8], *MEMORY[0x24BDB4000], *MEMORY[0x24BDB4160], *MEMORY[0x24BDB4030], *MEMORY[0x24BDB4078], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25414C358;
  qword_25414C358 = v0;

}

void sub_230F577FC(uint64_t a1, int a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 67109634;
      v10 = a2;
      v11 = 1024;
      v12 = a3;
      v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_230F56000, v7, OS_LOG_TYPE_ERROR, "Failed to update account: didAddAccount: %d, didChangeAccount: %d, error: %@", (uint8_t *)&v9, 0x18u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if ((a2 & 1) != 0 || a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 67109376;
        v10 = a2;
        v11 = 1024;
        v12 = a3;
        _os_log_impl(&dword_230F56000, v7, OS_LOG_TYPE_INFO, "Successfully updated account: didAddAccount: %d, didChangeAccount: %d", (uint8_t *)&v9, 0xEu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_230F57EB8(v7);
    }
  }

}

void sub_230F57A30(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7D208], "accountPlugin");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_230F57EF8((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_230F56000, v5, OS_LOG_TYPE_INFO, "Successfully deleted account", v6, 2u);
  }

}

void sub_230F57AE8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_230F57B24(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_230F57B3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_230F57B48()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F57B30();
  objc_msgSend((id)sub_230F57B24(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyDataclassProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F57AFC();
  sub_230F57AE8(&dword_230F56000, v4, v5, "Dirty dataclass properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F57B14();
}

void sub_230F57BD8()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F57B30();
  objc_msgSend((id)sub_230F57B24(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyAccountProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F57AFC();
  sub_230F57AE8(&dword_230F56000, v4, v5, "Dirty account properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F57B14();
}

void sub_230F57C68(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  objc_msgSend((id)sub_230F57B24(a1), "enabledDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4620]);
  v6 = CFSTR("is not");
  if (v4)
    v6 = CFSTR("is");
  v7 = 138412290;
  v8 = v6;
  sub_230F57B3C(&dword_230F56000, a2, v5, "Reminders dataclass %@ enabled", (uint8_t *)&v7);

}

void sub_230F57D1C()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_230F57B30();
  objc_msgSend((id)sub_230F57B24(v1), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "dirtyProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F57AFC();
  sub_230F57AE8(&dword_230F56000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);

  sub_230F57B14();
}

void sub_230F57DAC()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  sub_230F57B30();
  objc_msgSend(v1, "displayAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_230F57AFC();
  sub_230F57AE8(&dword_230F56000, v5, v6, "Received notification about the primary iCloud account (%@), but it has no dataclass properties yet. Here are the account properties: %@", v7, v8, v9, v10, v11);

  sub_230F57B14();
}

void sub_230F57E4C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  sub_230F57B3C(&dword_230F56000, a2, a3, "Not processing account with account type identifier %@", (uint8_t *)&v3);
}

void sub_230F57EB8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230F56000, log, OS_LOG_TYPE_DEBUG, "Didn't add or change account", v1, 2u);
}

void sub_230F57EF8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230F56000, a2, OS_LOG_TYPE_ERROR, "Failed to delete account: error: %@", (uint8_t *)&v2, 0xCu);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

