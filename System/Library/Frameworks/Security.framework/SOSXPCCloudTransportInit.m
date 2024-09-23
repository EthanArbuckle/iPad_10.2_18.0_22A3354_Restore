@implementation SOSXPCCloudTransportInit

void __SOSXPCCloudTransportInit_block_invoke(uint64_t a1)
{
  setupServiceConnection(*(_QWORD *)(a1 + 32));
}

void __SOSXPCCloudTransportInit_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = secLogObjForScope("sync");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18A900000, v2, OS_LOG_TYPE_DEFAULT, "CKP Transport: desktopUp happened, reestablishing xpc connections", v3, 2u);
  }
  teardownServiceConnection(*(_QWORD *)(a1 + 32));
}

@end
