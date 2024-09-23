@implementation NTKGreenfieldAddWatchFaceManager

- (NTKGreenfieldAddWatchFaceManager)init
{
  NTKGreenfieldAddWatchFaceManager *v2;
  uint64_t v3;
  NSMutableSet *skippedPendingComplicationsItemIds;
  uint64_t v5;
  NSMutableSet *installedComplicationIds;
  uint64_t v7;
  NSSet *locallyAvailableItemIds;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  NTKPersistentFaceCollection *library;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldAddWatchFaceManager;
  v2 = -[NTKGreenfieldAddWatchFaceManager init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    skippedPendingComplicationsItemIds = v2->_skippedPendingComplicationsItemIds;
    v2->_skippedPendingComplicationsItemIds = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    installedComplicationIds = v2->_installedComplicationIds;
    v2->_installedComplicationIds = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    locallyAvailableItemIds = v2->_locallyAvailableItemIds;
    v2->_locallyAvailableItemIds = (NSSet *)v7;

    v9 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    +[NTKCompanionFaceCollectionsManager sharedInstance](NTKCompanionFaceCollectionsManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sharedFaceCollectionForDevice:forCollectionIdentifier:", v12, CFSTR("LibraryFaces"));
    v13 = objc_claimAutoreleasedReturnValue();
    library = v2->_library;
    v2->_library = (NTKPersistentFaceCollection *)v13;

    -[NTKFaceCollection addObserver:](v2->_library, "addObserver:", v2);
    if (!-[NTKPersistentFaceCollection hasLoaded](v2->_library, "hasLoaded"))
      -[NTKGreenfieldAddWatchFaceManager _startLibraryTimeoutTimer](v2, "_startLibraryTimeoutTimer");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKFaceCollection removeObserver:](self->_library, "removeObserver:", self);
  -[NTKGreenfieldAddWatchFaceManager _cleanUpDownloader](self, "_cleanUpDownloader");
  v3.receiver = self;
  v3.super_class = (Class)NTKGreenfieldAddWatchFaceManager;
  -[NTKGreenfieldAddWatchFaceManager dealloc](&v3, sel_dealloc);
}

- (void)decodeWatchFaceWithURL:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSError *failedError;
  NSObject *v12;
  unint64_t decodingState;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("21EB4560-EFA0-46AA-B75C-401D30C5BBF1"));
  v10 = objc_msgSend(v8, "supportsCapability:", v9);

  if ((v10 & 1) != 0)
  {
    failedError = self->_failedError;
    self->_failedError = 0;

    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "decodeWatchFaceWithURL: %@", (uint8_t *)&v19, 0xCu);
    }

    decodingState = self->_decodingState;
    if (decodingState && decodingState != 3)
      -[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:].cold.1();
    objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, a4);
    -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 0);
    if (self->_isLibraryTimeout)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 9;
    }
    else
    {
      if (objc_msgSend(v6, "isFileURL"))
      {
        -[NTKGreenfieldAddWatchFaceManager _decodeUrl:](self, "_decodeUrl:", v6);
        goto LABEL_10;
      }
      objc_msgSend(v6, "scheme");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("watchface"));

      if (v18)
      {
        -[NTKGreenfieldAddWatchFaceManager _startDownloadWirthURL:](self, "_startDownloadWirthURL:", v6);
        goto LABEL_10;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 12;
  }
  objc_msgSend(v14, "greenfield_addWatchFaceErrorWithCode:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v16);

LABEL_10:
}

- (void)_decodeUrl:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "_decodeUrl: %@", buf, 0xCu);
  }

  self->_decodingState = 2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke;
  v7[3] = &unk_1E6BD4B10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[NTKGreenfieldUtilities decodeWatchFaceFromUrl:completionBlock:](NTKGreenfieldUtilities, "decodeWatchFaceFromUrl:completionBlock:", v6, v7);

}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "_decodeUrl completed: decodedRecipe: %@ decodedError: %@", buf, 0x16u);
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (!v6 || v7)
  {
    *(_QWORD *)(v9 + 16) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_handleAddWatchFaceManagerDidFinishWithError:", v7);
  }
  else
  {
    objc_storeStrong((id *)(v9 + 8), a2);
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nrDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isTinker");

      if (!v13)
      {
        v30 = *(void **)(a1 + 32);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_206;
        v31[3] = &unk_1E6BCD5F0;
        v31[4] = v30;
        objc_msgSend(v30, "_refreshInstalledComplicationsWithContinueBlock:", v31);
        goto LABEL_16;
      }
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

      objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_handleAddWatchFaceManagerDidFinishWithError:", v22);
    }
    else
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_1(a1, v23, v24, v25, v26, v27, v28, v29);

      objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_handleAddWatchFaceManagerDidFinishWithError:", v22);
      objc_msgSend(*(id *)(a1 + 32), "_cancelLibraryTimeoutTimer");
    }

  }
LABEL_16:

}

uint64_t __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_206(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_moveAndNotifyDelegateToStartStateIfPossible");
}

