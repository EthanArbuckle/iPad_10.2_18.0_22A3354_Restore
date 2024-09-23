@implementation CSFocusActivityManager

- (CSFocusActivityManager)initWithItemDestination:(id)a3
{
  id v5;
  CSFocusActivityManager *v6;
  CSFocusActivityManager *v7;
  CSFocusActivityViewController *v8;
  CSFocusActivityViewController *focusActivityViewController;
  uint64_t Serial;
  OS_dispatch_queue *activityManagerQueue;
  uint64_t v12;
  FCActivityManager *activityManager;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFocusActivityManager;
  v6 = -[CSFocusActivityManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemDestination, a3);
    v8 = objc_alloc_init(CSFocusActivityViewController);
    focusActivityViewController = v7->_focusActivityViewController;
    v7->_focusActivityViewController = v8;

    -[CSFocusActivityViewController setDelegate:](v7->_focusActivityViewController, "setDelegate:", v7);
    -[CSFocusActivityManager _addOrUpdateFocusActivityIndicatorItemIfNecessary](v7, "_addOrUpdateFocusActivityIndicatorItemIfNecessary");
    Serial = BSDispatchQueueCreateSerial();
    activityManagerQueue = v7->_activityManagerQueue;
    v7->_activityManagerQueue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x1E0D22368], "sharedActivityManager");
    v12 = objc_claimAutoreleasedReturnValue();
    activityManager = v7->_activityManager;
    v7->_activityManager = (FCActivityManager *)v12;

    -[FCActivityManager addObserver:](v7->_activityManager, "addObserver:", v7);
    -[CSFocusActivityManager _updateFocusActivityIndicator](v7, "_updateFocusActivityIndicator");
  }

  return v7;
}

- (void)focusActivityViewIndicatorDidChangeToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CSAdjunctListItem *focusActivityItem;
  id v7;

  v3 = a3;
  -[CSFocusActivityManager delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSFocusActivityManager _activityForDisplayInIndicator](self, "_activityForDisplayInIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CSItemDestination removeItemForIdentifier:](self->_itemDestination, "removeItemForIdentifier:", CFSTR("focus activity identifier"));
    focusActivityItem = self->_focusActivityItem;
    self->_focusActivityItem = 0;

  }
  objc_msgSend(v7, "focusActivityIndicatorDidChangeToVisible:", v3);

}

- (void)activeActivityDidChangeForManager:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_activityManager == a3)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "Active focus activity did change...", v5, 2u);
    }

    -[CSFocusActivityManager _addOrUpdateFocusActivityIndicatorItemIfNecessary](self, "_addOrUpdateFocusActivityIndicatorItemIfNecessary");
    -[CSFocusActivityManager _updateFocusActivityIndicator](self, "_updateFocusActivityIndicator");
  }
}

- (void)availableActivitiesDidChangeForManager:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_activityManager == a3)
  {
    SBLogDashBoard();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "Available focus activities did change...", v5, 2u);
    }

    -[CSFocusActivityManager _updateFocusActivityIndicator](self, "_updateFocusActivityIndicator");
  }
}

- (BOOL)isFocusActivityIndicatorVisible
{
  return (CSAutobahnEnabledForPlatform() & 1) == 0
      && -[CSFocusActivityViewController isActivityIndicatorVisible](self->_focusActivityViewController, "isActivityIndicatorVisible");
}

- (void)presentFocusActivityPickerViewControllerFromView:(id)a3 coverSheetViewPresenting:(id)a4
{
  -[CSFocusActivityViewController presentFocusActivityPickerViewControllerFromView:coverSheetViewPresenting:](self->_focusActivityViewController, "presentFocusActivityPickerViewControllerFromView:coverSheetViewPresenting:", a3, a4);
}

- (void)_addOrUpdateFocusActivityIndicatorItemIfNecessary
{
  void *v3;
  CSAdjunctListItem *focusActivityItem;
  CSAdjunctListItem *v5;
  CSAdjunctListItem *v6;

  -[CSFocusActivityManager _activityForDisplayInIndicator](self, "_activityForDisplayInIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    focusActivityItem = self->_focusActivityItem;
    if (!focusActivityItem)
    {
      v5 = -[CSAdjunctListItem initWithIdentifier:]([CSAdjunctListItem alloc], "initWithIdentifier:", CFSTR("focus activity identifier"));
      -[CSAdjunctListItem setAnimatePresentation:](v5, "setAnimatePresentation:", 0);
      -[CSAdjunctListItem setContentHost:](v5, "setContentHost:", self->_focusActivityViewController);
      v6 = self->_focusActivityItem;
      self->_focusActivityItem = v5;

      focusActivityItem = self->_focusActivityItem;
    }
    -[CSItemDestination addOrUpdateItem:](self->_itemDestination, "addOrUpdateItem:", focusActivityItem);
  }
}

- (id)_activityForDisplayInIndicator
{
  void *v3;

  if ((CSAutobahnEnabledForPlatform() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[FCActivityManager activeActivity](self->_activityManager, "activeActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateFocusActivityIndicator
{
  NSObject *activityManagerQueue;
  _QWORD block[5];

  activityManagerQueue = self->_activityManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke;
  block[3] = &unk_1E8E2DB38;
  block[4] = self;
  dispatch_async(activityManagerQueue, block);
}

void __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activityForDisplayInIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogDashBoard();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1D0337000, v3, OS_LOG_TYPE_DEFAULT, "Setting focus activity: %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke_5;
  v5[3] = &unk_1E8E2DC00;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __55__CSFocusActivityManager__updateFocusActivityIndicator__block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setActivity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusActivityIndicatorDidChangeToVisible:", objc_msgSend(*(id *)(a1 + 32), "isFocusActivityIndicatorVisible"));

}

- (CSFocusActivityDelegate)delegate
{
  return (CSFocusActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusActivityItem, 0);
  objc_storeStrong((id *)&self->_focusActivityViewController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_activityManagerQueue, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_itemDestination, 0);
}

@end
