@implementation MPHomeSharingML3DataProvider

+ (void)beginScanningForLibraries
{
  void *v3;
  char v4;
  MPHSBrowserDelegate *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SharingDisabled"));

  if ((v4 & 1) == 0)
  {
    if (!__browserDelegate)
    {
      v5 = objc_alloc_init(MPHSBrowserDelegate);
      v6 = (void *)__browserDelegate;
      __browserDelegate = (uint64_t)v5;

    }
    if ((__isBrowsing & 1) == 0)
    {
      v7 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Beginning scan.", buf, 2u);
      }

      __isBrowsing = 1;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __57__MPHomeSharingML3DataProvider_beginScanningForLibraries__block_invoke;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      objc_msgSend(a1, "_determineHomeSharingGroupIDWithCompletionHandler:", v8);
    }
  }
}

uint64_t __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  uint64_t result;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "groupID");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Determined group ID: %{public}@", (uint8_t *)&v5, 0xCu);

    }
    else
    {
      v5 = 138543362;
      v6 = CFSTR("Unable to determine groupID");
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Determined group ID: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __57__MPHomeSharingML3DataProvider_beginScanningForLibraries__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__isBrowsing == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "homeSharingGroupID");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v1;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Group ID: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    v3 = objc_msgSend(v1, "length");
    v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v8 = 138543362;
        v9 = v1;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Searching for libraries in home sharing group: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D335A8], "homeSharingBrowserWithGroupID:", v1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)__browser;
      __browser = v6;

      objc_msgSend((id)__browser, "setDelegate:", __browserDelegate);
      objc_msgSend((id)__browser, "start");
      objc_opt_class();
    }
    else
    {
      if (v5)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] No group ID, skipping scan.", (uint8_t *)&v8, 2u);
      }

      __isBrowsing = 0;
    }

  }
}

+ (id)homeSharingGroupID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D33590], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_determineHomeSharingGroupIDWithCompletionHandler:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  void (**v11)(_QWORD);
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D33590], "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRemoteServerLikelyReachable");

  if (!v7)
  {
LABEL_7:
    if (v3)
      v3[2](v3);
    goto LABEL_9;
  }
  v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] No group ID known, trying to determine it from user defaults account / password.", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E315C198;
  v10 = v4;
  v11 = v3;
  objc_msgSend(v10, "determineGroupIDWithCompletionHandler:", v9);

LABEL_9:
}

void __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__MPHomeSharingML3DataProvider__determineHomeSharingGroupIDWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E315C170;
  v6 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (unsigned)databaseID
{
  return -[HSHomeSharingLibrary databaseID](self->_homeSharingLibrary, "databaseID");
}

- (id)URLForItemDataRequest:(id)a3
{
  return (id)-[HSHomeSharingLibrary urlForRequest:](self->_homeSharingLibrary, "urlForRequest:", a3);
}

- (MPHomeSharingML3DataProvider)initWithHomeSharingLibrary:(id)a3
{
  id v5;
  MPHomeSharingML3DataProvider *v6;
  MPHomeSharingML3DataProvider *v7;
  NSMutableSet *v8;
  NSMutableSet *loadedContainerPIDs;
  NSMutableDictionary *v10;
  NSMutableDictionary *blocksForLoadingContainerPIDs;
  void *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *containerFillQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  MPHomeSharingArtworkDataSource *v17;
  MPArtworkDataSource *artworkDataSource;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPHomeSharingML3DataProvider;
  v6 = -[MPMediaLibraryDataProviderML3 initWithLibrary:](&v20, sel_initWithLibrary_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_homeSharingLibrary, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    loadedContainerPIDs = v7->_loadedContainerPIDs;
    v7->_loadedContainerPIDs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    blocksForLoadingContainerPIDs = v7->_blocksForLoadingContainerPIDs;
    v7->_blocksForLoadingContainerPIDs = v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__homeSharingGroupIDDidChangeNotification_, *MEMORY[0x1E0D33560], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__homeSharingLibraryDidUpdateRevisionNumber_, *MEMORY[0x1E0D33570], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__homeSharingLibraryDidBecomeUnavailable_, *MEMORY[0x1E0D33568], 0);
    v13 = dispatch_queue_create("com.apple.mobileipod.containerfill", 0);
    containerFillQueue = v7->_containerFillQueue;
    v7->_containerFillQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.MediaPlayer.MPHomeSharingML3DataProvider/serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(MPHomeSharingArtworkDataSource);
    -[MPHomeSharingArtworkDataSource setLibrary:](v17, "setLibrary:", v7->_homeSharingLibrary);
    artworkDataSource = v7->_artworkDataSource;
    v7->_artworkDataSource = (MPArtworkDataSource *)v17;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D33560], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D33570], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D33568], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  -[MPMediaLibraryDataProviderML3 dealloc](&v4, sel_dealloc);
}

