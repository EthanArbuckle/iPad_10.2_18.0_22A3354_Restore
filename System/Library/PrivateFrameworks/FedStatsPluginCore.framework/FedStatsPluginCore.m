void sub_23B4278BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t checkPrivateRelay(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v6, "hasSuffix:", CFSTR("with-private-relay")))
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      checkPrivateRelay_cold_5();

    if ((objc_msgSend(v5, "containsString:", CFSTR("privacyProxy = 1")) & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE2CBD8]);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        -[NSObject objectForKey:](v9, "objectForKey:", *MEMORY[0x24BE2CBE0]);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v12 = v11;
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v24;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v24 != v15)
                  objc_enumerationMutation(v12);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "containsString:", CFSTR("apple"), (_QWORD)v23))
                {
                  +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                    checkPrivateRelay_cold_3();

                  v17 = 0;
                  goto LABEL_34;
                }
              }
              v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              if (v14)
                continue;
              break;
            }
          }
          v17 = 1;
LABEL_34:

          goto LABEL_39;
        }
        +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          checkPrivateRelay_cold_2();

      }
      else
      {
        +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          checkPrivateRelay_cold_1();
      }
      v17 = 0;
LABEL_39:

      goto LABEL_40;
    }
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    goto LABEL_28;
  }
  v18 = objc_msgSend(v6, "hasSuffix:", CFSTR("without-private-relay"));
  +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
  v10 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v18)
  {
    if (v19)
      checkPrivateRelay_cold_8();
    v17 = 1;
    goto LABEL_40;
  }
  if (v19)
    checkPrivateRelay_cold_7();

  if ((objc_msgSend(v5, "containsString:", CFSTR("privacyProxy = 0")) & 1) == 0)
  {
    +[FedStatsPluginLog logger](FedStatsPluginLog, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
LABEL_27:
      checkPrivateRelay_cold_4();
LABEL_28:
    v17 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v17 = 1;
LABEL_41:

  return v17;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_9(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void checkPrivateRelay_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23B425000, v0, v1, "Dedisco configuration is missing Server configuration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23B425000, v0, v1, "Dedisco Server configuration is missing helper servers.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23B425000, v0, v1, "Helper in Dedisco Server configuration cannot be 1st party.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23B425000, v0, v1, "The SQL query does not filter against only private relay signal on the table.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23B425000, v0, v1, "The client ID is associated with explicit use-case with private relay.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23B425000, v0, v1, "The client ID is associated with explicit use-case without private relay.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void checkPrivateRelay_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_23B425000, v0, v1, "The client ID is not associated with private relay.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t INSupportedMediaCategories()
{
  return MEMORY[0x24BDD9A48]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

