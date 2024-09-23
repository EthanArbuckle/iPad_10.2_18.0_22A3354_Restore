void sub_23770B300(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t CAMIsCameraButtonEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t CAMIsCameraButtonAvailable()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return MGGetBoolAnswer();
  return result;
}

uint64_t CAMIsCameraOverlayEnabled()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      return 1;
    else
      return _os_feature_enabled_impl();
  }
  return result;
}

uint64_t CAMIsCameraOverlayAvailable()
{
  uint64_t result;

  result = CAMIsCameraOverlayEnabled();
  if ((_DWORD)result)
    return CAMIsCameraButtonAvailable();
  return result;
}

uint64_t CAMIsCameraButtonPOREventRoutingEnabled()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

__CFString *CAMStringForOverlayServiceConnectionStatus(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_2508F8F50[a1];
}

void sub_23770D8A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

id CAMOverlayErrorForStatus(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a1 == 2)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = CFSTR("InvalidConnection");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
    v4 = -2;
    goto LABEL_5;
  }
  if (!a1)
  {
    v1 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = CFSTR("InactiveConnection");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v1;
    v4 = -1;
LABEL_5:
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("CAMOverlayErrorDomain"), v4, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  return 0;
}

id CAMOverlayErrorForCode(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = CFSTR("InvalidValueType");
  if (a1 != -12)
    v3 = 0;
  if (a1 == -13)
    v3 = CFSTR("InvalidValue");
  if (a1 == -100)
    v3 = CFSTR("InvalidIdentifier");
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("CAMOverlayErrorDomain"), a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