- (void)_startDownloadWirthURL:(id)a3
{
  id v4;
  NSObject *v5;
  NTKGreenfieldDownloader *v6;
  NTKGreenfieldDownloader *downloader;
  NTKGreenfieldDownloader *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  NTKGreenfieldAddWatchFaceManager *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "_startDownloadWirthURL: %@", buf, 0xCu);
  }

  self->_decodingState = 1;
  v6 = -[NTKGreenfieldDownloader initWithWatchFaceURL:]([NTKGreenfieldDownloader alloc], "initWithWatchFaceURL:", v4);
  downloader = self->_downloader;
  self->_downloader = v6;

  objc_initWeak((id *)buf, self);
  v8 = self->_downloader;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__NTKGreenfieldAddWatchFaceManager__startDownloadWirthURL___block_invoke;
  v10[3] = &unk_1E6BD4B38;
  v9 = v4;
  v11 = v9;
  objc_copyWeak(&v13, (id *)buf);
  v12 = self;
  -[NTKGreenfieldDownloader downloadWithCompletionBlock:](v8, "downloadWithCompletionBlock:", v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak((id *)buf);
}

void __59__NTKGreenfieldAddWatchFaceManager__startDownloadWirthURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *WeakRetained;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "_startDownloadWirthURL: %@ completed: %@", (uint8_t *)&v12, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_decodeUrl:", v11);

    }
    else
    {
      WeakRetained[2] = 0;
      objc_msgSend(WeakRetained, "_cleanUpDownloader");
      objc_msgSend(*(id *)(a1 + 40), "_handleAddWatchFaceManagerDidFinishWithError:", v6);
    }
  }

}

- (void)_cleanUpDownloader
{
  NTKGreenfieldDownloader *downloader;

  -[NTKGreenfieldDownloader cancelDownload](self->_downloader, "cancelDownload");
  -[NTKGreenfieldDownloader downloadCleanUp](self->_downloader, "downloadCleanUp");
  downloader = self->_downloader;
  self->_downloader = 0;

}

- (void)handleAddToMyFacesAction
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (self->_uiState == 1)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "StartState: handleAddToMyFacesAction", v5, 2u);
    }

    -[NTKGreenfieldAddWatchFaceManager _addToLibraryOrUpdateFaceInLibrary](self, "_addToLibraryOrUpdateFaceInLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v4);

  }
}

- (void)handleContinueAction
{
  unint64_t uiState;
  NSObject *v4;
  NTKGreenfieldAddWatchFaceManager *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  uiState = self->_uiState;
  if (uiState != 2)
  {
    if (uiState != 1)
      return;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldAddWatchFaceUIStateStart: handleContinueAction", buf, 2u);
    }

    if (-[NSMutableSet count](self->_unavailableComplicationsSlots, "count"))
    {
      v5 = self;
      v6 = 2;
LABEL_14:
      -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](v5, "_updateUIStateAndNotifyDelegate:", v6);
      return;
    }
    if (self->_totalNonInstalledAppCount < 1)
      return;
LABEL_13:
    v5 = self;
    v6 = 3;
    goto LABEL_14;
  }
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldAddWatchFaceUIStateComplicationsNotAvailable: handleContinueAction", v9, 2u);
  }

  if (self->_totalNonInstalledAppCount >= 1)
    goto LABEL_13;
  -[NTKGreenfieldAddWatchFaceManager _addToLibraryOrUpdateFaceInLibrary](self, "_addToLibraryOrUpdateFaceInLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v8);
  else
    -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 4);

}

- (void)handleDoneAction
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_uiState == 4)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "CompletedState: handleDoneAction", v4, 2u);
    }

    -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", 0);
  }
}

- (void)handleRevisitSkippedComplicationsAction
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_uiState == 4)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "handleRevisitSkippedComplicationsAction: current complication id: %@", buf, 0xCu);

    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__NTKGreenfieldAddWatchFaceManager_handleRevisitSkippedComplicationsAction__block_invoke;
    v5[3] = &unk_1E6BCD5F0;
    v5[4] = self;
    -[NTKGreenfieldAddWatchFaceManager _refreshInstalledComplicationsWithContinueBlock:](self, "_refreshInstalledComplicationsWithContinueBlock:", v5);
  }
}

uint64_t __75__NTKGreenfieldAddWatchFaceManager_handleRevisitSkippedComplicationsAction__block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "remainingComplicationsToInstallCount") > 0)
    v2 = 3;
  else
    v2 = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_updateUIStateAndNotifyDelegate:", v2);
}

- (void)handleSkipComplicationAction
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_uiState == 3)
  {
    -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[NSMutableSet addObject:](self->_skippedPendingComplicationsItemIds, "addObject:", v3);
      -[NSMutableArray removeObject:](self->_orderedPendingComplicationsItemIds, "removeObject:", v3);
      ++self->_viewedNonInstalledAppCount;
    }
    -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "handleSkipComplicationAction current complication id: %@, nextComplication id: %@", (uint8_t *)&v7, 0x16u);
    }

    if (v4)
    {
      -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 3);
    }
    else
    {
      -[NTKGreenfieldAddWatchFaceManager _addToLibraryOrUpdateFaceInLibrary](self, "_addToLibraryOrUpdateFaceInLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v6);
      else
        -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 4);

    }
  }
}

