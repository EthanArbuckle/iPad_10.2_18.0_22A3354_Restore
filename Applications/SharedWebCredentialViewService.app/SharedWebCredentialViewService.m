uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(SWCAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_100002E1C(CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  const __CFString *v10;
  const __CFDictionary *v11;
  const __CFString *Value;
  _BOOL4 v13;
  CFIndex Code;
  const __CFString *Domain;
  CFComparisonResult v16;
  _BOOL4 v18;
  __CFString *v19;
  const __CFString *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const void *v23;
  const __CFNumber *v24;
  CFNumberRef v25;
  __CFDictionary *Mutable;
  __CFDictionary *v27;
  uint64_t v28;
  uint64_t valuePtr;

  if (!a4)
    return;
  if (*a4)
  {
    if (cf)
    {
      if (*a4 != cf)
        CFRelease(cf);
    }
    return;
  }
  v10 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  v28 = 0;
  if (!cf)
    goto LABEL_28;
  v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    v13 = CFStringCompare(v10, Value, 0) == kCFCompareEqualTo;
    if (!v11)
      goto LABEL_10;
    goto LABEL_9;
  }
  v13 = 0;
  if (v11)
LABEL_9:
    CFRelease(v11);
LABEL_10:
  Code = CFErrorGetCode((CFErrorRef)cf);
  Domain = CFErrorGetDomain((CFErrorRef)cf);
  v16 = CFStringCompare(a2, Domain, 0);
  v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  v19 = cf;
  if (v18)
    goto LABEL_17;
  v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    v22 = v21;
    v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        valuePtr = 0;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          v19 = cf;
LABEL_17:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10)
            return;
          v20 = v10;
          goto LABEL_42;
        }
        v28 = valuePtr + 1;
      }
    }
    CFRelease(v22);
  }
LABEL_28:
  v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v27 = Mutable;
  if (cf)
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  if (v25)
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  if (v10)
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25)
    CFRelease(v25);
  if (v10)
    CFRelease(v10);
  if (v27)
    CFRelease(v27);
  if (cf)
  {
    v20 = cf;
LABEL_42:
    CFRelease(v20);
  }
}

void sub_1000030B8(CFIndex a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
  va_list va;

  va_start(va, format);
  sub_100002E1C(a1, CFSTR("com.apple.security.swcagent"), 0, a4, format, va);
}

void sub_1000030F0(uint64_t a1, __CFString **a2, CFStringRef format, ...)
{
  CFTypeRef v4;
  CFTypeRef cf;
  va_list va;

  va_start(va, format);
  cf = 0;
  if (a2)
  {
    sub_100002E1C(-50, kCFErrorDomainOSStatus, *a2, &cf, format, va);
    *a2 = (__CFString *)cf;
  }
  else
  {
    sub_100002E1C(-50, kCFErrorDomainOSStatus, 0, &cf, format, va);
    v4 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v4);
    }
  }
}

BOOL sub_100003174(void *a1, _QWORD *a2, __CFString **a3)
{
  const void *data;
  const void *v7;
  size_t v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  CFTypeRef v16;
  _BOOL8 result;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  CFTypeRef v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  size_t length;
  size_t v28;
  CFTypeRef cf;
  void *v30;
  _BYTE buf[24];
  void *v32;
  __int128 v33;
  uint64_t v34;

  length = 0;
  if (xpc_dictionary_get_data(a1, "status", &length))
  {
    v28 = 0;
    cf = 0;
    data = xpc_dictionary_get_data(a1, "status", &v28);
    if (!data)
    {
      sub_1000030F0(0, a3, CFSTR("no object for key %s"), "status");
      v16 = 0;
LABEL_30:
      result = v16 != 0;
      goto LABEL_31;
    }
    v7 = data;
    v8 = (size_t)data + v28;
    v9 = SecCFAllocatorZeroize();
    if (der_decode_plist(v9, &cf, a3, v7, v8) == v8)
    {
LABEL_29:
      cc_clear(v28, v7);
      v16 = cf;
      goto LABEL_30;
    }
    v10 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("trailing garbage after der decoded object for key %s"), "status");
    sub_1000030F0((uint64_t)v10, a3, CFSTR("%@"), v10);
    if (a3)
    {
      v11 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *a3;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "xpc: %@", buf, 0xCu);
      }
    }
    v13 = secLogObjForScope("SecError");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1405091842;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
    }

    v15 = dword_10000DF28;
    if (dword_10000DF28 == -1)
    {
      if (!qword_10000DF30)
      {
        *(_OWORD *)buf = off_100008378;
        *(_QWORD *)&buf[16] = 0;
        qword_10000DF30 = _sl_dlopen(buf, 0);
      }
      if (qword_10000DF30)
      {
        v18 = getpid();
        v19 = v10;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v20 = off_10000DF38;
        v32 = off_10000DF38;
        if (!off_10000DF38)
        {
          v30 = 0;
          if (!qword_10000DF30)
          {
            v33 = off_100008378;
            v34 = 0;
            qword_10000DF30 = _sl_dlopen(&v33, &v30);
          }
          v21 = (void *)qword_10000DF30;
          if (!qword_10000DF30)
            goto LABEL_35;
          if (v30)
            free(v30);
          v20 = dlsym(v21, "SimulateCrash");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
          off_10000DF38 = v20;
        }
        _Block_object_dispose(buf, 8);
        if (!v20)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"));
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("simulate_crash.m"), 22, CFSTR("%s"), dlerror());

          while (1)
          {
            __break(1u);
LABEL_35:
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CrashReporterSupportLibrary(void)"));
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("simulate_crash.m"), 18, CFSTR("%s"), v30);

          }
        }
        ((void (*)(uint64_t, uint64_t, __CFString *))v20)(v18, 1405091842, v19);

        goto LABEL_25;
      }
      v15 = dword_10000DF28;
    }
    dword_10000DF28 = v15 + 1;
