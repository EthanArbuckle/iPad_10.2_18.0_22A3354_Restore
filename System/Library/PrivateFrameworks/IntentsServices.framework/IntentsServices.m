id INSJSONEncodedIntent(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_JSONDictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_JSONStringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id INSJSONEncodedIntentResponse(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_JSONDictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_JSONStringRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id INSJSONEncodedSlotResolutionResult(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v6, "_intentInstanceDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slotByName:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_msgSend(v9, "resolutionResultClass"), "_resolutionResultWithData:slotDescription:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "facadePropertyName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_JSONDictionaryRepresentationForIntent:parameterName:", v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "if_JSONStringRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id INSExtensionServiceTraceCompletionHandlerWithCode(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  int v9;

  v3 = a1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __INSExtensionServiceTraceCompletionHandlerWithCode_block_invoke;
  v7[3] = &unk_24C4B93F0;
  v8 = v3;
  v9 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x20BD3AB28](v7);

  return v5;
}

float INSGetAceVersionNumberFromString(void *a1)
{
  void *v1;
  void *v2;
  float v3;
  float v4;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("-"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "floatValue");
    v4 = v3;

  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

void *__getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary;
    if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "FBSOpenApplicationErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getFBSOpenApplicationErrorDomainSymbolLoc_block_invoke_271(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (FrontBoardServicesLibraryCore_frameworkLibrary_273)
  {
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary_273;
  }
  else
  {
    FrontBoardServicesLibraryCore_frameworkLibrary_273 = _sl_dlopen();
    v2 = (void *)FrontBoardServicesLibraryCore_frameworkLibrary_273;
    if (!FrontBoardServicesLibraryCore_frameworkLibrary_273)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "FBSOpenApplicationErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getFBSOpenApplicationErrorDomainSymbolLoc_ptr_270 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20BAB1A94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 152));
  _Unwind_Resume(a1);
}

uint64_t IFMergeDictionaries()
{
  return MEMORY[0x24BE5B910]();
}

uint64_t INExtractAppInfoFromSiriLaunchId()
{
  return MEMORY[0x24BDD98D8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x24BDD9900]();
}

uint64_t INIntentDefinitionURLsForInstalledApps()
{
  return MEMORY[0x24BDD9908]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x24BDD9918]();
}

uint64_t INIntentResponseIsFailure()
{
  return MEMORY[0x24BDD9920]();
}

uint64_t INIntentSchemaGetIntentResponseDescriptionWithFacadeClass()
{
  return MEMORY[0x24BDD9930]();
}

uint64_t INSchemaWithTypeName()
{
  return MEMORY[0x24BDD9A18]();
}

uint64_t INThisProcessIsAssistantd()
{
  return MEMORY[0x24BDD9AE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _INVCVoiceShortcutErrorDomain()
{
  return MEMORY[0x24BDDA4E0]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

