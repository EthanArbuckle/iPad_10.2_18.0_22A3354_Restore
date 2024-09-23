@implementation NMSMediaItemGroup

+ (id)sharedLibraryRequestQueue
{
  if (sharedLibraryRequestQueue_onceToken != -1)
    dispatch_once(&sharedLibraryRequestQueue_onceToken, &__block_literal_global_103);
  return (id)sharedLibraryRequestQueue_sharedQueue;
}

uint64_t __46__NMSMediaItemGroup_sharedLibraryRequestQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)sharedLibraryRequestQueue_sharedQueue;
  sharedLibraryRequestQueue_sharedQueue = (uint64_t)v0;

  objc_msgSend((id)sharedLibraryRequestQueue_sharedQueue, "setMaxConcurrentOperationCount:", 4);
  objc_msgSend((id)sharedLibraryRequestQueue_sharedQueue, "setName:", CFSTR("com.apple.NanoMusicSync.NMSMediaItemGroup.LibraryRequestQueue"));
  return objc_msgSend((id)sharedLibraryRequestQueue_sharedQueue, "setQualityOfService:", -1);
}

+ (NMSMediaItemGroup)itemGroupWithRecommendation:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NMSRecommendationMediaItemGroup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSRecommendationMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 6, v5, 0, v5, v4);

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithUpNextEpisodesDownloadedItemsOnly:(BOOL)a3
{
  return (NMSMediaItemGroup *)-[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSPodcastUpNextMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 2, CFSTR("NMSRefObj_UpNext"), 0, CFSTR("NMSRefObj_UpNext"), a3);
}

+ (NMSMediaItemGroup)itemGroupWithSavedEpisodesDownloadedItemsOnly:(BOOL)a3
{
  return (NMSMediaItemGroup *)-[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSPodcastSavedEpisodesMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 4, CFSTR("NMSRefObj_SavedEpisodes"), 0, CFSTR("NMSRefObj_SavedEpisodes"), a3);
}

+ (NMSMediaItemGroup)itemGroupWithCustomPodcastFeedURL:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NMSPodcastCustomShowMediaItemGroup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSPodcastCustomShowMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 2, v5, 0, v5, v4);

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithPodcastStationUUID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NMSPodcastStationMediaItemGroup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSPodcastStationMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 3, v5, 0, v5, v4);

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithPodcastFeedURL:(id)a3 downloadOrder:(unint64_t)a4 episodeLimit:(unint64_t)a5 manuallyAdded:(BOOL)a6 downloadedItemsOnly:(BOOL)a7
{
  return (NMSMediaItemGroup *)objc_msgSend(a1, "itemGroupWithCustomPodcastFeedURL:downloadedItemsOnly:", a3, 0, a5, a6, a7);
}

+ (NMSMediaItemGroup)itemGroupWithAudiobookIdentifier:(id)a3 downloadLimit:(unint64_t)a4 manuallyAdded:(BOOL)a5 downloadedItemsOnly:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  NMSAudiobookReferenceObject *v10;
  NMSAudiobooksMediaItemGroup *v11;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = -[NMSAudiobookReferenceObject initWithAudiobookIdentifier:downloadLimit:]([NMSAudiobookReferenceObject alloc], "initWithAudiobookIdentifier:downloadLimit:", v9, a4);
  v11 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSAudiobooksMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 7, v10, v7, v9, v6);

  return (NMSMediaItemGroup *)v11;
}

