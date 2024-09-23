id _ARLogDaemon()
{
  if (_ARLogDaemon_onceToken != -1)
    dispatch_once(&_ARLogDaemon_onceToken, &__block_literal_global_105);
  return (id)_ARLogDaemon_logObj;
}

const __CFString *NSStringFromARMemoryPressureCondition(uint64_t a1)
{
  if (a1)
    return CFSTR("Critical");
  else
    return CFSTR("Warning");
}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1)
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_0);
  return (id)_ARLogGeneral_logObj;
}

void sub_235C48604(_Unwind_Exception *a1)
{
  __90__ARDaemon_initWithConfiguration_spawnTime_watchdogMonitor_graphScheduler_replayDelegate___block_invoke();
  _Unwind_Resume(a1);
}

id _ARLogDaemon_0()
{
  if (_ARLogDaemon_onceToken_0 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_0, &__block_literal_global_161);
  return (id)_ARLogDaemon_logObj_0;
}

id _ARLogDaemon_1()
{
  if (_ARLogDaemon_onceToken_1 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_1, &__block_literal_global_161_0);
  return (id)_ARLogDaemon_logObj_1;
}

void sub_235C4A054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogGeneral_0()
{
  if (_ARLogGeneral_onceToken_0 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_0, &__block_literal_global_164);
  return (id)_ARLogGeneral_logObj_0;
}

void sub_235C4A45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_235C4A5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_235C4A7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_235C4A930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_235C4AC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
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

id _ARLogDaemon_2()
{
  if (_ARLogDaemon_onceToken_2 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_2, &__block_literal_global_2);
  return (id)_ARLogDaemon_logObj_2;
}

id _ARLogDaemon_3()
{
  if (_ARLogDaemon_onceToken_4 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_4, &__block_literal_global_4);
  return (id)_ARLogDaemon_logObj_4;
}

const __CFString *NSStringFromARProcessTaskState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("ARProcessTaskStateUnknown");
  else
    return off_250702880[a1 - 1];
}

const __CFString *NSStringFromARProcessDebugState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("ARProcessDebugStateUnknown");
  else
    return off_2507028A0[a1 - 1];
}

const __CFString *NSStringFromARProcessImmersivenessLevel(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("ARProcessImmersivenessLevelNone");
  if (a1 == 1)
    v1 = CFSTR("ARProcessImmersivenessLevelDefocused");
  if (a1 == 2)
    return CFSTR("ARProcessImmersivenessLevelFull");
  else
    return v1;
}

void sub_235C4CC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogProcessMonitor()
{
  if (_ARLogProcessMonitor_onceToken != -1)
    dispatch_once(&_ARLogProcessMonitor_onceToken, &__block_literal_global_5);
  return (id)_ARLogProcessMonitor_logObj;
}

void sub_235C4D210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  os_unfair_lock_s *v15;

  os_unfair_lock_unlock(v15);
  _Unwind_Resume(a1);
}

void sub_235C4D50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  os_unfair_lock_s *v15;

  os_unfair_lock_unlock(v15);
  _Unwind_Resume(a1);
}

void sub_235C4D778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ARDiagnosticPipelineRequestTailspin(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = *MEMORY[0x24BDD0FC8];
    v7[0] = CFSTR("DiagnosticPipeline is not supported.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ARErrorWithCodeAndUserInfo();
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

void sub_235C4E2A4(_Unwind_Exception *a1)
{
  __95__ARServer_initWithDaemonConfiguration_spawnTime_sessionUUID_watchdogMonitor_executionManager___block_invoke();
  _Unwind_Resume(a1);
}

id _ARLogDaemon_4()
{
  if (_ARLogDaemon_onceToken_6 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_6, &__block_literal_global_240);
  return (id)_ARLogDaemon_logObj_6;
}

void sub_235C4EDE8(_Unwind_Exception *a1)
{
  __25__ARServer__addServices___block_invoke();
  _Unwind_Resume(a1);
}

id _ARLogGeneral_1()
{
  if (_ARLogGeneral_onceToken_1 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_243);
  return (id)_ARLogGeneral_logObj_1;
}

void sub_235C4F778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  os_unfair_lock_s *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock(v7);
  _Unwind_Resume(a1);
}

void sub_235C4F8E0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_235C4FD78(_Unwind_Exception *a1)
{
  __25__ARServer__addServices___block_invoke();
  _Unwind_Resume(a1);
}

void sub_235C50250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_235C508CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v26);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_235C50C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void (*a12)(char *))
{
  a12(&a10);
  _Unwind_Resume(a1);
}

