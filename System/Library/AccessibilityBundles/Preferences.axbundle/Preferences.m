id accessibilityNonLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  accessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0;
  if (v1 && v2)
  {
    v5 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("NonLocalizedStrings"), CFSTR("strings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id accessibilityBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)accessibilityBundle_axBundle;
  if (!accessibilityBundle_axBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Preferences.axbundle"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)accessibilityBundle_axBundle;
    accessibilityBundle_axBundle = v1;

    v0 = (void *)accessibilityBundle_axBundle;
  }
  return v0;
}

id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  accessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250312BA8, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

