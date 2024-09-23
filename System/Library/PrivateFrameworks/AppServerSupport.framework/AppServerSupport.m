id _os_launch_job_log()
{
  if (_os_launch_job_log_once != -1)
    dispatch_once(&_os_launch_job_log_once, &__block_literal_global);
  return (id)_os_launch_job_log_log;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_crash_msg();
}

uint64_t _xpc_mach_port_close_recv(mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return mach_port_destruct(*MEMORY[0x24BDAEC58], name, srdelta, guard);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t launch_get_running_pid_4SB(const char *a1, _DWORD *a2)
{
  void *v3;
  uint64_t v4;

  _create_app_request(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _xpc_service_routine();
  if (!(_DWORD)v4)
    *a2 = xpc_dictionary_get_int64(0, "pid");

  return v4;
}

id _create_app_request(const char *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  xpc_dictionary_set_string(v2, "name", a1);
  return v2;
}

uint64_t _launch_get_last_exit_reason_4SB(const char *a1, uint64_t *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t uint64;
  int v8;
  uint64_t v9;

  _create_app_request(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _xpc_service_routine();
  if (!(_DWORD)v6)
  {
    uint64 = xpc_dictionary_get_uint64(0, "termination-state");
    *a2 = uint64;
    if (uint64 == 128)
    {
      v8 = xpc_dictionary_get_uint64(0, "os-namespace");
      v9 = xpc_dictionary_get_uint64(0, "os-code");
      *(_DWORD *)a3 = v8;
      *(_QWORD *)(a3 + 8) = v9;
    }
  }

  return v6;
}

void ___os_launch_job_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.libxpc.OSLaunchdJob", "all");
  v1 = (void *)_os_launch_job_log_log;
  _os_launch_job_log_log = (uint64_t)v0;

}

double OUTLINED_FUNCTION_3_0(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_6(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return _os_crash_msg();
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_254CF6218;
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _launch_job_routine()
{
  return MEMORY[0x24BDACAD8]();
}

uint64_t _launch_job_routine_async()
{
  return MEMORY[0x24BDACAE0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _xpc_domain_routine()
{
  return MEMORY[0x24BDACF28]();
}

uint64_t _xpc_service_routine()
{
  return MEMORY[0x24BDACF68]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x24BDADFC0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x24BDAEBC0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0670](xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x24BDB0698](xarray, index);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

uint64_t xpc_copy_short_description()
{
  return MEMORY[0x24BDB0848]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

uint64_t xpc_dictionary_extract_mach_recv()
{
  return MEMORY[0x24BDB08F0]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x24BDB0AA0]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x24BDB0AD0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x24BDB0B78]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

