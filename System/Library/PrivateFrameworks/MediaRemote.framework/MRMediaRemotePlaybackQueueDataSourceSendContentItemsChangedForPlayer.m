@implementation MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer

void __MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (MRContentItemGetArtworkData(v8))
        {
          MRContentItemSetArtworkData(v8, 0);
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "playerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _onQueue_MRMediaRemotePlaybackQueueDataSourceSendShortCircutedContentItemsChangedForPlayer(v9, v10);

  _onQueue_MRMediaRemotePlaybackQueueDataSourceSendContentItemsChangedForPlayer(*(void **)(a1 + 32), *(void **)(a1 + 40));
  _onQueue_MRMediaRemoteSendContentItemArtworkUpdatedNotification(v2, *(void **)(a1 + 40));

}

@end
