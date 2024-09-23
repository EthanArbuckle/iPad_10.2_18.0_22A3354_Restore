@implementation APCarPlayControlServerAddInterface

void __APCarPlayControlServerAddInterface_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v2 + 64);
    *(_QWORD *)(v2 + 64) = v3 + 1;
    v4 = MEMORY[0x1E0C81028];
    if (!v3)
    {
      CFObjectSetProperty();
      if (gLogCategory_CarPlayControlServer <= 50
        && (gLogCategory_CarPlayControlServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
        APSEventRecorderRecordEvent();
      v5 = LogCategoryCopyOSLogHandle();
      v6 = (void *)v5;
      if (v5)
        v7 = v5;
      else
        v7 = v4;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9382000, v7, OS_SIGNPOST_EVENT, 0x2B8D07D8uLL, "AP_SIGNPOST_CAR_CONTROLSERVER_STARTEDSERVER", ", buf, 2u);
      }
      if (v6)
        os_release(v6);
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 80))
    {
      BonjourAdvertiserSetPort();
      BonjourAdvertiserStart();
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
        APSEventRecorderRecordEvent();
      v8 = LogCategoryCopyOSLogHandle();
      v9 = (void *)v8;
      if (v8)
        v4 = v8;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9382000, v4, OS_SIGNPOST_EVENT, 0x2B8D07DCuLL, "AP_SIGNPOST_CAR_CONTROLSERVER_STARTEDADVERTISE", ", v10, 2u);
      }
      if (v9)
        os_release(v9);
      if (gLogCategory_CarPlayControlServer <= 40
        && (gLogCategory_CarPlayControlServer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 72), *(const void **)(a1 + 48), *(const void **)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