- (id)name
{
  return (id)-[HSHomeSharingLibrary name](self->_homeSharingLibrary, "name");
}

- (id)uniqueIdentifier
{
  return (id)-[HSHomeSharingLibrary uniqueIdentifier](self->_homeSharingLibrary, "uniqueIdentifier");
}

- (BOOL)requiresAuthentication
{
  return -[HSHomeSharingLibrary requiresPassword](self->_homeSharingLibrary, "requiresPassword");
}

- (BOOL)writable
{
  return 0;
}

- (void)connectWithAuthenticationData:(id)a3 completionBlock:(id)a4 progressHandler:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  id v8;
  void *v9;
  HSHomeSharingLibrary *homeSharingLibrary;
  _QWORD v11[5];
  void (**v12)(id, uint64_t, _QWORD);
  id v13;

  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = a5;
  if (-[MPHomeSharingML3DataProvider isSupportedSharingVersion](self, "isSupportedSharingVersion"))
  {
    if (-[HSHomeSharingLibrary connectionState](self->_homeSharingLibrary, "connectionState") == 2)
    {
      if (v7)
        v7[2](v7, 1, 0);
    }
    else
    {
      homeSharingLibrary = self->_homeSharingLibrary;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke;
      v11[3] = &unk_1E315C0E0;
      v11[4] = self;
      v12 = v7;
      v13 = v8;
      -[HSHomeSharingLibrary connectWithCompletionHandler:](homeSharingLibrary, "connectWithCompletionHandler:", v11);

    }
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hs_homeSharingErrorWithCode:userInfo:", 1002, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v9);

  }
}

- (void)disconnect
{
  -[HSHomeSharingLibrary disconnect](self->_homeSharingLibrary, "disconnect");
}

- (void)loadQueryCriteria:(id)a3 hasItemsWithCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MPHomeSharingML3DataProvider *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__MPHomeSharingML3DataProvider_loadQueryCriteria_hasItemsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E3161780;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[MPHomeSharingML3DataProvider _fillContainerForQueryCriteria:completionBlock:](self, "_fillContainerForQueryCriteria:completionBlock:", v9, v10);

}

- (void)loadQueryCriteria:(id)a3 hasCollectionsWithCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MPHomeSharingML3DataProvider *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__MPHomeSharingML3DataProvider_loadQueryCriteria_hasCollectionsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E3161780;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[MPHomeSharingML3DataProvider _fillContainerForQueryCriteria:completionBlock:](self, "_fillContainerForQueryCriteria:completionBlock:", v9, v10);

}

- (void)loadQueryCriteria:(id)a3 countOfItemsWithCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MPHomeSharingML3DataProvider *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfItemsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E3161780;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[MPHomeSharingML3DataProvider _fillContainerForQueryCriteria:completionBlock:](self, "_fillContainerForQueryCriteria:completionBlock:", v9, v10);

}

- (void)loadQueryCriteria:(id)a3 countOfCollectionsWithCompletionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  MPHomeSharingML3DataProvider *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfCollectionsWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E3161780;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  -[MPHomeSharingML3DataProvider _fillContainerForQueryCriteria:completionBlock:](self, "_fillContainerForQueryCriteria:completionBlock:", v9, v10);

}