- (NMSMediaItemGroup)initWithType:(unint64_t)a3 refObj:(id)a4 manuallyAdded:(BOOL)a5 quotaRefObj:(id)a6 downloadedItemsOnly:(BOOL)a7
{
  id v13;
  id v14;
  NMSMediaItemGroup *v15;
  NMSMediaItemGroup *v16;
  NSObject *v17;
  NMSMediaContainerQuotaData *v18;
  NMSMediaContainerQuotaData *quotaData;
  objc_super v21;

  v13 = a4;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NMSMediaItemGroup;
  v15 = -[NMSMediaItemGroup init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    objc_storeStrong(&v15->_referenceObj, a4);
    v16->_manuallyAdded = a5;
    if (!v14)
    {
      NMLogForCategory(5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:].cold.1();

    }
    v18 = objc_alloc_init(NMSMediaContainerQuotaData);
    quotaData = v16->_quotaData;
    v16->_quotaData = v18;

    -[NMSMediaContainerQuotaData setQuotaRefObj:](v16->_quotaData, "setQuotaRefObj:", v14);
    v16->_downloadedItemsOnly = a7;
  }

  return v16;
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[NMSMediaItemGroup type](self, "type");
  if (v5 == objc_msgSend(v4, "type"))
  {
    -[NMSMediaItemGroup referenceObj](self, "referenceObj");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceObj");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NMSMediaItemGroup *v4;
  NMSMediaItemGroup *v5;
  BOOL v6;

  v4 = (NMSMediaItemGroup *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NMSMediaItemGroup isEqualToContainer:](self, "isEqualToContainer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NMSMediaItemGroup referenceObj](self, "referenceObj");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)NMSMediaItemGroup;
  -[NMSMediaItemGroup description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSMediaItemGroup type](self, "type");
  -[NMSMediaItemGroup referenceObj](self, "referenceObj");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ type:%tu, refObj:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifiers
{
  return -[NMSMediaItemGroup identifiersForContainerType:](self, "identifiersForContainerType:", -[NMSMediaItemGroup type](self, "type"));
}

- (id)identifiersForContainerType:(unint64_t)a3
{
  NSObject *v3;

  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[NMSMediaItemGroup identifiersForContainerType:].cold.1();

  return 0;
}

- (id)itemList
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[NMSMediaItemGroup type](self, "type");
  if (v3 - 2 >= 6)
  {
    if (v3 == 1)
    {
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      -[NMSMediaItemGroup identifiers](self, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NMSMediaItemGroup downloadedItemsOnly](self, "downloadedItemsOnly");
      v10 = -[NMSMediaItemGroup manuallyAdded](self, "manuallyAdded");
      v11 = (void *)v15;
      v12 = v16;
      v13 = v8;
      v14 = 0;
    }
    else
    {
      if (v3)
      {
        v5 = 0;
        return v5;
      }
      v6 = objc_opt_class();
      v7 = objc_opt_class();
      -[NMSMediaItemGroup identifiers](self, "identifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NMSMediaItemGroup downloadedItemsOnly](self, "downloadedItemsOnly");
      v10 = -[NMSMediaItemGroup manuallyAdded](self, "manuallyAdded");
      v11 = (void *)v6;
      v12 = v7;
      v13 = v8;
      v14 = 1;
    }
    objc_msgSend(v11, "_itemsForContainerClass:containerIDs:includingNonLibraryContent:includingDownloadedContentOnly:manuallyAdded:", v12, v13, v14, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NMSMediaItemGroup itemList].cold.1();

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isEstimate
{
  return 0;
}

+ (id)_itemsForContainerClass:(Class)a3 containerIDs:(id)a4 includingNonLibraryContent:(BOOL)a5 includingDownloadedContentOnly:(BOOL)a6 manuallyAdded:(BOOL)a7
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NMSDownloadableItem *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NMSDownloadableItem *v48;
  NSObject *v49;
  void *v50;
  uint64_t v52;
  _BOOL4 v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v66;
  void *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[2];
  _QWORD v74[3];
  _BYTE v75[128];
  uint64_t v76;

  v53 = a7;
  v76 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v9 = v8;
  v63 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v63)
  {
    v60 = *(_QWORD *)v70;
    v58 = *MEMORY[0x24BE6B128];
    v59 = *MEMORY[0x24BE6B130];
    v57 = *MEMORY[0x24BE6B0F8];
    v52 = *MEMORY[0x24BE6B148];
    v56 = *MEMORY[0x24BE6B120];
    v10 = 0x24BE6B000uLL;
    v55 = *MEMORY[0x24BE6B158];
    v62 = v9;
    v61 = a5;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v70 != v60)
          objc_enumerationMutation(v9);
        v68 = v11;
        v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v11);
        v66 = *(void **)(v10 + 384);
        v13 = (void *)MEMORY[0x24BE6B1A8];
        if ((Class)objc_opt_class() == a3)
          v14 = v59;
        else
          v14 = v58;
        v15 = (void *)MEMORY[0x24BDBCF20];
        v16 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v12, "library");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithLongLong:", objc_msgSend(v17, "persistentID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setWithObject:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithProperty:values:", v14, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v20;
        v21 = (void *)MEMORY[0x24BE6B1E0];
        objc_msgSend(MEMORY[0x24BE6B1B0], "predicateWithProperty:values:", v57, &unk_24D6558A8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predicateWithPredicate:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v74[1] = v23;
        objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ageVerificationState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v12;
        v67 = v17;
        if (objc_msgSend(v25, "status") == 2)
          objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", v52, MEMORY[0x24BDBD1C0], 1);
        else
          objc_msgSend(MEMORY[0x24BE6B200], "truePredicate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v74[2] = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "predicateMatchingPredicates:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x24BE6B1F8];
        objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
          objc_msgSend(v29, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v30, v28, 0, 0);
        else
          objc_msgSend(v29, "queryWithLibrary:predicate:", v30, v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v62;
        v10 = 0x24BE6B000uLL;

        objc_msgSend(v31, "valueForAggregateFunction:onEntitiesForProperty:", v56, v55);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "unsignedLongLongValue");

        v34 = (void *)MEMORY[0x24BE6B180];
        v73[0] = v28;
        objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", v55, &unk_24D655C20, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v73[1] = v35;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "predicateMatchingPredicates:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x24BE6B1F8];
        objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
          objc_msgSend(v38, "allItemsQueryWithLibrary:predicate:orderingTerms:usingSections:", v39, v37, 0, 0);
        else
          objc_msgSend(v38, "queryWithLibrary:predicate:", v39, v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = v33 + 7000000 * objc_msgSend(v40, "countOfEntities");
        if (v41)
        {
          v42 = [NMSDownloadableItem alloc];
          v43 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v64, "library");
          v44 = v28;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v45, "persistentID"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if ((Class)objc_opt_class() == a3)
            v47 = 3;
          else
            v47 = 4;
          v48 = -[NMSDownloadableItem initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:](v42, "initWithMediaLibraryIdentifier:externalLibraryIdentifier:size:itemType:manuallyAdded:", v46, 0, v41, v47, v53);
          objc_msgSend(v54, "addObject:", v48);

          v28 = v44;
          v9 = v62;
          v10 = 0x24BE6B000;
        }

        v11 = v68 + 1;
      }
      while (v63 != v68 + 1);
      v63 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v63);
  }

  NMLogForCategory(5);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    +[NMSMediaItemGroup _itemsForContainerClass:containerIDs:includingNonLibraryContent:includingDownloadedContentOnly:manuallyAdded:].cold.1(v54, (uint64_t)v9, v49);

  objc_msgSend(v54, "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

+ (NMSMediaItemGroup)itemGroupWithSyncedPlaylistID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NMSSyncedMediaItemGroup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSSyncedMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 0, v5, 1, v5, v4);

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithSyncedAlbumID:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NMSSyncedMediaItemGroup *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSSyncedMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 1, v5, 1, v5, v4);

  return (NMSMediaItemGroup *)v6;
}

