const __CFString *IRServicePackageString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Invalid");
  if (a1 == 1)
    v1 = CFSTR("ServicePackageAppleTVControl");
  if (a1)
    return v1;
  else
    return CFSTR("ServicePackageMedia");
}

const __CFString *IRMediaBundleTypeToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Invalid");
  else
    return off_25103F988[a1];
}

const __CFString *IRMediaEventTypeToString(unint64_t a1)
{
  if (a1 > 0xB)
    return CFSTR("Invalid");
  else
    return off_25103F9B0[a1];
}

const __CFString *IRMediaEventSubTypeToString(uint64_t a1)
{
  if (a1)
    return CFSTR("Invalid");
  else
    return CFSTR("Default");
}

const __CFString *IRAppleTVControlEventTypeToString(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("Invalid");
  else
    return off_25103FA10[a1];
}

const __CFString *IRAppleTVControlEventSubTypeToString(uint64_t a1)
{
  if (a1)
    return CFSTR("Invalid");
  else
    return CFSTR("Default");
}

void sub_23FFB067C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23FFB234C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_6(uint64_t a1, void *a2)
{
  return a2;
}

void IRSetupLogging()
{
  if (IRSetupLogging_onceToken != -1)
    dispatch_once(&IRSetupLogging_onceToken, &__block_literal_global);
}

const __CFString *IRCandidateClassificationToString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("Invalid");
  else
    return *(&off_25103FB60 + a1);
}

id IRMakeXPCServerInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256FB2138);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v2 = objc_opt_class();
  v3 = (void *)objc_msgSend(v1, "initWithObjects:", v2, objc_opt_class(), 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__createServiceWithParameters_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel__createServiceWithParameters_reply_, 1, 1);
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__databaseExportwithReply_, 0, 1);
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel__getServiceTokensWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel__deleteDatabaseWithReply_, 0, 1);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__deleteService_, 0, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel__runWithConfiguration_, 0, 0);
  v14 = objc_alloc(MEMORY[0x24BDBCF20]);
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel__updateCandidates_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel__deleteCandidate_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__addEvent_forCandidateIdentifier_, 0, 0);
  objc_msgSend(v0, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel__setSpotOnLocationWithParameters_, 0, 0);

  return v0;
}

id IRMakeXPCClientInterface()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256FB0FA0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDBCF20]);
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel__didUpdateContext_, 0, 0);
  v8 = objc_alloc(MEMORY[0x24BDBCF20]);
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel__didUpdateBundlesWithSignificantInteractionPattern_, 0, 0);

  return v0;
}

uint64_t IRErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.IntelligentRouting"), a1, a2);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

