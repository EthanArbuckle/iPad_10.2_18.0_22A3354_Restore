@implementation ReadingListMetadataFetcher

+ (id)sharedMetadataFetcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ReadingListMetadataFetcher_sharedMetadataFetcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetadataFetcher_onceToken != -1)
    dispatch_once(&sharedMetadataFetcher_onceToken, block);
  return (id)sharedMetadataFetcher_sharedInstance;
}

void __51__ReadingListMetadataFetcher_sharedMetadataFetcher__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_initWithBookmarkCollection:", v4);
  v3 = (void *)sharedMetadataFetcher_sharedInstance;
  sharedMetadataFetcher_sharedInstance = v2;

}

- (id)_initWithBookmarkCollection:(id)a3
{
  id v5;
  ReadingListMetadataFetcher *v6;
  ReadingListMetadataFetcher *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *metadataSynchronizationQueue;
  uint64_t v10;
  NSMutableArray *bookmarksPendingMetadata;
  uint64_t v12;
  NSMutableArray *bookmarksPendingThumbnail;
  ReadingListMetadataFetcher *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ReadingListMetadataFetcher;
  v6 = -[ReadingListMetadataFetcher init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = dispatch_queue_create("com.apple.Safari.ReadingListMetadataFetcher", 0);
    metadataSynchronizationQueue = v7->_metadataSynchronizationQueue;
    v7->_metadataSynchronizationQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    bookmarksPendingMetadata = v7->_bookmarksPendingMetadata;
    v7->_bookmarksPendingMetadata = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    bookmarksPendingThumbnail = v7->_bookmarksPendingThumbnail;
    v7->_bookmarksPendingThumbnail = (NSMutableArray *)v12;

    v14 = v7;
  }

  return v7;
}

+ (BOOL)shouldFetchMetadataForBookmark:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "hasFetchedMetadata") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) >= 2)
    {
      objc_msgSend(v3, "previewText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v3, "readingListIconURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "length") == 0;

      }
      else
      {
        v4 = 1;
      }

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

+ (BOOL)shouldFetchThumbnailForBookmark:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "hasFetchedMetadata") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "readingListIconURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "readingListIconUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)fetchMetadataForReadingListBookmark:(id)a3 withProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *metadataSynchronizationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  metadataSynchronizationQueue = self->_metadataSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ReadingListMetadataFetcher_fetchMetadataForReadingListBookmark_withProvider___block_invoke;
  block[3] = &unk_1E9CF2990;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(metadataSynchronizationQueue, block);

}

uint64_t __79__ReadingListMetadataFetcher_fetchMetadataForReadingListBookmark_withProvider___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue:containsBookmark:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    +[PendingReadingListItem itemWithBookmark:provider:](PendingReadingListItem, "itemWithBookmark:provider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    result = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(result + 32))
      return objc_msgSend((id)result, "_fetchNextItemMetadata");
  }
  return result;
}

- (void)fetchThumbnailForReadingListBookmark:(id)a3 withProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *metadataSynchronizationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  metadataSynchronizationQueue = self->_metadataSynchronizationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__ReadingListMetadataFetcher_fetchThumbnailForReadingListBookmark_withProvider___block_invoke;
  block[3] = &unk_1E9CF2990;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(metadataSynchronizationQueue, block);

}

uint64_t __80__ReadingListMetadataFetcher_fetchThumbnailForReadingListBookmark_withProvider___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue:containsBookmark:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_queue:containsBookmark:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));
    if ((result & 1) == 0)
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      +[PendingReadingListItem itemWithBookmark:provider:](PendingReadingListItem, "itemWithBookmark:provider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

      result = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(result + 56))
        return objc_msgSend((id)result, "_fetchNextItemThumbnail");
    }
  }
  return result;
}

