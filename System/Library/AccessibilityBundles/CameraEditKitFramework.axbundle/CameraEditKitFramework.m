id accessibilityCameraEditKitD2xLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle;
  if (accessibilityCameraEditKitD2xLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle,
        accessibilityCameraEditKitD2xLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityCameraEditKitD2xLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FEDD528, CFSTR("CameraEditKitAccessibility-d2x"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityCameraEditKitV2LocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle;
  if (accessibilityCameraEditKitV2LocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle,
        accessibilityCameraEditKitV2LocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityCameraEditKitV2LocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FEDD528, CFSTR("CameraEditKitAccessibility-D94"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

double AXScaledSliderValues(double a1, double a2, double a3, double a4)
{
  BOOL v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v12;

  v4 = a4 == a2 || a4 == a3;
  if (v4 || ((v5 = vabdd_f64(a4, a2), v6 = vabdd_f64(a3, a4), a4 + a4 == a3) ? (v7 = v5 == v6) : (v7 = 0), v7))
  {
    if (a3 > a2)
      return (a1 - a2) / (a3 - a2) + 0.0;
    return 2.22507386e-308;
  }
  v8 = 0.0;
  if (a4 <= a2)
    return v8;
  if (a3 <= a2)
    return 2.22507386e-308;
  if (a1 >= a4)
  {
    if (a3 > a4)
    {
      v9 = (a1 - a4) / (a3 - a4);
      v10 = 0.0;
      goto LABEL_20;
    }
  }
  else if (a4 > a2)
  {
    v9 = (a1 - a2) / (a4 - a2);
    v10 = -1.0;
LABEL_20:
    v12 = v9 + v10;
    goto LABEL_22;
  }
  v12 = 2.22507386e-308;
LABEL_22:
  if (round(v12 * 100.0) / 100.0 == 0.0)
    return 0.0;
  else
    return v12;
}

double AXScaleSymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5)
{
  if (a3 <= a2)
    return 2.22507386e-308;
  else
    return (a1 - a2) * (a5 - a4) / (a3 - a2) + a4;
}

double AXScaleAsymmetricSliderValuesBetween(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result;

  if (a4 <= a2)
    return 2.22507386e-308;
  if (a1 >= a3)
  {
    if (a4 > a3)
    {
      result = (a1 - a3) * (a7 - a6) / (a4 - a3) + a6;
      goto LABEL_9;
    }
  }
  else if (a3 > a2)
  {
    result = (a1 - a2) * (a6 - a5) / (a3 - a2) + a5;
    goto LABEL_9;
  }
  result = 2.22507386e-308;
LABEL_9:
  if (round(result * 100.0) / 100.0 == 0.0)
    return 0.0;
  return result;
}

void sub_230B2BF34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_230B2D280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

uint64_t AXFormatFloat()
{
  return MEMORY[0x24BE000C8]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

uint64_t UIAXFrameForElements()
{
  return MEMORY[0x24BEBAE40]();
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

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x24BEBB0B8]();
}

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return MEMORY[0x24BEBB0D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BE00830]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
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