- (id)skippedComplicationsSlots
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)-[NSMutableSet copy](self->_skippedPendingComplicationsItemIds, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        -[NTKGreenfieldDecodedRecipe complicationSlotToItemIdMapping](self->_decodedRecipe, "complicationSlotToItemIdMapping");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeysForObject:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  -[NSMutableSet allObjects](self->_unavailableComplicationsSlots, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)openAppStore
{
  int64_t totalNonInstalledAppCount;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  totalNonInstalledAppCount = self->_totalNonInstalledAppCount;
  if (totalNonInstalledAppCount)
  {
    if (totalNonInstalledAppCount == 1
      && -[NSMutableArray count](self->_orderedPendingComplicationsItemIds, "count") == 1)
    {
      -[NSMutableArray firstObject](self->_orderedPendingComplicationsItemIds, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("itms-apps://itunes.apple.com/app/id%@"), v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "openURL:options:completionHandler:", v6, MEMORY[0x1E0C9AA70], 0);

    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_serialQueue, &__block_literal_global_98);
    }
  }
}

void __48__NTKGreenfieldAddWatchFaceManager_openAppStore__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openApplicationWithBundleID:", CFSTR("com.apple.AppStore"));

}

- (NSString)addFaceDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldAddWatchFaceManager _missingAppsDescription](self, "_missingAppsDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isUsingConfigurationModifiedForThisDevice") & 1) == 0
    && !-[NTKGreenfieldDecodedRecipe wasModifiedForThisDevice](self->_decodedRecipe, "wasModifiedForThisDevice"))
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_9;
    }
    v7 = v4;
    goto LABEL_8;
  }
  if (!v4)
  {
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_CONFIGURATION_WAS_MODIFIED"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = v7;
    goto LABEL_9;
  }
  NTKClockFaceLocalizedString(CFSTR("GREENFIELD_ADD_WATCH_FACE_CONFIGURATION_WAS_MODIFIED_AND_HAS_MISSING_APPS"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return (NSString *)v6;
}

- (id)_missingAppsDescription
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t, const __CFString *);
  void *v12;
  void *v13;
  void *v14;
  int64_t totalNonInstalledAppCount;
  __CFString *v16;
  void *v17;
  _QWORD aBlock[5];
  id v20;
  id v21;

  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_totalNonInstalledSlotCount == 1)
  {
    v4 = CFSTR("GREENFIELD_ADD_WATCH_FACE_A_COMPLICATION");
    v5 = CFSTR("a complication");
  }
  else
  {
    v4 = CFSTR("GREENFIELD_ADD_WATCH_FACE_COMPLICATIONS");
    v5 = CFSTR("complications");
  }
  NTKClockFaceLocalizedString(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GREENFIELD_MISSING_APP_COUNT_DESCRIPTION_%ld"), self->_totalNonInstalledAppCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(v7, CFSTR("one app"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKGreenfieldAddWatchFaceManager__missingAppsDescription__block_invoke;
  aBlock[3] = &unk_1E6BD4B80;
  aBlock[4] = self;
  v9 = v6;
  v20 = v9;
  v10 = v8;
  v21 = v10;
  v11 = (void (**)(void *, uint64_t, const __CFString *))_Block_copy(aBlock);
  if (objc_msgSend(v3, "faceStyle") == 22)
  {
    if (NTKPhotosIsCustomPhotosFace(v3))
    {
      objc_msgSend(v3, "resourceDirectory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPhotosReader readerForResourceDirectory:](NTKPhotosReader, "readerForResourceDirectory:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11[2](v11, objc_msgSend(v13, "count"), CFSTR("GREENFIELD_ADD_WATCH_FACE_PHOTOS_COUNT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "faceStyle") == 23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "isUsingCustomAsset"))
      {
        v11[2](v11, 1, CFSTR("GREENFIELD_ADD_WATCH_FACE_KALEIDOSCOPE_COUNT"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
  }
  totalNonInstalledAppCount = self->_totalNonInstalledAppCount;
  if (!totalNonInstalledAppCount)
    goto LABEL_16;
  if (totalNonInstalledAppCount == 1)
    v16 = CFSTR("GREENFIELD_MISSING_APP_DEFAULT_MISSING_SINGULAR");
  else
    v16 = CFSTR("GREENFIELD_MISSING_APP_DEFAULT_MISSING_PLURAL");
  NTKClockFaceLocalizedString(v16, CFSTR("This face includes %@ from %@ in the App Store."));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v17, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v14;
}

id __59__NTKGreenfieldAddWatchFaceManager__missingAppsDescription__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)(a1[4] + 176))
  {
    NTKClockFaceLocalizedString(a3, CFSTR("a photo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_MISSING_APP_PHOTOS_APP_MISSING_IOS"), CFSTR("This face contains %@ and %@ from %@ in the App Store."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, v6, a1[5], a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NTKClockFaceLocalizedString(CFSTR("GREENFIELD_PHOTOS_COUNT_DESCRIPTION"), CFSTR("nil"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)_canAddFaceWithoutAllCompicationInstalled
{
  return 1;
}

- (void)_buildUnavailableComplicationsInformationWithInstalledBundleIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  id v14;
  NSMutableSet *unavailableComplicationsSlots;
  NSMutableSet *v16;
  NSMutableSet *unavailableComplicationsNames;
  NSMutableSet *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  NTKGreenfieldAddWatchFaceManager *v22;
  id v23;
  NSMutableSet *v24;
  NSMutableSet *v25;

  v4 = a3;
  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKRestrictedComplicationsForDevice(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__NTKGreenfieldAddWatchFaceManager__buildUnavailableComplicationsInformationWithInstalledBundleIds___block_invoke;
  v19[3] = &unk_1E6BD4BA8;
  v20 = v5;
  v21 = v9;
  v22 = self;
  v23 = v4;
  v10 = v6;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v12 = v4;
  v13 = v9;
  v14 = v5;
  objc_msgSend(v14, "enumerateComplicationSlotsWithBlock:", v19);
  unavailableComplicationsSlots = self->_unavailableComplicationsSlots;
  self->_unavailableComplicationsSlots = v10;
  v16 = v10;

  unavailableComplicationsNames = self->_unavailableComplicationsNames;
  self->_unavailableComplicationsNames = v11;
  v18 = v11;

}

void __100__NTKGreenfieldAddWatchFaceManager__buildUnavailableComplicationsInformationWithInstalledBundleIds___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "complication");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (objc_msgSend(v3, "complicationType"))
  {
    objc_msgSend(v3, "appIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = NTKCanAddInternalComplicationWithBundleId(v5);

    if (v6 && (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v3, "complicationType")) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "preferredComplicationFamilyForComplication:withSlot:", v3, v17);
        +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v3, v9, v11, 1);

        if (v12)
          goto LABEL_9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_9;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "complicationSlotToItemIdMapping");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 && objc_msgSend(v8, "intValue"))
          goto LABEL_8;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "complicationSlotToBundleIdMapping");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v15);

          if ((v16 & 1) != 0)
            goto LABEL_9;
        }
        else
        {

        }
      }
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v17);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "complicationSlotToNameMapping");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v8);
LABEL_8:

  }
