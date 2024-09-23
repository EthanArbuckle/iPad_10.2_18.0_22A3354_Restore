id accessibilityMobilePhoneLocalizedString(void *a1)
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
  v2 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  if (accessibilityMobilePhoneLocalizedString_axBundle)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDD1488];
  MEMORY[0x234911F44]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MobilePhone.axbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  accessibilityMobilePhoneLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityMobilePhoneLocalizedString_axBundle;
  if (accessibilityMobilePhoneLocalizedString_axBundle)
  {
LABEL_3:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250245590, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250245590, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id axStringForCallParticipantsView(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "safeValueForKey:", CFSTR("singleCallLabelView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "safeValueForKey:", CFSTR("topMultipleCallLabelView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  objc_msgSend(v1, "safeValueForKey:", CFSTR("bottomMultipleCallLabelView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = (void *)v7;
  v21 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "safeUIViewForKey:", CFSTR("participantMarqueeLabel"), v18, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "accessibilityLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v16;
        v19 = CFSTR("__AXStringForVariablesSentinel");
        __UIAXStringForVariables();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16, v16, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_2326BD7E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2326BE734(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2326BEA20(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2326BF720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2326C1518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2326C1E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BE000D8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x24BE002A8]();
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

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x24BE00420]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x24BDF7220](path, view);
}

BOOL UIAccessibilityIsAssistiveTouchRunning(void)
{
  return MEMORY[0x24BDF7260]();
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

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x24BDF7FA0]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXIgnoreNextNotification()
{
  return MEMORY[0x24BDFED08]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

