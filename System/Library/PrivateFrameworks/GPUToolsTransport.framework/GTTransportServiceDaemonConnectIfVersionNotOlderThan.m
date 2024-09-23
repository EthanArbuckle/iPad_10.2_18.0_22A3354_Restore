@implementation GTTransportServiceDaemonConnectIfVersionNotOlderThan

void __GTTransportServiceDaemonConnectIfVersionNotOlderThan_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  allServices(*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
