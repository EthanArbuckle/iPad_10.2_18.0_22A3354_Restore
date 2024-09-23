@implementation IOHIDServiceCopyEventLog

void ___IOHIDServiceCopyEventLog_block_invoke(uint64_t a1, uint64_t a2, void *cf)
{
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  const __CFAllocator *v9;
  CFStringRef v10;
  CFStringRef v11;
  unint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  unint64_t v15;
  const __CFString *v16;
  __CFDictionary *v17;

  v6 = CFGetAllocator(cf);
  Mutable = CFDictionaryCreateMutable(v6, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
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
    v12 = *(_QWORD *)(a2 + 24);
    if (!v12)
      goto LABEL_17;
    if (*(_DWORD *)a2 == 1)
    {
      _IOHIDDictionaryAddSInt32(v8, CFSTR("UsagePage"), WORD1(v12));
      _IOHIDDictionaryAddSInt32(v8, CFSTR("Usage"), (unsigned __int16)v12);
      v16 = CFSTR("Length");
      v17 = v8;
      v15 = HIDWORD(v12);
    }
    else
    {
      if (*(_DWORD *)a2 != 3)
        goto LABEL_17;
      _IOHIDDictionaryAddSInt32(v8, CFSTR("Down"), v12 & 1);
      _IOHIDDictionaryAddSInt32(v8, CFSTR("PressCount"), (v12 >> 2));
      _IOHIDDictionaryAddSInt32(v8, CFSTR("LongPress"), (v12 >> 1) & 1);
      v13 = CFSTR("ended");
      if ((v12 & 0x1000) == 0)
        v13 = &stru_1E2005170;
      v14 = (v12 & 0x400) != 0 ? CFSTR("begin") : (__CFString *)v13;
      CFDictionaryAddValue(v8, CFSTR("Phase"), v14);
      if ((v12 & 0x3FFFC000000) == 0)
        goto LABEL_17;
      _IOHIDDictionaryAddSInt32(v8, CFSTR("Usage"), (unsigned __int16)(v12 >> 26));
      LODWORD(v15) = (unsigned __int16)(v12 >> 42);
      v16 = CFSTR("UsagePage");
      v17 = v8;
    }
    _IOHIDDictionaryAddSInt32(v17, v16, v15);
LABEL_17:
    CFArrayAppendValue((CFMutableArrayRef)cf, v8);
    CFRelease(v8);
  }
}

@end
