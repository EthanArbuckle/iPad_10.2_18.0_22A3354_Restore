@implementation _SFPrintController

- (BOOL)isDisplayingPrintUI
{
  return self->_isDisplayingPrintInteractionController;
}

- (void)dismissPrintInteractionControllerAnimated:(BOOL)a3
{
  -[UIPrintInteractionController dismissAnimated:](self->_printInteractionController, "dismissAnimated:", a3);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void)setReaderController:(id)a3
{
  objc_storeWeak((id *)&self->_readerController, a3);
}

- (void)setDialogPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_dialogPresenter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_SFPrintController)init
{
  _SFPrintController *v2;
  uint64_t v3;
  NSMutableArray *printQueue;
  UIPrintInteractionController *v5;
  UIPrintInteractionController *printInteractionController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFPrintController;
  v2 = -[_SFPrintController init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  printQueue = v2->_printQueue;
  v2->_printQueue = (NSMutableArray *)v3;

  v5 = (UIPrintInteractionController *)objc_alloc_init(MEMORY[0x1E0CEA8D0]);
  printInteractionController = v2->_printInteractionController;
  v2->_printInteractionController = v5;

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_SFPrintController clearQueue](self, "clearQueue");
  v3.receiver = self;
  v3.super_class = (Class)_SFPrintController;
  -[_SFPrintController dealloc](&v3, sel_dealloc);
}

- (void)_preparePrintInteractionControllerForUsage:(int64_t)a3 onlyIfLoaded:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  id WeakRetained;
  char v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _SFPrintController *v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35[2];
  id location[2];

  v5 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(WeakRetained, "printControllerPageIsLoading:", self);
  v11 = objc_msgSend(WeakRetained, "printControllerShouldPrintReader:", self);
  v12 = objc_loadWeakRetained((id *)&self->_readerController);
  v13 = v12;
  if (!v5 || (v10 & 1) == 0 && (!v11 || !objc_msgSend(v12, "isLoadingNextPage")))
  {
    -[_SFPrintController printRenderer](self, "printRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)&self->_webView);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke_2;
    v25 = &unk_1E4AC1940;
    v16 = v14;
    v26 = v16;
    v27 = self;
    v17 = v15;
    v28 = v17;
    v32 = v11;
    v18 = v13;
    v29 = v18;
    v30 = v8;
    v31 = a3;
    v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](&v22);
    if (a3 != 2)
    {
      -[SFPrintQueueItem frameHandle](self->_currentItem, "frameHandle", v22, v23, v24, v25, v26, v27, v28, v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[SFPrintQueueItem frameHandle](self->_currentItem, "frameHandle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v19)[2](v19, v21);

        goto LABEL_12;
      }
      if (v11)
      {
        objc_msgSend(v18, "prepareReaderPrintingIFrameWithCompletion:", v19);
        goto LABEL_12;
      }
    }
    v19[2](v19, 0);
LABEL_12:

    goto LABEL_13;
  }
  objc_initWeak(location, self);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke;
  v33[3] = &unk_1E4AC1918;
  v34 = v8;
  objc_copyWeak(v35, location);
  v35[1] = (id)a3;
  -[_SFPrintController _shouldPrintWhileLoadingForUsage:completionHandler:](self, "_shouldPrintWhileLoadingForUsage:completionHandler:", a3, v33);
  objc_destroyWeak(v35);

  objc_destroyWeak(location);
LABEL_13:

}

- (void)_printCurrentItem
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  -[_SFPrintController updatePrintInfo](self, "updatePrintInfo");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39___SFPrintController__printCurrentItem__block_invoke;
  v3[3] = &unk_1E4AC1990;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  -[_SFPrintController preparePrintInteractionControllerForUsage:completion:](self, "preparePrintInteractionControllerForUsage:completion:", 0, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_didFinishPrintingCurrentItemWithResult:(int64_t)a3 fromPrintInteractionControllerCompletion:(BOOL)a4
{
  _BOOL4 v4;
  SFPrintQueueItem *v7;
  SFPrintQueueItem *currentItem;
  SFPrintPageRenderer *cachedPrintPageRenderer;
  _QWORD block[4];
  SFPrintQueueItem *v11;
  _SFPrintController *v12;
  int64_t v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a4;
  if (a4 && !self->_currentItem)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke;
    v14[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!a3)
      self->_suppressingPrintUI = 0;
    v7 = self->_currentItem;
    currentItem = self->_currentItem;
    self->_currentItem = 0;

    cachedPrintPageRenderer = self->_cachedPrintPageRenderer;
    self->_cachedPrintPageRenderer = 0;

    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke_2;
      block[3] = &unk_1E4AC19B8;
      v12 = self;
      v13 = a3;
      v11 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      -[SFPrintQueueItem completeWithResult:](v7, "completeWithResult:", a3);
      -[_SFPrintController handleNextPrintRequest](self, "handleNextPrintRequest");
    }

  }
}

