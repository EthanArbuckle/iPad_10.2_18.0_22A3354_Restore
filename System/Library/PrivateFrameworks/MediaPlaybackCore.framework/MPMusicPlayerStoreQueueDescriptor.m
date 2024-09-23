@implementation MPMusicPlayerStoreQueueDescriptor

void __80__MPMusicPlayerStoreQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__MPMusicPlayerStoreQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke_2;
  v3[3] = &unk_24CAB89F0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);

}

void __80__MPMusicPlayerStoreQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "longLongValue"));

}

@end
