@implementation MPCProcessSiriAssetInfoWithStorePlatformPayload

void ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  os_log_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  if (_NSIsNSString() && (_NSIsNSDictionary() & 1) != 0)
  {
    v5 = (void *)a1[4];
    v6 = (void *)a1[5];
    v17 = 0;
    v18 = 0;
    v16 = 0;
    _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(v4, v5, v6, &v18, &v17, &v16);
    v7 = (os_log_t)v18;
    v8 = v17;
    v9 = v16;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_20910);
    if (v8)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC40]), "initWithStorePlatformDictionary:expirationDate:", v8, a1[6]);
      objc_msgSend(MEMORY[0x24BDDCC50], "sharedStoreItemMetadataRequestController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addStoreItemMetadata:", v10);

    }
    if (objc_msgSend(v9, "count"))
    {
      v12 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      if (!v12)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v14 = *(_QWORD *)(a1[8] + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

        v12 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
      }
      objc_msgSend(v12, "addObjectsFromArray:", v9);
    }

  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[MPCModelStorePlaybackItemsRequest] Siri asset info has results dictionary with invalid key or value format.", buf, 2u);
    }
  }

}

void ___MPCProcessSiriAssetInfoWithStorePlatformPayload_block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDDCC10];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "sharedCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCachedResponse:forRequest:", v5, v6);

}

@end
