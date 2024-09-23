void sub_20A9FCCCC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;

  if (MarcoShouldLogRegistration())
  {
    if (!qword_254613490)
      goto LABEL_8;
    v10 = objc_alloc(MEMORY[0x24BDD16A8]);
    v11 = (void *)objc_msgSend(v10, "initWithCapacity:", 2 * qword_254613490 + 3);
    if (qword_254613490)
    {
      v12 = 0;
      do
      {
        objc_msgSend(v11, "appendString:", CFSTR("  "));
        ++v12;
      }
      while (v12 < qword_254613490);
    }
    objc_msgSend(v11, "appendString:", CFSTR("=> "));
    if (v11)
    {
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@"), v11, a2);
    }
    else
    {
LABEL_8:
      v13 = a2;
      v11 = 0;
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v13, &a9);
    MarcoLogRegistration();

  }
}

void sub_20A9FCE04()
{
  ++qword_254613490;
}

void sub_20A9FCE18()
{
  if (qword_254613490)
    --qword_254613490;
}

__CFString *FTCServiceNameForServiceType(uint64_t a1)
{
  __CFString **v1;

  switch(a1)
  {
    case 0:
      v1 = FTCServiceNameFaceTime;
      return *v1;
    case 1:
      v1 = FTCServiceNameMadrid;
      return *v1;
    case 2:
      v1 = FTCServiceNameCalling;
      return *v1;
  }
  return 0;
}

uint64_t FTCServiceTypeForServiceName(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("iMessage")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("Calling")))
    return 2;
  return 0;
}

FTCServiceAvailabilityCenter *sub_20A9FCECC()
{
  FTCServiceAvailabilityCenter *result;

  result = objc_alloc_init(FTCServiceAvailabilityCenter);
  qword_253D0AE78 = (uint64_t)result;
  return result;
}

uint64_t sub_20A9FD914(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "object");
  return MEMORY[0x24BEDD108](v1, sel_updateAvailability);
}

uint64_t sub_20A9FDC98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAvailability");
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x24BE50680]();
}

uint64_t IMUserScopedNotification()
{
  return MEMORY[0x24BE50838]();
}

uint64_t MarcoLogRegistration()
{
  return MEMORY[0x24BE64008]();
}

uint64_t MarcoShouldLogRegistration()
{
  return MEMORY[0x24BE64030]();
}

uint64_t OSLogHandleForRegistrationCategory()
{
  return MEMORY[0x24BE50910]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x24BE509D8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x24BDAF388]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

