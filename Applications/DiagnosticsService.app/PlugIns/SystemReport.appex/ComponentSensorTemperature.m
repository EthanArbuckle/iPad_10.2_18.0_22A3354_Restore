@implementation ComponentSensorTemperature

- (BOOL)isPresent
{
  CFArrayRef v3;
  BOOL v4;

  if (!-[ComponentSensorTemperature systemClientSetup](self, "systemClientSetup"))
    return 0;
  v3 = IOHIDEventSystemClientCopyServices(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
  v4 = v3 != 0;
  if (v3)
    CFRelease(v3);
  -[ComponentSensorTemperature systemClientRelease](self, "systemClientRelease");
  return v4;
}

- (void)populateAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ComponentSensorTemperature temperatureData](self, "temperatureData"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (__IOHIDEventSystemClient)HIDEventSystem
{
  __IOHIDEventSystemClient *result;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  result = self->_HIDEventSystem;
  if (!result)
  {
    result = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2);
    self->_HIDEventSystem = result;
    if (!result)
    {
      v4 = DiagnosticLogHandleForCategory(6);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[ERROR] - Could not create HID event system.", v6, 2u);
      }

      return self->_HIDEventSystem;
    }
  }
  return result;
}

- (BOOL)systemClientSetup
{
  __IOHIDEventSystemClient *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v3 = -[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem");
  if (v3)
  {
    v6[0] = CFSTR("PrimaryUsagePage");
    v6[1] = CFSTR("PrimaryUsage");
    v7[0] = &off_1000B2B78;
    v7[1] = &off_1000B2B90;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
    IOHIDEventSystemClientSetMatching(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"), v4);

  }
  return v3 != 0;
}

- (void)systemClientRelease
{
  if (-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"))
  {
    CFRelease(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
    -[ComponentSensorTemperature setHIDEventSystem:](self, "setHIDEventSystem:", 0);
  }
}

- (id)parseHIDLocationID:(int)a3
{
  NSString *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 < 0 || (_DefaultRuneLocale.__runetype[HIBYTE(a3)] & 0x200) != 0)
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%3ld "), a3, v5, v6, v7);
  else
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)celsiusTemperatureFromService:(__IOHIDServiceClient *)a3
{
  void *v3;
  const void *v4;
  double FloatValue;

  v3 = (void *)IOHIDServiceClientCopyEvent(a3, 15, 0, 0);
  if (v3)
  {
    v4 = v3;
    FloatValue = IOHIDEventGetFloatValue(v3, 983040);
    CFRelease(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", FloatValue));
  }
  return v3;
}

- (id)temperatureData
{
  void *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex v6;
  __IOHIDServiceClient *ValueAtIndex;
  const __CFNumber *v8;
  const __CFNumber *v9;
  int Value;
  void *v11;
  void *v12;
  int valuePtr;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[ComponentSensorTemperature systemClientSetup](self, "systemClientSetup"))
  {
    v4 = IOHIDEventSystemClientCopyServices(-[ComponentSensorTemperature HIDEventSystem](self, "HIDEventSystem"));
    if (v4)
    {
      v5 = v4;
      if (CFArrayGetCount(v4) >= 1)
      {
        v6 = 0;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v5, v6);
          v8 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("LocationID"));
          if (v8)
          {
            v9 = v8;
            valuePtr = 0;
            Value = CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
            CFRelease(v9);
            if (Value)
            {
              if (valuePtr != -1)
              {
                v11 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSensorTemperature parseHIDLocationID:](self, "parseHIDLocationID:"));
                v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentSensorTemperature celsiusTemperatureFromService:](self, "celsiusTemperatureFromService:", ValueAtIndex));
                if (v12)
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

              }
            }
          }
          ++v6;
        }
        while (CFArrayGetCount(v5) > v6);
      }
      CFRelease(v5);
    }
    -[ComponentSensorTemperature systemClientRelease](self, "systemClientRelease");
  }
  return v3;
}

- (void)setHIDEventSystem:(__IOHIDEventSystemClient *)a3
{
  self->_HIDEventSystem = a3;
}

@end
