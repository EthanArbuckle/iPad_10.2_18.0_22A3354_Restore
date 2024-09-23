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
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25022FAA8, CFSTR("Accessibility"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _AXGetStringForDay(void *a1)
{
  id v1;
  void *v2;
  int v3;
  __CFString *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDateInYesterday:", v1);
  if (v3)
  {
    accessibilityLocalizedString(CFSTR("context.yesterday"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_25022FAA8;
  }
  v5 = objc_msgSend(v2, "isDateInToday:", v1);
  if (v5)
  {
    accessibilityLocalizedString(CFSTR("context.today"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_25022FAA8;
  }
  if ((objc_msgSend(v2, "isDateInTomorrow:", v1) & 1) == 0)
  {
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  accessibilityLocalizedString(CFSTR("context.tomorrow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
LABEL_11:

LABEL_12:
  if (v3)
  {

    if (v7)
      goto LABEL_14;
LABEL_16:
    AXDateStringForFormat();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!v7)
    goto LABEL_16;
LABEL_14:
  AXDateStringForFormat();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v8;
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
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

