@implementation MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer

void ___onQueue_MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "contentItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "playerPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _onQueue_MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer(v4, v3);

  }
}

void __MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer_block_invoke(void **a1)
{
  _onQueue_MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer(a1[4], a1[5], a1[6]);
}

@end
