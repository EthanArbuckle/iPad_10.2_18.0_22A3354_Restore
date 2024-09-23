void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_4(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

uint64_t OUTLINED_FUNCTION_5(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;

  return v0;
}

void ServiceMatchingCallback(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  IOKIterator *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;

  v4 = (void *)MEMORY[0x2199DC9EC]();
  v5 = a1;
  objc_msgSend(v5, "lock");
  v6 = (id)objc_msgSend(v5, "notification");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "iterator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = -[IOKIterator initWithIterator:]([IOKIterator alloc], "initWithIterator:", a2);
      objc_msgSend(v7, "setIterator:", v9);

    }
    objc_msgSend(v7, "handler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "handler");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "iterator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v12);

    }
  }
  objc_msgSend(v5, "unlock");

  objc_autoreleasePoolPop(v4);
}

void ServiceInterestCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  IOKService *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);

  v8 = (void *)MEMORY[0x2199DC9EC]();
  v9 = a1;
  objc_msgSend(v9, "lock");
  v10 = (id)objc_msgSend(v9, "notification");
  if (v10)
  {
    v11 = v10;
    v12 = -[IOKService initWithServiceEntry:]([IOKService alloc], "initWithServiceEntry:", a2);
    objc_msgSend(v11, "handler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v11, "handler");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, IOKService *, uint64_t, uint64_t))v14)[2](v14, v12, a3, a4);

    }
  }
  objc_msgSend(v9, "unlock");

  objc_autoreleasePoolPop(v8);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallAsyncStructMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, inputStruct, inputStructCnt, outputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x24BDD7F10](*(_QWORD *)&connect, service);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F20](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperties(io_connect_t connect, CFTypeRef properties)
{
  return MEMORY[0x24BDD7F30](*(_QWORD *)&connect, properties);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD7F38](*(_QWORD *)&connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return MEMORY[0x24BDD7F48](*(_QWORD *)&connect, *(_QWORD *)&index);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x24BDD7F50](*(_QWORD *)&connect, *(_QWORD *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x24BDD7F58](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x24BDD7F60](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3);
}

kern_return_t IOConnectTrap4(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4)
{
  return MEMORY[0x24BDD7F68](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4);
}

kern_return_t IOConnectTrap5(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5)
{
  return MEMORY[0x24BDD7F70](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4, p5);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x24BDD7F78](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3, p4, p5, p6);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F88](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

CFStringRef IOObjectCopyBundleIdentifierForClass(CFStringRef classname)
{
  return (CFStringRef)MEMORY[0x24BDD86C0](classname);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x24BDD86C8](*(_QWORD *)&object);
}

CFStringRef IOObjectCopySuperclassForClass(CFStringRef classname)
{
  return (CFStringRef)MEMORY[0x24BDD86D0](classname);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

io_connect_t IOPMFindPowerManagement(mach_port_t master_device_port)
{
  return MEMORY[0x24BDD8780](*(_QWORD *)&master_device_port);
}

BOOLean_t IOPMSleepEnabled(void)
{
  return MEMORY[0x24BDD87B0]();
}

IOReturn IOPMSleepSystem(io_connect_t fb)
{
  return MEMORY[0x24BDD87B8](*(_QWORD *)&fb);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryCreateIterator(mach_port_t mainPort, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD8890](*(_QWORD *)&mainPort, plane, *(_QWORD *)&options, iterator);
}

io_registry_entry_t IORegistryEntryCopyFromPath(mach_port_t mainPort, CFStringRef path)
{
  return MEMORY[0x24BDD8898](*(_QWORD *)&mainPort, path);
}

CFStringRef IORegistryEntryCopyPath(io_registry_entry_t entry, const io_name_t plane)
{
  return (CFStringRef)MEMORY[0x24BDD88A0](*(_QWORD *)&entry, plane);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88B8](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetLocationInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t location)
{
  return MEMORY[0x24BDD88D8](*(_QWORD *)&entry, plane, location);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return MEMORY[0x24BDD88E8](*(_QWORD *)&entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88F8](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x24BDD8920](*(_QWORD *)&entry, plane);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x24BDD8940](*(_QWORD *)&mainPort);
}

kern_return_t IORegistryIteratorEnterEntry(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8948](*(_QWORD *)&iterator);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8950](*(_QWORD *)&iterator);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceAuthorize(io_service_t service, uint32_t options)
{
  return MEMORY[0x24BDD8968](*(_QWORD *)&service, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetBusyState(io_service_t service, uint32_t *busyState)
{
  return MEMORY[0x24BDD8978](*(_QWORD *)&service, busyState);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return MEMORY[0x24BDD89A0](*(_QWORD *)&service, matching, matches);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

kern_return_t IOServiceRequestProbe(io_service_t service, uint32_t options)
{
  return MEMORY[0x24BDD89C0](*(_QWORD *)&service, *(_QWORD *)&options);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

