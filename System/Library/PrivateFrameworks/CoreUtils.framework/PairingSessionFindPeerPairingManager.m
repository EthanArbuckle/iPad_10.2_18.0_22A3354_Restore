@implementation PairingSessionFindPeerPairingManager

void ___PairingSessionFindPeerPairingManager_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v6;
  id v7;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = v4;
  v6 = a3;
  LODWORD(v4) = NSErrorToOSStatusEx(v6, 0);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)v4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