- (id)itemResultSetForQueryCriteria:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MPHomeSharingML3DataProvider *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__30496;
  v19 = __Block_byref_object_dispose__30497;
  v20 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MPHomeSharingML3DataProvider_itemResultSetForQueryCriteria___block_invoke;
  v10[3] = &unk_1E31615D0;
  v14 = &v15;
  v6 = v4;
  v11 = v6;
  v12 = self;
  v7 = v5;
  v13 = v7;
  -[MPHomeSharingML3DataProvider _fillContainerForQueryCriteria:completionBlock:](self, "_fillContainerForQueryCriteria:completionBlock:", v6, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)hasGeniusMixes
{
  return 0;
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofItemWithIdentifier:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  HSHomeSharingLibrary *homeSharingLibrary;
  __CFString *v29;
  _QWORD v30[4];
  __CFString *v31;
  __CFString *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("bookmarkTime")))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%u"), (v14 * 1000.0));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("daap.songbookmark");
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("rating")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), 20 * objc_msgSend(v10, "unsignedIntValue"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("daap.songuserrating");
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("playCount")) & 1) != 0)
  {
    v16 = CFSTR("daap.songuserplaycount");
LABEL_9:
    v15 = CFSTR("1");
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("skipCount")) & 1) != 0)
  {
    v16 = CFSTR("daap.songuserskipcount");
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("likedState")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), objc_msgSend(v10, "unsignedIntValue"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("com.apple.itunes.liked-state");
LABEL_10:
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("playCount")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("skipCount")))
    {
      v17 = (void *)MEMORY[0x1E0D512C8];
      -[MPMediaLibraryDataProviderML3 library](self, "library");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "newWithPersistentID:inLibrary:", a5, v18);

      objc_msgSend(v19, "valueForProperty:", *MEMORY[0x1E0D50E28]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "longLongValue");
      v22 = (id *)0x1E0D335C8;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0D512C8];
      -[MPMediaLibraryDataProviderML3 library](self, "library");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v23, "newWithPersistentID:inLibrary:", a5, v24);

      objc_msgSend(v19, "valueForProperty:", *MEMORY[0x1E0D50E28]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id *)0x1E0D335D8;
      v21 = v20;
    }

    objc_msgSend(*v22, "requestWithDatabaseID:itemID:", -[HSHomeSharingLibrary databaseID](self->_homeSharingLibrary, "databaseID"), v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setValue:forArgument:", v15, v16);
    v26 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[HSHomeSharingLibrary urlForRequest:](self->_homeSharingLibrary, "urlForRequest:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Sending request '%{public}@'", buf, 0xCu);

    }
    homeSharingLibrary = self->_homeSharingLibrary;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __90__MPHomeSharingML3DataProvider_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke;
    v30[3] = &unk_1E315C120;
    v31 = (__CFString *)v16;
    v32 = v15;
    v33 = v12;
    v29 = v15;
    -[HSHomeSharingLibrary sendRequest:withResponseHandler:](homeSharingLibrary, "sendRequest:withResponseHandler:", v25, v30);

    goto LABEL_17;
  }
  if (v12)
    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 1, 0);
LABEL_17:

}

- (id)adjustedValueForMPProperty:(id)a3 ofEntity:(id)a4 withDefaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("filePath")))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0D50E28]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "longLongValue");

    objc_msgSend(MEMORY[0x1E0D335D0], "requestWithDatabaseID:itemID:format:", -[HSHomeSharingLibrary databaseID](self->_homeSharingLibrary, "databaseID"), v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HSHomeSharingLibrary urlForRequest:](self->_homeSharingLibrary, "urlForRequest:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "replaceCharactersInRange:withString:", 0, 4, CFSTR("home-sharing"));
    v10 = (id)v12;
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("verifiedIntegrity")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("albumRepresentativeItemArtworkToken"))
        && !objc_msgSend(v10, "length"))
      {
        v17 = 0;
        goto LABEL_9;
      }
      v20.receiver = self;
      v20.super_class = (Class)MPHomeSharingML3DataProvider;
      -[MPMediaLibraryDataProviderML3 adjustedValueForMPProperty:ofEntity:withDefaultValue:](&v20, sel_adjustedValueForMPProperty_ofEntity_withDefaultValue_, v8, v9, v10);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v18;
  }
LABEL_9:

  return v17;
}

