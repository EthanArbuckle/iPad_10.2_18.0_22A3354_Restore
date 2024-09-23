@implementation NMSPodcastsFetchRequests

+ (id)fetchRequestForUpNextDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForListenNow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AND:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x24BE737F8], "sortDescriptorsForListenNow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v11);

  v12 = objc_msgSend(v6, "numberOfEpisodes");
  objc_msgSend(v7, "setFetchLimit:", v12);
  return v7;
}

+ (id)fetchRequestForStationUUID:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v19[2];

  v5 = a5;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE73978];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN %K.%K"), v9, *MEMORY[0x24BE73978], *MEMORY[0x24BE73A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v5, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "AND:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v16);

  v17 = objc_msgSend(v8, "numberOfEpisodes");
  objc_msgSend(v10, "setFetchLimit:", v17);
  objc_msgSend(v10, "setIncludesPendingChanges:", 0);
  return v10;
}

+ (id)fetchRequestForSavedEpisodesDownloadSettings:(id)a3 downloadedOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForBookmarkedEpisodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AND:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x24BE737F8], "sortDescriptorsForLastBookmarkedDateAscending:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v11);

  v12 = objc_msgSend(v6, "numberOfEpisodes");
  objc_msgSend(v7, "setFetchLimit:", v12);
  return v7;
}

+ (id)fetchRequestForFeedURL:(id)a3 downloadSettings:(id)a4 downloadedOnly:(BOOL)a5 ctx:(id)a6
{
  void *v6;
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  _QWORD v47[4];
  _QWORD v48[4];

  v8 = a5;
  v48[2] = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v34 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *MEMORY[0x24BE739F8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x24BE73AE0], v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  v14 = *MEMORY[0x24BE73AE8];
  v48[0] = *MEMORY[0x24BE73B80];
  v48[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPropertiesToFetch:", v15);

  objc_msgSend(v12, "setFetchLimit:", 1);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  v45 = 0;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __87__NMSPodcastsFetchRequests_fetchRequestForFeedURL_downloadSettings_downloadedOnly_ctx___block_invoke;
  v36[3] = &unk_24D647810;
  v39 = &v40;
  v16 = v11;
  v37 = v16;
  v17 = v12;
  v38 = v17;
  objc_msgSend(v16, "performBlockAndWait:", v36);
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v41[5], "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x24BE737F8];
    objc_msgSend((id)v41[5], "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateForAllEpisodesOnPodcastUuid:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v8, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "AND:", v8);
    a1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForPodcastIsSubscribed:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "AND:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "falsePredicate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;
  }
  objc_msgSend(v18, "setPredicate:", v22);
  if (v19)
  {

  }
  v23 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73950], 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayWithObject:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend((id)v41[5], "sortAscending");
  v27 = *MEMORY[0x24BE73990];
  if (v26)
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v27, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v28;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v29;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v30;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v28;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v29;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v30;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v32);

  objc_msgSend(v18, "setSortDescriptors:", v25);
  objc_msgSend(v18, "setFetchLimit:", objc_msgSend(v34, "numberOfEpisodes"));

  _Block_object_dispose(&v40, 8);
  return v18;
}

void __87__NMSPodcastsFetchRequests_fetchRequestForFeedURL_downloadSettings_downloadedOnly_ctx___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)_predicateForDownloadableWatchEpisodesWithDownloadedOnly:(BOOL)a3 unplayedOnly:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForAudio:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForEntitledEpisodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForDownloaded:excludeHidden:", 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AND:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForPlayed:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AND:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  return v8;
}

+ (id)_createFetchRequestForEpisodeDownloadableItem
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *MEMORY[0x24BE739E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "propertiesToFetchDownloadInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v3);

  objc_msgSend(MEMORY[0x24BE737F8], "relationshipKeyPathsForPrefetchingDownloadInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  objc_msgSend(v2, "setFetchBatchSize:", 20);
  return v2;
}

+ (id)legacy_fetchRequestForUpNextEpisodesDownloadedOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForListenNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x24BE737F8], "sortDescriptorsForListenNow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v9);

  objc_msgSend(v5, "setFetchLimit:", 10);
  return v5;
}

+ (id)legacy_fetchRequestForSavedEpisodesDownloadedOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForBookmarkedEpisodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  objc_msgSend(MEMORY[0x24BE737F8], "sortDescriptorsForPubDateAscending:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v9);

  return v5;
}

+ (id)legacy_fetchRequestForStationWithUUID:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = *MEMORY[0x24BE739F0];
  v5 = a3;
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x24BE73A88], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v7);
  objc_msgSend(v6, "setFetchLimit:", 1);
  return v6;
}

+ (id)legacy_fetchRequestForEpisodesWithFeedURL:(id)a3 downloadedOnly:(BOOL)a4 ctx:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDBB678];
  v10 = *MEMORY[0x24BE739F8];
  v11 = a3;
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x24BE73AE0], v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPredicate:", v13);
  v14 = *MEMORY[0x24BE73AE8];
  v29[0] = *MEMORY[0x24BE73B80];
  v29[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPropertiesToFetch:", v15);

  objc_msgSend(v12, "setFetchLimit:", 1);
  objc_msgSend(a1, "_createFetchRequestForEpisodeDownloadableItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __89__NMSPodcastsFetchRequests_legacy_fetchRequestForEpisodesWithFeedURL_downloadedOnly_ctx___block_invoke;
  v23[3] = &unk_24D647A50;
  v24 = v8;
  v25 = v12;
  v17 = v16;
  v26 = v17;
  v27 = a1;
  v28 = a4;
  v18 = v12;
  v19 = v8;
  objc_msgSend(v19, "performBlockAndWait:", v23);
  v20 = v26;
  v21 = v17;

  return v21;
}

void __89__NMSPodcastsFetchRequests_legacy_fetchRequestForEpisodesWithFeedURL_downloadedOnly_ctx___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v25 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForUserSetTopLevelEpisodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE737F8];
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForAllEpisodesOnPodcastUuid:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "AND:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "_predicateForDownloadableWatchEpisodesWithDownloadedOnly:unplayedOnly:", *(unsigned __int8 *)(a1 + 64), 1);
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "AND:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE737F8], "predicateForPodcastIsSubscribed:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "AND:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setPredicate:", v16);

    v6 = v12;
    v17 = objc_msgSend(v12, "sortAscending");
    v18 = *MEMORY[0x24BE73990];
    if ((v17 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v19;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v20;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v21;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v22;
      v23 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v19;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v20;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v21;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v22;
      v23 = v26;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setSortDescriptors:", v24);

    v5 = 0;
  }

}

@end
