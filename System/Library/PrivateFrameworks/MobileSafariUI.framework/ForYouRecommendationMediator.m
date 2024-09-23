@implementation ForYouRecommendationMediator

- (ForYouRecommendationMediator)initWithContextClient:(id)a3 featureManager:(id)a4 historyProvider:(id)a5
{
  id v9;
  ForYouRecommendationMediator *v10;
  ForYouRecommendationMediator *v11;
  void *v12;
  uint64_t v13;
  CNMonogrammer *monogrammer;
  ForYouRecommendationMediator *v15;
  objc_super v17;

  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ForYouRecommendationMediator;
  v10 = -[WBSForYouRecommendationMediator initWithContextClient:historyProvider:](&v17, sel_initWithContextClient_historyProvider_, a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_featureManager, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__cloudTabFeatureAvailabilityDidChange_, *MEMORY[0x1E0DD9938], v11->_featureManager);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, 26.0);
    monogrammer = v11->_monogrammer;
    v11->_monogrammer = (CNMonogrammer *)v13;

    v11->_rendererLock._os_unfair_lock_opaque = 0;
    v15 = v11;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ForYouRecommendationMediator;
  -[WBSForYouRecommendationMediator dealloc](&v4, sel_dealloc);
}

- (void)loadLinkPresentationMetadataForMessageWithGUID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  SafariSandboxBrokerConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SafariSandboxBrokerConnection);
  -[WBSUISafariSandboxBrokerConnection loadLinkPresentationMetdataForMessageWithGUID:completionHandler:](v7, "loadLinkPresentationMetdataForMessageWithGUID:completionHandler:", v6, v5);

}

- (id)dataSources
{
  WebBookmarkCollection *v3;
  WebBookmarkCollection *bookmarkCollection;
  WBBookmarkProvider *v5;
  WBBookmarkProvider *bookmarkProvider;
  id v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *bookmarkProviderAccessQueue;
  void *v10;
  BookmarksForYouDataSource *v11;
  BookmarksForYouDataSource *bookmarksDataSource;
  ReadingListForYouDataSource *v13;
  WBBookmarkProvider *v14;
  OS_dispatch_queue *v15;
  void *v16;
  void *v17;
  ReadingListForYouDataSource *v18;
  ReadingListForYouDataSource *readingListDataSource;
  void *v20;
  void *v21;
  void *v22;

  if (!self->_bookmarkCollection)
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v3 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
    bookmarkCollection = self->_bookmarkCollection;
    self->_bookmarkCollection = v3;

    v5 = (WBBookmarkProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA8]), "initReadonlySafariBookmarkCollection");
    bookmarkProvider = self->_bookmarkProvider;
    self->_bookmarkProvider = v5;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mobilesafari.%@.bookmarkProviderAccess.%p"), objc_opt_class(), self);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    bookmarkProviderAccessQueue = self->_bookmarkProviderAccessQueue;
    self->_bookmarkProviderAccessQueue = v8;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_bookmarksDataSource)
  {
    v11 = -[BookmarksForYouDataSource initWithBookmarkProvider:accessQueue:bookmarkCollection:]([BookmarksForYouDataSource alloc], "initWithBookmarkProvider:accessQueue:bookmarkCollection:", self->_bookmarkProvider, self->_bookmarkProviderAccessQueue, self->_bookmarkCollection);
    bookmarksDataSource = self->_bookmarksDataSource;
    self->_bookmarksDataSource = v11;

  }
  if (!self->_readingListDataSource)
  {
    v13 = [ReadingListForYouDataSource alloc];
    v14 = self->_bookmarkProvider;
    v15 = self->_bookmarkProviderAccessQueue;
    +[Application sharedApplication](Application, "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "readingListLeadImageCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[ReadingListForYouDataSource initWithBookmarkProvider:accessQueue:imageCache:](v13, "initWithBookmarkProvider:accessQueue:imageCache:", v14, v15, v17);
    readingListDataSource = self->_readingListDataSource;
    self->_readingListDataSource = v18;

  }
  objc_msgSend(v10, "addObject:", self->_bookmarksDataSource);
  objc_msgSend(v10, "addObject:", self->_readingListDataSource);
  +[Application sharedApplication](Application, "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "forYouRecentParsecResultsManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v21);

  -[ForYouRecommendationMediator _cloudTabsDataSourceIfAvailable](self, "_cloudTabsDataSourceIfAvailable");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v10, "addObject:", v22);

  return v10;
}

