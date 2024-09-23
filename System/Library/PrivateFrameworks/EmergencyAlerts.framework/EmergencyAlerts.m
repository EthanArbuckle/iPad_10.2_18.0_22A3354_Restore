void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id ea_getFormattedDatePrint(void *a1, BOOL *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v4, "setFormatOptions:", 1907);
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "timeIntervalSinceNow");
    *a2 = v7 < 0.0;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.cmas.bundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isDateInToday:", v6) & 1) != 0)
    {
      v10 = CFSTR("TODAY");
    }
    else if ((objc_msgSend(v8, "isDateInTomorrow:", v6) & 1) != 0)
    {
      v10 = CFSTR("TOMORROW");
    }
    else
    {
      if ((objc_msgSend(v8, "isDateInYesterday:", v6) & 1) == 0)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
        goto LABEL_12;
      }
      v10 = CFSTR("YESTERDAY");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24DCD11E0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
    if (v12)
    {
LABEL_13:
      objc_msgSend(v13, "setDateFormat:", CFSTR("hh:mm a"));
      objc_msgSend(v13, "stringFromDate:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(", %@"), v14);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(v13, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMd"));
    objc_msgSend(v13, "stringFromDate:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v11 = v3;
LABEL_14:

  return v11;
}

void *ea_isValidString(void *result)
{
  if (result)
    return (void *)(objc_msgSend(result, "length") != 0);
  return result;
}

uint64_t ea_getEpochTimestamp()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSince1970");
  objc_msgSend(v0, "numberWithDouble:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

id ea_getHashForString(void *a1)
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
    v2 = strlen(v1);
    CC_SHA256(v1, v2, md);
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 16; ++i)
      objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void ea_sendSafetyAlertTapIndication(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = a1;
  v8[0] = CFSTR("WeaMessage");
  v8[1] = CFSTR("WeaHash");
  v3 = a1;
  ea_getHashForString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("UserInteractionType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE833E0], "sharedInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "onUserTappedOnWeaWithInfo:", v6);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void EARegisterUserNotificationsLogging()
{
  if (EARegisterUserNotificationsLogging_onceToken != -1)
    dispatch_once(&EARegisterUserNotificationsLogging_onceToken, &__block_literal_global_0);
}

void EAHandleCellBroadcastMessageReceivedNotification(int a1, uint64_t a2, CFTypeRef cf, uint64_t a4, const void *a5)
{
  _QWORD block[7];

  CFRetain(cf);
  CFRetain(a5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __EAHandleCellBroadcastMessageReceivedNotification_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a5;
  block[5] = a2;
  block[6] = cf;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t TUAddTelephonyCenterObserver()
{
  return MEMORY[0x24BEB4A48]();
}

uint64_t TURemoveTelephonyCenterObserver()
{
  return MEMORY[0x24BEB4B70]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

