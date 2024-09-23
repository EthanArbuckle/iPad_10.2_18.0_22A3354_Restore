@implementation APSRTCReportingSendMsg

void __APSRTCReportingSendMsg_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    v2 = *(const void **)(a1 + 40);
    if (*(_BYTE *)(v1 + 48))
    {
      apsrr_sendOneMsg(*(_QWORD **)(a1 + 32), *(_WORD *)(a1 + 48), *(_WORD *)(a1 + 50), v2);
      return;
    }
    if (sRTCreportingFrameworkIsValid && v2)
    {
      if (CFArrayGetCount(*(CFArrayRef *)(v1 + 40)) >= 30)
      {
        if (gLogCategory_APSRTCReporting <= 50
          && (gLogCategory_APSRTCReporting != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        apsrr_setReportingToDead(v1);
        return;
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v4 = Mutable;
        FigCFDictionarySetInt32();
        FigCFDictionarySetInt32();
        FigCFDictionarySetValue();
        CFArrayAppendValue(*(CFMutableArrayRef *)(v1 + 40), v4);
        CFRelease(v4);
        return;
      }
    }
    APSLogErrorAt(0);
    return;
  }
  if (gLogCategory_APSRTCReporting <= 60
    && (gLogCategory_APSRTCReporting != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end
