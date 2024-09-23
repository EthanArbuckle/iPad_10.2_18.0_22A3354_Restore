@implementation NMSPodcastStationMediaItemGroup

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
    v10[2] = __63__NMSPodcastStationMediaItemGroup_identifiersForContainerType___block_invoke;
    v10[3] = &unk_24D6471F0;
    v10[4] = self;
    v7 = (void *)objc_msgSend(v6, "initWithBlock:", v10);
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

void __63__NMSPodcastStationMediaItemGroup_identifiersForContainerType___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NMSPodcastSizeEstimation *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  NMSPodcastStationMediaItemGroup *v25;
  NMSPodcastSizeEstimation *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(NMSPodcastSizeEstimation);
  -[NMSMediaItemGroup referenceObj](self, "referenceObj");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NMSPodcastsFetchRequests legacy_fetchRequestForStationWithUUID:](NMSPodcastsFetchRequests, "legacy_fetchRequestForStationWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x24BE73980];
  v28[0] = *MEMORY[0x24BE73A58];
  v28[1] = v7;
  v29[0] = v28[0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(v6, "setFetchBatchSize:", 20);
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mainOrPrivateContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke;
  v22 = &unk_24D648018;
  v23 = v12;
  v24 = v6;
  v25 = self;
  v26 = v4;
  v27 = v3;
  v13 = v3;
  v14 = v4;
  v15 = v6;
  v16 = v12;
  objc_msgSend(v16, "performBlockAndWait:", &v19);
  v17 = (void *)objc_msgSend(v13, "copy", v19, v20, v21, v22);

  return v17;
}

void __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
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
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v28 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v28);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v28;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke_cold_1(a1);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v6, "episodes", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((!objc_msgSend(*(id *)(a1 + 48), "downloadedItemsOnly")
           || objc_msgSend(v13, "isDownloaded"))
          && (objc_msgSend(v13, "isHidden") & 1) == 0
          && objc_msgSend(v13, "isEntitled"))
        {
          v14 = *(void **)(a1 + 56);
          objc_msgSend(v13, "podcast");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "feedURL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "duration");
          v18 = objc_msgSend(v14, "sizeForFeedURL:duration:feedProvidedSize:", v16, objc_msgSend(v13, "byteSize"), v17);

          v19 = *(void **)(a1 + 64);
          v20 = [NMSDownloadableItem alloc];
          objc_msgSend(v13, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v20, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", 0, v21, v18, 1, 0);
          objc_msgSend(v19, "addObject:", v22);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

}

void __43__NMSPodcastStationMediaItemGroup_itemList__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 48), "referenceObj");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_216E27000, v2, v3, "Failed to fetch station itemList for station %@ - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
