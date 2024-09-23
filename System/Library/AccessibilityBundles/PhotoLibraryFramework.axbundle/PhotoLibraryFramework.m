id accessibilityCameraUIDuoLocalizedString(void *a1)
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
  v2 = (void *)accessibilityCameraUIDuoLocalizedString_axBundle;
  if (accessibilityCameraUIDuoLocalizedString_axBundle)
    goto LABEL_3;
  v3 = (void *)MEMORY[0x24BDD1488];
  AXAccessibilityBundlesDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("CameraUI.axbundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)accessibilityCameraUIDuoLocalizedString_axBundle;
  accessibilityCameraUIDuoLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityCameraUIDuoLocalizedString_axBundle;
  if (accessibilityCameraUIDuoLocalizedString_axBundle)
  {
LABEL_3:
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FF00C00, CFSTR("CameraUI-Bravo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityLocalizedStringFromBundle(void *a1, void *a2)
{
  return accessibilityLocalizedStringFromBundleWithTable(a1, a2, (uint64_t)CFSTR("Accessibility"));
}

id accessibilityLocalizedStringFromBundleWithTable(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(a2, "localizedStringForKey:value:table:", v5, &stru_24FF00C00, a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24FF00C00, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _createFormatDurationString(double a1, double a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;

  MEMORY[0x2348C0E3C](1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C0E3C](1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  accessibilityLocalizedString(CFSTR("slomo.trim.duration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", v6, v3, v4);

  v8 = objc_msgSend(v7, "rangeOfString:", v3);
  v10 = v9;
  v11 = objc_msgSend(v7, "rangeOfString:options:", v4, 4);
  v13 = v12;
  v14 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA60]), "initWithString:", v7);
  v15 = v14;
  v16 = (_QWORD *)MEMORY[0x24BDBD270];
  v17 = (_QWORD *)MEMORY[0x24BDFEB38];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = v8;
    v19 = (_QWORD *)MEMORY[0x24BDBD270];
    objc_msgSend(v14, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v18, v10);
    v16 = v19;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v15, "setAttribute:forKey:withRange:", *v16, *v17, v11, v13);

  return v15;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFDF58]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x24BE00060]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x24BDFE838]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x24BDFE840]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x24BEBB050]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

