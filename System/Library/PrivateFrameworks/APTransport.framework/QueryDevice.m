@implementation QueryDevice

void __queryManagerGetInfo_QueryDevice_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const __CFString *v4;
  uint64_t DerivedStorage;
  uint64_t v6;
  int v7;
  __int128 v8;
  int v9;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(const void **)(a1 + 40);
  v3 = *(const void **)(a1 + 48);
  v4 = *(const __CFString **)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 64);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  *(_OWORD *)buffer = 0u;
  if (!v3 || !v4 || !(_QWORD)v8)
  {
    APSLogErrorAt();
    v7 = -72231;
LABEL_25:
    v9 = v7;
    goto LABEL_21;
  }
  v6 = DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 16))
  {
    v7 = -72233;
    goto LABEL_25;
  }
  CFGetInt64();
  buffer[0] = 0;
  if (!CFStringGetCString(v4, buffer, 128, 0x8000100u))
  {
    APSLogErrorAt();
    v7 = -72232;
    goto LABEL_25;
  }
  v9 = HTTPClientCreate();
  if (v9)
    goto LABEL_26;
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(v6 + 24), v3))
  {
    if (gLogCategory_APBrowserDeviceQueryManagerGetInfo <= 20
      && (gLogCategory_APBrowserDeviceQueryManagerGetInfo != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    HTTPClientInvalidate();
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v6 + 24), v3);
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 24), v3, 0);
  if (gLogCategory_APBrowserDeviceQueryManagerGetInfo <= 50
    && (gLogCategory_APBrowserDeviceQueryManagerGetInfo != -1 || _LogCategory_Initialize()))
  {
    HTTPClientGetClientID();
    LogPrintF();
  }
  HTTPClientSetDispatchQueue();
  APSLogUtilsGetHTTPClientCoreLogCategory();
  HTTPClientSetLogging();
  APSLogUtilsGetAsyncCnxLogCategory();
  HTTPClientSetConnectionLogging();
  HTTPClientSetFlags();
  HTTPClientSetTimeout();
  v9 = HTTPClientSetDestination();
  if (v9 || (v9 = HTTPMessageCreate()) != 0)
  {
LABEL_26:
    APSLogErrorAt();
  }
  else
  {
    HTTPMessageSetCompletionBlock();
    buffer[0] = 0;
    snprintf(buffer, 0x80uLL, "/info?%s&%s", "txtAirPlay", "txtRAOP");
    HTTPHeader_InitRequest();
    CFRetain(v2);
    CFRetain(0);
    CFRetain(v4);
    CFRetain((CFTypeRef)v8);
    CFRetain(v3);
    v9 = HTTPClientSendMessage();
    if (v9)
    {
      APSLogErrorAt();
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v6 + 24), v3);
      CFRelease(v4);
      CFRelease((CFTypeRef)v8);
      CFRelease(v3);
      CFRelease(0);
      CFRelease(v2);
    }
  }
LABEL_21:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
}

@end
