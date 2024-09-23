void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &loc_219609000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_219602000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_219602000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_219602000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (_QWORD *)&loc_219609000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[395];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_219602000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  return init_logging_signposts();
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id logObjectForModule()
{
  BOOL v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    v10 = (id)MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  return v10;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  char v12;
  __int16 v13;

  if (a3 >= 2)
  {
    v3 = 0;
    v4 = a3 >> 1;
    do
    {
      v5 = 0;
      v13 = -21846;
      v6 = 1;
      do
      {
        v7 = v6;
        v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        v9 = v8 - 48;
        v10 = v8 - 65;
        if ((v8 - 97) >= 6)
          v11 = 0;
        else
          v11 = v8 - 87;
        v12 = v8 - 55;
        if (v10 > 5)
          v12 = v11;
        if (v9 < 0xA)
          v12 = v9;
        *((_BYTE *)&v13 + v5) = v12;
        v5 = 1;
        v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(_BYTE *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v7;
  unsigned int v8;

  if (result)
  {
    v4 = a2;
    if (a2)
    {
      v7 = result;
      do
      {
        v8 = *v7++;
        result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
        return (unsigned __int8 *)putchar(10);
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10)
    a1[v2 - 1] = 0;
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  size_t v5;
  char *result;
  char *v7;
  unint64_t v8;
  char *v9;
  char *v10;
  size_t v11;
  char *v12;
  size_t v13;
  char *v14;

  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        v5 = (2 * a2) | 1;
LABEL_10:
        v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          v8 = 0;
          v9 = v7;
          v14 = v7;
          v10 = v7;
          v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              v12 = v10;
              v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8)
              return v14;
          }
          v12 = v9;
          v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result)
    strcpy(result, "(null)");
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __int128 v6;
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;

  v33 = -1431655766;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  v18 = v6;
  v16 = v6;
  v17 = v6;
  v14 = v6;
  v15 = v6;
  v12 = v6;
  v13 = v6;
  *(_OWORD *)task_info_out = v6;
  v11 = v6;
  task_info_outCnt = 93;
  v7 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1)
      *a1 = v11;
    if (a2)
      *a2 = *(_QWORD *)task_info_out;
    if (a3)
      *a3 = v19;
  }
  return v7 == 0;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_219602000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_219602000, MEMORY[0x24BDACB70], a3, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t init_logging_signposts()
{
  return MEMORY[0x24BE00DD8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

