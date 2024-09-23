id accessibilityLocalizedString(void *a1)
{
  return localizedString(CFSTR("Accessibility"), a1);
}

id localizedString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = (void *)localizedString_axBundle;
  if (localizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)localizedString_axBundle,
        localizedString_axBundle = v6,
        v7,
        (v5 = (void *)localizedString_axBundle) != 0))
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_2502305F8, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityAntimonyLocalizedString(void *a1)
{
  return localizedString(CFSTR("Accessibility-Antimony"), a1);
}

id accessibilityHealthCinnamonLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle;
  if (accessibilityHealthCinnamonLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "accessibilityBundleWithLastPathComponent:", CFSTR("Health.axbundle")),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle,
        accessibilityHealthCinnamonLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityHealthCinnamonLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2502305F8, CFSTR("Accessibility-Cinnamon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_232683DA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

