@implementation SecuritydXPCProxyObject

void __SecuritydXPCProxyObject_block_invoke()
{
  SecuritydXPCClient *v0;
  void *v1;

  v0 = objc_alloc_init(SecuritydXPCClient);
  v1 = (void *)SecuritydXPCProxyObject_rpc;
  SecuritydXPCProxyObject_rpc = (uint64_t)v0;

}

@end
