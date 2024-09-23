@implementation PairingSessionSavePeerPairingManager

intptr_t ___PairingSessionSavePeerPairingManager_block_invoke(uint64_t a1, void *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NSErrorToOSStatusEx(a2, 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