LABEL_9:

}

- (void)_refreshInstalledComplicationsWithContinueBlock:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke;
  v7[3] = &unk_1E6BD00B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serialQueue, v7);

}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  dispatch_semaphore_t v27;
  void *v28;
  id v29;
  dispatch_time_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD v38[4];
  id v39;
  NSObject *v40;
  _QWORD v41[5];
  id v42;
  id obj;
  _QWORD block[5];
  id v45;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__29;
  v64 = __Block_byref_object_dispose__29;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__29;
  v58 = __Block_byref_object_dispose__29;
  v59 = 0;
  v51 = 0;
  v52[0] = &v51;
  v52[1] = 0x3032000000;
  v52[2] = __Block_byref_object_copy__29;
  v52[3] = __Block_byref_object_dispose__29;
  v53 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_259;
  v46[3] = &unk_1E6BD4BD0;
  v48 = &v60;
  v49 = &v54;
  v50 = &v51;
  v5 = v2;
  v47 = v5;
  objc_msgSend(v3, "_queue_fetchInstalledAppsOnWatchWithithCompletionBlock:", v46);
  v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)v61[5];
    v9 = v55[5];
    v10 = *(_QWORD *)(v52[0] + 40);
    *(_DWORD *)buf = 138412802;
    v67 = v8;
    v68 = 2112;
    v69 = v9;
    v70 = 2112;
    v71 = v10;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "_queue_fetchInstalledAppsOnWatchWithError: itemIds: %@  bundleIds:%@ error:%@", buf, 0x20u);
  }

  v11 = (id *)(v52[0] + 40);
  if (*(_QWORD *)(v52[0] + 40))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_cold_1((uint64_t)v52, v12, v13, v14, v15, v16, v17, v18);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_261;
    block[3] = &unk_1E6BCD778;
    block[4] = *(_QWORD *)(a1 + 32);
    v45 = v19;
    v20 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v21 = *(void **)(a1 + 32);
    obj = 0;
    objc_msgSend(v21, "_queue_fetchLocallyAvailableAppsWithError:", &obj);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, obj);
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(v52[0] + 40);
      *(_DWORD *)buf = 138412546;
      v67 = v20;
      v68 = 2112;
      v69 = v23;
      _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "_queue_fetchLocallyAvailableAppsWithError: itemIds: %@ error:%@", buf, 0x16u);
    }

    if (*(_QWORD *)(v52[0] + 40))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v4;
      v41[1] = 3221225472;
      v41[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_262;
      v41[3] = &unk_1E6BCD778;
      v41[4] = *(_QWORD *)(a1 + 32);
      v42 = v24;
      v25 = v24;
      dispatch_async(MEMORY[0x1E0C80D38], v41);

    }
    else
    {
      v26 = (void *)objc_opt_new();
      v27 = dispatch_semaphore_create(0);

      objc_msgSend(MEMORY[0x1E0CF9DE0], "defaultService");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v4;
      v38[1] = 3221225472;
      v38[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_2;
      v38[3] = &unk_1E6BD4BF8;
      v29 = v26;
      v39 = v29;
      v5 = v27;
      v40 = v5;
      objc_msgSend(v28, "getUpdatesWithCompletionBlock:", v38);

      v30 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v5, v30);
      v32[0] = v4;
      v32[1] = 3221225472;
      v32[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_3;
      v32[3] = &unk_1E6BD4C20;
      v31 = *(_QWORD *)(a1 + 32);
      v36 = &v54;
      v32[4] = v31;
      v33 = v20;
      v34 = v29;
      v37 = &v60;
      v35 = *(id *)(a1 + 40);
      v25 = v29;
      dispatch_async(MEMORY[0x1E0C80D38], v32);

    }
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_259(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v18 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_261(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddWatchFaceManagerDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_262(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddWatchFaceManagerDidFinishWithError:", *(_QWORD *)(a1 + 40));
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "updateState") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v8, "storeItemIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "_buildUnavailableComplicationsInformationWithInstalledBundleIds:", v4);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "decodedRecipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationSlotToItemIdMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "decodedRecipe");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "complicationSlotToItemIdMapping");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "intValue"))
          {
            if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v17))
            {
              objc_msgSend(v5, "addObject:", v17);
              goto LABEL_12;
            }
            if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "containsObject:", v17) & 1) == 0
              && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "containsObject:", v17) & 1) == 0)
            {
LABEL_12:
              objc_msgSend(v6, "addObject:", v17);
            }
          }

          continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v11);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(v6, "count");
  v36 = v5;
  v18 = objc_msgSend(v5, "copy");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 112);
  *(_QWORD *)(v19 + 112) = v18;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "decodedRecipe");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "watchFace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "orderedComplicationSlots");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "containsObject:", v29) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "decodedRecipe");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "complicationSlotToItemIdMapping");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32 && objc_msgSend(v6, "containsObject:", v32))
          {
            objc_msgSend(v21, "addObject:", v32);
            ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
          }

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v26);
  }

  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(void **)(v33 + 80);
  *(_QWORD *)(v33 + 80) = v21;
  v35 = v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)_curPendingComplicationItemId
{
  void *v2;

  if (self->_uiState == 3)
  {
    -[NSMutableArray firstObject](self->_orderedPendingComplicationsItemIds, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int64_t)remainingComplicationsToInstallCount
{
  return -[NSMutableArray count](self->_orderedPendingComplicationsItemIds, "count");
}

- (BOOL)hasSkippedComplications
{
  return -[NSMutableSet count](self->_skippedPendingComplicationsItemIds, "count") != 0;
}

- (void)markComplicationAsInstalled
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray removeObject:](self->_orderedPendingComplicationsItemIds, "removeObject:", v3);
    -[NSMutableSet addObject:](self->_installedComplicationIds, "addObject:", v3);
    ++self->_viewedNonInstalledAppCount;
  }
  -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "markComplicationAsInstalled current complication id: %@, nextComplication id: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4)
  {
    -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 3);
  }
  else
  {
    -[NTKGreenfieldAddWatchFaceManager _addToLibraryOrUpdateFaceInLibrary](self, "_addToLibraryOrUpdateFaceInLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v6);
    else
      -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 4);

  }
}

