uint64_t sub_230F276A0()
{
  return IDSiCloudSignIn();
}

uint64_t sub_230F27748()
{
  return IDSiCloudModify();
}

uint64_t sub_230F278F4()
{
  return IDSiTunesSignIn();
}

uint64_t sub_230F27A8C()
{
  return IDSGameCenterSignIn();
}

uint64_t sub_230F27B38()
{
  return IDSGameCenterModify();
}

void sub_230F28970(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230F26000, a2, OS_LOG_TYPE_FAULT, "Failed to get an account type for IDS identifier { identifier: %@ }", (uint8_t *)&v2, 0xCu);
}

void sub_230F289E4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230F26000, a2, OS_LOG_TYPE_ERROR, "Failed loading existing accounts { error: %@}}", (uint8_t *)&v2, 0xCu);
}

uint64_t IDSGameCenterModify()
{
  return MEMORY[0x24BE4F9D8]();
}

uint64_t IDSGameCenterSignIn()
{
  return MEMORY[0x24BE4F9E0]();
}

uint64_t IDSGameCenterSignOut()
{
  return MEMORY[0x24BE4F9E8]();
}

uint64_t IDSUpdateUser()
{
  return MEMORY[0x24BE4FBA8]();
}

uint64_t IDSiCloudModify()
{
  return MEMORY[0x24BE4FBB0]();
}

uint64_t IDSiCloudSignIn()
{
  return MEMORY[0x24BE4FBB8]();
}

uint64_t IDSiCloudSignOut()
{
  return MEMORY[0x24BE4FBC0]();
}

uint64_t IDSiTunesSignIn()
{
  return MEMORY[0x24BE4FBC8]();
}

uint64_t IDSiTunesSignOut()
{
  return MEMORY[0x24BE4FBD0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

