@implementation FigXPCRemoteClientCreateWithXPCService

xpc_connection_t __FigXPCRemoteClientCreateWithXPCService_block_invoke(uint64_t a1, NSObject *a2)
{
  return xpc_connection_create(*(const char **)(a1 + 32), a2);
}

@end
