@implementation IOHIDEventSystemConnectionCopyEventLog

void ___IOHIDEventSystemConnectionCopyEventLog_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFStringRef v10;
  CFStringRef v11;

  v6 = CFGetAllocator(cf);
  Mutable = CFDictionaryCreateMutable(v6, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v8 = Mutable;
    _IOHIDDictionaryAddSInt32(Mutable, CFSTR("EventType"), *(_DWORD *)a2);
    v9 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
    v10 = _IOHIDCreateTimeString(v9, (time_t *)(a2 + 8));
    if (v10)
    {
      v11 = v10;
      CFDictionaryAddValue(v8, CFSTR("EventTime"), v10);
      CFRelease(v11);
    }
    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }
}

@end
