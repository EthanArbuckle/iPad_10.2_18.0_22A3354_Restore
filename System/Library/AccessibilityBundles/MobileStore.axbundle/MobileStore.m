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
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileStore.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502A5620, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id starStringForStarCount(float a1)
{
  float v1;
  BOOL v2;
  float v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1 > 1.0)
    a1 = 1.0;
  v1 = a1 * 10.0;
  v2 = a1 <= 0.0;
  v3 = 0.0;
  if (!v2)
    v3 = v1;
  v4 = (float)(rintf(v3) / 10.0) * 5.0;
  if (v4 <= (float)(int)v4)
  {
    UIAXStarRatingStringForRating();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityUIKitLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

uint64_t GSEventGetLocationInWindow()
{
  return MEMORY[0x24BE3D5A0]();
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x24BEBAE78]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x24BEBB2E0]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

