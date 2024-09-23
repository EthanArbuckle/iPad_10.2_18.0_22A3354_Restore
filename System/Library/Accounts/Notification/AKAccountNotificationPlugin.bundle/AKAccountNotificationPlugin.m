void sub_230EC2254(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_230EC1000, v6, OS_LOG_TYPE_DEFAULT, "Successfully cleaned Hide My Email database", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_230EC4280();
  }

}

void sub_230EC2CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230EC2CCC(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230EC4430();

  }
}

uint64_t sub_230EC2D24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_230EC2D34(uint64_t a1)
{

}

void sub_230EC2D3C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_230EC3520(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_230EC1000, v5, OS_LOG_TYPE_DEFAULT, "\"Successfully updated remote IdMS account...\"", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_230EC45E0(v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_saveOptionsForCompanionDeviceAuth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "remoteDeviceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendCommand:withAccount:options:completion:", *MEMORY[0x24BDB4338], *(_QWORD *)(a1 + 48), v6, &unk_24FFA1740);

}

void sub_230EC35FC(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a4;
  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_230EC1000, v7, OS_LOG_TYPE_DEFAULT, "\"Successfully verified credentials on the remote iCloud account!\"", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_230EC461C();
  }

}

void sub_230EC3794(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_230EC1000, v3, OS_LOG_TYPE_DEFAULT, "Remove PCS auth credentials completed with error: %@", (uint8_t *)&v5, 0xCu);

  }
}

void sub_230EC3858(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_230EC387C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_230EC3E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230EC3EBC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v11, "informativeText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = v7 == 0;

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = 1;
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24))
    *a4 = 1;

}

void sub_230EC401C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_230EC47BC((uint64_t)v4, v5);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_230EC41B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_230EC41C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Reporting invalid save of account: %@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Reporting invalid change of account: %@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4280()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Failed to wipe Hide My Email database with error:%@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC42E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Failed to wipe database with error: %@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4340()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Failed to clean up follow ups... please file a radar: %@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC43A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EC387C(&dword_230EC1000, a1, a3, "Ignoring idMS account change, as we already had a token", a5, a6, a7, a8, 0);
  sub_230EC388C();
}

void sub_230EC43D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Failed to fetch fresh account for %@, not synchronizing followups!", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4430()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Failed to mark followup sync timestamp, oh well... %@", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4490()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Account %@ is not valid, missing username!", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC44F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Account %@ is not valid, missing DSID!", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC4550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "Account %@ is not valid, missing altDSID!", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC45B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EC387C(&dword_230EC1000, a1, a3, "Sending updated CK+PRK to peer device...", a5, a6, a7, a8, 0);
  sub_230EC388C();
}

void sub_230EC45E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230EC1000, log, OS_LOG_TYPE_ERROR, "\"Failed to update the remote IdMS account, bailing!\"", v1, 2u);
  sub_230EC388C();
}

void sub_230EC461C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_230EC3870();
  sub_230EC3858(&dword_230EC1000, v0, v1, "\"Failed to verify credentials on the remote iCloud account, error: %@\"", v2, v3, v4, v5, v6);
  sub_230EC3868();
}

void sub_230EC467C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EC41B0(&dword_230EC1000, a1, a3, "AKFollowUpSynchronizer: Client provided nil account, defaulting to the primary iCloud account", a5, a6, a7, a8, 0);
}

void sub_230EC46B0(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "altDSIDForAccount:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = v4;
  v9 = 2113;
  v10 = v6;
  _os_log_error_impl(&dword_230EC1000, a2, OS_LOG_TYPE_ERROR, "Sync for account: %{private}@ - %{private}@", (uint8_t *)&v7, 0x16u);

}

void sub_230EC4788(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230EC41B0(&dword_230EC1000, a1, a3, "Failed to fetch items, falling back to sync", a5, a6, a7, a8, 0);
}

void sub_230EC47BC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230EC1000, a2, OS_LOG_TYPE_ERROR, "Failed to update follow up synchronization date: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x24BE00EB0]();
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x24BE0AE10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

