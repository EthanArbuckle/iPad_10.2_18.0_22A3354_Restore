id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2503A69E0, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id accessibilityRetrieveLabelForSource(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v1 = a1;
  if (!objc_msgSend(v1, "isEqualToString:", CFSTR("trailer")))
  {
    if (objc_msgSend(v1, "containsString:", CFSTR("button-play")))
    {
      v2 = CFSTR("play.button");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("popover-more")))
    {
      v2 = CFSTR("more.button");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("popover-share")))
    {
      v2 = CFSTR("share.button");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://ActionMenu-Add")))
    {
      v2 = CFSTR("add.button");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://ActionMenu-Remove")))
    {
      v2 = CFSTR("remove.button");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("Actions_AddGlyph")))
    {
      v2 = CFSTR("add.hint");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("Actions_CheckGlyph")))
    {
      v2 = CFSTR("remove.hint");
      goto LABEL_17;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("tomato-certified")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "atvaccessibilityLocalizedString:", CFSTR("tv.tomato.rating"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("tv.freshness.certified.fresh");
LABEL_26:
      objc_msgSend(v7, "atvaccessibilityLocalizedString:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __AXStringForVariables();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
      goto LABEL_18;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("tomato-fresh")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "atvaccessibilityLocalizedString:", CFSTR("tv.tomato.rating"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("tv.freshness.fresh");
      goto LABEL_26;
    }
    if ((objc_msgSend(v1, "containsString:", CFSTR("tomato-rotten")) & 1) != 0
      || objc_msgSend(v1, "containsString:", CFSTR("tomato-splat")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "atvaccessibilityLocalizedString:", CFSTR("tv.tomato.rating"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("tv.freshness.rotten");
      goto LABEL_26;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://overlay-checkmark")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("tv.played");
LABEL_47:
      objc_msgSend(v10, "atvaccessibilityLocalizedString:", v11);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://cc")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.closed.captions");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://metadata-ad")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.ad");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://dolby-vision")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.dolby-vision");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://dolby-atmos")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.dolby-atmos");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://4k")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.4k");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://hdr")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.hdr");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://metadata-sdh")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.sdh");
      goto LABEL_47;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("resource://videos-HD")) & 1) != 0
      || objc_msgSend(v1, "isEqualToString:", CFSTR("resource://hd")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.hd");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://mpaa-g")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.g");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://mpaa-pg")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.pg");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://mpaa-pg13")))
    {
LABEL_53:
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.pg13");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://mpaa-r")))
    {
LABEL_55:
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.r");
      goto LABEL_47;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("resource://mpaa-nr")) & 1) != 0
      || objc_msgSend(v1, "isEqualToString:", CFSTR("resource://nr")))
    {
LABEL_58:
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.nr");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("unrated")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("axid.icon.rating.unrated");
      goto LABEL_47;
    }
    if (objc_msgSend(v1, "containsString:", CFSTR("common-sense-badge")))
    {
      objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("tv.common.sense");
      goto LABEL_47;
    }
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-g")))
    {
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-pg13")))
        goto LABEL_53;
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-ma")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tvma");
        goto LABEL_47;
      }
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-nr")))
        goto LABEL_58;
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-r")))
        goto LABEL_55;
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-nc17")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.nc17");
        goto LABEL_47;
      }
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-y7fv")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tvy7fv");
        goto LABEL_47;
      }
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-y7")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tvy7");
        goto LABEL_47;
      }
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-y")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tvy");
        goto LABEL_47;
      }
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-pg")))
      {
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tvpg");
        goto LABEL_47;
      }
      if (!objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-g")))
      {
        if (!objc_msgSend(v1, "isEqualToString:", CFSTR("resource://tv-14")))
        {
          v3 = 0;
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        v11 = CFSTR("axid.icon.rating.tv14");
        goto LABEL_47;
      }
    }
    objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    v11 = CFSTR("axid.icon.rating.tvg");
    goto LABEL_47;
  }
  v2 = CFSTR("trailer.label");
LABEL_17:
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v3;
}

id accessibilityLabelForTVView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v1 = a1;
  objc_opt_class();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("tv_AccessibilityText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "_accessibilityValueForKey:", CFSTR("AXTVMLKitAccessibilityTextOverrideKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "_accessibilityBoolValueForKey:", CFSTR("AXTVMLKitPrefersAccessibilityTextOverrideKey")))v5 = v4;
  else
    v5 = v3;
  v6 = v5;
  if (!objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v3, "length"))
      v7 = v3;
    else
      v7 = v4;
    v8 = v7;

    v6 = v8;
  }
  objc_msgSend(v1, "tv_associatedIKViewElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("src"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("srcset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  accessibilityRetrieveLabelForSource(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_232ADEDF4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 136));
  objc_destroyWeak((id *)(v6 - 128));
  objc_destroyWeak((id *)(v6 - 120));
  _Unwind_Resume(a1);
}

void sub_232ADF078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXStarRatingStringForRatingWithMaxRating()
{
  return MEMORY[0x24BEBAE88]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
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

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BE008B8]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