- (void)_fetchMetadataForPendingItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isFetchingMetadata = 1;
  objc_msgSend(v4, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Begin fetching metadata for Reading List item with provider %{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "bookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke;
    v11[3] = &unk_1E9CF4E88;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v5, "fetchMetadataForBookmark:completion:", v10, v11);

  }
  else
  {
    -[ReadingListMetadataFetcher _fetchMetadataWithDefaultProviderForPendingItem:](self, "_fetchMetadataWithDefaultProviderForPendingItem:", v4);
  }

}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if ((a2 & 1) != 0)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_80;
    v19[3] = &unk_1E9CF4E60;
    v19[4] = *(_QWORD *)(a1 + 32);
    v15 = &v20;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v24 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v18 = *(NSObject **)(v16 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2;
    block[3] = &unk_1E9CF1830;
    block[4] = v16;
    v15 = &v26;
    v26 = v17;
    dispatch_async(v18, block);
  }

}

uint64_t __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMetadataWithDefaultProviderForPendingItem:", *(_QWORD *)(a1 + 40));
}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_80(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Successfully fetched metadata for Reading List item", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setTitle:previewText:thumbnailURLString:thumbnailImage:forItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_81;
  v5[3] = &unk_1E9CF1830;
  v5[4] = v3;
  v6 = *(id *)(a1 + 72);
  dispatch_async(v4, v5);

}

uint64_t __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishFetchingMetadataForItem:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchMetadataWithDefaultProviderForPendingItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ReadingListMetadataProvider *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Begin fetching metadata for Reading List item with default provider", buf, 2u);
  }
  objc_msgSend(v4, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(ReadingListMetadataProvider);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke;
  v10[3] = &unk_1E9CF4ED8;
  v10[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  -[ReadingListMetadataProvider fetchMetadataForBookmark:completion:](v7, "fetchMetadataForBookmark:completion:", v8, v10);

}

void __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_2;
  v20[3] = &unk_1E9CF4EB0;
  v27 = a2;
  v15 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = *(id *)(a1 + 48);
  v16 = v14;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

void __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Successfully fetched metadata for Reading List item with default provider", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setTitle:previewText:thumbnailURLString:thumbnailImage:forItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFailMetadataFetchForBookmarkWithID:", objc_msgSend(*(id *)(a1 + 80), "identifier"));
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_84;
  v5[3] = &unk_1E9CF1830;
  v5[4] = v3;
  v6 = *(id *)(a1 + 72);
  dispatch_async(v4, v5);

}

uint64_t __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishFetchingMetadataForItem:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchThumbnailForPendingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isFetchingThumbnail = 1;
  objc_msgSend(v4, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "Begin fetching thumbnail for Reading List item with provider %{public}@", buf, 0xCu);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke;
    v11[3] = &unk_1E9CF4F28;
    v11[4] = self;
    v12 = v4;
    v13 = v5;
    objc_msgSend(v6, "fetchThumbnailForBookmark:completion:", v13, v11);

  }
  else
  {
    -[ReadingListMetadataFetcher _fetchThumbnailWithDefaultProviderForPendingItem:](self, "_fetchThumbnailWithDefaultProviderForPendingItem:", v4);
  }

}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_86;
    block[3] = &unk_1E9CF4F00;
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = &v15;
    v15 = v8;
    v16 = v7;
    v17 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(NSObject **)(v11 + 16);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2;
    v19[3] = &unk_1E9CF1830;
    v19[4] = v11;
    v10 = &v20;
    v20 = v12;
    dispatch_async(v13, v19);
  }

}

uint64_t __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_fetchThumbnailWithDefaultProviderForPendingItem:", *(_QWORD *)(a1 + 40));
}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_86(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Successfully fetched thumbnail for Reading List item", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setThumbnailImage:fromURL:forBookmarkWithID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "identifier"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_87;
  v5[3] = &unk_1E9CF1830;
  v5[4] = v3;
  v6 = *(id *)(a1 + 64);
  dispatch_async(v4, v5);

}