- (void)_startLibraryTimeoutTimer
{
  NSObject *v3;
  void *v4;
  NSTimer *v5;
  NSTimer *libraryTimeoutTimer;
  _QWORD v7[4];
  id v8;
  id buf[2];

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "_startLibraryTimeoutTimer", (uint8_t *)buf, 2u);
  }

  -[NSTimer invalidate](self->_libraryTimeoutTimer, "invalidate");
  objc_initWeak(buf, self);
  v4 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__NTKGreenfieldAddWatchFaceManager__startLibraryTimeoutTimer__block_invoke;
  v7[3] = &unk_1E6BCDE70;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 5.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __61__NTKGreenfieldAddWatchFaceManager__startLibraryTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_libraryTimeoutTimerFired");

}

- (void)_libraryTimeoutTimerFired
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "_libraryTimeoutTimerFired", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)_cancelLibraryTimeoutTimer
{
  NSTimer *libraryTimeoutTimer;

  -[NSTimer invalidate](self->_libraryTimeoutTimer, "invalidate");
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = 0;

}

- (void)faceCollectionDidLoad:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "faceCollectionDidLoad", v5, 2u);
  }

  -[NTKGreenfieldAddWatchFaceManager _cancelLibraryTimeoutTimer](self, "_cancelLibraryTimeoutTimer");
  -[NTKGreenfieldAddWatchFaceManager _moveAndNotifyDelegateToStartStateIfPossible](self, "_moveAndNotifyDelegateToStartStateIfPossible");
}

- (void)_moveAndNotifyDelegateToStartStateIfPossible
{
  uint64_t v3;
  id v4;

  if (-[NTKPersistentFaceCollection hasLoaded](self->_library, "hasLoaded") && self->_decodingState == 3)
  {
    -[NTKGreenfieldAddWatchFaceManager canAddWatchFaceFromDecodedRecipe:toLibrary:](self, "canAddWatchFaceFromDecodedRecipe:toLibrary:", self->_decodedRecipe, self->_library);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (id)v3;
    if (v3)
    {
      self->_decodingState = 0;
      -[NTKGreenfieldAddWatchFaceManager _handleAddWatchFaceManagerDidFinishWithError:](self, "_handleAddWatchFaceManagerDidFinishWithError:", v3);
    }
    else
    {
      -[NTKGreenfieldAddWatchFaceManager _updateUIStateAndNotifyDelegate:](self, "_updateUIStateAndNotifyDelegate:", 1);
    }

  }
}

