@implementation GSDaemonConnection

void __GSDaemonConnection_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)sDaemonConn;
  if (!sDaemonConn)
  {
    _SetupGSXPCConn();
    v2 = (void *)sDaemonConn;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2);
}

@end
