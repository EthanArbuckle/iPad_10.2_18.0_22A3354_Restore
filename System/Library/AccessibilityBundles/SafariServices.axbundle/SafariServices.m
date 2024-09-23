void sub_232959168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id accessibilityMobileSafariLocalizedString(void *a1)
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
  v2 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
  if (!accessibilityMobileSafariLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    AXAccessibilityBundlesDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MobileSafari.axbundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
    accessibilityMobileSafariLocalizedString_axBundle = v6;

    v2 = (void *)accessibilityMobileSafariLocalizedString_axBundle;
    if (!accessibilityMobileSafariLocalizedString_axBundle)
      accessibilityMobileSafariLocalizedString_cold_1();
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25032DC60, CFSTR("Accessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id accessibilitySafariServicesLocalizedString(void *a1)
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
  v2 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
  if (!accessibilitySafariServicesLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    AXAccessibilityBundlesDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("SafariServices.axbundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
    accessibilitySafariServicesLocalizedString_axBundle = v6;

    v2 = (void *)accessibilitySafariServicesLocalizedString_axBundle;
    if (!accessibilitySafariServicesLocalizedString_axBundle)
      accessibilitySafariServicesLocalizedString_cold_1();
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25032DC60, CFSTR("SafariServicesAccessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id accessibilitySafariScribbleLocalizedString(void *a1)
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
  v2 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
  if (!accessibilitySafariScribbleLocalizedString_axBundle)
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    AXAccessibilityBundlesDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MobileSafariFramework.axbundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleWithPath:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
    accessibilitySafariScribbleLocalizedString_axBundle = v6;

    v2 = (void *)accessibilitySafariScribbleLocalizedString_axBundle;
    if (!accessibilitySafariScribbleLocalizedString_axBundle)
      accessibilitySafariScribbleLocalizedString_cold_1();
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25032DC60, CFSTR("SafariScribbleAccessibility"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_23295A568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23295C370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23295C754(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23295DD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void accessibilityMobileSafariLocalizedString_cold_1()
{
  __assert_rtn("accessibilityMobileSafariLocalizedString", "AXSafariBundleSharedUtilities.m", 16, "axBundle != nil");
}

void accessibilitySafariServicesLocalizedString_cold_1()
{
  __assert_rtn("accessibilitySafariServicesLocalizedString", "AXSafariBundleSharedUtilities.m", 34, "axBundle != nil");
}

void accessibilitySafariScribbleLocalizedString_cold_1()
{
  __assert_rtn("accessibilitySafariScribbleLocalizedString", "AXSafariBundleSharedUtilities.m", 53, "axBundle != nil");
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFFC50]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFFEA8]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x24BDFFFA0]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXProcessIsSafari()
{
  return MEMORY[0x24BE00318]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t UIAXFormatFloatWithPercentage()
{
  return MEMORY[0x24BEBAE30]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BDF8058]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x24BEBB2E0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

