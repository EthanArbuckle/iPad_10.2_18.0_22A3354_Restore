@implementation CFHTTPServerRequestSetClient

uint64_t ___CFHTTPServerRequestSetClient_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = *(uint64_t **)(a1 + 32);
  v4 = *(_QWORD *)(a2 + 136);
  if (HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection != -1)
    dispatch_once(&HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection, &__block_literal_global_13743);
  return HTTPServerClientOwning::setServerClient(a2 + 8, v3, *(_DWORD **)(v4 + 112));
}

@end
