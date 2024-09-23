@implementation APSNetworkClockReportRTCMetrics

void __APSNetworkClockReportRTCMetrics_block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v3;
  const __CFArray *v4;
  CFIndex v5;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    APSLogErrorAt(0);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -71970;
    return;
  }
  v3 = Mutable;
  v4 = (const __CFArray *)CFDictionaryCopyKeys();
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v5 = 0;
    if (FigCFNumberGetUInt16())
    {
      while (v5 < CFArrayGetCount(v4))
      {
        CFArrayGetValueAtIndex(v4, v5);
        if (!FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual()
          && !FigCFEqual())
        {
          FigCFEqual();
        }
        FigCFDictionarySetValueFromKeyInDict();
        ++v5;
      }
      APSRTCReportingAgentSendEvent(*(_QWORD *)(a1 + 40), 8, v3);
      if (gLogCategory_APSNetworkClockCommon >= 31
        || gLogCategory_APSNetworkClockCommon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_32;
      }
    }
    else
    {
      while (v5 < CFArrayGetCount(v4))
      {
        CFArrayGetValueAtIndex(v4, v5);
        if (!FigCFEqual() && !FigCFEqual() && !FigCFEqual())
          FigCFEqual();
        FigCFDictionarySetValueFromKeyInDict();
        ++v5;
      }
      APSRTCReportingAgentSendEvent(*(_QWORD *)(a1 + 40), 9, v3);
      if (gLogCategory_APSNetworkClockCommon >= 31
        || gLogCategory_APSNetworkClockCommon == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_32;
      }
    }
    LogPrintF();
  }
LABEL_32:
  CFRelease(v3);
  if (v4)
    CFRelease(v4);
}

@end
