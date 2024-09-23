void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1()
{
  return initialized == 0;
}

intptr_t btaLock()
{
  if (btaLock_onceToken != -1)
    dispatch_once(&btaLock_onceToken, &__block_literal_global);
  return dispatch_semaphore_wait((dispatch_semaphore_t)initSem, 0xFFFFFFFFFFFFFFFFLL);
}

dispatch_semaphore_t __btaLock_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(1);
  initSem = (uint64_t)result;
  return result;
}

intptr_t btaUnlock()
{
  return dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
}

intptr_t BackgroundTaskAgentInit(char *__s, NSObject *a2, uint64_t a3)
{
  size_t v6;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD handler[5];

  if (!__s)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      BackgroundTaskAgentInit_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    __assert_rtn("BackgroundTaskAgentInit", "BackgroundTaskAgent.m", 80, "clientName != ((void *)0)");
  }
  if (gClientName)
    free((void *)gClientName);
  v6 = strlen(__s);
  gClientName = (uint64_t)malloc_type_malloc(v6 + 1, 0x100004077774924uLL);
  strcpy((char *)gClientName, __s);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __BackgroundTaskAgentInit_block_invoke;
  handler[3] = &unk_24C7EF4E0;
  handler[4] = a3;
  btaLock();
  initialized = 1;
  xpc_set_event_stream_handler("com.apple.backgroundtaskagent", a2, handler);
  return dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
}

uint64_t BackgroundTaskAgentRemoveJob(uint64_t a1)
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  btaLock();
  if (!initialized)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v3 || (BackgroundTaskAgentRemoveJob_cold_3(v3, v4, v5, v6, v7, v8, v9, v10), (v11 & 1) != 0))
      BackgroundTaskAgentRemoveJob_cold_1();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  if (!a1)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      BackgroundTaskAgentRemoveJob_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
    __assert_rtn("BackgroundTaskAgentRemoveJob", "BackgroundTaskAgent.m", 158, "jobName != ((void *)0)");
  }
  return xpc_set_event();
}

uint64_t BackgroundTaskAgentAddJob(uint64_t a1, void *a2)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  btaLock();
  if (!initialized)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v5 || (BackgroundTaskAgentAddJob_cold_3(v5, v6, v7, v8, v9, v10, v11, v12), (v13 & 1) != 0))
      BackgroundTaskAgentAddJob_cold_1();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  if (!a1)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      BackgroundTaskAgentAddJob_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    __assert_rtn("BackgroundTaskAgentAddJob", "BackgroundTaskAgent.m", 139, "jobName != ((void *)0)");
  }
  if (MEMORY[0x212BAC4F0](a2) == MEMORY[0x24BDACFA0])
    xpc_dictionary_set_string(a2, "BackgroundTaskAgentClientName", (const char *)gClientName);
  return xpc_set_event();
}

void *BackgroundTaskAgentCopyJob()
{
  void *v0;
  void *v1;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  btaLock();
  if (!initialized)
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v3 || (BackgroundTaskAgentCopyJob_cold_2(v3, v4, v5, v6, v7, v8, v9, v10), (v11 & 1) != 0))
      BackgroundTaskAgentCopyJob_cold_1();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  v0 = (void *)xpc_copy_event();
  v1 = v0;
  if (v0 && !xpc_dictionary_get_count(v0))
  {
    xpc_release(v1);
    return 0;
  }
  return v1;
}

void BackgroundTaskAgentInit_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentInit: clientName is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void BackgroundTaskAgentRemoveJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentRemoveJob", "BackgroundTaskAgent.m", 156, "initialized == 1");
}

void BackgroundTaskAgentRemoveJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentRemoveJob: jobName is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void BackgroundTaskAgentRemoveJob_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentRemoveJob: Call BackgroundTaskAgentInit first", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
}

void BackgroundTaskAgentAddJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentAddJob", "BackgroundTaskAgent.m", 137, "initialized == 1");
}

void BackgroundTaskAgentAddJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentAddJob: jobName is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void BackgroundTaskAgentAddJob_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentAddJob: Call BackgroundTaskAgentInit first", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
}

void BackgroundTaskAgentCopyJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentCopyJob", "BackgroundTaskAgent.m", 171, "initialized == 1");
}

void BackgroundTaskAgentCopyJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgentCopyJob: Call BackgroundTaskAgentInit first", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x24BDB0840]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

