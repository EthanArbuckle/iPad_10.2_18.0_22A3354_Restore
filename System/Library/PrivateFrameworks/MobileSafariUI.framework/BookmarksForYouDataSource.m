@implementation BookmarksForYouDataSource

- (BookmarksForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 bookmarkCollection:(id)a5
{
  id v9;
  id v10;
  id v11;
  BookmarksForYouDataSource *v12;
  BookmarksForYouDataSource *v13;
  void *v14;
  BookmarksForYouDataSource *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BookmarksForYouDataSource;
  v12 = -[BookmarksForYouDataSource init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkProvider, a3);
    objc_storeStrong((id *)&v13->_bookmarkProviderAccessQueue, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__bookmarksDidChangeWithNotification_, *MEMORY[0x1E0DCCC10], v11);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__bookmarksDidChangeWithNotification_, *MEMORY[0x1E0DCCC00], v11);
    v15 = v13;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BookmarksForYouDataSource;
  -[BookmarksForYouDataSource dealloc](&v4, sel_dealloc);
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *bookmarkProviderAccessQueue;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BookmarksForYouDataSource;
  -[WBSForYouRecommendationMediatorDataSource emitStartRetrievingRecommendationsPerformanceMarker](&v14, sel_emitStartRetrievingRecommendationsPerformanceMarker);
  if (v7)
  {
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      bookmarkProviderAccessQueue = self->_bookmarkProviderAccessQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
      v10[3] = &unk_1E9CF2298;
      v10[4] = self;
      v11 = v8;
      v12 = v6;
      v13 = v7;
      dispatch_async(bookmarkProviderAccessQueue, v10);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarksMatchingString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E9CF9C60;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_1E9CF2248;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(a2, "parentID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isReadingListFolder") & 1) != 0
    || (objc_msgSend(v2, "isFrequentlyVisitedSitesFolder") & 1) != 0
    || (objc_msgSend(v2, "isWebFilterAllowedSitesFolder") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isBookmarksBarFolder") ^ 1;
  }

  return v3;
}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *group;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = a1;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    v22 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v7, "title", v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_userVisibleTitleIgnoringFullURLString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v7, "address");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = objc_alloc(MEMORY[0x1E0D8A918]);
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)objc_msgSend(v12, "initWithTitle:url:lastSeenDate:source:topicSource:", v9, v11, v13, 0, objc_msgSend(*(id *)(v23 + 40), "source"));

              _WBSLocalizedString();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setFootnote:", v15);

              v16 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(*(id *)(v23 + 40), "title");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setWithObject:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addOriginalQueries:", v18);

              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_4;
              block[3] = &unk_1E9CF1830;
              v30 = v14;
              v31 = v7;
              v19 = v14;
              dispatch_group_async(group, MEMORY[0x1E0C80D38], block);
              objc_msgSend(v24, "addObject:", v19);

              v2 = v22;
            }

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v4);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_5;
  v26[3] = &unk_1E9CF2D98;
  v20 = *(id *)(v23 + 48);
  v27 = v24;
  v28 = v20;
  v21 = v24;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], v26);

}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2;

  +[WebBookmarkCollection leadImageURLForBookmark:](MEMORY[0x1E0DCCBA0], *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImageURL:", v2);

}

uint64_t __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_bookmarksDidChangeWithNotification:(id)a3
{
  -[WBSForYouRecommendationMediatorDataSource notifyContentsDidChangeFromSource:](self, "notifyContentsDidChangeFromSource:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkProviderAccessQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end
