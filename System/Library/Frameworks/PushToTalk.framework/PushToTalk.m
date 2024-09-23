id _pttAttemptTranslateErrorFromCXError(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB7868]);

  if (v3)
  {
    switch(objc_msgSend(v1, "code"))
    {
      case 1:
      case 8:
        v4 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v4;
        v7 = 0;
        break;
      case 2:
        v9 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v9;
        v7 = 3;
        break;
      case 3:
        v10 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v10;
        v7 = 2;
        break;
      case 4:
        v11 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v11;
        v7 = 1;
        break;
      case 6:
        v12 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12;
        v7 = 4;
        break;
      case 7:
        v13 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v13;
        v7 = 5;
        break;
      case 9:
        v14 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v14;
        v7 = 7;
        break;
      case 10:
        v15 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v15;
        v7 = 8;
        break;
      case 11:
        v16 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v16;
        v7 = 6;
        break;
      case 12:
        v17 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v1, "userInfo");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v17;
        v7 = 9;
        break;
      default:
        goto LABEL_4;
    }
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pushtotalk.channel"), v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v8 = v1;
  }

  return v8;
}

id PTDefaultLog()
{
  if (PTDefaultLog_onceToken != -1)
    dispatch_once(&PTDefaultLog_onceToken, &__block_literal_global);
  return (id)PTDefaultLog_log;
}

void sub_22AD10544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AD10D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AD11CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id _pttTemporaryFilesystemURLForImage(void *a1)
{
  UIImage *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend(a1, "imageByPreparingThumbnailOfSize:", 300.0, 300.0);
    v1 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImageJPEGRepresentation(v1, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("PushToTalk-%@.jpeg"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "writeToFile:atomically:", v8, 1);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

id _pttCheckIfErrorPreventingInstantiationExists()
{
  void *v0;
  char v1;
  uint64_t v2;
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  CFTypeID v6;
  int Value;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __SecTask *v12;
  __SecTask *v13;
  CFTypeRef v14;
  CFTypeID v15;
  CFTypeID TypeID;
  void *v17;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isiOSAppOnMac");

  if ((v1 & 1) != 0)
  {
    v2 = 1;
    NSLog(CFSTR("ERROR: Push-to-Talk API is not available on this platform"));
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.pushtotalk.instantiation"), v2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    return v17;
  }
  v3 = SecTaskCreateFromSelf(0);
  if (!v3)
    goto LABEL_13;
  v4 = v3;
  v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.developer.push-to-talk"), 0);
  CFRelease(v4);
  if (!v5)
    goto LABEL_13;
  v6 = CFGetTypeID(v5);
  if (v6 != CFBooleanGetTypeID())
  {
    CFRelease(v5);
    goto LABEL_13;
  }
  Value = CFBooleanGetValue((CFBooleanRef)v5);
  CFRelease(v5);
  if (!Value)
  {
LABEL_13:
    v2 = 4;
    NSLog(CFSTR("ERROR: Push-to-Talk API requires the \"com.apple.developer.push-to-talk\" capability be added."));
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "infoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UIBackgroundModes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", CFSTR("push-to-talk"));

  if (!v11)
  {
    v2 = 2;
    NSLog(CFSTR("ERROR: Push-to-Talk API requires the \"push-to-talk\" Background Mode be added."));
    goto LABEL_14;
  }
  v12 = SecTaskCreateFromSelf(0);
  if (!v12
    || (v13 = v12, v14 = SecTaskCopyValueForEntitlement(v12, CFSTR("aps-environment"), 0), CFRelease(v13), !v14)
    || (v15 = CFGetTypeID(v14), TypeID = CFStringGetTypeID(), CFRelease(v14), v15 != TypeID))
  {
    v2 = 3;
    NSLog(CFSTR("ERROR: Push-to-Talk API requires enabling the Push Notifications capability (\"aps-environment\" entitlement)."));
    goto LABEL_14;
  }
  v17 = 0;
  return v17;
}

BOOL PTChannelJoinReasonForCXActionOriginator(uint64_t a1)
{
  return a1 == 3;
}

uint64_t PTChannelLeaveReasonForCXActionOriginator(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_22AD144B0[a1 - 1];
}

uint64_t PTChannelTransmitRequestSourceForCXActionOriginator(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_22AD144D0[a1 - 1];
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