- (void)_updateUIStateAndNotifyDelegate:(unint64_t)a3
{
  unint64_t uiState;
  _BOOL8 v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id WeakRetained;

  uiState = self->_uiState;
  self->_uiState = a3;
  switch(a3)
  {
    case 0uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "didStartLoadingInAddWatchFaceManager:", self);
      goto LABEL_25;
    case 1uLL:
      if (-[NTKGreenfieldAddWatchFaceManager totalNonInstalledAppCount](self, "totalNonInstalledAppCount"))
        v5 = 0;
      else
        v5 = -[NSMutableSet count](self->_unavailableComplicationsSlots, "count") == 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "addWatchFaceManager:updateStateToWelcomeWithCanAddFaceDirectly:", self, v5);
      goto LABEL_25;
    case 2uLL:
      if (-[NSMutableSet count](self->_unavailableComplicationsNames, "count") == 1)
      {
        v6 = CFSTR("GREENFIELD_COMPLICATION_NOT_AVAILABLE_TITLE");
        v7 = CFSTR("Complication Not Available");
      }
      else
      {
        v6 = CFSTR("GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_TITLE");
        v7 = CFSTR("Complications Not Available");
      }
      NTKClockFaceLocalizedString(v6, v7);
      WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet allObjects](self->_unavailableComplicationsNames, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count") == 1)
      {
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_DESCRIPTION_ONE"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        NTKClockFaceLocalizedString(CFSTR("GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_DESCRIPTION_OTHER"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v20, "removeLastObject");
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v18, v22, v23);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v24 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v24, "addWatchFaceManager:updateStateToComplicationsNotAvailableWithSlots:unavailableTitle:unavailableDescription:", self, self->_unavailableComplicationsSlots, WeakRetained, v21);

      goto LABEL_22;
    case 3uLL:
      -[NTKGreenfieldAddWatchFaceManager _curPendingComplicationItemId](self, "_curPendingComplicationItemId");
      WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      -[NTKGreenfieldAddWatchFaceManager skippedComplicationsSlots](self, "skippedComplicationsSlots");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NSSet containsObject:](self->_locallyAvailableItemIds, "containsObject:", WeakRetained);
      v10 = -[NSSet containsObject:](self->_appsThatRequireUpdatesItemIds, "containsObject:", WeakRetained);
      v11 = 2;
      if (!v10 || !v9)
        v11 = 3;
      if (v10)
        v12 = v11;
      else
        v12 = v9;
      -[NTKGreenfieldAddWatchFaceManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (uiState == 4)
        objc_msgSend(v13, "addWatchFaceManager:updateStateToRevisitComplicationWithItemId:installMode:skippedComplicationSlots:", self, WeakRetained, v12, v8);
      else
        objc_msgSend(v13, "addWatchFaceManager:updateStateToAddComplicationWithItemId:installMode:skippedComplicationSlots:", self, WeakRetained, v12, v8);

LABEL_22:
      goto LABEL_25;
    case 4uLL:
      -[NTKGreenfieldAddWatchFaceManager skippedComplicationsSlots](self, "skippedComplicationsSlots");
      WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      v15 = -[NSMutableSet count](self->_skippedPendingComplicationsItemIds, "count") != 0;
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "addWatchFaceManager:updateStateToCompletedWithSkippedComplicationSlots:canRevisit:", self, WeakRetained, v15);

LABEL_25:
      break;
    default:
      return;
  }
}

- (id)_addToLibraryOrUpdateFaceInLibrary
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  NSUUID *v26;
  NSUUID *addedFaceID;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_addedFaceID)
  {
    -[NTKGreenfieldAddWatchFaceManager canAddWatchFaceFromDecodedRecipe:toLibrary:](self, "canAddWatchFaceFromDecodedRecipe:toLibrary:", self->_decodedRecipe, self->_library);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      return v23;
    if (!self->_addedFaceID)
    {
      -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deepCopy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v25, "origin"))
        objc_msgSend(v25, "setOrigin:", 12);
      -[NTKFaceCollection appendFace:suppressingCallbackToObserver:](self->_library, "appendFace:suppressingCallbackToObserver:", v25, 0);
      -[NTKFaceCollection setSelectedFace:suppressingCallbackToObserver:](self->_library, "setSelectedFace:suppressingCallbackToObserver:", v25, 0);
      -[NTKFaceCollection selectedUUID](self->_library, "selectedUUID");
      v26 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      addedFaceID = self->_addedFaceID;
      self->_addedFaceID = v26;

    }
  }
  -[NTKFaceCollection facesByUUID](self->_library, "facesByUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", self->_addedFaceID);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v32;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "_addFace: face in the decoded recipe: %@", buf, 0xCu);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedComplicationSlots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    v31 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_unavailableComplicationsSlots, "containsObject:", v10))
        {
          +[NTKComplication nullComplication](NTKComplication, "nullComplication");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setComplication:forSlot:", v11, v10);
          goto LABEL_21;
        }
        -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "complicationForSlot:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NTKGreenfieldDecodedRecipe complicationSlotToItemIdMapping](self->_decodedRecipe, "complicationSlotToItemIdMapping");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[NSMutableSet containsObject:](self->_skippedPendingComplicationsItemIds, "containsObject:", v14))
          {
            +[NTKComplication nullComplication](NTKComplication, "nullComplication");
            v15 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setComplication:forSlot:", v15, v10);
            goto LABEL_19;
          }
          if (-[NSMutableSet containsObject:](self->_installedComplicationIds, "containsObject:", v14))
          {
            v15 = v11;
            -[NTKGreenfieldAddWatchFaceManager _appNameFromItemId:](self, "_appNameFromItemId:", v14);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v15, "complication");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:appStoreItemId:appName:](NTKGreenfieldPlaceholderComplication, "placeholderWithComplication:appStoreItemId:appName:", v29, v14, v30);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              +[NTKComplication nullComplication](NTKComplication, "nullComplication");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v32, "setComplication:forSlot:", v16, v10);

