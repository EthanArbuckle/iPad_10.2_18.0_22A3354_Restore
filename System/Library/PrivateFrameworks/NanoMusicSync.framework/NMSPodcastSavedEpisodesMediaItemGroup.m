@implementation NMSPodcastSavedEpisodesMediaItemGroup

- (id)identifiersForContainerType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaItemGroup type](self, "type") == a3)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC758]), "initWithBlock:", &__block_literal_global_10);
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

uint64_t __69__NMSPodcastSavedEpisodesMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentItemID:", CFSTR("SavedEpisodes"));
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
  NMSPodcastSavedEpisodesMediaItemGroup *v16;
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
  v14 = __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke;
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

void __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  NMSDownloadableItem *v24;
  void *v25;
  NMSDownloadableItem *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  +[NMSPodcastsFetchRequests legacy_fetchRequestForSavedEpisodesDownloadedOnly:](NMSPodcastsFetchRequests, "legacy_fetchRequestForSavedEpisodesDownloadedOnly:", objc_msgSend(*(id *)(a1 + 32), "downloadedItemsOnly"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchBatchSize:", 20);
  v3 = *(void **)(a1 + 40);
  v33 = 0;
  v28 = v2;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v33;
  if (v5)
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v27 = v5;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v17);
        v19 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "referenceObj", v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "duration");
        v22 = objc_msgSend(v19, "sizeForFeedURL:duration:feedProvidedSize:", v20, objc_msgSend(v18, "byteSize"), v21);

        v23 = *(void **)(a1 + 56);
        v24 = [NMSDownloadableItem alloc];
        objc_msgSend(v18, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v24, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", 0, v25, v22, 1, 0);
        objc_msgSend(v23, "addObject:", v26);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

}

void __49__NMSPodcastSavedEpisodesMediaItemGroup_itemList__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "Failed to fetch saved episodes itemList - %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
