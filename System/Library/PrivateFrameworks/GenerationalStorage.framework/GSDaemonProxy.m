@implementation GSDaemonProxy

void __GSDaemonProxy_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (!sDaemonConn)
    _SetupGSXPCConn();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)sDaemonConn, "remoteObjectProxyWithErrorHandler:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = (id)sDaemonProxy;
    v4 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v6;
  }

}

@end
