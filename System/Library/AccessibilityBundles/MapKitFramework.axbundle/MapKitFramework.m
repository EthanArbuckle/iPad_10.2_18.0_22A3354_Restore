id AXVectorKitLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXVectorKitLocString_onceToken != -1)
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global_0);
  if (AXVectorKitLocString_bundle)
  {
    objc_msgSend((id)AXVectorKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2502511F8, CFSTR("Accessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXMapKitLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXMapKitLocString_onceToken != -1)
    dispatch_once(&AXMapKitLocString_onceToken, &__block_literal_global_182);
  if (AXMapKitLocString_bundle)
  {
    objc_msgSend((id)AXMapKitLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2502511F8, CFSTR("Accessibility"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXMapsLocString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (AXMapsLocString_onceToken != -1)
    dispatch_once(&AXMapsLocString_onceToken, &__block_literal_global_185);
  if (AXMapsLocString_bundle)
  {
    objc_msgSend((id)AXMapsLocString_bundle, "localizedStringForKey:value:table:", v1, &stru_2502511F8, CFSTR("Accessibility-Maps"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id AXStringByReplacingMiddleDots(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = AXStringByReplacingMiddleDots_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AXStringByReplacingMiddleDots_onceToken, &__block_literal_global_190);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", AXStringByReplacingMiddleDots_MiddleDotCharacterSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", AXStringByReplacingMiddleDots_MiddleDotCharacterSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_195);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id AXShortAddressDescriptionForPlacemark(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "subThoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = v6 != 0;
  if (!v6)
    goto LABEL_4;
  if (objc_msgSend(v5, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "appendString:", v5);
LABEL_4:
    v8 = 0;
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("BETWEEN_ADDRESS_RANGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v11);

  v8 = 1;
LABEL_6:
  objc_msgSend(v3, "thoroughfare");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    if (v6)
      objc_msgSend(v4, "appendString:", CFSTR(" "));
    if (v8)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(CFSTR("ON_ROAD"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v15);

    }
    else
    {
      objc_msgSend(v4, "appendString:", v12);
    }
    v7 = 1;
  }
  if (!v7 || a2)
  {
    objc_msgSend(v3, "subLocality");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v16);
      v7 = 1;
    }
    objc_msgSend(v3, "locality");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v17);
      v7 = 1;
    }
    objc_msgSend(v3, "subAdministrativeArea");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(v3, "locality");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        if (v7)
          objc_msgSend(v4, "appendString:", CFSTR(", "));
        objc_msgSend(v4, "appendString:", v18);
        v7 = 1;
      }
    }
    objc_msgSend(v3, "administrativeArea");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      if (v7)
        objc_msgSend(v4, "appendString:", CFSTR(", "));
      objc_msgSend(v4, "appendString:", v12);
    }
  }
  if (objc_msgSend(v4, "length"))
  {
    v21 = v4;
  }
  else
  {
    objc_msgSend(v3, "formattedAddressLines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

BOOL AXRequiresMapAccessibilityForAccessibilityTechnology()
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

id AXNotificationsForMapAccessibilityClients()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BED26F8];
  v3[0] = *MEMORY[0x24BED2970];
  v3[1] = v0;
  v1 = *MEMORY[0x24BED2770];
  v3[2] = *MEMORY[0x24BED2730];
  v3[3] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t AXRequiresMapAccessibility()
{
  return 1;
}

uint64_t AXRequiresMapAccessibilityPurelyForAutomation()
{
  uint64_t result;

  result = _AXSAutomationEnabled();
  if ((_DWORD)result)
    return !AXRequiresMapAccessibilityForAccessibilityTechnology();
  return result;
}

BOOL AXRequiresLongerTimeouts()
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

uint64_t AXPublisherDescriptionForAttribution(void *a1, const char *a2)
{
  return objc_msgSend(a1, "safeStringForKey:", CFSTR("displayName"));
}

id AXPublisherDescriptionForCollection(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safeValueForKey:", CFSTR("publisherAttribution"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeStringForKey:", CFSTR("displayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_2326F0F0C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_2326F2414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
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

void sub_2326F2A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2326F34DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2326F3740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x24BDFFF10]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x24BE001D8]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MNGetHoursAndMinutesForTimeInterval()
{
  return MEMORY[0x24BE6B558]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXPriceRangeDescription()
{
  return MEMORY[0x24BEBAE68]();
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x24BEBAE78]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x24BEBB058]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXServerCacheGetPossiblyNilObjectForKey()
{
  return MEMORY[0x24BEBB218]();
}

uint64_t _AXServerCacheInsertPossiblyNilObjectForKey()
{
  return MEMORY[0x24BEBB220]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x24BDBD008]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