- (id)errorResolverForItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  MPHomeSharingRentalErrorResolver *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  MPHomeSharingErrorResolver *v27;
  NSObject *v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isRental"))
  {
    objc_msgSend(v4, "valueForProperty:", CFSTR("storeAccountID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

    -[MPHomeSharingML3DataProvider _tokenDataForAccountID:](self, "_tokenDataForAccountID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v14 || !objc_msgSend(v15, "length"))
    {
      v21 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v30 = 138543874;
        v31 = (uint64_t)v4;
        v32 = 2048;
        v33 = v14;
        v34 = 2048;
        v35 = objc_msgSend(v16, "length");
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_ERROR, "Cannot create error resolver for media item: %{public}@ (accountID: %llu, tokenData: %llu bytes)", (uint8_t *)&v30, 0x20u);
      }
      v11 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v4, "valueForProperty:", CFSTR("storeDownloaderAccountID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedLongLongValue");

    objc_msgSend(v4, "valueForProperty:", CFSTR("storeFamilyAccountID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedLongLongValue");

    -[MPHomeSharingML3DataProvider _tokenDataForAccountID:](self, "_tokenDataForAccountID:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaLibrary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "protectedContentSupportStorageURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && v20)
    {
      v24 = -[NSObject length](v21, "length");
      v25 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      v26 = v25;
      if (!v24)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v30 = 138544386;
          v31 = (uint64_t)v4;
          v32 = 2048;
          v33 = v14;
          v34 = 2048;
          v35 = objc_msgSend(v16, "length");
          v36 = 2048;
          v37 = v18;
          v38 = 2048;
          v39 = -[NSObject length](v21, "length");
          _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_ERROR, "Cannot create error resolver for media item: %{public}@ (accountID: %llu, accountTokenData: %llu bytes, downloaderAccountID: %llu, downloaderTokenData: %llu bytes)", (uint8_t *)&v30, 0x34u);
        }

        v11 = 0;
        goto LABEL_23;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138544386;
        v31 = (uint64_t)v4;
        v32 = 2048;
        v33 = v14;
        v34 = 2048;
        v35 = objc_msgSend(v16, "length");
        v36 = 2048;
        v37 = v18;
        v38 = 2048;
        v39 = -[NSObject length](v21, "length");
        _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for media item: %{public}@ (accountID: %llu, accountTokenData: %llu bytes, downloaderAccountID: %llu, downloaderTokenData: %llu bytes)", (uint8_t *)&v30, 0x34u);
      }

      v27 = -[MPHomeSharingErrorResolver initWithKeybagURL:accountID:accountTokenData:downloaderAccountID:downloaderAccountTokenData:familyAccountID:]([MPHomeSharingErrorResolver alloc], "initWithKeybagURL:accountID:accountTokenData:downloaderAccountID:downloaderAccountTokenData:familyAccountID:", v23, v14, v16, v18, v21, v20);
    }
    else
    {
      v28 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 134218240;
        v31 = v14;
        v32 = 2048;
        v33 = objc_msgSend(v16, "length");
        _os_log_impl(&dword_193B9B000, v28, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for account ID: %llu, token data length: %lu", (uint8_t *)&v30, 0x16u);
      }

      v27 = -[MPHomeSharingErrorResolver initWithKeybagURL:accountID:accountTokenData:]([MPHomeSharingErrorResolver alloc], "initWithKeybagURL:accountID:accountTokenData:", v23, v14, v16);
    }
    v11 = (MPHomeSharingRentalErrorResolver *)v27;
    -[MPHomeSharingErrorResolver setDataProvider:](v27, "setDataProvider:", self);
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  objc_msgSend(v4, "valueForProperty:", CFSTR("homeSharingID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v4, "valueForProperty:", CFSTR("storeAccountID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(v4, "valueForProperty:", CFSTR("storeRentalID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  v11 = 0;
  if (v6 && v8 && v10)
  {
    v12 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 134218496;
      v31 = v6;
      v32 = 2048;
      v33 = v8;
      v34 = 2048;
      v35 = v10;
      _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Creating error resolver for item ID: %llu, account ID: %llu, rental ID: %llu", (uint8_t *)&v30, 0x20u);
    }

    v11 = -[MPHomeSharingRentalErrorResolver initWithItemID:homeSharingID:rentalID:accountID:]([MPHomeSharingRentalErrorResolver alloc], "initWithItemID:homeSharingID:rentalID:accountID:", objc_msgSend(v4, "persistentID"), v6, v10, v8);
    -[MPHomeSharingRentalErrorResolver setDataProvider:](v11, "setDataProvider:", self);
  }
LABEL_25:

  return v11;
}

- (void)setRentalPlaybackStartDateForItemID:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "Updating rental playback start date", v11, 2u);
  }

  v6 = (void *)MEMORY[0x1E0D512C8];
  -[MPMediaLibraryDataProviderML3 library](self, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "newWithPersistentID:inLibrary:", a3, v7);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forProperty:", v10, *MEMORY[0x1E0D50F98]);

}

