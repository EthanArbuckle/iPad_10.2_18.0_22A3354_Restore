@implementation CFHTTPServerResponseSetClient

uint64_t ___CFHTTPServerResponseSetClient_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  _DWORD *v5;

  v3 = *(uint64_t **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 80) + 136);
  if (v4)
  {
    if (HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection != -1)
      dispatch_once(&HTTPServerConnection::Class(void)::sOnce_HTTPServerConnection, &__block_literal_global_13743);
    v5 = *(_DWORD **)(v4 + 112);
  }
  else
  {
    v5 = 0;
  }
  return HTTPServerClientOwning::setServerClient(a2 + 8, v3, v5);
}

@end
