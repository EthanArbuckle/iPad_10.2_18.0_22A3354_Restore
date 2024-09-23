@implementation APTransportTrafficRegistrarAWDLTrafficRegistrationCreateEx

void __APTransportTrafficRegistrarAWDLTrafficRegistrationCreateEx_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (gLogCategory_APTransportTrafficRegistrar <= 50
    && (gLogCategory_APTransportTrafficRegistrar != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __APTransportTrafficRegistrarAWDLTrafficRegistrationCreateEx_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v2;
  dispatch_async(v3, block);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __APTransportTrafficRegistrarAWDLTrafficRegistrationCreateEx_block_invoke_2(uint64_t a1)
{
  _DWORD *v1;

  v1 = *(_DWORD **)(a1 + 32);
  --v1[10];
  CFRelease(v1);
}

void __APTransportTrafficRegistrarAWDLTrafficRegistrationCreateEx_block_invoke_3(uint64_t a1)
{
  _DWORD *v1;

  v1 = *(_DWORD **)(a1 + 32);
  ++v1[10];
  CFRelease(v1);
}

@end
