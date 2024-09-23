@implementation IOHIDEventSystemClientCacheServices

uint64_t ____IOHIDEventSystemClientCacheServices_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const __CFDictionary *v5;
  HIDServiceClient *v6;
  HIDServiceClient *v7;

  Value = CFDictionaryGetValue(theDict, CFSTR("ServiceID"));
  v5 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Properties"));
  os_unfair_recursive_lock_lock_with_options();
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 96), Value))
  {
    v6 = _IOHIDServiceClientCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], Value, v5, *(__IOHIDEventSystemClient **)(a1 + 32));
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 96), Value, v6);
      CFRelease(v7);
    }
  }
  return os_unfair_recursive_lock_unlock();
}

@end
