uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
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

