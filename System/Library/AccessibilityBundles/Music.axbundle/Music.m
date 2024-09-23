id accessibilityMusicLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityMusicLocalizedString_axBundle,
        accessibilityMusicLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityMusicLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502C2A10, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityOasisMusicLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityOasisMusicLocalizedString_axBundle;
  if (accessibilityOasisMusicLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityOasisMusicLocalizedString_axBundle,
        accessibilityOasisMusicLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityOasisMusicLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502C2A10, CFSTR("Accessibility-AQ"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void speakReorderItems(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(v7, "section"));
  if (v8 >= 2)
  {
    v9 = v8;
    objc_opt_class();
    objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v7, "row") == v9 - 1)
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cellForItemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = CFSTR("collection.view.reorder.after");
      if (!v14)
        goto LABEL_8;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") + 1, objc_msgSend(v7, "section"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cellForItemAtIndexPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = CFSTR("collection.view.reorder.before");
      if (!v14)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(v14, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMusicLocalizedString(v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

    goto LABEL_8;
  }
LABEL_10:

}

void speakReorderItemsTableView(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v7, "section"));
  if (v8 >= 2)
  {
    v9 = v8;
    objc_opt_class();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v7, "row") == v9 - 1)
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cellForRowAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = CFSTR("collection.view.reorder.after");
      if (!v14)
        goto LABEL_8;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row") + 1, objc_msgSend(v7, "section"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cellForRowAtIndexPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = CFSTR("collection.view.reorder.before");
      if (!v14)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(v14, "accessibilityLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMusicLocalizedString(v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

    goto LABEL_8;
  }
LABEL_10:

}

id accessibilityStripUnfavorableCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  __int16 v6;

  v6 = 183;
  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v1, "stringWithCharacters:length:", &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v3, CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_232824B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2328262B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, id *a15)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_232828BA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x24BEBAD48]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFFEA8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x24BE00058]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x24BE000E8]();
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

uint64_t AXPositionalStyleDurationStringForDuration()
{
  return MEMORY[0x24BE002C0]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
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

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x24BDFED30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BE00888]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