- (id)protectedContentSupportStorageURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[HSHomeSharingLibrary uniqueIdentifier](self->_homeSharingLibrary, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HSLibraryCacheDirectoryForIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Tokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_homeSharingGroupIDDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[MPHomeSharingML3DataProvider homeSharingGroupID](MPHomeSharingML3DataProvider, "homeSharingGroupID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPHomeSharingML3DataProvider homeSharingLibrary](self, "homeSharingLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeSharingGroupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      +[MPHomeSharingML3DataProvider homeSharingGroupID](MPHomeSharingML3DataProvider, "homeSharingGroupID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Home sharing group ID changed to: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    +[MPMediaLibrary removeLibraryDataProvider:removalReason:](MPMediaLibrary, "removeLibraryDataProvider:removalReason:", self, 0);
    +[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryDataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", self);

    if (v12)
      +[MPMediaLibrary setDefaultMediaLibrary:](MPMediaLibrary, "setDefaultMediaLibrary:", 0);
    if (+[MPHomeSharingML3DataProvider isScanningForLibraries](MPHomeSharingML3DataProvider, "isScanningForLibraries"))
    {
      +[MPHomeSharingML3DataProvider endScanningForLibraries](MPHomeSharingML3DataProvider, "endScanningForLibraries");
      +[MPHomeSharingML3DataProvider beginScanningForLibraries](MPHomeSharingML3DataProvider, "beginScanningForLibraries");
    }
  }
}

- (void)_homeSharingLibraryDidUpdateRevisionNumber:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_homeSharingLibraryDidBecomeUnavailable:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33578]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Home Sharing Library became unavailable: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  +[MPHomeSharingML3DataProvider endScanningForLibraries](MPHomeSharingML3DataProvider, "endScanningForLibraries");
  +[MPHomeSharingML3DataProvider beginScanningForLibraries](MPHomeSharingML3DataProvider, "beginScanningForLibraries");

}

- (BOOL)isSupportedSharingVersion
{
  return -[HSHomeSharingLibrary version](self->_homeSharingLibrary, "version") > 0x30005;
}

- (void)setTokenData:(id)a3 forAuthorizedDSID:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *tokenDataForDSIDs;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  v6 = a3;
  if (!self->_tokenDataForDSIDs)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    tokenDataForDSIDs = self->_tokenDataForDSIDs;
    self->_tokenDataForDSIDs = v7;

  }
  v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v6, "length")));
  v10 = (void *)objc_msgSend(v9, "mutableBytes");
  v13 = objc_retainAutorelease(v6);
  memcpy(v10, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  v11 = self->_tokenDataForDSIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v9, v12);

}

- (void)_fetchTokensForAuthorizedDSIDs
{
  void *v3;
  void *v4;
  HSHomeSharingLibrary *homeSharingLibrary;
  _QWORD v6[5];

  -[HSHomeSharingLibrary homeSharingGroupID](self->_homeSharingLibrary, "homeSharingGroupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D335A0], "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    homeSharingLibrary = self->_homeSharingLibrary;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke;
    v6[3] = &unk_1E315CA70;
    v6[4] = self;
    -[HSHomeSharingLibrary sendRequest:withResponseHandler:](homeSharingLibrary, "sendRequest:withResponseHandler:", v4, v6);

  }
}

