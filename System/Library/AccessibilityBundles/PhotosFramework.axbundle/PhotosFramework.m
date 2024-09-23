id accessibilityCameraUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = (void *)_AXSCopyPathForAccessibilityBundle();
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)accessibilityCameraUILocalizedString_axBundle;
  accessibilityCameraUILocalizedString_axBundle = v5;

  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle)
  {
LABEL_3:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FF05328, CFSTR("CameraUIStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id accessibilityPLServicesLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  if (accessibilityPLServicesLocalizedString_axBundle)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = (void *)_AXSCopyPathForAccessibilityBundle();
  objc_msgSend(v3, "bundleWithPath:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  accessibilityPLServicesLocalizedString_axBundle = v5;

  v2 = (void *)accessibilityPLServicesLocalizedString_axBundle;
  if (accessibilityPLServicesLocalizedString_axBundle)
  {
LABEL_3:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FF05328, CFSTR("PhotoLibraryServicesStrings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_230BAC3C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x24BEBAD48]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x24BE00060]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x24BDFE830]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x24BDFE838]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x24BDFE840]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x24BE007E0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXSCopyPathForAccessibilityBundle()
{
  return MEMORY[0x24BED2180]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BE00840]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BE00868]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BE00888]();
}

uint64_t __UIAccessibilitySetAssociatedCopiedObject()
{
  return MEMORY[0x24BE008A0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x24BEBB2E0]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

