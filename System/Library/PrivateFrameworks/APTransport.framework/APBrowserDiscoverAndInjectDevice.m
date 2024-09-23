@implementation APBrowserDiscoverAndInjectDevice

uint64_t __APBrowserDiscoverAndInjectDevice_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)v2;
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v5 = *(void **)(v2 + 208);
  if (v5)
  {
    objc_msgSend(v5, "stopBrowsing");
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v7 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v7 + 208) = v6;
    objc_msgSend(v6, "setDispatchQueue:", *(_QWORD *)(v7 + 8));
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  CFRetain(*(CFTypeRef *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "startBrowsingFor:withTimeout:deviceFoundHandler:", 30.0);
}

void __APBrowserDiscoverAndInjectDevice_block_invoke_2(uint64_t a1, const void *a2)
{
  int v4;
  int v5;
  const __CFAllocator *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *Mutable;
  __CFDictionary *v10;
  int v11;
  CFTypeRef cf;
  void *value;

  v4 = NSErrorToOSStatus();
  cf = 0;
  value = 0;
  v5 = ***(_DWORD ***)(a1 + 32);
  if (!v4)
  {
    if (v5 <= 50)
    {
      if (v5 != -1)
      {
LABEL_4:
        if (v5 == -1)
          _LogCategory_Initialize();
        LogPrintF();
        goto LABEL_10;
      }
      if (_LogCategory_Initialize())
      {
        v5 = ***(_DWORD ***)(a1 + 32);
        goto LABEL_4;
      }
    }
LABEL_10:
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (APBrowserCreateAdvertiserInfoForDevice(*MEMORY[0x1E0C9AE00], (const __CFDictionary *)a2, 0, &cf)|| APBrowserCopyDeviceIDFromBonjourInfo(v6, (uint64_t)a2, (CFNumberRef *)&value)|| (v7 = CFDictionaryCreateMutable(v6, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) == 0)
    {
      APSLogErrorAt();
    }
    else
    {
      v8 = v7;
      CFDictionarySetValue(v7, CFSTR("deviceID"), value);
      CFDictionarySetValue(v8, CFSTR("deviceInfo"), cf);
      CFDictionarySetValue(v8, CFSTR("assistedInfo"), *(const void **)(a1 + 48));
      CFDictionarySetValue(v8, CFSTR("isModernPresent"), (const void *)*MEMORY[0x1E0C9AE50]);
      Mutable = CFDictionaryCreateMutable(v6, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v10 = Mutable;
        CFDictionarySetValue(Mutable, CFSTR("AirPlayBonjourInfo"), a2);
        CFDictionarySetValue(v10, CFSTR("LastEventInfo"), v8);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 200), value, v10);
        v11 = ***(_DWORD ***)(a1 + 32);
        if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        if (browser_dispatchEvent(*(const void **)(a1 + 40), 3, v8))
          APSLogErrorAt();
        CFRelease(v10);
      }
      else
      {
        APSLogErrorAt();
      }
      CFRelease(v8);
    }
    goto LABEL_22;
  }
  if (v5 > 90)
    goto LABEL_22;
  if (v5 == -1)
  {
    if (!_LogCategory_Initialize())
      goto LABEL_22;
    v5 = ***(_DWORD ***)(a1 + 32);
  }
  if (v5 == -1)
    _LogCategory_Initialize();
  LogPrintF();
LABEL_22:
  if (value)
    CFRelease(value);
  if (cf)
    CFRelease(cf);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