uint64_t __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_87(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishFetchingThumbnailForItem:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchThumbnailWithDefaultProviderForPendingItem:(id)a3
{
  id v4;
  ReadingListMetadataProvider *v5;
  ReadingListMetadataProvider *defaultThumbnailProvider;
  NSObject *v7;
  void *v8;
  ReadingListMetadataProvider *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ReadingListMetadataFetcher *v15;
  id v16;
  uint8_t buf[16];

  v4 = a3;
  if (!self->_defaultThumbnailProvider)
  {
    objc_msgSend(MEMORY[0x1E0D8A9C0], "sharedManager");
    v5 = (ReadingListMetadataProvider *)objc_claimAutoreleasedReturnValue();
    defaultThumbnailProvider = self->_defaultThumbnailProvider;
    self->_defaultThumbnailProvider = v5;

  }
  v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Begin fetching thumbnail for Reading List item with default provider", buf, 2u);
  }
  objc_msgSend(v4, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_defaultThumbnailProvider;
  objc_msgSend(v4, "bookmark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke;
  v13[3] = &unk_1E9CF4F28;
  v14 = v8;
  v15 = self;
  v16 = v4;
  v11 = v4;
  v12 = v8;
  -[ReadingListMetadataProvider fetchThumbnailForBookmark:completion:](v9, "fetchThumbnailForBookmark:completion:", v10, v13);

}

void __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v7 = a3;
  v8 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_2;
  v14[3] = &unk_1E9CF4F50;
  v9 = *(id *)(a1 + 32);
  v20 = a2;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v18 = v7;
  v19 = v11;
  v12 = v7;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  if (*(_BYTE *)(a1 + 72))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Successfully fetched thumbnail for Reading List item", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_setThumbnailImage:fromURL:forBookmarkWithID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_didFailMetadataFetchForBookmarkWithID:", v2);
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v4 + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_90;
  v6[3] = &unk_1E9CF1830;
  v6[4] = v4;
  v7 = *(id *)(a1 + 64);
  dispatch_async(v5, v6);

}

uint64_t __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishFetchingThumbnailForItem:", *(_QWORD *)(a1 + 40));
}

- (void)_setTitle:(id)a3 previewText:(id)a4 thumbnailURLString:(id)a5 thumbnailImage:(id)a6 forItem:(id)a7
{
  id v12;
  id v13;
  id v14;
  WebBookmarkCollection *collection;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  collection = self->_collection;
  objc_msgSend(a7, "bookmark");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection bookmarkWithID:](collection, "bookmarkWithID:", objc_msgSend(v16, "identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length")
      && (!objc_msgSend(v18, "length") || (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) <= 1))
    {
      objc_msgSend(v17, "setTitle:", v23);
    }
    objc_msgSend(v17, "previewText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {

    }
    else
    {
      v20 = objc_msgSend(v12, "length");

      if (v20)
        objc_msgSend(v17, "setPreviewText:", v12);
    }
    objc_msgSend(v17, "readingListIconUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      if (!v14)
      {
        objc_msgSend(v17, "setReadingListIconURL:", v13);
        goto LABEL_14;
      }
      -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:](self->_collection, "saveIconWithData:urlString:forBookmark:", v14, v13, v17);
    }
    objc_msgSend(v17, "setHasFetchedMetadata:", 1);
LABEL_14:
    -[ReadingListMetadataFetcher _lockAndSaveBookmark:postNotification:](self, "_lockAndSaveBookmark:postNotification:", v17, 1);

  }
}

- (void)_setThumbnailImage:(id)a3 fromURL:(id)a4 forBookmarkWithID:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v11 = a3;
  v8 = a4;
  -[WebBookmarkCollection bookmarkWithID:](self->_collection, "bookmarkWithID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setHasFetchedMetadata:", 1);
    -[WebBookmarkCollection saveIconWithData:urlString:forBookmark:](self->_collection, "saveIconWithData:urlString:forBookmark:", v11, v8, v10);
    -[ReadingListMetadataFetcher _lockAndSaveBookmark:postNotification:](self, "_lockAndSaveBookmark:postNotification:", v10, 1);
  }

}

