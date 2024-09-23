@implementation ComponentProximitySensor

- (BOOL)isPresent
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;

  if (findDeviceWithName("prox"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DAProximityManager sharedInstance](DAProximityManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sensorRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v2 = objc_msgSend(v5, "count") != 0;

  return v2;
}

- (void)populateAttributes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentProximitySensor supplyCurrent](self, "supplyCurrent"));
  if (v4)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("supplyCurrentReading"));

}

- (id)supplyCurrent
{
  uint64_t v2;
  __IOHIDEventSystemClient *v3;
  CFRunLoopRef Current;
  CFNumberRef v5;
  CFNumberRef v6;
  CFDictionaryRef v7;
  __CFArray *Mutable;
  const __CFArray *v9;
  const __CFArray *v10;
  __IOHIDServiceClient *ValueAtIndex;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  NSObject *v22;
  uint8_t v23[8];
  int v24;
  int valuePtr;
  void *values[2];
  void *keys[2];

  v2 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
  if (v2)
  {
    v3 = (__IOHIDEventSystemClient *)v2;
    Current = CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop(v3, Current, kCFRunLoopDefaultMode);
    v24 = 8;
    valuePtr = 65280;
    v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v24);
    *(_OWORD *)keys = *(_OWORD *)off_100080C18;
    values[0] = v5;
    values[1] = v6;
    v7 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, v7);
    IOHIDEventSystemClientSetMatchingMultiple(v3, Mutable);
    v9 = IOHIDEventSystemClientCopyServices(v3);
    v10 = v9;
    if (v9 && CFArrayGetCount(v9) >= 1)
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v10, 0);
      v12 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("SupplyCurrentReading"));
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        v21 = DiagnosticLogHandleForCategory(6);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v23 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Couldn't retrieve property from HID service...", v23, 2u);
        }

      }
      CFRelease(v3);
    }
    else
    {
      v15 = DiagnosticLogHandleForCategory(6);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Couldn't find prox service\n", v23, 2u);
      }

      CFRelease(v3);
      v13 = 0;
      v17 = 0;
      if (!v10)
        goto LABEL_18;
    }
    CFRelease(v10);
    v17 = v13;
LABEL_18:
    CFRelease(Mutable);
    CFRelease(v7);
    CFRelease(v6);
    CFRelease(v5);
    return v17;
  }
  v18 = DiagnosticLogHandleForCategory(6);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(keys[0]) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Couldn't open hid system", (uint8_t *)keys, 2u);
  }

  return 0;
}

@end
