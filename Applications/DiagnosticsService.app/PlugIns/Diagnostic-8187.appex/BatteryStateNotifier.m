@implementation BatteryStateNotifier

+ (void)registerForBatteryEvents
{
  IONotificationPort *v2;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  __CFRunLoop *Current;
  IONotificationPort *v6;
  const __CFDictionary *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[12];
  io_iterator_t notification;

  notification = 0;
  v2 = IONotificationPortCreate(kIOMainPortDefault);
  qword_1000167A0 = (uint64_t)v2;
  if (!v2)
  {
    v11 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100008F2C();
    goto LABEL_11;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v2);
  if (!RunLoopSource)
  {
    IONotificationPortDestroy((IONotificationPortRef)qword_1000167A0);
    qword_1000167A0 = 0;
    v13 = DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100008F58();
LABEL_11:

    return;
  }
  v4 = RunLoopSource;
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v4, kCFRunLoopCommonModes);
  v6 = (IONotificationPort *)qword_1000167A0;
  v7 = IOServiceMatching("IOPMPowerSource");
  LODWORD(v6) = IOServiceAddMatchingNotification(v6, "IOServiceFirstMatch", v7, (IOServiceMatchingCallback)sub_100004EFC, &qword_1000167A0, &notification);
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100008F84();

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Registered for battery status changes: added matching notification", v14, 2u);
    }

    sub_100004EFC((IONotificationPort **)&qword_1000167A0, notification);
  }
  IOObjectRelease(notification);
}

+ (void)unregisterForBatteryEvents
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v7;
  __CFRunLoop *Current;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v2 = DiagnosticLogHandleForCategory(3);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Unregistering for battery status changes", v14, 2u);
  }

  if (dword_1000167A8)
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_100009070();

    IOObjectRelease(dword_1000167A8);
    dword_1000167A8 = 0;
  }
  if (qword_1000167A0)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_1000167A0);
    if (RunLoopSource)
    {
      v7 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, v7, kCFRunLoopCommonModes);
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_100009044();
    }
    else
    {
      v11 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100009018();
    }

    v12 = DiagnosticLogHandleForCategory(3);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_100008FEC();

    IONotificationPortDestroy((IONotificationPortRef)qword_1000167A0);
    qword_1000167A0 = 0;
  }
}

+ (BOOL)disableUSBCharging
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  __CFDictionary *Mutable;
  kern_return_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  io_service_t v12;

  v2 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionarySetValue(Mutable, CFSTR("FieldDiagsInflowInhibit"), kCFBooleanTrue);
    v5 = IORegistryEntrySetCFProperties(MatchingService, Mutable);
    CFRelease(Mutable);
    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to disable charging. Reason: 0x%x", (uint8_t *)&v11, 8u);
      }

      MatchingService = 0;
    }
    else
    {
      MatchingService = 1;
    }
  }
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    v12 = MatchingService;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully disabled charging: %d", (uint8_t *)&v11, 8u);
  }

  return MatchingService;
}

+ (BOOL)enableUSBCharging
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  __CFDictionary *Mutable;
  kern_return_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  io_service_t v12;

  v2 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionarySetValue(Mutable, CFSTR("FieldDiagsInflowInhibit"), kCFBooleanFalse);
    v5 = IORegistryEntrySetCFProperties(MatchingService, Mutable);
    CFRelease(Mutable);
    if (v5)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 67109120;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to resume charging. Reason: 0x%x", (uint8_t *)&v11, 8u);
      }

      MatchingService = 0;
    }
    else
    {
      MatchingService = 1;
    }
  }
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    v12 = MatchingService;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully enabled charging: %d", (uint8_t *)&v11, 8u);
  }

  return MatchingService;
}

@end
