double MailTableCellTextLeftForLevel(uint64_t a1)
{
  if (a1 < 1)
    return 59.0;
  if (a1 == 1)
    return 90.0;
  return (float)((float)(a1 - 1) * 30.0) + 90.0;
}

double MailTableCellImageCenterForLevel(uint64_t a1)
{
  double v1;
  double v2;

  if (a1 < 1)
  {
    v1 = 49.5;
  }
  else if (a1 == 1)
  {
    v1 = 80.5;
  }
  else
  {
    v1 = (float)((float)(a1 - 1) * 30.0) + 90.0 + -9.5;
  }
  v2 = 32.0;
  if (a1)
    v2 = 23.0;
  return v1 + v2 * -0.5;
}

uint64_t _DAFoldersThatExternalClientsCareAboutChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadFoldersAndSpecifiersForced:", 0);
}

uint64_t _DAFolderHierarchyChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadFoldersAndSpecifiersForced:", 1);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PCSettingsGetClassPollInterval()
{
  return MEMORY[0x24BE71A38]();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return MEMORY[0x24BE71A40]();
}

uint64_t PCSettingsPurgeDictionariesExceptForCurrent()
{
  return MEMORY[0x24BE71A60]();
}

uint64_t PCSettingsSetClassPollInterval()
{
  return MEMORY[0x24BE71A68]();
}

uint64_t PCSettingsSetClassPushEnabled()
{
  return MEMORY[0x24BE71A70]();
}

uint64_t PCSettingsSetStyle()
{
  return MEMORY[0x24BE71A78]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BDF7D08]();
}

uint64_t _PCSettingsGetStyle()
{
  return MEMORY[0x24BE71A80]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

