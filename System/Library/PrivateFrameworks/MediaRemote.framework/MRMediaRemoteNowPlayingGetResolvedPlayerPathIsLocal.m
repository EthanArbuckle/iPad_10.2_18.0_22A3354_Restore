@implementation MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal

uint64_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __MRMediaRemoteNowPlayingGetResolvedPlayerPathIsLocal_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t IsLocal;

  v3 = *(_QWORD *)(a1 + 32);
  IsLocal = MRNowPlayingPlayerPathIsLocal(a2);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, a2, IsLocal);
}

@end
