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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2503369E8, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLabelForUsageItems(void *a1)
{
  return accessibilityLabelForUsageItemsOverridingUsages(a1, 0, 1);
}

id accessibilityLabelForUsageItemsOverridingUsages(void *a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v37;
  uint64_t v38;
  char v39;

  v5 = a2;
  objc_msgSend(a1, "axFilterObjectsUsingBlock:", &__block_literal_global_248);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  if (!objc_msgSend(v6, "count"))
    goto LABEL_27;
  v38 = 0;
  v37 = 0;
  v8 = 0;
  v9 = CFSTR("itemType");
  v39 = a3;
  do
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((a3 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("totalUsage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a3 & 1) != 0)
        goto LABEL_8;
    }
    objc_msgSend(v11, "doubleValue");
    if (v13 == 0.0)
      goto LABEL_24;
LABEL_8:
    v14 = objc_msgSend(v10, "safeUnsignedIntegerForKey:", v9);
    if (v14 == 6)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("pickups.count.format"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v20, objc_msgSend(v11, "unsignedIntegerValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "axSafelyAddObject:", v17);
LABEL_15:

      goto LABEL_24;
    }
    if (v14 == 5)
    {
      objc_msgSend(v10, "safeValueForKey:", CFSTR("displayName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v10, "safeValueForKey:", CFSTR("displayName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && v11)
        {
          accessibilityLabelForNotificationsCount(v16, v11, (v37 & 1) == 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

          v37 = 1;
        }
        goto LABEL_15;
      }
      v38 += objc_msgSend(v11, "unsignedIntegerValue");
    }
    else
    {
      v21 = v9;
      objc_msgSend(v10, "safeValueForKey:", CFSTR("displayName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        accessibilityLocalizedString(CFSTR("unknown.item"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;

      objc_msgSend(v7, "axSafelyAddObject:", v25);
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "doubleValue");
        v29 = v28;
        objc_msgSend(v27, "doubleValue");
        MEMORY[0x23491C5C8](v30 < 60.0, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      objc_msgSend(v7, "axSafelyAddObject:", v31);

      v9 = v21;
      a3 = v39;
    }
LABEL_24:

    ++v8;
  }
  while (v8 < objc_msgSend(v6, "count"));
  if (v38)
  {
    accessibilityLocalizedString(CFSTR("unknown.notification.senders"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLabelForNotificationsCount(v32, v33, (v37 & 1) == 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v34);

  }
LABEL_27:
  AXLabelForElements();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

BOOL __accessibilityLabelForUsageItemsOverridingUsages_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id accessibilityLabelForNotificationsCount(void *a1, void *a2, int a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = a2;
    v6 = a1;
    accessibilityLocalizedString(CFSTR("notifications.count.format"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "unsignedIntegerValue");

    objc_msgSend(v4, "stringWithFormat:", v7, v8);
  }
  else
  {
    v7 = a2;
    v9 = a1;
    AXFormatNumber();
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("notification.origination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v10, a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_232975560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2329769C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232976C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232976E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232977EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_232978AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v24 - 88));
  _Unwind_Resume(a1);
}

void sub_232978C68(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_232979B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
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

uint64_t AXClockTimeStringForDate()
{
  return MEMORY[0x24BDFFEB0]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x24BE00060]();
}

uint64_t AXFormatNumber()
{
  return MEMORY[0x24BE000E0]();
}

uint64_t AXLabelForElements()
{
  return MEMORY[0x24BDFE8F8]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x24BE001C8]();
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

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BE00830]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BE00840]();
}

uint64_t __UIAccessibilityGetAssociatedUnsignedInteger()
{
  return MEMORY[0x24BE00878]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BE00888]();
}

uint64_t __UIAccessibilitySetAssociatedUnsignedInteger()
{
  return MEMORY[0x24BE008C8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

