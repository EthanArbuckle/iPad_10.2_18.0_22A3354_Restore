@implementation AFGetNowPlayingMediaContentItmes

uint64_t ___AFGetNowPlayingMediaContentItmes_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___AFGetNowPlayingMediaContentItmes_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD, uint64_t, _QWORD);
  id v9;

  if (AFIsInternalInstall_onceToken != -1)
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_100_40135);
  if (AFIsInternalInstall_isInternal)
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (a2)
  {
    v6 = a3;
    v9 = (id)MRPlaybackQueueCopyContentItems();
    MRPlaybackQueueGetRange();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v7 + 16);
    v9 = a3;
    v8(v7, 0, -1, 0);
  }

}

@end
