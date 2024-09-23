@implementation HIDElement(HIDFramework)

- (uint64_t)description
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("timestamp: %llu type: %ld usagePage: %ld usage: %ld reportID: %ld value: %ld"), objc_msgSend(a1, "timestamp"), objc_msgSend(a1, "type"), objc_msgSend(a1, "usagePage"), objc_msgSend(a1, "usage"), objc_msgSend(a1, "reportID"), objc_msgSend(a1, "integerValue"));
}

- (uint64_t)setValueRef:()HIDFramework
{
  return _IOHIDElementSetValue();
}

- (double)scaleValue:()HIDFramework
{
  if (objc_msgSend(a1, "valueRef"))
    return IOHIDValueGetScaledValue((IOHIDValueRef)objc_msgSend(a1, "valueRef"), a3);
  else
    return 0.0;
}

- (CFIndex)integerValue
{
  CFIndex result;

  result = objc_msgSend(a1, "valueRef");
  if (result)
    return IOHIDValueGetIntegerValue((IOHIDValueRef)objc_msgSend(a1, "valueRef"));
  return result;
}

- (void)setIntegerValue:()HIDFramework
{
  IOHIDValueRef v4;
  IOHIDValueRef v5;

  v4 = IOHIDValueCreateWithIntegerValue((CFAllocatorRef)*MEMORY[0x1E0C9AE00], element, 0, value);
  if (v4)
  {
    v5 = v4;
    -[__IOHIDElement setValueRef:](element, "setValueRef:", v4);
    CFRelease(v5);
  }
}

- (id)dataValue
{
  void *v2;
  void *v3;
  const uint8_t *BytePtr;

  v2 = (void *)objc_msgSend(a1, "valueRef");
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    BytePtr = IOHIDValueGetBytePtr((IOHIDValueRef)objc_msgSend(a1, "valueRef"));
    objc_msgSend(v3, "dataWithBytes:length:", BytePtr, IOHIDValueGetLength((IOHIDValueRef)objc_msgSend(a1, "valueRef")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDataValue:()HIDFramework
{
  const __CFAllocator *v4;
  id v5;
  const uint8_t *v6;
  CFIndex v7;
  IOHIDValueRef v8;
  IOHIDValueRef v9;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = objc_retainAutorelease(a3);
  v6 = (const uint8_t *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  v8 = IOHIDValueCreateWithBytes(v4, a1, 0, v6, v7);
  if (v8)
  {
    v9 = v8;
    -[__IOHIDElement setValueRef:](a1, "setValueRef:", v8);
    CFRelease(v9);
  }
}

- (uint64_t)type
{
  return IOHIDElementGetType(a1);
}

- (uint64_t)usagePage
{
  return IOHIDElementGetUsagePage(a1);
}

- (uint64_t)usage
{
  return IOHIDElementGetUsage(a1);
}

- (uint64_t)reportID
{
  return IOHIDElementGetReportID(a1);
}

- (uint64_t)reportSize
{
  return IOHIDElementGetReportSize(a1);
}

- (uint64_t)unit
{
  return IOHIDElementGetUnit(a1);
}

- (uint64_t)unitExponent
{
  return IOHIDElementGetUnitExponent(a1);
}

- (uint64_t)timestamp
{
  uint64_t result;

  result = objc_msgSend(a1, "valueRef");
  if (result)
    return IOHIDValueGetTimeStamp((IOHIDValueRef)objc_msgSend(a1, "valueRef"));
  return result;
}

@end
