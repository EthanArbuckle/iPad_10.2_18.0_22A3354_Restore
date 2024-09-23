@implementation FigXPCRemoteClientCreateWithXPCEndpoint

_xpc_connection_s *__FigXPCRemoteClientCreateWithXPCEndpoint_block_invoke(uint64_t a1, NSObject *a2)
{
  _xpc_connection_s *v3;

  v3 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 32));
  xpc_connection_set_target_queue(v3, a2);
  return v3;
}

@end
