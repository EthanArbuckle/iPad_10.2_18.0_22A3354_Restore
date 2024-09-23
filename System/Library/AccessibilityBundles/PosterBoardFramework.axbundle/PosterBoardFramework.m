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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLocalizedStringForJ7XX(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedStringForJ7XX_axBundle;
  if (accessibilityLocalizedStringForJ7XX_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedStringForJ7XX_axBundle,
        accessibilityLocalizedStringForJ7XX_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedStringForJ7XX_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Accessibility-J717"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_2328EAF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v23 - 112));
  objc_destroyWeak((id *)(v23 - 104));
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

void sub_2328EDE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2328EDF60(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2328EEF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

uint64_t AXLockScreenPostersCount(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "_accessibilitySubviews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        MEMORY[0x23491A0AC](CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "accessibilityFrame");
          if (v8 > 0.0)
            ++v4;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t AXPosterIdentity(void *a1, const char *a2)
{
  return objc_msgSend(a1, "safeValueForKeyPath:", CFSTR("posterDescriptorLookupInfo.posterDescriptorPath.identity"));
}

id AXPosterProvider(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safeValueForKeyPath:", CFSTR("posterDescriptorLookupInfo.posterDescriptorPath.identity"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeStringForKey:", CFSTR("provider"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *AXWallpaperIdentifier(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v1 = a1;
  MEMORY[0x23491A0B8](CFSTR("PBFPosterPreview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "conformsToProtocol:", v2);

  if (!v3
    || (objc_msgSend(v1, "safeValueForKeyPath:", CFSTR("posterDescriptorLookupInfo.posterDescriptorPath.identity")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "safeStringForKey:", CFSTR("descriptorIdentifier")),
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    AXPreviewIdentifier(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster"));

      if ((v9 & 1) != 0)
      {
        v10 = CFSTR("KaleidoscopePoster");
      }
      else
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.WatchFacesWallpaperSupport.RhizomePoster"));

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        v10 = CFSTR("RhizomePoster");
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@:%@"), v10, v14);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = &stru_250308B10;
    }
LABEL_11:

  }
  return v5;
}

id AXPreviewIdentifier(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safeUIViewForKey:", CFSTR("_posterPreviewContentView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id AXMappedLabelOrValueForPosterPreview(void *a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  AXWallpaperIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  AXConvertWallpaperId(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v2;
    _os_log_impl(&dword_2328E9000, v3, OS_LOG_TYPE_INFO, "WallpaperID: %@", buf, 0xCu);
  }

  AXCFormattedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    accessibilityLocalizedStringForJ7XX(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "isEqualToString:", v4, v2))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

__CFString *AXConvertWallpaperId(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V01-Earth")) & 1) != 0)
  {
    v2 = CFSTR("V01-Earth-Full");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V02-Moon")) & 1) != 0)
  {
    v2 = CFSTR("V02-Moon-Full");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

uint64_t AXLayoutMode(void *a1)
{
  void *v1;
  uint64_t v2;

  AXCollectionViewController(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeUnsignedIntegerForKey:", CFSTR("layoutMode"));

  return v2;
}

id AXCollectionViewController(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_opt_class();
  objc_msgSend(v1, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_delegateViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AXTopWidgetAndAppName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "safeValueForKey:", CFSTR("extensionIdentity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("containerBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXAppNameForBundleId();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("editing.wrapper.inline.complication.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeStringForKey:", CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXCFormattedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void AXMapAppNameToWidgets(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v14 = v3;
    v4 = a1;
    objc_msgSend(v4, "safeValueForKey:", CFSTR("extensionIdentity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("containerBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXAppNameForBundleId();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeStringForKey:", CFSTR("displayName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v8)
    {
      accessibilityLocalizedString(CFSTR("editing.wrapper.grouped.complication.label"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKey:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v12, v7);

      }
      objc_msgSend(v14, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "axSafelyAddObject:", v10);

    }
    v3 = v14;
  }

}

uint64_t AXAppNameForBundleId()
{
  return MEMORY[0x24BDFF9A0]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFFEA8]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXFormatAndListWithElements()
{
  return MEMORY[0x24BE000B8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
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

uint64_t AXSafeProtocolFromString()
{
  return MEMORY[0x24BE00368]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

