@implementation APConnectivityHelperHandleCWFEventExternal

void ___APConnectivityHelperHandleCWFEventExternal_block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  const __CFAllocator *v5;
  CFMutableDictionaryRef v6;
  char v7;
  _BYTE *v8;
  CFMutableDictionaryRef Mutable;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(_BYTE **)(a1 + 40);
  v4 = objc_msgSend(v3, "type");
  if (v2[200])
    goto LABEL_43;
  if (v4 > 9)
  {
    if (v4 != 29)
    {
      if (v4 == 10 && (v2[80] || v2[177]))
      {
        if (gLogCategory_APConnectivityHelper <= 40
          && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v2[80])
          _APConnectivityHelperTrySettingWiFiDevice((uint64_t)v2);
        if (v2[177])
          _APConnectivityHelperTrySettingAWDLDevice((uint64_t)v2);
      }
      goto LABEL_43;
    }
    if (!v2[75])
      goto LABEL_43;
    v8 = v2;
    if (gLogCategory_APConnectivityHelper <= 40
      && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = CFGetAllocator(v2);
    Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v10 = 0;
      _APConnectivityHelperPopulateCurrentWiFiNetworkInfo((uint64_t *)&v8);
      if ((_DWORD)v10)
      {
        APSLogErrorAt();
        v7 = 1;
        v6 = Mutable;
      }
      else
      {
        v6 = Mutable;
        if (_APConnectivityHelperDispatchEvent((uint64_t)v2, (void *)9, Mutable))
        {
          APSLogErrorAt();
          v7 = 0;
        }
        else
        {
          v7 = 1;
        }
      }
      if (v6)
        CFRelease(v6);
      if ((v7 & 1) != 0)
        goto LABEL_43;
    }
    else
    {
      APSLogErrorAt();
    }
    if (gLogCategory_APConnectivityHelper <= 90
      && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_47;
    }
  }
  else if (v4 == 1)
  {
    if (v2[77])
    {
      if (gLogCategory_APConnectivityHelper <= 40
        && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (_APConnectivityHelperDispatchEvent((uint64_t)v2, (void *)2, 0))
      {
        APSLogErrorAt();
        if (gLogCategory_APConnectivityHelper <= 90
          && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_47;
        }
      }
    }
  }
  else if (v4 == 6
         && v2[73]
         && _APConnectivityHelperHandleWiFiLinkChangedInternal(v2, (void *)objc_msgSend(v3, "info"))
         && gLogCategory_APConnectivityHelper <= 90
         && (gLogCategory_APConnectivityHelper != -1 || _LogCategory_Initialize()))
  {
LABEL_47:
    LogPrintF();
  }
LABEL_43:

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end