LABEL_19:
            v5 = v31;
          }

        }
LABEL_21:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v7);
  }

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v32;
    _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "_addFace: face we are going to add: %@", buf, 0xCu);
  }

  if (objc_msgSend(v32, "editedState") == 2)
  {
    objc_msgSend(v32, "lastEditedDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCreationDate:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCreationDate:", v19);

    objc_msgSend(v32, "setEditedState:", 1);
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __70__NTKGreenfieldAddWatchFaceManager__addToLibraryOrUpdateFaceInLibrary__block_invoke;
  v33[3] = &unk_1E6BD2138;
  v34 = v32;
  v20 = v32;
  objc_msgSend(v20, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v33);
  +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor](NTKGreenfieldCompanionAppInstallationMonitor, "sharedMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleAddFaceManagerDidUpdateFaceLibrary");

  return 0;
}

void __70__NTKGreenfieldAddWatchFaceManager__addToLibraryOrUpdateFaceInLibrary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAddedFromFaceSharing");

}

- (id)canAddWatchFaceFromDecodedRecipe:(id)a3 toLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "watchFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v8 = NTKCanAddWatchFace(v7, v6, &v30);
  v9 = v30;

  if ((v8 & 1) == 0)
  {
    if (v9)
      v15 = objc_msgSend(v9, "code");
    else
      v15 = 0;
    v14 = v9;
    goto LABEL_9;
  }
  objc_msgSend(v5, "watchFace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldSanitizeFaceConfigurationWhenAddingSharedFace");

  if (!v11)
    goto LABEL_10;
  objc_msgSend(v5, "watchFace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v13 = objc_msgSend(v12, "sanitizeFaceConfiguration:", &v29);
  v14 = v29;

  if ((v13 & 1) != 0)
  {
    v9 = v14;
    goto LABEL_10;
  }
  objc_msgSend(v14, "domain");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 == CFSTR("com.apple.nanotimekit.photos"))
  {
    v20 = objc_msgSend(v14, "code");

    if (v20 == 1006)
    {
      v15 = 7;
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v14, "domain");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 != CFSTR("com.apple.nanotimekit.resourceDirectory"))
  {

LABEL_23:
    v15 = 0;
    goto LABEL_9;
  }
  v23 = objc_msgSend(v14, "code");

  if (v23 != 2004)
    goto LABEL_23;
  v15 = 12;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_addWatchFaceErrorWithCode:", v15);
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (v9)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "watchFace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v9, "code");
      objc_msgSend(v5, "watchFace");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v32 = v24;
      v33 = 2112;
      v34 = v25;
      v35 = 2048;
      v36 = v26;
      v37 = 2112;
      v38 = v6;
      v39 = 2112;
      v40 = v5;
      v41 = 2112;
      v42 = v28;
      _os_log_error_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_ERROR, "Failed to add watch face %@, errorMessage %@, errorCode %ld, library %@, decodedRecipe %@, device %@", buf, 0x3Eu);

    }
  }

  return v9;
}

- (id)_appNameFromItemId:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;

  v3 = a3;
  if (v3)
  {
    v25 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", objc_msgSend(v3, "longLongValue"), &v25);
    v5 = v25;
    if (!v4)
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NTKGreenfieldAddWatchFaceManager _appNameFromItemId:].cold.2((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    }
    objc_msgSend(v4, "localizedName");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E6BDC918;
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NTKGreenfieldAddWatchFaceManager _appNameFromItemId:].cold.1(v5, v17, v18, v19, v20, v21, v22, v23);
    v16 = 0;
  }

  return v16;
}

