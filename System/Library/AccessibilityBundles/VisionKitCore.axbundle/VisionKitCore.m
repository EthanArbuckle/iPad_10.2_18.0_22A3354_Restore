id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2503DE6F8, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLookupButtonName(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  NSObject *v8;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("pawprint.fill")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.argos.domain_key.cats")))
    {
      v5 = CFSTR("lookup.cat");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.argos.domain_key.dogs")))
    {
      v5 = CFSTR("lookup.dog");
    }
    else
    {
      v5 = CFSTR("lookup.pet");
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("mappin.and.ellipse")))
  {
    v5 = CFSTR("lookup.landmarks");
LABEL_19:
    accessibilityLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("leaf.fill")))
  {
    v5 = CFSTR("lookup.plant");
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("photo.fill")))
  {
    v5 = CFSTR("lookup.art");
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("book.closed.fill")))
  {
    v5 = CFSTR("lookup.book");
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("music")))
  {
    v5 = CFSTR("lookup.album");
    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("music.on.film")))
  {
    v5 = CFSTR("lookup.media");
    goto LABEL_19;
  }
  AXLogAppAccessibility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    accessibilityLookupButtonName_cold_1((uint64_t)v3, (uint64_t)v4, v8);

  v6 = 0;
LABEL_20:

  return v6;
}

id AXImageAnalysisLabel(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  NSObject *v4;

  switch(a1)
  {
    case 2:
      v2 = CFSTR("appclip");
      goto LABEL_7;
    case 1:
      v2 = CFSTR("qrcode");
      goto LABEL_7;
    case 0:
      v2 = CFSTR("text");
LABEL_7:
      accessibilityLocalizedString(v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
  AXLogAppAccessibility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    AXImageAnalysisLabel_cold_1(a1, v4);

  v3 = 0;
  return v3;
}

void sub_232BA0274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void accessibilityLookupButtonName_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_232B9E000, log, OS_LOG_TYPE_ERROR, "No lookup button name found for symbolName : %@, domainName : %@", (uint8_t *)&v3, 0x16u);
}

void AXImageAnalysisLabel_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_232B9E000, a2, OS_LOG_TYPE_ERROR, "VKImageAnalysisButtonMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x24BE001F0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x24BEBB058]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BE00830]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BE00868]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BE008B8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

