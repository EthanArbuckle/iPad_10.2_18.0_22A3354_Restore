@implementation WFPodcastUtilities

+ (id)generatePlaybackQueueURL:(id)a3 withQueryDictionary:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDD1808];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", CFSTR("podcasts://"));
  objc_msgSend(v8, "setHost:", v7);

  objc_msgSend(v5, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__WFPodcastUtilities_generatePlaybackQueueURL_withQueryDictionary___block_invoke;
  v15[3] = &unk_24F8B7850;
  v16 = v5;
  v10 = v5;
  objc_msgSend(v9, "if_map:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v11);

  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueWithURLs:(id)a3 setImmediatePlayback:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  _MRSystemAppPlaybackQueue *v6;

  v4 = a4;
  v5 = a3;
  v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (v4)
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  return v6;
}

+ (void)createPlayerPathForOrigin:(void *)a3
{
  return (void *)objc_msgSend(a1, "createPlayerPathForOrigin:playerID:", a3, CFSTR("Podcasts"));
}

+ (void)createPlayerPathForOrigin:(void *)a3 playerID:(id)a4
{
  id v4;
  const void *v5;
  const void *v6;
  void *v7;

  v4 = a4;
  v5 = (const void *)MRNowPlayingClientCreate();
  v6 = (const void *)MRNowPlayingPlayerCreate();

  v7 = (void *)MRNowPlayingPlayerPathCreate();
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
  return v7;
}

+ (void)createLocalPlayerPath
{
  return (void *)objc_msgSend(a1, "createPlayerPathForOrigin:", MRMediaRemoteGetLocalOrigin());
}

+ (void)createLocalPlayerPathWithPlayerID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "createPlayerPathForOrigin:playerID:", MRMediaRemoteGetLocalOrigin(), v4);

  return v5;
}

+ (void)createPreferredPlayerPathWithCompletion:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, uint64_t))a3 + 2))(v5, objc_msgSend(a1, "createLocalPlayerPath"));

}

+ (void)getPodcastsFromLibraryFetchingDetailsFromServer:(BOOL)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BEC1318], "standardClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke;
  v8[3] = &unk_24F8B78B8;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "getSiriPodcastsDatabaseURLWithCompletion:", v8);

}

void __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x24BEC3A08], "modelsOfClass:fromJSONArray:error:", objc_opt_class(), v5, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "children");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "if_compactMap:", &__block_literal_global_37340);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 40))
    {
      v14 = (void *)objc_opt_new();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_3;
      v17[3] = &unk_24F8BABC0;
      v19 = *(id *)(a1 + 32);
      v18 = v12;
      objc_msgSend(v14, "lookupMediaWithIdentifiers:countryCode:completion:", v13, 0, v17);

      v15 = v19;
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 32);
      WFiTunesPodcastObjectsFromDatabaseShows(v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v15, v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = v6;
  }

}

void __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  WFiTunesPodcastObjectsFromDatabaseShows(v5, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __85__WFPodcastUtilities_getPodcastsFromLibraryFetchingDetailsFromServer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeId");
}

id __67__WFPodcastUtilities_generatePlaybackQueueURL_withQueryDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD1838];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryItemWithName:value:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
