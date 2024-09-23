@implementation APDemoManagerStart

void __APDemoManagerStart_block_invoke(uint64_t a1)
{
  SCDynamicStoreRef *v2;
  const __CFAllocator *v3;
  const __CFArray *v4;
  const __SCDynamicStore *v5;
  NSObject *v6;
  int v7;
  int v8;
  _QWORD block[5];
  SCDynamicStoreContext context;
  void *values;
  CFTypeRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  sleep(1u);
  CFStringGetTypeID();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = APSSettingsCopyValueEx();
  v2 = *(SCDynamicStoreRef **)(a1 + 32);
  memset(&context, 0, sizeof(context));
  v12 = 0;
  if (gLogCategory_APDemoManager <= 50 && (gLogCategory_APDemoManager != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  values = (void *)SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], CFSTR("en[0-9]+"), (CFStringRef)*MEMORY[0x1E0CE8B80]);
  v4 = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  context.info = v2;
  v5 = SCDynamicStoreCreate(v3, CFSTR("APDemoManager"), (SCDynamicStoreCallBack)callback_ipAddressChanged, &context);
  v2[5] = v5;
  if (v5
    && SCDynamicStoreSetNotificationKeys(v5, 0, v4)
    && SCDynamicStoreSetDispatchQueue(v2[5], (dispatch_queue_t)*v2))
  {
    v6 = *v2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __demoManagerStartLinkDiscovery_block_invoke;
    block[3] = &__block_descriptor_tmp_43;
    block[4] = v2;
    dispatch_async(v6, block);
  }
  else
  {
    APSLogErrorAt();
    v7 = SCError();
    if (v7)
      v8 = v7;
    else
      v8 = 1001;
    if (gLogCategory_APDemoManager <= 90
      && (gLogCategory_APDemoManager != -1 || _LogCategory_Initialize()))
    {
      SCErrorString(v8);
      LogPrintF();
    }
  }
  if (values)
    CFRelease(values);
  if (v12)
    CFRelease(v12);
  if (v4)
    CFRelease(v4);
}

@end