- (BOOL)_isContentManaged
{
  void *v3;
  id WeakRetained;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isURLManaged:", v5);

  return v6;
}

- (void)_shouldPrintWhileLoadingForUsage:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a4;
  if ((unint64_t)a3 > 2)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, self->_loadingDialogTitle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_dialogPresenter);
  objc_msgSend(MEMORY[0x1E0D4EC60], "continuePrintingDialogWithTitle:message:applicationModal:completionHandler:", v8, v9, self->_hasSetupPrintController, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentDialog:sender:", v11, self);

}

- (void)_shouldAllowBlockedPrintWithCompletionHandler:(id)a3
{
  SFDialogPresenting **p_dialogPresenter;
  id v5;
  void *v6;
  id WeakRetained;

  p_dialogPresenter = &self->_dialogPresenter;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dialogPresenter);
  objc_msgSend(MEMORY[0x1E0D4EC60], "printBlockedDialogWithCompletionHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "presentDialog:sender:", v6, self);
}

- (void)_enqueuePrintItem:(id)a3
{
  NSMutableArray *printQueue;
  id v5;

  printQueue = self->_printQueue;
  v5 = a3;
  if ((unint64_t)-[NSMutableArray count](printQueue, "count") < 0xA)
  {
    -[NSMutableArray addObject:](self->_printQueue, "addObject:", v5);

    -[_SFPrintController handleNextPrintRequest](self, "handleNextPrintRequest");
  }
  else
  {
    objc_msgSend(v5, "completeWithResult:", 2);

  }
}

- (id)_dequeuePrintItem
{
  void *v3;

  if (-[NSMutableArray count](self->_printQueue, "count"))
  {
    -[NSMutableArray firstObject](self->_printQueue, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_printQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)printFrame:(id)a3 initiatedByWebContent:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  SFPrintQueueItem *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[SFPrintQueueItem initWithFrameHandle:initiatedByWebContent:completionHandler:]([SFPrintQueueItem alloc], "initWithFrameHandle:initiatedByWebContent:completionHandler:", v9, v5, v8);

  -[_SFPrintController _enqueuePrintItem:](self, "_enqueuePrintItem:", v10);
}

- (void)getPDFDataForUsage:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  BOOL hasSetupPrintController;
  uint64_t v8;
  id v9;
  dispatch_time_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD v28[3];
  char v29;

  v6 = a4;
  hasSetupPrintController = self->_hasSetupPrintController;
  if (hasSetupPrintController || -[_SFPrintController setUpPrintController](self, "setUpPrintController"))
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke;
    v24[3] = &unk_1E4AC19E0;
    v25 = v6;
    v26 = v28;
    v27 = !hasSetupPrintController;
    v24[4] = self;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_23;
    v22[3] = &unk_1E4AC1A58;
    v9 = (id)MEMORY[0x1A8598C40](v24);
    v22[4] = self;
    v23 = v9;
    -[_SFPrintController preparePrintInteractionControllerForUsage:completion:](self, "preparePrintInteractionControllerForUsage:completion:", a3, v22);
    v10 = dispatch_time(0, 5000000000);
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_27;
    v19[3] = &unk_1E4AC1A80;
    v21 = v28;
    v6 = v9;
    v20 = v6;
    dispatch_after(v10, MEMORY[0x1E0C80D38], v19);

    _Block_object_dispose(v28, 8);
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_SFPrintController getPDFDataForUsage:withCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)handleNextPrintRequest
{
  id WeakRetained;
  int v4;
  SFPrintQueueItem *v5;
  SFPrintQueueItem *currentItem;
  SFPrintQueueItem *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_isDisplayingPrintInteractionController && !self->_currentItem)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_msgSend(WeakRetained, "printControllerCanPresentPrintUI:", self);

    if (v4)
    {
      -[_SFPrintController _dequeuePrintItem](self, "_dequeuePrintItem");
      v5 = (SFPrintQueueItem *)objc_claimAutoreleasedReturnValue();
      currentItem = self->_currentItem;
      self->_currentItem = v5;

      v7 = self->_currentItem;
      if (v7)
      {
        if (-[SFPrintQueueItem initiatedByWebContent](v7, "initiatedByWebContent"))
        {
          if (self->_suppressingPrintUI)
          {
            objc_initWeak(&location, self);
            v8[0] = MEMORY[0x1E0C809B0];
            v8[1] = 3221225472;
            v8[2] = __44___SFPrintController_handleNextPrintRequest__block_invoke;
            v8[3] = &unk_1E4AC1AA8;
            objc_copyWeak(&v9, &location);
            -[_SFPrintController _shouldAllowBlockedPrintWithCompletionHandler:](self, "_shouldAllowBlockedPrintWithCompletionHandler:", v8);
            objc_destroyWeak(&v9);
            objc_destroyWeak(&location);
            return;
          }
          self->_suppressingPrintUI = 1;
        }
        -[_SFPrintController _printCurrentItem](self, "_printCurrentItem");
      }
    }
  }
}

