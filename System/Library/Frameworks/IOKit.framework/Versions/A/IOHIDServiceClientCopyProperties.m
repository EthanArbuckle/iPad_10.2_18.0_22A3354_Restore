@implementation IOHIDServiceClientCopyProperties

void __IOHIDServiceClientCopyProperties_block_invoke(IOHIDServiceClientRef *a1, const __CFString *a2)
{
  const void *Value;
  CFTypeRef v5;
  const void *v6;

  os_unfair_recursive_lock_lock_with_options();
  Value = CFDictionaryGetValue(*((CFDictionaryRef *)a1[4] + 12), a2);
  os_unfair_recursive_lock_unlock();
  if (Value)
  {
    if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9B0D0]))
      CFDictionarySetValue(a1[5], a2, Value);
  }
  else if ((CFEqual(a2, CFSTR("PrimaryUsagePage"))
          || CFEqual(a2, CFSTR("PrimaryUsage"))
          || CFEqual(a2, CFSTR("DeviceUsagePairs")))
         && (v5 = IOHIDServiceClientCopyProperty(a1[4], a2)) != 0)
  {
    v6 = v5;
    CFDictionarySetValue(a1[5], a2, v5);
    CFRelease(v6);
  }
  else
  {
    CFArrayAppendValue(a1[6], a2);
  }
}

void __IOHIDServiceClientCopyProperties_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, a3);
}

uint64_t __IOHIDServiceClientCopyProperties_block_invoke_3(uint64_t a1, const void *a2)
{
  const void *Value;
  uint64_t result;
  const void *v6;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  result = CFSetContainsValue((CFSetRef)__serviceKeysSet, a2);
  if ((_DWORD)result)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (Value)
      v6 = Value;
    else
      v6 = (const void *)*MEMORY[0x1E0C9B0D0];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 96), a2, v6);
    return os_unfair_recursive_lock_unlock();
  }
  return result;
}

@end
