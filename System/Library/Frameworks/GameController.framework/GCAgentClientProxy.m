@implementation GCAgentClientProxy

void __68___GCAgentClientProxy__initWithConnection_server_userDefaultsProxy___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "_invalidate");

}

uint64_t __37___GCAgentClientProxy_pingWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76___GCAgentClientProxy_connectToUserDefaultsXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

uint64_t __79___GCAgentClientProxy_connectToVideoRelocationXPCProxyServiceWithClient_reply___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[4];
  v3 = a1[6];
  if (v2)
    v4 = a1[5];
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

@end