- (id)_tokenDataForAccountID:(unint64_t)a3
{
  NSMutableDictionary *tokenDataForDSIDs;
  void *v4;
  void *v5;

  if (a3)
  {
    tokenDataForDSIDs = self->_tokenDataForDSIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](tokenDataForDSIDs, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_fillContainerForQueryCriteria:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *containerFillQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MPHomeSharingML3DataProvider *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  containerFillQueue = self->_containerFillQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke;
  block[3] = &unk_1E3161780;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(containerFillQueue, block);

}

- (id)artworkDataSource
{
  return self->_artworkDataSource;
}

- (HSHomeSharingLibrary)homeSharingLibrary
{
  return self->_homeSharingLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDataSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_containerFillQueue, 0);
  objc_storeStrong((id *)&self->_blocksForLoadingContainerPIDs, 0);
  objc_storeStrong((id *)&self->_loadedContainerPIDs, 0);
  objc_storeStrong((id *)&self->_tokenDataForDSIDs, 0);
  objc_storeStrong((id *)&self->_homeSharingLibrary, 0);
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD block[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  _QWORD v32[5];
  id v33;

  objc_msgSend(a1[4], "predicateForProperty:", CFSTR("playlistPersistentID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2 || objc_msgSend(a1[4], "groupingType") == 6)
    goto LABEL_5;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*((id *)a1[5] + 18), "containsObject:", v3) & 1) != 0)
  {

LABEL_5:
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2_130;
    block[3] = &unk_1E31637F8;
    v22 = a1[6];
    dispatch_async(v4, block);

    v3 = v22;
    goto LABEL_6;
  }
  objc_msgSend(*((id *)a1[5] + 19), "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1[6], "copy");
  v7 = (void *)v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x19403A810](v6);
    objc_msgSend(v5, "addObject:", v8);

  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v10 = (void *)MEMORY[0x19403A810](v7);
    v5 = (void *)objc_msgSend(v9, "initWithObjects:", v10, 0);

    objc_msgSend(*((id *)a1[5] + 19), "setObject:forKey:", v5, v3);
    v11 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2;
    v32[3] = &unk_1E31635F8;
    v32[4] = a1[5];
    v12 = v3;
    v33 = v12;
    v13 = (void *)MEMORY[0x19403A810](v32);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 0;
    v14 = dispatch_time(0, 2000000000);
    v15 = *((_QWORD *)a1[5] + 20);
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_4;
    v27[3] = &unk_1E315C1C8;
    v29 = v30;
    v16 = v13;
    v28 = v16;
    dispatch_after(v14, v15, v27);
    objc_msgSend(a1[5], "library");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *((_QWORD *)a1[5] + 16);
    v19 = objc_msgSend(v12, "longLongValue");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_5;
    v23[3] = &unk_1E315C218;
    v23[4] = a1[5];
    v24 = v12;
    v26 = v30;
    v20 = v16;
    v25 = v20;
    objc_msgSend(v17, "fillContainerForHomeSharingLibrary:containerID:completionHandler:", v18, v19, v23);

    _Block_object_dispose(v30, 8);
  }

LABEL_6:
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "addObject:", *(_QWORD *)(a1 + 40));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        dispatch_get_global_queue(0, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_3;
        block[3] = &unk_1E31637F8;
        block[4] = v8;
        dispatch_async(v9, block);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  char v16;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_6;
  block[3] = &unk_1E315C1F0;
  block[1] = 3221225472;
  v16 = a2;
  v12 = v6;
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 48);
  v8 = (id)v10;
  v15 = v10;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_2_130(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 72))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v7 = v3;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "Could not populate container %{public}@: %{public}@", buf, 0x16u);
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_129;
    block[3] = &unk_1E3163508;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_129(uint64_t a1)
{
  return +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 32));
}

uint64_t __79__MPHomeSharingML3DataProvider__fillContainerForQueryCriteria_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id obj;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "deviceGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v13 = v3;
    objc_msgSend(v3, "authorizedDSIDs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D335C0], "requestWithDSID:deviceGUID:", objc_msgSend(v9, "unsignedLongLongValue"), v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(a1 + 32);
          v12 = *(void **)(v11 + 128);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke_2;
          v15[3] = &unk_1E315C770;
          v15[4] = v11;
          v15[5] = v9;
          objc_msgSend(v12, "sendRequest:withResponseHandler:", v10, v15);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v3 = v13;
  }

}

void __62__MPHomeSharingML3DataProvider__fetchTokensForAuthorizedDSIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "tokenData");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setTokenData:forAuthorizedDSID:", v3, objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));

}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "library");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 128);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_2;
  v5[3] = &unk_1E31637D0;
  v5[4] = v3;
  objc_msgSend(v2, "checkForChangesInHomeSharingLibrary:completionHandler:", v4, v5);

}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_3;
  v7[3] = &unk_1E31635F8;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __75__MPHomeSharingML3DataProvider__homeSharingLibraryDidUpdateRevisionNumber___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v3;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "%{public}@: Failure to update shared library: %{public}@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "removeAllObjects");
    +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HSLibraryCacheDirectoryForIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Tokens"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);

    objc_msgSend(*(id *)(a1 + 40), "_fetchTokensForAuthorizedDSIDs");
  }
}

