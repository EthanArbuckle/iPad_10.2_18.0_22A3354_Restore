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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25026E4D0, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id AXMeasureAccessibilityStateObserver()
{
  void *v0;
  void *v1;

  objc_opt_class();
  objc_msgSend((id)MEMORY[0x234913CC4](CFSTR("Measure.AccessibilityStateObserver")), "safeValueForKey:", CFSTR("shared"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXMeasureLabelView()
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  AXMeasureViewController();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("labelView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AXMeasureViewController()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if ((AXDeviceIsPad() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "rootViewController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "safeArrayForKey:", CFSTR("viewControllers"));
  }
  else
  {
    AXMeasureTabBarController();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllers");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXMeasureReticleView()
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  AXMeasureViewController();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("reticleView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AXMeasureTabBarController()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rootViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AXMeasureSpeakableDescriptionForLastSavedMeasurement()
{
  void *v0;
  void *v1;

  AXMeasureLabelView();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_accessibilityLastSavedMeasurementString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id AXMeasureSpeakableDescriptionForCurrentMeasurement()
{
  void *v0;
  void *v1;

  AXMeasureLabelView();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_accessibilityCurrentMeasurementString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t AXMeasureIsMeasuring()
{
  void *v0;
  uint64_t v1;
  void *v3;
  uint64_t v4;

  AXMeasureTabBarController();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "selectedIndex");

  if (v1)
    return 0;
  AXMeasureAccessibilityStateObserver();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "axIsModeForMeasuring");

  return v4;
}

void AXMeasureSpeakMeasurementAnnouncement(void *a1)
{
  id v1;
  id v2;

  v2 = a1;
  v1 = v2;
  AXPerformBlockOnMainThread();

}

void AXMeasureAnnounceUpdatedMeasurement(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a1;
  v6 = a2;
  v4 = v6;
  v5 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

}

void AXMeasureDidPotentiallyShowCardViewWithAncestorClass(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id argument;

  if (a1)
  {
    v2 = MEMORY[0x234913CC4](CFSTR("Measure.CardTitleView"));
    if (v2)
    {
      v3 = v2;
      objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_accessibilityDescendantOfType:", a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_accessibilityDescendantOfType:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeUIViewForKey:", CFSTR("title"));
      argument = (id)objc_claimAutoreleasedReturnValue();

      if (argument)
      {
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);

      }
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_232735EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_2327375B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_232737604()
{
  JUMPOUT(0x2327375ECLL);
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BE000D8]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x24BE001F0]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BE00298]();
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

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x24BEBB0C8]();
}

uint64_t UIAccessibilitySpeakOrQueueIfNeeded()
{
  return MEMORY[0x24BEBB0D0]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x24BDF7C98]();
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

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BE00840]();
}

uint64_t __UIAccessibilityGetAssociatedInteger()
{
  return MEMORY[0x24BE00858]();
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

uint64_t __UIAccessibilitySetAssociatedInteger()
{
  return MEMORY[0x24BE008A8]();
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

