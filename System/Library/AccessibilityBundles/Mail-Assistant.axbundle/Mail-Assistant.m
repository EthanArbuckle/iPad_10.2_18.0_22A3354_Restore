__CFString *accessibilityMobileMailLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v1 = a1;
  v2 = (void *)accessibilityMobileMailLocalizedString_axBundle;
  if (accessibilityMobileMailLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/AccessibilityBundles/MobileMail.axbundle")), v3 = objc_claimAutoreleasedReturnValue(), v4 = (void *)accessibilityMobileMailLocalizedString_axBundle, accessibilityMobileMailLocalizedString_axBundle = v3, v4, (v2 = (void *)accessibilityMobileMailLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25024E610, CFSTR("Accessibility"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = &stru_25024E610;
  v7 = v6;

  return v7;
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

