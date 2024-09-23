@implementation SOSCCForEachEngineStateAsStringFromArray

void __SOSCCForEachEngineStateAsStringFromArray_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  const __CFAllocator *v5;
  __CFString *Mutable;
  const void *Value;
  const void *v8;
  CFTypeID v9;
  const __CFSet *v10;
  const __CFSet *v11;
  CFTypeID v12;
  const void *v13;
  const __CFData *v14;
  const __CFData *v15;
  CFTypeID v16;
  _QWORD *v17;
  CFIndex Length;
  __CFString *v19;
  const UInt8 *BytePtr;
  CFIndex v21;
  CFIndex v22;
  unsigned int v23;
  const void *v24;
  const void *v25;
  CFTypeID v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  __CFString *v30;
  _QWORD v31[5];

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      Value = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSOSCCEngineStatePeerIDKey);
      if (Value && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID()))
        CFStringAppendFormat(Mutable, 0, CFSTR("remote %@ "), v8);
      else
        CFStringAppendFormat(Mutable, 0, CFSTR("local "));
      v10 = (const __CFSet *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSOSCCEngineStateSyncSetKey);
      if (v10 && (v11 = v10, v12 = CFGetTypeID(v10), v12 == CFSetGetTypeID()))
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __SOSCCForEachEngineStateAsStringFromArray_block_invoke_2;
        v31[3] = &__block_descriptor_40_e21_v16__0____CFString__8l;
        v31[4] = Mutable;
        CFStringSetPerformWithDescription(v11, (uint64_t)v31);
      }
      else
      {
        CFStringAppendFormat(Mutable, 0, CFSTR("<Missing view set!>"));
      }
      v13 = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSOSCCEngineStateManifestCountKey);
      CFStringAppendFormat(Mutable, 0, CFSTR(" [%@]"), v13);
      v14 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSOSCCEngineStateManifestHashKey);
      if (v14)
      {
        v15 = v14;
        v16 = CFGetTypeID(v14);
        if (v16 == CFDataGetTypeID())
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v28 = __SOSCCForEachEngineStateAsStringFromArray_block_invoke_3;
          v29 = &__block_descriptor_40_e21_v16__0____CFString__8l;
          v30 = Mutable;
          v17 = v27;
          Length = CFDataGetLength(v15);
          v19 = CFStringCreateMutable(v5, 2 * Length);
          BytePtr = CFDataGetBytePtr(v15);
          v21 = CFDataGetLength(v15);
          if (v21 >= 1)
          {
            v22 = v21;
            do
            {
              v23 = *BytePtr++;
              CFStringAppendFormat(v19, 0, CFSTR("%02X"), v23);
              --v22;
            }
            while (v22);
          }
          v28((uint64_t)v17, (uint64_t)v19);
          CFRelease(v19);

        }
      }
      v24 = CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)kSOSCCEngineStateCoderKey);
      if (v24)
      {
        v25 = v24;
        v26 = CFGetTypeID(v24);
        if (v26 == CFStringGetTypeID())
          CFStringAppendFormat(Mutable, 0, CFSTR(" %@"), v25);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (Mutable)
        CFRelease(Mutable);
    }
  }
}

void __SOSCCForEachEngineStateAsStringFromArray_block_invoke_2(uint64_t a1, const __CFString *a2)
{
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), a2);
}

void __SOSCCForEachEngineStateAsStringFromArray_block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR(" %@"), a2);
}

@end
