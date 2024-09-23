id localizedString(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend(a1, "localizedStringForKey:value:table:", a3, &stru_2502359A8, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id accessibilityHomeLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  AXAccessibilityBundlesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Home.axbundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  localizedString(v5, (uint64_t)CFSTR("Accessibility"), (uint64_t)v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id accessibilityHomeUILocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localizedString(v3, (uint64_t)CFSTR("Accessibility"), (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id accessibilityLabelForNamedWallpaper(void *a1)
{
  id v1;
  __CFString *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("interior_wallpaper")))
  {
    v2 = CFSTR("wallpaper.description.interior");
LABEL_5:
    accessibilityHomeUILocalizedString(v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("red_wallpaper")))
  {
    v2 = CFSTR("wallpaper.description.red");
    goto LABEL_5;
  }
  accessibilityHomeUILocalizedString(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v1))
    v5 = v1;
  else
    v5 = v4;
  v3 = v5;

LABEL_10:
  return v3;
}

id accessibilityLabelForCustomWallpaper(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDE3488];
  v11[0] = a1;
  v2 = (void *)MEMORY[0x24BDBCE30];
  v3 = a1;
  objc_msgSend(v2, "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fetchAssetsWithLocalIdentifiers:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityLabelForIconIdentifier(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("icons.%@"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    goto LABEL_4;
  accessibilityHomeUILocalizedString(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v2))
  {

LABEL_4:
    v3 = 0;
  }

  return v3;
}

id accessibilityLabelForBadgeType(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 8 && ((0xFDu >> v1) & 1) != 0)
  {
    v4 = off_2502344B8[v1];
    accessibilityHomeUILocalizedString(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", v4))
      v3 = 0;
    else
      v3 = v2;
  }
  else
  {
    accessibilityHomeUILocalizedString(0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0;
  }
  v5 = v3;

  return v5;
}

id accessibilityLabelForStatusItemCategory(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    if (a1 != 1)
    {
      accessibilityHomeUILocalizedString(0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = 0;
      goto LABEL_9;
    }
    v1 = CFSTR("status.actionrequired");
  }
  else
  {
    v1 = CFSTR("status.alarm");
  }
  accessibilityHomeUILocalizedString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v1))
    v3 = 0;
  else
    v3 = v2;
LABEL_9:
  v4 = v3;

  return v4;
}

id _accessibilityItemAccessoryType(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  MEMORY[0x234911848](CFSTR("HFItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0;
    objc_opt_class();
    objc_msgSend(v1, "safeValueForKey:", CFSTR("accessories"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v15 = v1;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            v20 = 0;
            objc_opt_class();
            objc_msgSend(v10, "safeValueForKeyPath:", CFSTR("category.localizedDescription"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              abort();
            objc_msgSend(v2, "axSafelyAddObject:", v12);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v7);
      }

      v1 = v15;
    }

  }
  AXLabelForElements();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_232694538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23269567C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232696F88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
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

void sub_232697720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  id *v26;
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(v26);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_2326979F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_23269845C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_232699170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_23269D14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_23269DCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

void sub_23269DE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23269EFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13)
{
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v18);
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v19 - 128));
  _Unwind_Resume(a1);
}

void sub_2326A1134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2326A1444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2326A2B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_2326A37E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFDF58]();
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x24BEBAD48]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFDF80]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDurationStringForDuration()
{
  return MEMORY[0x24BE00058]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
}

uint64_t AXFormatMagnificationFactor()
{
  return MEMORY[0x24BDFE060]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x24BDFE8F8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
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

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x24BDFED30]();
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
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsSwiftStruct()
{
  return MEMORY[0x24BDFE568]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BDFE570]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

