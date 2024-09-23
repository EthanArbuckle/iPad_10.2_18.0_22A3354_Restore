@implementation MRCreatePlaybackQueueForOffset

void ___onQueue_MRCreatePlaybackQueueForOffset_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t (**v6)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "block");
  v6 = (uint64_t (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = (void *)v6[2](v6, *(_QWORD *)(a1 + 48));
  if (v2)
  {
    _onClientQueue_MRCreatePlaybackQueueForOffset(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
