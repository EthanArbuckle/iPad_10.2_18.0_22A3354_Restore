@implementation DAComponentUtil

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024D9C;
  block[3] = &unk_100080B40;
  block[4] = a1;
  if (qword_1000BA088 != -1)
    dispatch_once(&qword_1000BA088, block);
  return (id)qword_1000BA090;
}

+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6
{
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  CFDictionaryRef v12;
  io_service_t MatchingService;
  io_object_t v14;
  const __CFData *CFProperty;
  const __CFData *v16;
  CFTypeID v17;
  NSData *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v27;
  NSObject *v28;
  CFTypeID v29;
  CFTypeID TypeID;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  _BYTE v34[24];

  v10 = IOServiceMatching(a3);
  if (!v10)
  {
    v22 = DiagnosticLogHandleForCategory(6);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      return 0;
    }
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)&v34[4] = a3;
    v24 = "Class %s not found";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, v34, 0xCu);
    goto LABEL_13;
  }
  v11 = v10;
  if (a6)
  {
    *(_QWORD *)v34 = a6;
    v12 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)v34, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v11, CFSTR("IONameMatch"), v12);
    CFRelease(v12);
  }
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  if (!MatchingService)
  {
    v25 = DiagnosticLogHandleForCategory(6);
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)v34 = 136315138;
    *(_QWORD *)&v34[4] = a3;
    v24 = "IO service for %s not found";
    goto LABEL_27;
  }
  v14 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, a4, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v16 = CFProperty;
    v17 = CFGetTypeID(CFProperty);
    if (v17 == CFDataGetTypeID())
    {
      v18 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", CFDataGetBytePtr(v16), a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = DiagnosticLogHandleForCategory(6);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v34 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "   Got CFData", v34, 2u);
      }

    }
    else
    {
      v29 = CFGetTypeID(v16);
      TypeID = CFStringGetTypeID();
      v31 = DiagnosticLogHandleForCategory(6);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v29 == TypeID)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v34 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "   Got CFString", v34, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v16, "dataUsingEncoding:", 4));
      }
      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v34 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Unsupported type from ioreg", v34, 2u);
        }

        v19 = 0;
      }
    }
    CFRelease(v16);
  }
  else
  {
    v27 = DiagnosticLogHandleForCategory(6);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      *(_QWORD *)&v34[4] = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "ioreg entry %@ does not exist", v34, 0xCu);
    }

    v19 = 0;
  }
  IOObjectRelease(v14);
  return v19;
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
  uint8_t v13[4];
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
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_ERROR, "Class/name not found", v13, 2u);
    }

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
  const char *v29;
  CFTypeID v30;
  uint64_t v31;
  NSObject *v32;
  uint8_t *v34;
  uint64_t v35;
  _WORD v36[8];
  uint8_t buf[16];

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
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "ioreg entry does not exist", buf, 2u);
      }

      v17 = 0;
      goto LABEL_25;
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
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

LABEL_24:
        CFRelease(v13);
LABEL_25:
        IOObjectRelease(v11);
        goto LABEL_26;
      }
      *(_WORD *)buf = 0;
      v29 = "   Got CFData";
    }
    else
    {
      v24 = CFGetTypeID(v13);
      if (v24 == CFStringGetTypeID())
      {
        v25 = DiagnosticLogHandleForCategory(6);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "   Got CFString", buf, 2u);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v13, "dataUsingEncoding:", 4));
        goto LABEL_24;
      }
      v27 = CFGetTypeID(v13);
      if (v27 != CFBooleanGetTypeID())
      {
        v30 = CFGetTypeID(v13);
        if (v30 != CFNumberGetTypeID() || CFNumberIsFloatType(v13))
        {
          v31 = DiagnosticLogHandleForCategory(6);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Unsupported type from ioreg", buf, 2u);
          }

          v17 = 0;
          goto LABEL_24;
        }
        *(_QWORD *)buf = 0;
        CFNumberGetValue(v13, kCFNumberNSIntegerType, buf);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 8));
        v35 = DiagnosticLogHandleForCategory(6);
        v19 = objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          goto LABEL_5;
        v36[0] = 0;
        v29 = "   Got Float";
        v34 = (uint8_t *)v36;
        goto LABEL_29;
      }
      LOBYTE(v36[0]) = CFBooleanGetValue(v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v36, 1));
      v28 = DiagnosticLogHandleForCategory(6);
      v19 = objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
      *(_WORD *)buf = 0;
      v29 = "   Got Boolean";
    }
    v34 = buf;
LABEL_29:
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v29, v34, 2u);
    goto LABEL_5;
  }
  v20 = DiagnosticLogHandleForCategory(6);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "IO service not found", buf, 2u);
  }

  v17 = 0;
LABEL_26:

  return v17;
}

+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3
{
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t CFProperties;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  _BYTE properties[24];

  v3 = (const __CFDictionary *)a3;
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    *(_QWORD *)properties = 0;
    CFProperties = IORegistryEntryCreateCFProperties(MatchingService, (CFMutableDictionaryRef *)properties, 0, 0);
    IOObjectRelease(v5);
    if (!CFProperties)
    {
      v14 = *(void **)properties;
      goto LABEL_8;
    }
    v7 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      v9 = "[ERROR] Could not create properties";
      v10 = (uint8_t *)&v17;
      v11 = v8;
      v12 = 2;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
    }
  }
  else
  {
    v13 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)properties = 138412290;
      *(_QWORD *)&properties[4] = v3;
      v9 = "[ERROR] Could not find the service matched by: %@";
      v10 = properties;
      v11 = v8;
      v12 = 12;
      goto LABEL_10;
    }
  }

  v14 = 0;
LABEL_8:
  v15 = objc_msgSend(v14, "copy", v17);

  return v15;
}

@end
