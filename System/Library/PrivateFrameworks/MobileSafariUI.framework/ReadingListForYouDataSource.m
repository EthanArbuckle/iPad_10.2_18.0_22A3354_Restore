@implementation ReadingListForYouDataSource

- (ReadingListForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 imageCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  ReadingListForYouDataSource *v12;
  ReadingListForYouDataSource *v13;
  void *v14;
  ReadingListForYouDataSource *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ReadingListForYouDataSource;
  v12 = -[ReadingListForYouDataSource init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkProvider, a3);
    objc_storeStrong((id *)&v13->_bookmarkProviderAccessQueue, a4);
    objc_storeStrong((id *)&v13->_leadImageCache, a5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__readingListContentsDidChange_, CFSTR("ReadingListBookmarkDidUpdateNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__readingListContentsDidChange_, *MEMORY[0x1E0DCCC00], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__readingListContentsDidChange_, CFSTR("ReadingListBookmarkAddedNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__readingListContentsDidChange_, CFSTR("bookmarkCollectionHasBecomeAvailableNotification"), 0);
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
  v4.super_class = (Class)ReadingListForYouDataSource;
  -[ReadingListForYouDataSource dealloc](&v4, sel_dealloc);
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
  v14.super_class = (Class)ReadingListForYouDataSource;
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
      v10[2] = __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
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

void __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "readingListWithUnreadOnly:filteredUsingString:", 1, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E9CF2298;
  v8 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1)
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = a1;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v25 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "title");
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
              objc_msgSend(v7, "dateAdded");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)objc_msgSend(v12, "initWithTitle:url:lastSeenDate:source:topicSource:", v9, v11, v13, 1, objc_msgSend(*(id *)(v27 + 40), "source"));

              _WBSLocalizedString();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setFootnote:", v15);

              objc_msgSend(v7, "UUID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setSourceID:", v16);

              v17 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(*(id *)(v27 + 40), "title");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setWithObject:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addOriginalQueries:", v19);

              objc_msgSend(v7, "readingListIconURL");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "length"))
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setImageURL:", v21);

              }
              v22 = *(void **)(*(_QWORD *)(v27 + 48) + 24);
              objc_msgSend(v7, "readingListIconUUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "loadImageSynchronouslyForIconUUID:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setImage:", v24);

              objc_msgSend(v26, "addObject:", v14);
              v2 = v25;
            }

          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v4);
  }

  (*(void (**)(void))(*(_QWORD *)(v27 + 56) + 16))();
}

- (void)_readingListContentsDidChange:(id)a3
{
  -[WBSForYouRecommendationMediatorDataSource notifyContentsDidChangeFromSource:](self, "notifyContentsDidChangeFromSource:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadImageCache, 0);
  objc_storeStrong((id *)&self->_bookmarkProviderAccessQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end
