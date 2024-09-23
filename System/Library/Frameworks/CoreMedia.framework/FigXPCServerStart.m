@implementation FigXPCServerStart

xpc_connection_t __FigXPCServerStart_block_invoke(uint64_t a1, NSObject *a2)
{
  return xpc_connection_create_mach_service(*(const char **)(a1 + 32), a2, 1uLL);
}

@end
