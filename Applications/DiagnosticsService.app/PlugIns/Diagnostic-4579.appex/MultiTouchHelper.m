@implementation MultiTouchHelper

- (id)temperatureData
{
  void *v3;
  uint64_t v4;
  __IOHIDEventSystemClient *v5;
  void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex v9;
  __IOHIDServiceClient *ValueAtIndex;
  const __CFNumber *v11;
  const __CFNumber *v12;
  int Value;
  void *v14;
  void *v15;
  int valuePtr;
  _QWORD v18[2];
  _QWORD v19[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = IOHIDEventSystemClientCreate(kCFAllocatorDefault);
  if (v4)
  {
    v5 = (__IOHIDEventSystemClient *)v4;
    v18[0] = CFSTR("PrimaryUsagePage");
    v18[1] = CFSTR("PrimaryUsage");
    v19[0] = &off_10000C948;
    v19[1] = &off_10000C960;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    IOHIDEventSystemClientSetMatching(v5, v6);
    v7 = IOHIDEventSystemClientCopyServices(v5);
    if (v7)
    {
      v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        v9 = 0;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v8, v9);
          v11 = (const __CFNumber *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("LocationID"));
          if (v11)
          {
            v12 = v11;
            valuePtr = 0;
            Value = CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
            CFRelease(v12);
            if (Value)
            {
              if (valuePtr != -1)
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(-[MultiTouchHelper parseHIDLocationID:](self, "parseHIDLocationID:"));
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[MultiTouchHelper celsiusTemperatureFromService:](self, "celsiusTemperatureFromService:", ValueAtIndex));
                objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v14);

              }
            }
          }
          ++v9;
        }
        while (CFArrayGetCount(v8) > v9);
      }
      CFRelease(v8);
    }
    CFRelease(v5);

  }
  return v3;
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
  uint64_t v3;
  const void *v4;
  double FloatValue;
  void *v6;

  v3 = IOHIDServiceClientCopyEvent(a3, 15, 0, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    FloatValue = IOHIDEventGetFloatValue(v3, 983040);
    CFRelease(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", FloatValue));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  return v6;
}

- (BOOL)isBatteryCharging
{
  return MGGetBoolAnswer(CFSTR("BatteryIsCharging"), a2);
}

- (BOOL)isPowerConnected
{
  return MGGetBoolAnswer(CFSTR("ExternalPowerSourceConnected"), a2);
}

@end
