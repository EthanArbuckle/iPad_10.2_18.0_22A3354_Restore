id accessibilityMusicUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityMusicUILocalizedString_axBundle;
  if (accessibilityMusicUILocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityMusicUILocalizedString_axBundle,
        accessibilityMusicUILocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityMusicUILocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502D8670, CFSTR("MusicUIAccessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityMusicLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDD1488];
  AXAccessibilityBundlesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Music.axbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)accessibilityMusicLocalizedString_axBundle;
  accessibilityMusicLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle)
  {
LABEL_3:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502D8670, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_23285AE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFFC50]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