+ (NMSMediaItemGroup)itemGroupWithQuotaRefObj:(id)a3
{
  id v3;
  NMSRecommendationMediaItemGroup *v4;

  v3 = a3;
  v4 = -[NMSMediaItemGroup initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:]([NMSRecommendationMediaItemGroup alloc], "initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:", 6, v3, 0, v3, 0);

  return (NMSMediaItemGroup *)v4;
}

- (id)referenceObj
{
  return self->_referenceObj;
}

- (void)setReferenceObj:(id)a3
{
  objc_storeStrong(&self->_referenceObj, a3);
}

- (NMSMediaContainerQuotaData)quotaData
{
  return self->_quotaData;
}

- (void)setQuotaData:(id)a3
{
  objc_storeStrong((id *)&self->_quotaData, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)manuallyAdded
{
  return self->_manuallyAdded;
}

- (void)setManuallyAdded:(BOOL)a3
{
  self->_manuallyAdded = a3;
}

- (BOOL)downloadedItemsOnly
{
  return self->_downloadedItemsOnly;
}

- (void)setDownloadedItemsOnly:(BOOL)a3
{
  self->_downloadedItemsOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaData, 0);
  objc_storeStrong(&self->_referenceObj, 0);
}

- (void)initWithType:refObj:manuallyAdded:quotaRefObj:downloadedItemsOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_216E27000, v0, v1, "%@ %s Unexpected nil quotaRefObj for refObj:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)identifiersForContainerType:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3[3];
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3[0] = 138413058;
  OUTLINED_FUNCTION_1_1();
  v4 = "-[NMSMediaItemGroup identifiersForContainerType:]";
  v5 = 2048;
  v6 = v0;
  v7 = 2114;
  v8 = v1;
  _os_log_error_impl(&dword_216E27000, v2, OS_LOG_TYPE_ERROR, "%@ %s No identifiers for type (%lu): %{public}@", (uint8_t *)v3, 0x2Au);
}

- (void)itemList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_216E27000, v0, v1, "%@ %s No itemList: %{public}@", v2, v3, v4, v5, 2u);
}

+ (void)_itemsForContainerClass:(NSObject *)a3 containerIDs:includingNonLibraryContent:includingDownloadedContentOnly:manuallyAdded:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  int v7[3];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "count");
  v7[0] = 138413314;
  OUTLINED_FUNCTION_1_1();
  v8 = "+[NMSMediaItemGroup _itemsForContainerClass:containerIDs:includingNonLibraryContent:includingDownloadedContentOnl"
       "y:manuallyAdded:]";
  v9 = 2048;
  v10 = v6;
  v11 = 2114;
  v12 = a2;
  v13 = 2114;
  v14 = a1;
  _os_log_debug_impl(&dword_216E27000, a3, OS_LOG_TYPE_DEBUG, "%@ %s NMSMediaItemGroup: Fetched %tu items %{public}@, items @ %{public}@", (uint8_t *)v7, 0x34u);
}

@end
