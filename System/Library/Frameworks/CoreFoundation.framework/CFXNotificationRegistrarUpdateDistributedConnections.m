@implementation CFXNotificationRegistrarUpdateDistributedConnections

uint64_t __CFXNotificationRegistrarUpdateDistributedConnections_block_invoke(uint64_t a1, uint64_t a2)
{
  _CFXNotificationRegisteredObserverSetDistributedConnection(*(_QWORD **)(a1 + 40), *(_DWORD *)(a2 + 52), *(_DWORD *)(a2 + 48), *(_QWORD **)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
