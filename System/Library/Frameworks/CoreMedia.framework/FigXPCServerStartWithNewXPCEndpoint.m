@implementation FigXPCServerStartWithNewXPCEndpoint

xpc_connection_t __FigXPCServerStartWithNewXPCEndpoint_block_invoke(uint64_t a1, NSObject *a2)
{
  return xpc_connection_create(0, a2);
}

@end
