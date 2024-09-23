@implementation SFBrowserDocumentTrackerInfo

- (SFBrowserDocumentTrackerInfo)initWithDocument:(id)a3
{
  id v4;
  SFBrowserDocumentTrackerInfo *v5;
  SFBrowserDocumentTrackerInfo *v6;
  WBSQueryParameterFilteringDataQueue *v7;
  WBSQueryParameterFilteringDataQueue *queryParameterFilteringDataQueue;
  void *v9;
  SFBrowserDocumentTrackerInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFBrowserDocumentTrackerInfo;
  v5 = -[SFBrowserDocumentTrackerInfo init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v6->_cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled");
    v7 = (WBSQueryParameterFilteringDataQueue *)objc_alloc_init(MEMORY[0x1E0D8AB48]);
    queryParameterFilteringDataQueue = v6->_queryParameterFilteringDataQueue;
    v6->_queryParameterFilteringDataQueue = v7;

    -[SFBrowserDocumentTrackerInfo _resetKnownTrackingThirdParties](v6, "_resetKnownTrackingThirdParties");
    objc_msgSend(MEMORY[0x1E0C99EA0], "webui_defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v6, *MEMORY[0x1E0DD9958], 0, kvoContext);

    v10 = v6;
  }

  return v6;
}

+ (BOOL)trackingPreventionEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "webui_trackerProtectionEnabled");

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "webui_defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0DD9958], kvoContext);

  v4.receiver = self;
  v4.super_class = (Class)SFBrowserDocumentTrackerInfo;
  -[SFBrowserDocumentTrackerInfo dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kvoContext == a6 && objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DD9958]))
  {
    -[SFBrowserDocumentTrackerInfo _flushKnownTrackingThirdParties](self, "_flushKnownTrackingThirdParties");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFBrowserDocumentTrackerInfo;
    -[SFBrowserDocumentTrackerInfo observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  self->_cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled");
  -[SFBrowserDocumentTrackerInfo _updateKnownTrackingThirdPartiesWithCompletionHandler:](self, "_updateKnownTrackingThirdPartiesWithCompletionHandler:", v4);

}

- (void)documentDidCommitNavigation
{
  NSDate *v3;
  NSDate *lastNavigationCommitDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastNavigationCommitDate = self->_lastNavigationCommitDate;
  self->_lastNavigationCommitDate = v3;

  -[SFBrowserDocumentTrackerInfo _resetKnownTrackingThirdParties](self, "_resetKnownTrackingThirdParties");
  -[WBSQueryParameterFilteringDataQueue commitPendingData](self->_queryParameterFilteringDataQueue, "commitPendingData");
}

- (void)_updateKnownTrackingThirdPartiesWithCompletionHandler:(id)a3
{
  id v4;
  BOOL cachedTrackingPreventionEnabled;
  void *v6;
  id WeakRetained;
  void *v8;
  NSDate *lastNavigationCommitDate;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a3;
  cachedTrackingPreventionEnabled = self->_cachedTrackingPreventionEnabled;
  v6 = (void *)MEMORY[0x1E0D8AB00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  objc_msgSend(WeakRetained, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  lastNavigationCommitDate = self->_lastNavigationCommitDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SFBrowserDocumentTrackerInfo__updateKnownTrackingThirdPartiesWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E4AC1B70;
  v14 = cachedTrackingPreventionEnabled;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v6, "getKnownTrackingDomainsForWebView:after:before:completionHandler:", v8, lastNavigationCommitDate, v10, v12);

}

void __86__SFBrowserDocumentTrackerInfo__updateKnownTrackingThirdPartiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v5 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  v8 = objc_msgSend(WeakRetained, "privacyReportShouldSeparateBlockedTrackers");

  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    objc_msgSend(*(id *)(v9 + 40), "setByAddingObjectsFromArray:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    objc_msgSend(*(id *)(v9 + 48), "setByAddingObjectsFromArray:", v6);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v13;
  }

  v15 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(v15 + 48), "setByAddingObjectsFromArray:", v21);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 48);
    *(_QWORD *)(v17 + 48) = v16;
  }
  else
  {
    objc_msgSend(*(id *)(v15 + 32), "setByAddingObjectsFromArray:", v21);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v20 + 32);
    *(_QWORD *)(v20 + 32) = v19;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_resetKnownTrackingThirdParties
{
  NSSet *v3;
  NSSet *allowedKnownTrackingThirdParties;
  NSSet *v5;
  NSSet *blockedKnownTrackingThirdParties;
  NSSet *v7;
  NSSet *preventedKnownTrackingThirdParties;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allowedKnownTrackingThirdParties = self->_allowedKnownTrackingThirdParties;
  self->_allowedKnownTrackingThirdParties = v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  blockedKnownTrackingThirdParties = self->_blockedKnownTrackingThirdParties;
  self->_blockedKnownTrackingThirdParties = v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  preventedKnownTrackingThirdParties = self->_preventedKnownTrackingThirdParties;
  self->_preventedKnownTrackingThirdParties = v7;

}

- (void)_flushKnownTrackingThirdParties
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke;
  v3[3] = &unk_1E4ABFE00;
  v3[4] = self;
  -[SFBrowserDocumentTrackerInfo _updateKnownTrackingThirdPartiesWithCompletionHandler:](self, "_updateKnownTrackingThirdPartiesWithCompletionHandler:", v3);
  self->_cachedTrackingPreventionEnabled = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled](SFBrowserDocumentTrackerInfo, "trackingPreventionEnabled");
}

void __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke_2;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__SFBrowserDocumentTrackerInfo__flushKnownTrackingThirdParties__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v2 = v5;
  if (v5)
  {
    objc_msgSend(v5, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "websiteDataStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_clearLoadedSubresourceDomainsFor:", v5);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_clearLoadedThirdPartyDomainsFor:", v5);
    }

    v2 = v5;
  }

}

- (_SFBrowserDocument)document
{
  return (_SFBrowserDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (NSSet)allowedKnownTrackingThirdParties
{
  return self->_allowedKnownTrackingThirdParties;
}

- (NSSet)blockedKnownTrackingThirdParties
{
  return self->_blockedKnownTrackingThirdParties;
}

- (NSSet)preventedKnownTrackingThirdParties
{
  return self->_preventedKnownTrackingThirdParties;
}

- (WBSQueryParameterFilteringDataQueue)queryParameterFilteringDataQueue
{
  return self->_queryParameterFilteringDataQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParameterFilteringDataQueue, 0);
  objc_storeStrong((id *)&self->_preventedKnownTrackingThirdParties, 0);
  objc_storeStrong((id *)&self->_blockedKnownTrackingThirdParties, 0);
  objc_storeStrong((id *)&self->_allowedKnownTrackingThirdParties, 0);
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_lastNavigationCommitDate, 0);
}

@end
