uint64_t GRCCopyAllCounterSourceGroup()
{
  uint64_t v0;
  uint64_t v2;

  v2 = 0;
  v0 = GRCCopyAllCounterSourceGroupWithError((uint64_t)&v2);
  if (v2)
    NSLog(CFSTR("%@\n"), v2);
  return v0;
}

uint64_t GRCCopyAllCounterSourceGroupWithError(uint64_t a1)
{
  _QWORD block[5];

  if (GRCCopyAllCounterSourceGroupWithError::onceToken != -1)
    dispatch_once(&GRCCopyAllCounterSourceGroupWithError::onceToken, &__block_literal_global);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __GRCCopyAllCounterSourceGroupWithError_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)copyAllCounterSourceDispatchQueue, block);
  return objc_msgSend((id)allSourceManagers, "copy");
}

void GRCReleaseAllCounterSourceGroup()
{
  if (copyAllCounterSourceDispatchQueue)
    dispatch_sync((dispatch_queue_t)copyAllCounterSourceDispatchQueue, &__block_literal_global_7);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
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

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

