@implementation DCSXPCConnection

void __DCSXPCConnection_block_invoke()
{
  _xpc_connection_s *v0;

  v0 = xpc_connection_create("com.apple.DictionaryServiceHelper", 0);
  DCSXPCConnection__ServiceConnection = (uint64_t)v0;
  if (v0)
  {
    xpc_connection_set_event_handler(v0, &__block_literal_global_32);
    if (DCSXPCConnection__ServiceConnection)
      xpc_connection_resume((xpc_connection_t)DCSXPCConnection__ServiceConnection);
  }
}

Class __DCSXPCConnection_block_invoke_2(int a1, id a2)
{
  return object_getClass(a2);
}

@end
