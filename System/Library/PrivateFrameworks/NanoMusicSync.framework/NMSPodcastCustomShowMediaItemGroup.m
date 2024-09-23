@implementation NMSPodcastCustomShowMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaItemGroup type](self, "type") == a3)
  {
    v6 = objc_alloc(MEMORY[0x24BDDC758]);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__NMSPodcastCustomShowMediaItemGroup_identifiersForContainerType___block_invoke;
    v10[3] = &unk_24D6471F0;
    v10[4] = self;
    v7 = (void *)objc_msgSend(v6, "initWithBlock:", v10);
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

void __66__NMSPodcastCustomShowMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "referenceObj");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentItemID:", v4);

}

- (id)itemList
{
  void *v3;
  NMSPodcastSizeEstimation *v4;
  void *v5;
  void *v6;
  id v7;
  NMSPodcastSizeEstimation *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NMSPodcastCustomShowMediaItemGroup *v16;
  id v17;
  NMSPodcastSizeEstimation *v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke;
  v15 = &unk_24D647FF0;
  v16 = self;
  v17 = v6;
  v18 = v4;
  v19 = v3;
  v7 = v3;
  v8 = v4;
  v9 = v6;
  objc_msgSend(v9, "performBlockAndWait:", &v12);
  v10 = (void *)objc_msgSend(v7, "copy", v12, v13, v14, v15, v16);

  return v10;
}

void __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  NMSDownloadableItem *v20;
  void *v21;
  NMSDownloadableItem *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "referenceObj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMSPodcastsFetchRequests legacy_fetchRequestForEpisodesWithFeedURL:downloadedOnly:ctx:](NMSPodcastsFetchRequests, "legacy_fetchRequestForEpisodesWithFeedURL:downloadedOnly:ctx:", v3, objc_msgSend(*(id *)v2, "downloadedItemsOnly"), *(_QWORD *)(v2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchBatchSize:", 20);
  v5 = *(void **)(v2 + 8);
  v29 = 0;
  v24 = v4;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  if (v7)
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke_cold_1((id *)v2);

  }
  v23 = v7;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        v15 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "referenceObj", v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "duration");
        v18 = objc_msgSend(v15, "sizeForFeedURL:duration:feedProvidedSize:", v16, objc_msgSend(v14, "byteSize"), v17);

        v19 = *(void **)(a1 + 56);
        v20 = [NMSDownloadableItem alloc];
        objc_msgSend(v14, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v20, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", 0, v21, v18, 1, 0);
        objc_msgSend(v19, "addObject:", v22);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

}

void __46__NMSPodcastCustomShowMediaItemGroup_itemList__block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "referenceObj");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_216E27000, v2, v3, "Failed to fetch show episodes itemList for show %@ - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