LABEL_25:
    if (v10)
      CFRelease(v10);
    v22 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v22);
    }
    goto LABEL_29;
  }
  v16 = 0;
  result = 1;
LABEL_31:
  *a2 = v16;
  return result;
}

void sub_10000359C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

xpc_object_t sub_1000035BC(xpc_object_t message, CFTypeRef *a2)
{
  void *v4;
  _xpc_connection_s *v5;
  char v6;
  int v7;
  xpc_object_t v8;
  BOOL v9;
  CFIndex v11;
  char *v12;
  const char *string;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_10000DF40 != -1)
    dispatch_once(&qword_10000DF40, &stru_1000083B0);
  v4 = 0;
  v5 = (_xpc_connection_s *)qword_10000DF48;
  v6 = 1;
  v7 = -3;
  do
  {
    if ((v6 & 1) == 0)
      xpc_release(v4);
    v8 = xpc_connection_send_message_with_reply_sync(v5, message);
    v6 = 0;
    v9 = v8 != &_xpc_error_connection_interrupted || v7++ == 0;
    v4 = &_xpc_error_connection_interrupted;
  }
  while (!v9);
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_error)
  {
    if (v8 == &_xpc_error_connection_invalid || v8 == &_xpc_error_connection_interrupted)
      v11 = 3;
    else
      v11 = 4;
    v12 = xpc_copy_description(v5);
    string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
    sub_1000030B8(v11, v14, v15, a2, v16, CFSTR("%s: %s"), v12, string);
    free(v12);
    xpc_release(v8);
    return 0;
  }
  return v8;
}

void sub_1000036E8(id a1)
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.security.swcagent", 0, 0);
  xpc_connection_set_event_handler(mach_service, &stru_1000083F0);
  xpc_connection_resume(mach_service);
  qword_10000DF48 = (uint64_t)mach_service;
}

void sub_100003734(id a1, void *a2)
{
  const char *string;
  NSObject *v3;
  int v4;
  const char *v5;

  string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
  v3 = secLogObjForScope("xpc");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "got event: %s", (uint8_t *)&v4, 0xCu);
  }
}

xpc_object_t sub_1000037E8(unsigned int a1, CFTypeRef *a2)
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;

  v4 = xpc_dictionary_create(0, 0, 0);
  v8 = v4;
  if (v4)
    xpc_dictionary_set_uint64(v4, "operation", a1);
  else
    sub_1000030B8(3, v5, v6, a2, v7, CFSTR("xpc_dictionary_create returned NULL"));
  return v8;
}

BOOL sub_100003858(void *a1, _QWORD *a2)
{
  xpc_object_t value;
  xpc_object_t v4;

  value = xpc_dictionary_get_value(a1, "error");
  v4 = value;
  if (a2 && value)
    *a2 = SecCreateCFErrorWithXPCObject(value);
  return v4 == 0;
}

BOOL sub_1000038A0(const void *a1, uint64_t a2, CFTypeRef *a3)
{
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  char *v11;
  char *v12;
  char *v13;
  xpc_object_t v14;
  void *v15;
  CFTypeRef v16;
  CFTypeID v17;
  int v18;
  _BOOL8 v19;
  CFTypeRef cf;
  int valuePtr;

  v6 = sub_1000037E8(6u, a3);
  if (v6)
  {
    v7 = v6;
    xpc_dictionary_set_data(v6, "client", a1, 0x20uLL);
    if (a2)
    {
      v9 = der_sizeof_plist(a2, a3);
      if (v9)
      {
        v10 = v9;
        v11 = (char *)malloc_type_malloc(v9, 0x91A96E61uLL);
        v12 = &v11[v10];
        v13 = (char *)der_encode_plist_repair(a2, a3, 0, v11, v12);
        if (v13 && v12 > v13)
        {
          xpc_dictionary_set_data(v7, "query", v13, v12 - v13);
          free(v11);
          v14 = sub_1000035BC(v7, a3);
          if (v14)
          {
            v15 = v14;
            valuePtr = -1;
            cf = 0;
            if (!sub_100003858(v14, a3))
              goto LABEL_22;
            if (!sub_100003174(v15, &cf, (__CFString **)a3))
              goto LABEL_22;
            v16 = cf;
            if (!cf)
              goto LABEL_22;
            v17 = CFGetTypeID(cf);
            if (v17 == CFBooleanGetTypeID())
            {
              v18 = CFEqual(v16, kCFBooleanTrue) != 0;
            }
            else
            {
              if (v17 != CFNumberGetTypeID() || CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &valuePtr))
                goto LABEL_21;
              v18 = -1;
            }
            valuePtr = v18;
LABEL_21:
            CFRelease(v16);
LABEL_22:
            v19 = valuePtr != 0;
            xpc_release(v15);
            goto LABEL_17;
          }
        }
        else
        {
          free(v11);
        }
      }
    }
    else
    {
      sub_1000030F0(v8, (__CFString **)a3, CFSTR("object for key %s is NULL"), "query");
    }
    v19 = 0;
LABEL_17:
    xpc_release(v7);
    return v19;
  }
  return 0;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundView");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailTextLabel");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageView");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutSubviews");
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_opaqueSeparatorColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opaqueSeparatorColor");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectedBackgroundView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedBackgroundView");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorColor");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCredentials_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCredentials:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setShowSeparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowSeparator:");
}

id objc_msgSend_setShowTopSeparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowTopSeparator:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTicked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTicked:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleCells");
}
