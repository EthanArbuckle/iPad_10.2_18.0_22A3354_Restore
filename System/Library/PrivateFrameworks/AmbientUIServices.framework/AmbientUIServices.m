BOOL AMUIAmbientPresentationStateIsPresented(uint64_t a1)
{
  return a1 == 2;
}

BOOL AMUIAmbientDisplayStyleIsRedMode(uint64_t a1)
{
  return a1 == 1;
}

const __CFString *AMUIAmbientDisplayStyleString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("red-mode");
  if (a1)
    return v1;
  else
    return CFSTR("normal");
}

id AMUIServicesLogGeneral()
{
  if (AMUIServicesLogGeneral_onceToken != -1)
    dispatch_once(&AMUIServicesLogGeneral_onceToken, &__block_literal_global);
  return (id)AMUIServicesLogGeneral___logObj;
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

