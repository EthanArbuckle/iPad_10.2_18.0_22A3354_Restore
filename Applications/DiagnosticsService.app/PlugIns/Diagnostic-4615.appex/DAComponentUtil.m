@implementation DAComponentUtil

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000016C0;
  block[3] = &unk_100004218;
  block[4] = a1;
  if (qword_100008A10 != -1)
    dispatch_once(&qword_100008A10, block);
  return (id)qword_100008A18;
}

+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6
{
  CFMutableDictionaryRef v9;
  __CFDictionary *v10;
  CFDictionaryRef v11;
  io_service_t MatchingService;
  io_object_t v13;
  const __CFData *CFProperty;
  const __CFData *v15;
  CFTypeID v16;
  NSData *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v25;
  NSObject *v26;
  CFTypeID v27;
  CFTypeID TypeID;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *keys;

  v9 = IOServiceMatching(a3);
  if (!v9)
  {
    v21 = DiagnosticLogHandleForCategory(6);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000027E4();
    goto LABEL_14;
  }
  v10 = v9;
  if (a6)
  {
    keys = (void *)a6;
    v11 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v10, CFSTR("IONameMatch"), v11);
    CFRelease(v11);
  }
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v10);
  if (!MatchingService)
  {
    v23 = DiagnosticLogHandleForCategory(6);
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100002844();
LABEL_14:

    return 0;
  }
  v13 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, a4, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v15 = CFProperty;
    v16 = CFGetTypeID(CFProperty);
    if (v16 == CFDataGetTypeID())
    {
      v17 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", CFDataGetBytePtr(v15), a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = DiagnosticLogHandleForCategory(6);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        sub_100002904();

    }
    else
    {
      v27 = CFGetTypeID(v15);
      TypeID = CFStringGetTypeID();
      v29 = DiagnosticLogHandleForCategory(6);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = v30;
      if (v27 == TypeID)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          sub_100002930();

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v15, "dataUsingEncoding:", 4));
      }
      else
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          sub_10000295C();

        v18 = 0;
      }
    }
    CFRelease(v15);
  }
  else
  {
    v25 = DiagnosticLogHandleForCategory(6);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1000028A4();

    v18 = 0;
  }
  IOObjectRelease(v13);
  return v18;
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryClass:property:optionalKey:classValidator:", a3, a4, a5, 0);
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CFMutableDictionaryRef v14;
  void *v15;

  v10 = objc_retainAutorelease(a3);
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = IOServiceMatching((const char *)objc_msgSend(v10, "UTF8String"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getMatchingDict:property:optionalKey:optionalClassValidator:", v14, v13, v12, v11));

  if (v14)
    CFRelease(v14);
  return v15;
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryName:property:optionalKey:classValidator:](DAComponentUtil, "getIORegistryName:property:optionalKey:classValidator:", a3, a4, a5, 0);
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CFMutableDictionaryRef v14;
  void *v15;

  v10 = objc_retainAutorelease(a3);
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = IOServiceNameMatching((const char *)objc_msgSend(v10, "UTF8String"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getMatchingDict:property:optionalKey:optionalClassValidator:", v14, v13, v12, v11));

  if (v14)
    CFRelease(v14);
  return v15;
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4
{
  return +[DAComponentUtil IORegistryNameExists:optionalKey:passingValidator:](DAComponentUtil, "IORegistryNameExists:optionalKey:passingValidator:", a3, a4, 0);
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4 passingValidator:(id)a5
{
  id v7;
  id v8;
  id v9;
  CFMutableDictionaryRef v10;
  io_object_t v11;

  v7 = objc_retainAutorelease(a3);
  v8 = a5;
  v9 = a4;
  v10 = IOServiceNameMatching((const char *)objc_msgSend(v7, "UTF8String"));
  v11 = +[DAComponentUtil getIOService:optionalKey:optionalClassValidator:](DAComponentUtil, "getIOService:optionalKey:optionalClassValidator:", v10, v9, v8);

  if (v10)
    CFRelease(v10);
  if (v11)
    IOObjectRelease(v11);
  return v11 != 0;
}

+ (unsigned)getIOService:(__CFDictionary *)a3 optionalKey:(id)a4 optionalClassValidator:(id)a5
{
  id v7;
  unsigned int (**v8)(id, __CFDictionary *);
  CFDictionaryRef v9;
  kern_return_t MatchingServices;
  uint64_t v11;
  io_iterator_t existing;
  void *keys;

  v7 = a4;
  v8 = (unsigned int (**)(id, __CFDictionary *))a5;
  if (a3)
  {
    CFRetain(a3);
    if (v7)
    {
      keys = (void *)CFStringCreateWithCString(0, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0x8000100u);
      v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(a3, CFSTR("IONameMatch"), v9);
      CFRelease(v9);
      CFRelease(keys);
    }
    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, a3, &existing);
    LODWORD(a3) = 0;
    if (!MatchingServices)
    {
      if (v8)
      {
        do
          a3 = (__CFDictionary *)IOIteratorNext(existing);
        while ((_DWORD)a3 && !v8[2](v8, a3));
      }
      else
      {
        LODWORD(a3) = IOIteratorNext(existing);
      }
    }
  }
  else
  {
    v11 = DiagnosticLogHandleForCategory(6);
    a3 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
      sub_100002988();

    LODWORD(a3) = 0;
  }

  return a3;
}

+ (id)getMatchingDict:(__CFDictionary *)a3 property:(id)a4 optionalKey:(id)a5 optionalClassValidator:(id)a6
{
  __CFString *v9;
  io_registry_entry_t v10;
  io_object_t v11;
  const __CFData *CFProperty;
  const __CFData *v13;
  CFTypeID v14;
  const UInt8 *BytePtr;
  NSData *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  CFTypeID v24;
  uint64_t v25;
  NSObject *v26;
  CFTypeID v27;
  uint64_t v28;
  CFTypeID v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v33;
  uint64_t v34;
  Boolean Value;

  v9 = (__CFString *)a4;
  v10 = +[DAComponentUtil getIOService:optionalKey:optionalClassValidator:](DAComponentUtil, "getIOService:optionalKey:optionalClassValidator:", a3, a5, a6);
  if (v10)
  {
    v11 = v10;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v10, v9, kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      v22 = DiagnosticLogHandleForCategory(6);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000029E0();

      v17 = 0;
      goto LABEL_26;
    }
    v13 = CFProperty;
    v14 = CFGetTypeID(CFProperty);
    if (v14 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v13);
      v16 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", BytePtr, CFDataGetLength(v13));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = DiagnosticLogHandleForCategory(6);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_100002904();
    }
    else
    {
      v24 = CFGetTypeID(v13);
      if (v24 == CFStringGetTypeID())
      {
        v25 = DiagnosticLogHandleForCategory(6);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_100002930();

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v13, "dataUsingEncoding:", 4));
        goto LABEL_25;
      }
      v27 = CFGetTypeID(v13);
      if (v27 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue(v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &Value, 1));
        v28 = DiagnosticLogHandleForCategory(6);
        v19 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_100002A0C();
      }
      else
      {
        v29 = CFGetTypeID(v13);
        if (v29 != CFNumberGetTypeID() || CFNumberIsFloatType(v13))
        {
          v30 = DiagnosticLogHandleForCategory(6);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            sub_10000295C();

          v17 = 0;
          goto LABEL_25;
        }
        v34 = 0;
        CFNumberGetValue(v13, kCFNumberNSIntegerType, &v34);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v34, 8));
        v33 = DiagnosticLogHandleForCategory(6);
        v19 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_100002A38();
      }
    }

LABEL_25:
    CFRelease(v13);
LABEL_26:
    IOObjectRelease(v11);
    goto LABEL_27;
  }
  v20 = DiagnosticLogHandleForCategory(6);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1000029B4();

  v17 = 0;
LABEL_27:

  return v17;
}

+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  CFMutableDictionaryRef v10;
  id v11;
  CFMutableDictionaryRef properties;

  v3 = (const __CFDictionary *)a3;
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    properties = 0;
    v6 = IORegistryEntryCreateCFProperties(MatchingService, &properties, 0, 0);
    IOObjectRelease(v5);
    if (!v6)
    {
      v10 = properties;
      goto LABEL_9;
    }
    v7 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100002AC4();
  }
  else
  {
    v9 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100002A64();
  }

  v10 = 0;
LABEL_9:
  v11 = -[__CFDictionary copy](v10, "copy");

  return v11;
}

@end
