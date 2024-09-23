@implementation APReceiverStatsCollectorSetScreenOptions

uint64_t __APReceiverStatsCollectorSetScreenOptions_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  const __CFArray *TypedValue;
  uint64_t v4;
  uint64_t i;
  const void *v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_APReceiverStatsCollector <= 30
    && (gLogCategory_APReceiverStatsCollector != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  FigCFDictionaryGetInt32IfPresent();
  *(_QWORD *)(v1 + 248) = 0;
  v2 = *(const void **)(v1 + 120);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(v1 + 120) = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendF();
  CFStringAppendF();
  CFArrayGetTypeID();
  TypedValue = (const __CFArray *)CFDictionaryGetTypedValue();
  if (TypedValue)
    TypedValue = (const __CFArray *)CFArrayGetCount(TypedValue);
  if ((unint64_t)TypedValue >= 0x10)
    v4 = 16;
  else
    v4 = (uint64_t)TypedValue;
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      CFDictionaryGetTypeID();
      if (CFArrayGetTypedValueAtIndex())
      {
        CFStringGetTypeID();
        v6 = (const void *)CFDictionaryGetTypedValue();
        if (v6)
        {
          CFEqual(v6, CFSTR("HIDIn"));
          CFStringAppendF();
          ++*(_DWORD *)(v1 + 248);
        }
      }
    }
  }
  CFStringAppendF();
  CFStringAppendF();
  CFStringAppendF();
  CFStringAppendF();
  *(_DWORD *)(v1 + 252) += 4;
  if (FigSupportsIOSurfaceTimingInfo())
  {
    CFStringAppendF();
    CFStringAppendF();
    CFStringAppendF();
    CFStringAppendF();
    CFStringAppendF();
  }
  CFStringAppendF();
  CFStringAppendF();
  CFStringAppendF();
  return CFStringAppendF();
}

@end