- (void)resetPrintUISuppression
{
  self->_suppressingPrintUI = 0;
}

- (void)clearQueue
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  NSMutableArray *printQueue;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = self->_printQueue;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  printQueue = self->_printQueue;
  self->_printQueue = v4;

  if (self->_hasSetupPrintController)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v3;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "completeWithResult:", 2);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v8);
    }
  }
  else
  {
    if (self->_currentItem)
    {
      if (!self->_isDisplayingPrintInteractionController
        || (-[UIPrintInteractionController dismissAnimated:](self->_printInteractionController, "dismissAnimated:", 1),
            self->_currentItem))
      {
        -[_SFPrintController _didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:](self, "_didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:", 2, 0);
      }
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v3;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "completeWithResult:", 2, (_QWORD)v16);
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }
  }

}

- (SFPrintPageRenderer)printRenderer
{
  SFPrintPageRenderer *cachedPrintPageRenderer;
  SFPrintPageRenderer *v4;
  SFPrintPageRenderer *v5;

  cachedPrintPageRenderer = self->_cachedPrintPageRenderer;
  if (!cachedPrintPageRenderer)
  {
    v4 = objc_alloc_init(SFPrintPageRenderer);
    v5 = self->_cachedPrintPageRenderer;
    self->_cachedPrintPageRenderer = v4;

    -[SFPrintPageRenderer setDelegate:](self->_cachedPrintPageRenderer, "setDelegate:", self);
    cachedPrintPageRenderer = self->_cachedPrintPageRenderer;
  }
  return cachedPrintPageRenderer;
}

- (NSString)suggestedPDFFileName
{
  -[_SFPrintController updatePrintInfo](self, "updatePrintInfo");
  return self->_pageTitle;
}

- (UIPrintInfo)printInfo
{
  UIPrintInfo *cachedPrintInfo;

  cachedPrintInfo = self->_cachedPrintInfo;
  if (!cachedPrintInfo)
  {
    -[_SFPrintController updatePrintInfo](self, "updatePrintInfo");
    cachedPrintInfo = self->_cachedPrintInfo;
  }
  return cachedPrintInfo;
}

