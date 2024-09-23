void sub_230B6C42C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getCCSControlCenterServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  ControlCenterServicesLibrary();
  result = objc_getClass("CCSControlCenterService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSControlCenterServiceClass_block_invoke_cold_1();
  getCCSControlCenterServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ControlCenterServicesLibrary()
{
  void *v0;

  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
    ControlCenterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCCSModulePresentationOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  ControlCenterServicesLibrary();
  result = objc_getClass("CCSModulePresentationOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCCSModulePresentationOptionsClass_block_invoke_cold_1();
  getCCSModulePresentationOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCCSControlCenterServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCCSModulePresentationOptionsClass_block_invoke_cold_1(v0);
}

void __getCCSModulePresentationOptionsClass_block_invoke_cold_1()
{
  abort_report_np();
  AXFormatFloatWithPercentage();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t hearingAidStreamSelected()
{
  return MEMORY[0x24BE4BEB8]();
}

uint64_t hearingLocString()
{
  return MEMORY[0x24BE4BED8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

