@implementation APTransportWifiManagerClientUnregister

void __APTransportWifiManagerClientUnregister_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 56))
  {
    v3 = *(_DWORD *)(v2 + 24);
    v4 = __OFSUB__(v3--, 1);
    *(_DWORD *)(v2 + 24) = v3;
    if ((v3 < 0) ^ v4 | (v3 == 0))
    {
      objc_msgSend(*(id *)(v2 + 48), "endActivity:");
      if (gLogCategory_APTransportWifiManagerClient <= 40
        && (gLogCategory_APTransportWifiManagerClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      *(_QWORD *)(v2 + 56) = 0;
      objc_msgSend(*(id *)(v2 + 48), "invalidate");

      *(_QWORD *)(v2 + 48) = 0;
    }
    if (gLogCategory_APTransportWifiManagerClient <= 30
      && (gLogCategory_APTransportWifiManagerClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  CFRetain((CFTypeRef)v2);
  v5 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __wifiManagerClient_unregisterInternal_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v2;
  dispatch_async(v5, block);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

@end
