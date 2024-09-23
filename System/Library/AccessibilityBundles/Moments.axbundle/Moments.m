id accessibilityJurassicLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityJurassicLocalizedString_axBundle;
  if (accessibilityJurassicLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityJurassicLocalizedString_axBundle,
        accessibilityJurassicLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityJurassicLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502BE438, CFSTR("Accessibility-Jurassic"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t _accessibilityReplaceStylsticBulletsForSpeaking(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" · "), CFSTR(" , "));
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXProcessIsMomentsUIService()
{
  return MEMORY[0x24BDFE2C8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
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

