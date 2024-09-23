@implementation IOHIDEventSystemConnectionSerializeActivity

void ____IOHIDEventSystemConnectionSerializeActivity_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFStringRef v10;
  CFStringRef v11;
  uint64_t v12;
  int v13;

  v6 = CFGetAllocator(cf);
  Mutable = CFDictionaryCreateMutable(v6, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v8 = Mutable;
    _IOHIDDictionaryAddSInt32(Mutable, CFSTR("ActivityState"), *(_DWORD *)a2);
    v9 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
    v10 = _IOHIDCreateTimeString(v9, (time_t *)(a2 + 8));
    if (v10)
    {
      v11 = v10;
      CFDictionaryAddValue(v8, CFSTR("ActivityTime"), v10);
      CFRelease(v11);
    }
    v12 = *(_QWORD *)(a2 + 24);
    if (v12)
      _IOHIDDictionaryAddSInt64(v8, CFSTR("ServiceID"), v12);
    v13 = *(_DWORD *)(a2 + 32);
    if (v13)
      _IOHIDDictionaryAddSInt32(v8, CFSTR("EventType"), v13);
    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }
}

@end
