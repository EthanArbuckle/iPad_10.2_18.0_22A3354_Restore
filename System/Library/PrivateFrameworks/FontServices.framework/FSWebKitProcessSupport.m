@implementation FSWebKitProcessSupport

uint64_t __FSWebKitProcessSupport_block_invoke(uint64_t a1)
{
  FSWebKitProcessSupportManager *v1;
  void *v2;

  v1 = -[FSWebKitProcessSupportManager initWithXPCEndpoint:]([FSWebKitProcessSupportManager alloc], "initWithXPCEndpoint:", *(_QWORD *)(a1 + 32));
  v2 = (void *)FSWebKitProcessSupport_sSharedManager;
  FSWebKitProcessSupport_sSharedManager = (uint64_t)v1;

  return objc_msgSend((id)FSWebKitProcessSupport_sSharedManager, "checkin");
}

@end
