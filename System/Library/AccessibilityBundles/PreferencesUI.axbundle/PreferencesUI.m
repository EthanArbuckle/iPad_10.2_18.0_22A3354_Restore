id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  AXAccessibilityBundlesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Preferences.axbundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v1, &stru_2503189D0, CFSTR("Accessibility"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id accessibilityNonLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  AXAccessibilityBundlesDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Preferences.axbundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v1 && v4)
  {
    v7 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("NonLocalizedStrings"), CFSTR("strings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKey:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFFC50]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x24BDFED30]();
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