- (id)_cloudTabsDataSourceIfAvailable
{
  BOOL v3;
  CloudTabsForYouDataSource *cloudTabsDataSource;
  CloudTabsForYouDataSource *v5;
  void *v6;
  CloudTabsForYouDataSource *v7;
  CloudTabsForYouDataSource *v8;
  CloudTabsForYouDataSource *v9;

  v3 = -[WBUFeatureManager isCloudTabsAvailable](self->_featureManager, "isCloudTabsAvailable");
  cloudTabsDataSource = self->_cloudTabsDataSource;
  if (v3)
  {
    if (!cloudTabsDataSource)
    {
      v5 = [CloudTabsForYouDataSource alloc];
      +[CloudTabStore sharedCloudTabStore](CloudTabStore, "sharedCloudTabStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CloudTabsForYouDataSource initWithTabStore:](v5, "initWithTabStore:", v6);
      v8 = self->_cloudTabsDataSource;
      self->_cloudTabsDataSource = v7;

      cloudTabsDataSource = self->_cloudTabsDataSource;
    }
    v9 = cloudTabsDataSource;
  }
  else
  {
    self->_cloudTabsDataSource = 0;

    v9 = 0;
  }
  return v9;
}

- (void)fetchImageForRecommendation:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  CNAvatarImageRenderer *v11;
  CNAvatarImageRenderer *avatarImageRenderer;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  CNAvatarImageRenderer *v22;
  void *v23;
  uint64_t v24;
  id v25;
  dispatch_time_t v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[4];
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    os_unfair_lock_lock(&self->_rendererLock);
    if (!self->_avatarImageRenderer)
    {
      v9 = objc_alloc(MEMORY[0x1E0C97450]);
      objc_msgSend(MEMORY[0x1E0C97458], "defaultSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (CNAvatarImageRenderer *)objc_msgSend(v9, "initWithSettings:", v10);
      avatarImageRenderer = self->_avatarImageRenderer;
      self->_avatarImageRenderer = v11;

    }
    os_unfair_lock_unlock(&self->_rendererLock);
    -[CNMonogrammer monogramForContact:](self->_monogrammer, "monogramForContact:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContactImage:", v13);

    v14 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "characterDirectionForLanguage:", v16) == 2;

    v18 = (void *)MEMORY[0x1E0C97460];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    objc_msgSend(v18, "scopeWithPointSize:scale:rightToLeft:style:", v17, 0, 16.0, 16.0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = self->_avatarImageRenderer;
    v32[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke;
    v30[3] = &unk_1E9CFA4D0;
    v31 = v6;
    v25 = (id)-[CNAvatarImageRenderer renderAvatarsForContacts:scope:imageHandler:](v22, "renderAvatarsForContacts:scope:imageHandler:", v23, v21, v30);

    v26 = dispatch_time(0, 200000000);
    v28[0] = v24;
    v28[1] = 3221225472;
    v28[2] = __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke_3;
    v28[3] = &unk_1E9CF1950;
    v29 = v7;
    dispatch_after(v26, MEMORY[0x1E0C80D38], v28);

  }
  else
  {
    if (objc_msgSend(v6, "source") == 5)
    {
      -[CNMonogrammer silhouetteMonogram](self->_monogrammer, "silhouetteMonogram");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContactImage:", v27);

    }
    v7[2](v7);
  }

}

void __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke_2;
    v4[3] = &unk_1E9CF1830;
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContactImage:", *(_QWORD *)(a1 + 40));
}

uint64_t __78__ForYouRecommendationMediator_fetchImageForRecommendation_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cloudTabFeatureAvailabilityDidChange:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8B090], self);

}

- (void)updatedRecommendationsForTopics:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[ForYouRecommendationMediator _loadDemoSuggestions](self, "_loadDemoSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v7[2](v7, v8);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ForYouRecommendationMediator;
    -[WBSForYouRecommendationMediator updatedRecommendationsForTopics:withCompletionHandler:](&v9, sel_updatedRecommendationsForTopics_withCompletionHandler_, v6, v7);
  }

}

- (id)_loadDemoSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", *MEMORY[0x1E0D4F460]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__ForYouRecommendationMediator__loadDemoSuggestions__block_invoke;
    v7[3] = &unk_1E9CFA4F8;
    v7[4] = self;
    objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __52__ForYouRecommendationMediator__loadDemoSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "recommendationFromDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
  objc_storeStrong((id *)&self->_featureManager, 0);
  objc_storeStrong((id *)&self->_bookmarkProviderAccessQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_readingListDataSource, 0);
  objc_storeStrong((id *)&self->_cloudTabsDataSource, 0);
  objc_storeStrong((id *)&self->_bookmarksDataSource, 0);
}

@end
