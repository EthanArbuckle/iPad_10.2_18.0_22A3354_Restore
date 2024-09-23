@implementation MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync

intptr_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocalSync_block_invoke(uint64_t a1, void *a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