- (void)updatePrintInfo
{
  id v3;
  NSString *urlString;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *pageTitle;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *loadingDialogTitle;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  UIPrintInfo *v26;
  UIPrintInfo *cachedPrintInfo;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v3 = objc_loadWeakRetained((id *)&self->_delegate);
  urlString = self->_urlString;
  self->_urlString = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "URLStringForPrintController:", self);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlString;
    self->_urlString = v5;

  }
  v7 = self->_urlString;
  if (v7)
  {
    v8 = v7;
    v9 = self->_urlString;
    self->_urlString = v8;
  }
  else
  {
    objc_msgSend(WeakRetained, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_userVisibleString");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_urlString;
    self->_urlString = v10;

  }
  pageTitle = self->_pageTitle;
  self->_pageTitle = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "pageTitleForPrintController:", self);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_pageTitle;
    self->_pageTitle = v13;

  }
  v15 = self->_pageTitle;
  if (v15)
  {
    v16 = v15;
  }
  else
  {
    objc_msgSend(WeakRetained, "title");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v17 = self->_pageTitle;
  self->_pageTitle = v16;

  -[NSString safari_filenameByFixingIllegalCharacters](self->_pageTitle, "safari_filenameByFixingIllegalCharacters");
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  v19 = self->_pageTitle;
  self->_pageTitle = v18;

  loadingDialogTitle = self->_loadingDialogTitle;
  self->_loadingDialogTitle = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "loadingDialogPageTitleForPrintController:", self);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    v22 = self->_loadingDialogTitle;
    self->_loadingDialogTitle = v21;

  }
  v23 = self->_loadingDialogTitle;
  if (v23 || (v23 = self->_pageTitle) != 0)
  {
    v24 = v23;
  }
  else
  {
    objc_msgSend(WeakRetained, "title");
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v25 = self->_loadingDialogTitle;
  self->_loadingDialogTitle = v24;

  objc_msgSend(MEMORY[0x1E0CEA8C8], "printInfo");
  v26 = (UIPrintInfo *)objc_claimAutoreleasedReturnValue();
  cachedPrintInfo = self->_cachedPrintInfo;
  self->_cachedPrintInfo = v26;

  -[UIPrintInfo setJobName:](self->_cachedPrintInfo, "setJobName:", self->_pageTitle);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "printController:didCreatePrintInfo:", self, self->_cachedPrintInfo);

}

- (BOOL)setUpPrintController
{
  BOOL result;
  SFPrintQueueItem *v4;
  SFPrintQueueItem *currentItem;

  if (self->_isDisplayingPrintInteractionController || self->_currentItem)
    return 0;
  v4 = -[SFPrintQueueItem initWithFrameHandle:initiatedByWebContent:completionHandler:]([SFPrintQueueItem alloc], "initWithFrameHandle:initiatedByWebContent:completionHandler:", 0, 0, 0);
  currentItem = self->_currentItem;
  self->_currentItem = v4;

  result = 1;
  self->_hasSetupPrintController = 1;
  return result;
}

- (void)preparePrintInteractionControllerForUsage:(int64_t)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[_SFPrintController printInfo](self, "printInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintInteractionController setPrintInfo:](self->_printInteractionController, "setPrintInfo:", v6);

  -[_SFPrintController _preparePrintInteractionControllerForUsage:onlyIfLoaded:completion:](self, "_preparePrintInteractionControllerForUsage:onlyIfLoaded:completion:", a3, 1, v7);
}

- (void)printInteractionControllerDidFinish
{
  _BOOL4 isDisplayingPrintInteractionController;
  BOOL suppressingPrintUI;

  self->_hasSetupPrintController = 0;
  isDisplayingPrintInteractionController = self->_isDisplayingPrintInteractionController;
  suppressingPrintUI = self->_suppressingPrintUI;
  if (self->_isDisplayingPrintInteractionController)
    self->_isDisplayingPrintInteractionController = 0;
  -[_SFPrintController _didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:](self, "_didFinishPrintingCurrentItemWithResult:fromPrintInteractionControllerCompletion:", 0, isDisplayingPrintInteractionController);
  self->_suppressingPrintUI = suppressingPrintUI;
}

- (id)presentingViewControllerForPrintPageRenderer:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentingViewControllerForPrintController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)printInteractionControllerParentViewController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentingViewControllerForPrintController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (_SFReaderController)readerController
{
  return (_SFReaderController *)objc_loadWeakRetained((id *)&self->_readerController);
}

- (SFDialogPresenting)dialogPresenter
{
  return (SFDialogPresenting *)objc_loadWeakRetained((id *)&self->_dialogPresenter);
}

- (_SFPrintControllerDelegate)delegate
{
  return (_SFPrintControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIPrintInteractionController)printInteractionController
{
  return self->_printInteractionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printInteractionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dialogPresenter);
  objc_destroyWeak((id *)&self->_readerController);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_printQueue, 0);
  objc_storeStrong((id *)&self->_loadingDialogTitle, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_cachedPrintPageRenderer, 0);
  objc_storeStrong((id *)&self->_cachedPrintInfo, 0);
}

- (void)getPDFDataForUsage:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to set up print controller, returning nil PDF data", a5, a6, a7, a8, 0);
}

@end