void sub_235C50F54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_235C510AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _ARLogDaemon_5()
{
  if (_ARLogDaemon_onceToken_7 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_7, &__block_literal_global_7);
  return (id)_ARLogDaemon_logObj_7;
}

id _ARLogDaemon_6()
{
  if (_ARLogDaemon_onceToken_8 != -1)
    dispatch_once(&_ARLogDaemon_onceToken_8, &__block_literal_global_8);
  return (id)_ARLogDaemon_logObj_8;
}

void sub_235C53AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _ARLogGeneral_2()
{
  if (_ARLogGeneral_onceToken_2 != -1)
    dispatch_once(&_ARLogGeneral_onceToken_2, &__block_literal_global_9);
  return (id)_ARLogGeneral_logObj_2;
}

uint64_t ARCoreAnalyticsEventCreateAndReport()
{
  return MEMORY[0x24BDFD808]();
}

uint64_t ARCreateFixedPriorityDispatchQueue()
{
  return MEMORY[0x24BDFD810]();
}

uint64_t ARCreateNonFixedPriorityConcurrentDispatchQueue()
{
  return MEMORY[0x24BDFD818]();
}

uint64_t ARCreateNonFixedPriorityDispatchQueue()
{
  return MEMORY[0x24BDFD820]();
}

uint64_t ARCreateTransactionForService()
{
  return MEMORY[0x24BDFD828]();
}

uint64_t ARDaemonLocalAnonymousListenerDaemon()
{
  return MEMORY[0x24BDFD830]();
}

uint64_t ARErrorWithCodeAndUserInfo()
{
  return MEMORY[0x24BDFD848]();
}

uint64_t ARFrameworkVersions()
{
  return MEMORY[0x24BDFD850]();
}

uint64_t ARGetMemoryFootprint()
{
  return MEMORY[0x24BDFD858]();
}

uint64_t ARGetProcessNameForPID()
{
  return MEMORY[0x24BDFD860]();
}

uint64_t ARGetSubclassesForClass()
{
  return MEMORY[0x24BDFD868]();
}

uint64_t ARGetSystemBootTime()
{
  return MEMORY[0x24BDFD870]();
}

uint64_t ARGetSystemUpTime()
{
  return MEMORY[0x24BDFD878]();
}

uint64_t ARGetSystemUpTimeIncludingSleep()
{
  return MEMORY[0x24BDFD880]();
}

uint64_t ARGetSystemUpTimeIncludingSleepAndDriftCorrection()
{
  return MEMORY[0x24BDFD888]();
}

uint64_t AROverrideARDaemonLocalAnonymousListenerDaemon()
{
  return MEMORY[0x24BDFD890]();
}

uint64_t ARRemoteGeoTrackingTechniqueClientInterface()
{
  return MEMORY[0x24BDFD898]();
}

uint64_t ARRemoteGeoTrackingTechniqueServiceInterface()
{
  return MEMORY[0x24BDFD8A0]();
}

uint64_t ARRemoteLocationSensorClientInterface()
{
  return MEMORY[0x24BDFD8A8]();
}

uint64_t ARRemoteLocationSensorServiceInterface()
{
  return MEMORY[0x24BDFD8B0]();
}

uint64_t ARRemoteSensorClientInterfaceWithProtocol()
{
  return MEMORY[0x24BDFD8B8]();
}

uint64_t ARRemoteSensorServiceInterfaceWithProtocol()
{
  return MEMORY[0x24BDFD8C0]();
}

uint64_t ARRemoteTechniqueClientInterfaceWithProtocol()
{
  return MEMORY[0x24BDFD8C8]();
}

uint64_t ARRemoteTechniqueServiceInterfaceWithProtocol()
{
  return MEMORY[0x24BDFD8D0]();
}

uint64_t ARVector3FromNSData()
{
  return MEMORY[0x24BDFD900]();
}

uint64_t BSBundleIDForPID()
{
  return MEMORY[0x24BE0BAC0]();
}

void CVBufferRelease(CVBufferRef buffer)
{
  MEMORY[0x24BDC5168](buffer);
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x24BDC5178](buffer);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

