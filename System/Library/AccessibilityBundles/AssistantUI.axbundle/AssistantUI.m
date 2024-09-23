id AssistantUIAccessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)AssistantUIAccessibilityLocalizedString_axBundle;
  if (AssistantUIAccessibilityLocalizedString_axBundle
    || (objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)AssistantUIAccessibilityLocalizedString_axBundle,
        AssistantUIAccessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)AssistantUIAccessibilityLocalizedString_axBundle) != 0))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_25017D190, CFSTR("AssistantUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x24BE08EF0]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BE00198]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BE002B8]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BE00330]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t _AXIgnoreNextNotification()
{
  return MEMORY[0x24BDFED08]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x24BEBB260]();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return MEMORY[0x24BEBB2C0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