- (void)_queue_fetchInstalledAppsOnWatchWithithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t);
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__29;
  v29 = __Block_byref_object_dispose__29;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor](NTKGreenfieldCompanionAppInstallationMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__NTKGreenfieldAddWatchFaceManager__queue_fetchInstalledAppsOnWatchWithithCompletionBlock___block_invoke;
  v8[3] = &unk_1E6BD4BD0;
  v10 = &v25;
  v11 = &v19;
  v12 = &v13;
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "fetchInstalledAppsOnWatchWithCompletionBlock:", v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4, v26[5], v20[5], v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __91__NTKGreenfieldAddWatchFaceManager__queue_fetchInstalledAppsOnWatchWithithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v18 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_queue_fetchLocallyAvailableAppsWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__29;
  v25 = __Block_byref_object_dispose__29;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29;
  v19 = __Block_byref_object_dispose__29;
  v20 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nrDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke;
  v11[3] = &unk_1E6BD4C48;
  v8 = v4;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  objc_msgSend(v5, "enumerateLocallyAvailableApplicationsForPairedDevice:options:withBlock:", v7, 3, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v9 = (void *)objc_msgSend((id)v22[5], "copy");

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
LABEL_6:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v9 = 0;
    goto LABEL_7;
  }
  if (v6)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke_cold_1((uint64_t)v7, v5, v8);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    goto LABEL_6;
  }
  objc_msgSend((id)v5, "storeMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);

  v9 = 1;
LABEL_7:

  return v9;
}

- (void)_handleAddWatchFaceManagerDidFinishWithError:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_failedError, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "addWatchFaceManager:didFinishAddingFaceWithError:", self, v5);

}

- (id)_analyticsExitScreenNameForCurrentState
{
  unint64_t v2;

  v2 = self->_uiState - 1;
  if (v2 > 3)
    return CFSTR("Loading");
  else
    return off_1E6BD4C68[v2];
}

- (void)handleDidExitAddWatchFaceFlow
{
  NSError *failedError;
  void *v4;
  void *v5;
  id v6;

  failedError = self->_failedError;
  -[NTKGreenfieldAddWatchFaceManager _analyticsModelForAddFaceEvents](self, "_analyticsModelForAddFaceEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (failedError)
  {
    objc_msgSend(v4, "setError:", self->_failedError);
    NTKSubmitAnalyticsForErrorAddFaceFlow(v6);
  }
  else if (self->_addedFaceID)
  {
    NTKSubmitAnalyticsForAddSharedFace(v4);
  }
  else
  {
    -[NTKGreenfieldAddWatchFaceManager _analyticsExitScreenNameForCurrentState](self, "_analyticsExitScreenNameForCurrentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAddFaceFlowExitScreenName:", v5);

    NTKSubmitAnalyticsForExitAddSharedFaceFlow(v6);
  }

}

- (id)_analyticsModelForAddFaceEvents
{
  NTKGreenfieldAnalyticsModel *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(NTKGreenfieldAnalyticsModel);
  -[NTKGreenfieldDecodedRecipe watchFace](self->_decodedRecipe, "watchFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldAnalyticsModel setWatchFace:](v3, "setWatchFace:", v4);

  -[NTKGreenfieldAnalyticsModel setPurchasedComplicationsItemIds:](v3, "setPurchasedComplicationsItemIds:", self->_installedComplicationIds);
  -[NTKGreenfieldAnalyticsModel setSkippedComplicationsItemIds:](v3, "setSkippedComplicationsItemIds:", self->_skippedPendingComplicationsItemIds);
  -[NTKGreenfieldDecodedRecipe complicationSlotToItemIdMapping](self->_decodedRecipe, "complicationSlotToItemIdMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldAnalyticsModel setComplicationSlotToIdMapping:](v3, "setComplicationSlotToIdMapping:", v5);

  -[NTKGreenfieldAnalyticsModel setDistributionMechanism:](v3, "setDistributionMechanism:", self->_sourceApplicationBundleIdentifier);
  return v3;
}

- (NTKGreenfieldDecodedRecipe)decodedRecipe
{
  return self->_decodedRecipe;
}

- (NTKGreenfieldAddWatchFaceManagerDelegate)delegate
{
  return (NTKGreenfieldAddWatchFaceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)remainingAppsToInstallCount
{
  return self->_remainingAppsToInstallCount;
}

- (int64_t)viewedNonInstalledAppCount
{
  return self->_viewedNonInstalledAppCount;
}

- (int64_t)totalNonInstalledAppCount
{
  return self->_totalNonInstalledAppCount;
}

- (NSUUID)addedFaceID
{
  return self->_addedFaceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedFaceID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unavailableComplicationsNames, 0);
  objc_storeStrong((id *)&self->_unavailableComplicationsSlots, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appsThatRequireUpdatesItemIds, 0);
  objc_storeStrong((id *)&self->_locallyAvailableItemIds, 0);
  objc_storeStrong((id *)&self->_installedComplicationIds, 0);
  objc_storeStrong((id *)&self->_skippedPendingComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_orderedPendingComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_failedError, 0);
  objc_storeStrong((id *)&self->_libraryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_decodedRecipe, 0);
}

- (void)decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:.cold.1()
{
  __assert_rtn("-[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:]", "NTKGreenfieldAddWatchFaceManager.m", 187, "_decodingState == NTKGreenfieldAddWatchFaceDecodingStateIdle || _decodingState == NTKGreenfieldAddWatchFaceDecodingStateCompleted");
}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "decode watch face device is nil URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "paired device is tinker", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Cannot add watch face! Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_appNameFromItemId:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "_appNameFromItemId: itemId is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)_appNameFromItemId:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "Could not fine app record for item id %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "_queue_fetchLocallyAvailableAppsWithError: error: %@, app: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