void __90__MPHomeSharingML3DataProvider_setValue_forProperty_ofItemWithIdentifier_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2048;
    v13 = objc_msgSend(v3, "responseCode");
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Setting property '%{public}@' to '%{public}@' returned status code %lu", (uint8_t *)&v8, 0x20u);
  }

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);

}

intptr_t __62__MPHomeSharingML3DataProvider_itemResultSetForQueryCriteria___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)MPHomeSharingML3DataProvider;
  objc_msgSendSuper2(&v7, sel_itemResultSetForQueryCriteria_, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

id __88__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfCollectionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_countOfCollectionsWithCompletionBlock_, v1, v2);
}

id __82__MPHomeSharingML3DataProvider_loadQueryCriteria_countOfItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_countOfItemsWithCompletionBlock_, v1, v2);
}

id __84__MPHomeSharingML3DataProvider_loadQueryCriteria_hasCollectionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_hasCollectionsWithCompletionBlock_, v1, v2);
}

id __78__MPHomeSharingML3DataProvider_loadQueryCriteria_hasItemsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)MPHomeSharingML3DataProvider;
  return objc_msgSendSuper2(&v4, sel_loadQueryCriteria_hasItemsWithCompletionBlock_, v1, v2);
}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1[4] + 128), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HSLibraryCacheDirectoryForIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Library.itdb"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[4];
    v11 = (void *)a1[5];
    v12 = *(_QWORD *)(v10 + 128);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_2;
    v17[3] = &unk_1E3163250;
    v13 = (void *)MEMORY[0x1E0D51270];
    v17[1] = 3221225472;
    v17[4] = v10;
    v18 = v9;
    v19 = v11;
    v14 = a1[6];
    v15 = v9;
    objc_msgSend(v13, "buildDatabaseFromHomeSharingLibrary:atPath:completionHandler:progressHandler:", v12, v15, v17, v14);

  }
  else
  {
    v16 = a1[5];
    if (v16)
      (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v5);
  }

}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_2(uint64_t a1, char a2)
{
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  char v12;

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_3;
  v8[3] = &unk_1E315EDD8;
  v8[1] = 3221225472;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  v12 = a2;
  dispatch_async(v5, v8);

}

void __94__MPHomeSharingML3DataProvider_connectWithAuthenticationData_completionBlock_progressHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51270]), "initWithPath:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setLibrary:", v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 56), 0);
  +[MPMediaLibrary reloadLibraryDataProvider:](MPMediaLibrary, "reloadLibraryDataProvider:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_fetchTokensForAuthorizedDSIDs");
  +[MPHomeSharingRentalTracker sharedInstance](MPHomeSharingRentalTracker, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllRentalsForDatabaseID:", v5);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x194037540]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 6)
  {
    v26 = v8;
    v27 = v2;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v29 = *(_QWORD *)v31;
      v13 = *MEMORY[0x1E0CB2A88];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v29)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v16 = v7;
          objc_msgSend(v7, "stringByAppendingPathComponent:", v15, v26, v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v6;
          objc_msgSend(v6, "attributesOfItemAtPath:error:", v17, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "objectForKey:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12 || objc_msgSend(v11, "compare:", v20) == 1)
          {
            v21 = v15;

            v22 = v20;
            v11 = v22;
            v12 = v21;
          }

          v6 = v18;
          v7 = v16;
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    v23 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "stringByAppendingPathComponent:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      _os_log_impl(&dword_193B9B000, v23, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] Removing oldest cached library: %{public}@", buf, 0xCu);

    }
    objc_msgSend(v7, "stringByAppendingPathComponent:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtPath:error:", v25, 0);

    v8 = v26;
    v2 = v27;
  }

}

+ (BOOL)isScanningForLibraries
{
  return __isBrowsing;
}

+ (void)endScanningForLibraries
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (__isBrowsing == 1)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingML3DataProvider] [Browse] Ending scan.", v4, 2u);
    }

    objc_msgSend((id)__browser, "stop");
    v3 = (void *)__browser;
    __browser = 0;

    __isBrowsing = 0;
  }
}

@end
