void sub_21C6876F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21C687CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id nar_sync_log()
{
  if (nar_sync_log_onceToken != -1)
    dispatch_once(&nar_sync_log_onceToken, &__block_literal_global);
  return (id)nar_sync_log___logger;
}

void __nar_sync_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("NanoAppRegistry", "sync");
  v1 = (void *)nar_sync_log___logger;
  nar_sync_log___logger = (uint64_t)v0;

}

id nar_workspace_log()
{
  if (nar_workspace_log_onceToken != -1)
    dispatch_once(&nar_workspace_log_onceToken, &__block_literal_global_3);
  return (id)nar_workspace_log___logger;
}

void __nar_workspace_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("NanoAppRegistry", "workspace");
  v1 = (void *)nar_workspace_log___logger;
  nar_workspace_log___logger = (uint64_t)v0;

}

uint64_t NARSyncedInfoPlistKeys()
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDBD288], *MEMORY[0x24BDBD298], *MEMORY[0x24BDBD2A0], *MEMORY[0x24BDBD1D0], *MEMORY[0x24BDBD1E8], *MEMORY[0x24BDBD1E0], 0);
}

uint64_t NARSyncedLocalizedInfoPlistKeys()
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDBD298], *MEMORY[0x24BDBD1D0], *MEMORY[0x24BDBD1E0], 0);
}

uint64_t NARSyncediTunesPlistKeys()
{
  return objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("artistName"), CFSTR("itemName"), 0);
}

uint64_t NARWorkspaceServiceInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25529C2C8);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

