@implementation ProcessGetCallConfig

void __ProcessGetCallConfig_block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = (_xpc_connection_s *)objc_msgSend(*(id *)(a1 + 32), "connection");
  if (v2)
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

@end
