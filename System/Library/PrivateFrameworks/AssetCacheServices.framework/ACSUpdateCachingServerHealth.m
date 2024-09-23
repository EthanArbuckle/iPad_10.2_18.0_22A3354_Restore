@implementation ACSUpdateCachingServerHealth

void __ACSUpdateCachingServerHealth_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *SharedLocatorConnection;

  SharedLocatorConnection = aclGetSharedLocatorConnection(*(unsigned int *)(a1 + 40), 0, a3, a4, a5, a6, a7, a8);
  if (SharedLocatorConnection)
    xpc_connection_send_message(SharedLocatorConnection, *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

@end
