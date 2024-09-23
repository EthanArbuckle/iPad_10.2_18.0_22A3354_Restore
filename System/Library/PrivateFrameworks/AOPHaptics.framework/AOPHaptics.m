void AOPMatchedCallback(void *a1, io_iterator_t iterator)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  task_port_t *v7;
  NSObject *v8;
  NSObject *v9;
  kern_return_t v10;
  int v11;
  NSObject *v12;
  __int128 v13;
  io_connect_t connect;
  uint8_t buf[4];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = IOIteratorNext(iterator);
  if (!(_DWORD)v4)
    return;
  v6 = v4;
  *(_QWORD *)&v5 = 67109120;
  v13 = v5;
  v7 = (task_port_t *)MEMORY[0x24BDAEC58];
  while (1)
  {
    connect = 0;
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    v8 = _AHLog_log;
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = v13;
      v16 = v6;
      _os_log_impl(&dword_227C59000, v8, OS_LOG_TYPE_INFO, "AOPHaptics driver added: %u", buf, 8u);
    }
    if (objc_msgSend(a1, "service", v13))
    {
      if (_AHLog_onceToken != -1)
        dispatch_once(&_AHLog_onceToken, &__block_literal_global);
      v9 = _AHLog_log;
      if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        v16 = v6;
        _os_log_error_impl(&dword_227C59000, v9, OS_LOG_TYPE_ERROR, "Warning: unexpected second AOPHaptics driver: %u", buf, 8u);
      }
      IOObjectRelease(v6);
      goto LABEL_15;
    }
    objc_msgSend(a1, "setService:", v6);
    v10 = IOServiceOpen(v6, *v7, 0, &connect);
    if (v10)
      break;
    objc_msgSend(a1, "setConnect:", connect);
    objc_msgSend(a1, "signalReady");
LABEL_15:
    v6 = IOIteratorNext(iterator);
    if (!(_DWORD)v6)
      return;
  }
  v11 = v10;
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v12 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
    AOPMatchedCallback_cold_1(v6, v11, v12);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void AOPMatchedCallback_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_227C59000, log, OS_LOG_TYPE_ERROR, "Error: couldn't open AOPHaptics driver: %u, code: %d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_4();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

