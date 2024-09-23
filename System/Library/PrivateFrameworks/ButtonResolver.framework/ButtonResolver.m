void sub_215E58270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void AOPMatchedCallback(void *a1, io_iterator_t iterator)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  task_port_t *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  io_connect_t connect;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = IOIteratorNext(iterator);
  if (!(_DWORD)v4)
  {
LABEL_17:
    objc_msgSend(a1, "updateReadyState");
    return;
  }
  v6 = v4;
  *(_QWORD *)&v5 = 136315394;
  v13 = v5;
  v7 = (task_port_t *)MEMORY[0x24BDAEC58];
  while (1)
  {
    connect = 0;
    v8 = _BRLog_log_0;
    if (!_BRLog_log_0)
    {
      v8 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_0 = (uint64_t)v8;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v13;
      v16 = "void AOPMatchedCallback(void *, io_iterator_t)";
      v17 = 1024;
      v18 = v6;
      _os_log_debug_impl(&dword_215E56000, v8, OS_LOG_TYPE_DEBUG, "%s AOP service added: %u", buf, 0x12u);
    }
    if (objc_msgSend(a1, "service", v13))
    {
      v9 = _BRLog_log_0;
      if (!_BRLog_log_0)
      {
        v9 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_0 = (uint64_t)v9;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        v16 = "void AOPMatchedCallback(void *, io_iterator_t)";
        v17 = 1024;
        v18 = v6;
        _os_log_error_impl(&dword_215E56000, v9, OS_LOG_TYPE_ERROR, "%s Warning: unexpected second AOP Service: %u", buf, 0x12u);
      }
      IOObjectRelease(v6);
      goto LABEL_16;
    }
    objc_msgSend(a1, "setService:", v6);
    if (objc_msgSend(a1, "fastHaptics"))
      break;
LABEL_16:
    v6 = IOIteratorNext(iterator);
    if (!(_DWORD)v6)
      goto LABEL_17;
  }
  v10 = IOServiceOpen(v6, *v7, 0, &connect);
  if (!(_DWORD)v10)
  {
    objc_msgSend(a1, "setConnect:", connect);
    goto LABEL_16;
  }
  v11 = v10;
  v12 = _BRLog_log_0;
  if (!_BRLog_log_0)
  {
    v12 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_0 = (uint64_t)v12;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    AOPMatchedCallback_cold_1(v6, v11, v12);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t serviceAddedCallback(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;

  v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    serviceAddedCallback_cold_1();
  return objc_msgSend(a2, "serviceAddedHandler:", a3);
}

uint64_t serviceRemovedCallback(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;

  v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    serviceRemovedCallback_cold_1();
  return objc_msgSend(a2, "serviceRemovedHandler:", a3);
}

void sub_215E5CD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t serviceAddedCallback_0(int a1, void *a2, IOHIDServiceClientRef service)
{
  NSObject *v5;

  IOHIDServiceClientGetRegistryID(service);
  v5 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    serviceAddedCallback_cold_1_0();
  objc_msgSend((id)objc_msgSend(a2, "services"), "addObject:", service);
  IOHIDServiceClientRegisterRemovalCallback();
  return objc_msgSend(a2, "_setCachedPropertiesOnService:", service);
}

void sub_215E5EAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void serviceRemovedCallback_0(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a2, "services", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (CFEqual(v10, a3))
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
    if (!v10)
      goto LABEL_16;
    v11 = _BRLog_log_2;
    if (!_BRLog_log_2)
    {
      v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_2 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[BRInterfaceLegacy serviceRemovedHandler:].cold.2((__IOHIDServiceClient *)v10, v11);
    objc_msgSend((id)objc_msgSend(a2, "services"), "removeObject:", v10);
  }
  else
  {
LABEL_16:
    v12 = _BRLog_log_2;
    if (!_BRLog_log_2)
    {
      v12 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_2 = (uint64_t)v12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BRInterfaceLegacy serviceRemovedHandler:].cold.1((__IOHIDServiceClient *)a3, v12);
  }
}

void AOPMatchedCallback_cold_1(int a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;
  int v4;

  LODWORD(v3) = 136315650;
  *(_QWORD *)((char *)&v3 + 4) = "void AOPMatchedCallback(void *, io_iterator_t)";
  LOWORD(v4) = HIWORD(a1);
  HIWORD(v4) = 1024;
  OUTLINED_FUNCTION_1_0(&dword_215E56000, a2, a3, "%s Error: couldn't open AOP Service: %u, code: %d", (const char *)v3, (unint64_t)"void AOPMatchedCallback(void *, io_iterator_t)" >> 32, v4);
  OUTLINED_FUNCTION_1();
}

void serviceAddedCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s Legacy service added: %p", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void serviceRemovedCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s Legacy service removed: %p", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void serviceAddedCallback_cold_1_0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_215E56000, v0, v1, "%s Keyboard service added: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x24BDD8368]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x24BDD8388]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x24BDD83B8]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x24BDD83D8]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x24BDD83E0]();
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x24BDD8538](service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x24BDD8548]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD8558](service, key, property);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

