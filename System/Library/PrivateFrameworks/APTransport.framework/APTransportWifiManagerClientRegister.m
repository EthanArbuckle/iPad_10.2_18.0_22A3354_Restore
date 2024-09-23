@implementation APTransportWifiManagerClientRegister

void __APTransportWifiManagerClientRegister_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  _QWORD block[5];
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  if (*(_QWORD *)(v2 + 48))
    goto LABEL_2;
  v5 = objc_alloc_init(MEMORY[0x1E0D1BA50]);
  v6 = v5;
  if (!v5)
  {
    APSLogErrorAt();
    v10 = -71730;
    goto LABEL_17;
  }
  objc_msgSend(v5, "activate");
  v7 = objc_msgSend(MEMORY[0x1E0D1BA38], "activityWithType:reason:", 4, 0);
  if (v7)
  {
    v8 = (void *)v7;
    if ((objc_msgSend(v6, "beginActivity:error:", v7, &v15) & 1) != 0)
    {
      *(_QWORD *)(v2 + 48) = v6;
      *(_QWORD *)(v2 + 56) = v8;
      if (gLogCategory_APTransportWifiManagerClient >= 41)
      {
        v10 = 0;
        v6 = 0;
        ++*(_DWORD *)(v2 + 24);
        goto LABEL_17;
      }
      if (gLogCategory_APTransportWifiManagerClient != -1 || _LogCategory_Initialize())
      {
        v12 = "OSStatus wifiManagerClient_registerInternal(APTransportWifiManagerClientRef)";
        v13 = *(_QWORD *)(v2 + 48);
        LogPrintF();
      }
LABEL_2:
      v3 = gLogCategory_APTransportWifiManagerClient;
      v4 = (*(_DWORD *)(v2 + 24) + 1);
      *(_DWORD *)(v2 + 24) = v4;
      if (v3 <= 30)
      {
        if (v3 == -1)
        {
          if (!_LogCategory_Initialize())
            goto LABEL_16;
          v4 = *(unsigned int *)(v2 + 24);
        }
        v12 = "OSStatus wifiManagerClient_registerInternal(APTransportWifiManagerClientRef)";
        v13 = v4;
        LogPrintF();
      }
LABEL_16:
      v10 = 0;
      v6 = 0;
      goto LABEL_17;
    }
    v9 = NSErrorToOSStatus();
    if (v9)
      v10 = v9;
    else
      v10 = -71733;
  }
  else
  {
    v10 = -71733;
  }
  APSLogErrorAt();
LABEL_17:
  objc_msgSend(v6, "invalidate", v12, v13);

  CFRetain((CFTypeRef)v2);
  v11 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __wifiManagerClient_registerInternal_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v2;
  dispatch_async(v11, block);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
}

@end
