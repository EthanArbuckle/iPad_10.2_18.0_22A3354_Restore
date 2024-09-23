@implementation IOHIDServiceClientCacheProperties

uint64_t ___IOHIDServiceClientCacheProperties_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  int v7;
  uint64_t result;
  const __CFNumber *v9;
  CFTypeID v10;
  int v11;
  int valuePtr;
  int v13;

  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DeviceUsagePage"));
  if (Value && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
    v7 = valuePtr;
  }
  else
  {
    v7 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136)
            + 8 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = v7;
  v13 = 0;
  result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("DeviceUsage"));
  if (result
    && (v9 = (const __CFNumber *)result,
        v10 = CFGetTypeID((CFTypeRef)result),
        result = CFNumberGetTypeID(),
        v10 == result))
  {
    result = CFNumberGetValue(v9, kCFNumberSInt32Type, &v13);
    v11 = v13;
  }
  else
  {
    v11 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136)
            + 8 * (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++
            + 4) = v11;
  return result;
}

@end
