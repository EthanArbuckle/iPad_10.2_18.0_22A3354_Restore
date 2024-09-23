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
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Compass.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2501D2FE0, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id axCompassController()
{
  void *v0;
  void *v1;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rootViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id axCompassPageViewController()
{
  void *v0;
  void *v1;

  axCompassController();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("_compassPageController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id axLevelPageViewController()
{
  void *v0;
  void *v1;

  axCompassController();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("_levelPageController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BE000D8]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x24BEBB0C8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x24BE008D0]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

