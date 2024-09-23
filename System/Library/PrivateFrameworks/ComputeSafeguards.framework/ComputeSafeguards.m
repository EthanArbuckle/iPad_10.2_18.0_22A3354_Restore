uint64_t PowerLogLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PowerLogLibraryCore_frameworkLibrary)
    PowerLogLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PowerLogLibraryCore_frameworkLibrary;
  if (!PowerLogLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2383F8094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_6_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

id processLogger()
{
  if (processLogger_onceToken != -1)
    dispatch_once(&processLogger_onceToken, &__block_literal_global_0);
  return (id)processLogger_logger;
}

void processExitHandler(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  +[CSProcessManager sharedInstanceWithEnrolledProcesses:andExemptions:](CSProcessManager, "sharedInstanceWithEnrolledProcesses:andExemptions:", 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "currentPID");

  objc_msgSend(v3, "recordTerminationForPID:", v2);
}

void __processLogger_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSProcess"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)processLogger_logger;
  processLogger_logger = v0;

}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id getMainQueue()
{
  if (getMainQueue_onceToken != -1)
    dispatch_once(&getMainQueue_onceToken, &__block_literal_global_51);
  return (id)mainQueue;
}

void __getMainQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.computesafeguards.mainqueue", v2);
  v1 = (void *)mainQueue;
  mainQueue = (uint64_t)v0;

}

void sub_2383FD260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void *getCSProcesses()
{
  id v0;

  v0 = &unk_250A1F500;
  return &unk_250A1F500;
}

void *getCSExemptProcesses()
{
  id v0;

  v0 = &unk_250A1F258;
  return &unk_250A1F258;
}

void *getCSScenarios()
{
  id v0;

  v0 = &unk_250A1F690;
  return &unk_250A1F690;
}

uint64_t getCSProcessRestrictions(uint64_t a1)
{
  return objc_msgSend(&unk_250A1F4D8, "objectForKeyedSubscript:", a1);
}

id initComputeSafeguards()
{
  return +[CSDaemon run](CSDaemon, "run");
}

uint64_t isInternalBuild()
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_5);
  return isInternalBuild_internalBuild;
}

void __isInternalBuild_block_invoke()
{
  const __CFBoolean *v0;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  isInternalBuild_internalBuild = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

id CSObjectOfClassForKey(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

id CSObjectOfClassForKeyWithErrors(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a4;
  CSObjectOfClassForKey(v7, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2114;
      v25 = (id)objc_opt_class();
      v26 = 2114;
      v27 = a3;
      v19 = v25;
      _os_log_error_impl(&dword_2383F5000, v13, OS_LOG_TYPE_ERROR, "Detected misconfigured properties dictionary. Property %{public}@ had class %{public}@ when class %{public}@ was expected", buf, 0x20u);

    }
    if (v9)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Detected misconfigured properties dictionary. Property %@ had class %@ when class %@ was expected"), v8, objc_opt_class(), a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CSUtilitiesErrorDomain"), 1, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v17);
    }
  }

  return v11;
}

id CSNumberForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  CSObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CSNumberForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_opt_class();
  CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CSStringForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  CSObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CSStringForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_opt_class();
  CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CSURLForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  CSObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CSURLForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_opt_class();
  CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CSArrayForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  CSObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CSArrayForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_opt_class();
  CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id CSDictionaryForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  CSObjectOfClassForKey(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id CSDictionaryForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_opt_class();
  CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t CSBoolForKey(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
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

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x24BDAF6B8]();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6D8](*(_QWORD *)&type, *(_QWORD *)&typeinfo, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x24BDAF738]();
}

uint64_t proc_set_cpumon_params_fatal()
{
  return MEMORY[0x24BDAF740]();
}

