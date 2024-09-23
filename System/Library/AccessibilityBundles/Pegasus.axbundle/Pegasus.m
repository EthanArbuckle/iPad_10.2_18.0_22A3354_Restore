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
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Pegasus.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502F4498, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2328B36F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id a50)
{
  id *v50;
  id *v51;
  id *v52;

  objc_destroyWeak(v52);
  objc_destroyWeak(v51);
  objc_destroyWeak(v50);
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(&a50);
  _Unwind_Resume(a1);
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
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

uint64_t _AXUIElementRemoteBridgeMachPortForAXServer()
{
  return MEMORY[0x24BDFED78]();
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BDF8058]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
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

