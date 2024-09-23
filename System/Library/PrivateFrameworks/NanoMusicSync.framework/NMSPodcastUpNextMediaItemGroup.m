@implementation NMSPodcastUpNextMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaItemGroup type](self, "type") == a3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NMSPodcastUpNextMediaItemGroup _upNextFeedURLs](self, "_upNextFeedURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x24BDAC760];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = objc_alloc(MEMORY[0x24BDDC758]);
          v17[0] = v10;
          v17[1] = 3221225472;
          v17[2] = __62__NMSPodcastUpNextMediaItemGroup_identifiersForContainerType___block_invoke;
          v17[3] = &unk_24D6471F0;
          v17[4] = v12;
          v14 = (void *)objc_msgSend(v13, "initWithBlock:", v17);
          objc_msgSend(v5, "addObject:", v14);

          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

uint64_t __62__NMSPodcastUpNextMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentItemID:", *(_QWORD *)(a1 + 32));
}

- (id)itemList
{
  void *v3;
  NMSPodcastSizeEstimation *v4;
  void *v5;
  void *v6;
  id v7;
  NMSPodcastSizeEstimation *v8;
  void *v9;
  _QWORD v11[5];
  NMSPodcastSizeEstimation *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__NMSPodcastUpNextMediaItemGroup_itemList__block_invoke;
  v11[3] = &unk_24D647888;
  v11[4] = self;
  v12 = v4;
  v13 = v3;
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

void __42__NMSPodcastUpNextMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  NMSDownloadableItem *v14;
  void *v15;
  NMSDownloadableItem *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_upNextEpisodes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "podcast");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "feedURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "duration");
        v12 = objc_msgSend(v8, "sizeForFeedURL:duration:feedProvidedSize:", v10, objc_msgSend(v7, "byteSize"), v11);

        v13 = *(void **)(a1 + 48);
        v14 = [NMSDownloadableItem alloc];
        objc_msgSend(v7, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v14, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", 0, v15, v12, 1, 0);
        objc_msgSend(v13, "addObject:", v16);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

- (id)_upNextEpisodes
{
  NSArray *upNextEpisodes;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  upNextEpisodes = self->_upNextEpisodes;
  if (!upNextEpisodes)
  {
    +[NMSPodcastsFetchRequests legacy_fetchRequestForUpNextEpisodesDownloadedOnly:](NMSPodcastsFetchRequests, "legacy_fetchRequestForUpNextEpisodesDownloadedOnly:", -[NMSMediaItemGroup downloadedItemsOnly](self, "downloadedItemsOnly"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFetchBatchSize:", 20);
    v21 = 0;
    v22[0] = &v21;
    v22[1] = 0x3032000000;
    v22[2] = __Block_byref_object_copy__7;
    v22[3] = __Block_byref_object_dispose__7;
    v23 = 0;
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mainOrPrivateContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__NMSPodcastUpNextMediaItemGroup__upNextEpisodes__block_invoke;
    v17[3] = &unk_24D647F88;
    v17[4] = self;
    v7 = v6;
    v18 = v7;
    v8 = v4;
    v19 = v8;
    v20 = &v21;
    objc_msgSend(v7, "performBlockAndWait:", v17);
    if (*(_QWORD *)(v22[0] + 40))
    {
      NMLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NMSPodcastUpNextMediaItemGroup _upNextEpisodes].cold.1((uint64_t)v22, v9, v10, v11, v12, v13, v14, v15);

    }
    _Block_object_dispose(&v21, 8);

    upNextEpisodes = self->_upNextEpisodes;
  }
  return upNextEpisodes;
}

void __49__NMSPodcastUpNextMediaItemGroup__upNextEpisodes__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[5];
  v3 = a1[6];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = a1[4];
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_upNextFeedURLs
{
  NSArray *upNextFeedURLs;
  void *v4;
  void *v5;
  _QWORD v7[5];

  upNextFeedURLs = self->_upNextFeedURLs;
  if (!upNextFeedURLs)
  {
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainOrPrivateContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__NMSPodcastUpNextMediaItemGroup__upNextFeedURLs__block_invoke;
    v7[3] = &unk_24D646F30;
    v7[4] = self;
    objc_msgSend(v5, "performBlockAndWait:", v7);

    upNextFeedURLs = self->_upNextFeedURLs;
  }
  return upNextFeedURLs;
}

void __49__NMSPodcastUpNextMediaItemGroup__upNextFeedURLs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_upNextEpisodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), *MEMORY[0x24BE73980], *MEMORY[0x24BE73AE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextFeedURLs, 0);
  objc_storeStrong((id *)&self->_upNextEpisodes, 0);
}

- (void)_upNextEpisodes
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "Failed to fetch _upNextEpisodes - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