- (void)_didFailMetadataFetchForBookmarkWithID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ReadingListMetadataFetcher _didFailMetadataFetchForBookmarkWithID:].cold.1();
  -[WebBookmarkCollection bookmarkWithID:](self->_collection, "bookmarkWithID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setHasFetchedMetadata:", 1);
    -[ReadingListMetadataFetcher _lockAndSaveBookmark:postNotification:](self, "_lockAndSaveBookmark:postNotification:", v7, 0);
  }

}

- (BOOL)_lockAndSaveBookmark:(id)a3 postNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  WebBookmarkCollection *collection;
  void *v9;
  int v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "isLockedSync");
  if ((v7 & 1) != 0 || objc_msgSend((id)objc_opt_class(), "lockSync"))
  {
    collection = self->_collection;
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WebBookmarkCollection saveBookmarks:postNotification:](collection, "saveBookmarks:postNotification:", v9, 0);

    if (v10)
      v11 = !v4;
    else
      v11 = 1;
    if (!v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __68__ReadingListMetadataFetcher__lockAndSaveBookmark_postNotification___block_invoke;
      v13[3] = &unk_1E9CF1830;
      v13[4] = self;
      v14 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
    if ((v7 & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "unlockSync");
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

void __68__ReadingListMetadataFetcher__lockAndSaveBookmark_postNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("BookmarkWithUpdatedMetadataKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("ReadingListBookmarkMetadataDidUpdateNotification"), v4, v5);

}

- (void)_fetchNextItemMetadata
{
  id v3;

  if (-[NSMutableArray count](self->_bookmarksPendingMetadata, "count"))
  {
    -[NSMutableArray firstObject](self->_bookmarksPendingMetadata, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ReadingListMetadataFetcher _fetchMetadataForPendingItem:](self, "_fetchMetadataForPendingItem:", v3);

  }
}

- (void)_didFinishFetchingMetadataForItem:(id)a3
{
  self->_isFetchingMetadata = 0;
  -[NSMutableArray removeObject:](self->_bookmarksPendingMetadata, "removeObject:", a3);
  -[ReadingListMetadataFetcher _fetchNextItemMetadata](self, "_fetchNextItemMetadata");
}

- (void)_fetchNextItemThumbnail
{
  id v3;

  if (-[NSMutableArray count](self->_bookmarksPendingThumbnail, "count"))
  {
    -[NSMutableArray firstObject](self->_bookmarksPendingThumbnail, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ReadingListMetadataFetcher _fetchThumbnailForPendingItem:](self, "_fetchThumbnailForPendingItem:", v3);

  }
}

- (void)_didFinishFetchingThumbnailForItem:(id)a3
{
  self->_isFetchingThumbnail = 0;
  -[NSMutableArray removeObject:](self->_bookmarksPendingThumbnail, "removeObject:", a3);
  -[ReadingListMetadataFetcher _fetchNextItemThumbnail](self, "_fetchNextItemThumbnail");
}

- (BOOL)_queue:(id)a3 containsBookmark:(id)a4
{
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a4, "identifier");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "bookmark", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "identifier");

        if (v13 == v6)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultThumbnailProvider, 0);
  objc_storeStrong((id *)&self->_bookmarksPendingThumbnail, 0);
  objc_storeStrong((id *)&self->_bookmarksPendingMetadata, 0);
  objc_storeStrong((id *)&self->_metadataSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to fetch metadata for Reading List item. Retrying with default provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to fetch thumbnail for Reading List item. Retrying with default provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_didFailMetadataFetchForBookmarkWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Failed to fetch thumbnail for Reading List item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
