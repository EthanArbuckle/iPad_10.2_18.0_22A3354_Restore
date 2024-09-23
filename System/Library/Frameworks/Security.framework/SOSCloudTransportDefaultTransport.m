@implementation SOSCloudTransportDefaultTransport

void __SOSCloudTransportDefaultTransport_block_invoke()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD handler[5];
  int out_token;
  _QWORD block[5];

  if (!defaultTransport)
  {
    v0 = malloc_type_calloc(1uLL, 0x98uLL, 0xE00402F027784uLL);
    *v0 = SOSCloudTransportPut;
    v0[1] = SOSCloudTransportUpdateKeys;
    v0[3] = SOSCloudTransportGet;
    v0[4] = SOSCloudTransportGetAll;
    v0[5] = SOSCloudTransportSync;
    v0[6] = SOSCloudTransportSyncAndWait;
    v0[7] = SOSCloudTransportClearAll;
    v0[9] = SOSCloudTransportHasPendingKey;
    v0[10] = SOSCloudTransportRequestSyncWithPeers;
    v0[11] = SOSCloudTransportRequestEnsurePeerRegistration;
    v0[12] = SOSCloudTransportRequestPerfCounters;
    v0[13] = SOSCloudTransportFlush;
    v0[15] = SOSCloudTransportRemoveKeys;
    v0[14] = _Block_copy(&__block_literal_global_22_5496);
    v1 = dispatch_queue_create("com.apple.security.cloudkeychainproxy3", 0);
    v2 = MEMORY[0x1E0C809B0];
    v0[18] = v1;
    block[0] = v2;
    block[1] = 0x40000000;
    block[2] = __SOSXPCCloudTransportInit_block_invoke;
    block[3] = &__block_descriptor_tmp_25_5497;
    block[4] = v0;
    dispatch_sync(v1, block);
    out_token = -1431655766;
    v3 = v0[18];
    handler[0] = v2;
    handler[1] = 0x40000000;
    handler[2] = __SOSXPCCloudTransportInit_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_28_5498;
    handler[4] = v0;
    notify_register_dispatch("com.apple.system.loginwindow.desktopUp", &out_token, v3, handler);
    defaultTransport = (uint64_t)v0;
  }
}

@end
