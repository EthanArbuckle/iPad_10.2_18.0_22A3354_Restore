@implementation HUTriggerActionEditorContentViewController

- (HUTriggerActionEditorContentViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 effectiveNavigationItem:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  HUTriggerBuilderItem *v14;
  HUServiceGridItemManager *v15;
  void *v16;
  HUServiceGridItemManager *v17;
  HUTriggerActionEditorContentViewController *v18;
  HUTriggerActionEditorContentViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v27 = a5;
  v13 = a6;
  v14 = -[HUTriggerBuilderItem initWithTriggerBuilder:nameType:]([HUTriggerBuilderItem alloc], "initWithTriggerBuilder:nameType:", v11, 2);
  v15 = [HUServiceGridItemManager alloc];
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUTriggerActionEditorContentViewController, "defaultItemProviderCreatorWithOptions:", 29);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HUServiceGridItemManager initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:](v15, "initWithDelegate:sourceItem:shouldGroupByRoom:shouldShowSectionHeaders:itemProvidersCreator:", self, v14, 1, 1, v16);

  v28.receiver = self;
  v28.super_class = (Class)HUTriggerActionEditorContentViewController;
  v18 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v28, sel_initWithServiceGridItemManager_, v17);
  v19 = v18;
  if (v18)
  {
    -[HUServiceGridViewController setDelegate:](v18, "setDelegate:", v13);
    objc_storeStrong((id *)&v19->_triggerBuilder, a3);
    objc_storeStrong((id *)&v19->_flow, a4);
    objc_storeStrong((id *)&v19->_effectiveNavigationItem, a5);
    objc_msgSend(v11, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 || !v20)
    {
      objc_msgSend(v11, "naturalLanguageNameOfType:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setName:", v21);

      objc_msgSend(v11, "naturalLanguageNameOfType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDisplayName:", v22);

      objc_msgSend(v11, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("HUTriggerActionEditorContentViewController.m"), 72, CFSTR("Could not generate name for triggerBuilder: %@"), v11);

      }
    }
  }

  return v19;
}

- (HUTriggerActionEditorContentViewController)initWithServiceGridItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTriggerBuilder_flow_effectiveNavigationItem_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerActionEditorContentViewController.m"), 81, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerActionEditorContentViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUServiceGridViewController viewDidLoad](&v12, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonTitle:", v3);

  -[HUTriggerActionEditorContentViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setShouldDeriveVisibleBoundsFromContainingScrollView:", 1);

  -[HUTriggerActionEditorContentViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", 0);

  -[HUTriggerActionEditorContentViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUServiceGridViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[HUTriggerActionEditorContentViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingDismissed");

  if ((v5 & 1) == 0)
  {
    -[HUTriggerActionEditorContentViewController _setUpNavButtons](self, "_setUpNavButtons");
    -[HUTriggerActionEditorContentViewController _updateSelectedServicesAndActionSets](self, "_updateSelectedServicesAndActionSets");
  }
}

- (void)_setUpNavButtons
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUTriggerActionEditorContentViewController flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStandalone"))
  {

  }
  else
  {
    -[HUTriggerActionEditorContentViewController flow](self, "flow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSingleFlow");

    if (!v5)
      goto LABEL_5;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

LABEL_5:
  -[HUTriggerActionEditorContentViewController flow](self, "flow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLastState");

  v10 = objc_alloc(MEMORY[0x1E0CEA380]);
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_msgSend(v10, "initWithBarButtonSystemItem:target:action:", 0, self, sel__next_);
    -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorNextButton"), CFSTR("HUTriggerActionEditorNextButton"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 2, self, sel__next_);
    -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", v13);

  }
  -[HUTriggerActionEditorContentViewController _validateDoneButton](self, "_validateDoneButton");
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUServiceGridViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

}

- (void)_next:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v4 = a3;
  -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v7);
  -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  objc_msgSend(v7, "startAnimating");
  -[HUTriggerActionEditorContentViewController _triggerBuilderFuture](self, "_triggerBuilderFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke;
  v20[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v22, &location);
  v12 = v6;
  v21 = v12;
  v13 = (id)objc_msgSend(v10, "addCompletionBlock:", v20);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_2;
  v18[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v19, &location);
  v14 = (id)objc_msgSend(v10, "addFailureBlock:", v18);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_4;
  v16[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v17, &location);
  v15 = (id)objc_msgSend(v10, "addSuccessBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "triggerBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerEditor:didCommitTriggerBuilder:withError:", WeakRetained, v8, v11);

  }
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "effectiveNavigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_3;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __52__HUTriggerActionEditorContentViewController__next___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_next:", 0);
}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "flow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getNextState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isFinished"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "triggerBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "triggerEditor:didFinishWithTriggerBuilder:", WeakRetained, v4);

  }
  else
  {
    objc_msgSend(WeakRetained, "_goToSummaryScreen:", v2);
  }

}

- (void)goToSummaryScreen
{
  void *v3;
  id v4;

  -[HUTriggerActionEditorContentViewController flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNextState");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[HUTriggerActionEditorContentViewController _goToSummaryScreen:](self, "_goToSummaryScreen:", v4);
}

- (void)_goToSummaryScreen:(id)a3
{
  id v4;
  HUTriggerSummaryViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HUTriggerSummaryViewController *v10;

  v4 = a3;
  v5 = [HUTriggerSummaryViewController alloc];
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceGridViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUTriggerSummaryViewController initWithTriggerBuilder:flow:delegate:](v5, "initWithTriggerBuilder:flow:delegate:", v6, v4, v7);

  -[HUTriggerActionEditorContentViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUSelectableServiceGridViewController configureCell:forItem:](&v7, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setShouldColorDescription:", 0);

}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a3;
  if (-[HUTriggerActionEditorContentViewController _triggerForceDisableReasonsForActionItem:](self, "_triggerForceDisableReasonsForActionItem:", v5))
  {
    -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

    if (!v8)
      goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  v10 = v5;
  v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
  v12 = v11;

  objc_msgSend(v12, "sourceHomeKitItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0)
  {
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  v14 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v16, "sourceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v16) = objc_opt_isKindOfClass();

  if ((v16 & 1) == 0)
  {
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC8C8))
    {
      v9 = objc_msgSend(v14, "containsActions");
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  v18 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  objc_opt_class();
  objc_msgSend(v20, "sourceItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  v9 = -[HUTriggerActionEditorContentViewController _canSelectMediaAccessoryItem:](self, "_canSelectMediaAccessoryItem:", v23);
LABEL_23:

  return v9;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUTriggerActionEditorContentViewController;
  v6 = a4;
  -[HUItemCollectionViewController itemManager:didUpdateResultsForSourceItem:](&v11, sel_itemManager_didUpdateResultsForSourceItem_, a3, v6);
  objc_msgSend(v6, "latestResults", v11.receiver, v11.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("forceDisableReasonsForSecureCharacteristicControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (-[HUTriggerActionEditorContentViewController forceDisableReasonsForSecureCharacteristicControl](self, "forceDisableReasonsForSecureCharacteristicControl") != v9)
  {
    -[HUTriggerActionEditorContentViewController setForceDisableReasonsForSecureCharacteristicControl:](self, "setForceDisableReasonsForSecureCharacteristicControl:", v9);
    -[HUTriggerActionEditorContentViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUSelectableServiceGridViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUTriggerActionEditorContentViewController _updateSelectedServicesAndActionSets](self, "_updateSelectedServicesAndActionSets");
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUServiceGridViewController layoutOptionsForSection:](&v7, sel_layoutOptionsForSection_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!a3)
  {
    objc_msgSend(v5, "sectionTitleMargin");
    objc_msgSend(v5, "setSectionTitleMargin:", 9.0);
  }
  return v5;
}

- (void)didChangeSelection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUTriggerActionEditorContentViewController;
  -[HUSelectableServiceGridViewController didChangeSelection](&v3, sel_didChangeSelection);
  -[HUTriggerActionEditorContentViewController _validateDoneButton](self, "_validateDoneButton");
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  char isKindOfClass;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_serviceGridItemManager_shouldHideItem_)|| (v22.receiver = self, v22.super_class = (Class)HUTriggerActionEditorContentViewController, !-[HUSelectableServiceGridViewController serviceGridItemManager:shouldHideItem:](&v22, sel_serviceGridItemManager_shouldHideItem_, v6, v7)))
  {
    if (!objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC378)
      || (-[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) == 0))
    {
      v8 = 0;
      goto LABEL_15;
    }
    v11 = v7;
    v12 = objc_opt_class();
    -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v13;
      if (v14)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

    }
    v15 = 0;
LABEL_13:

    objc_msgSend(v15, "characteristics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_map:", &__block_literal_global_148);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "services");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v19, "intersectsSet:", v20);
    goto LABEL_15;
  }
  v8 = 1;
LABEL_15:

  return v8;
}

uint64_t __84__HUTriggerActionEditorContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service");
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  const __CFString *v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  unint64_t v49;
  objc_super v50;
  uint8_t buf[4];
  uint64_t v52;
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HUTriggerActionEditorContentViewController;
  v6 = a4;
  -[HUSelectableServiceGridViewController collectionView:didSelectItemAtIndexPath:](&v50, sel_collectionView_didSelectItemAtIndexPath_, a3, v6);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "sourceHomeKitItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();

  LOBYTE(v11) = objc_opt_isKindOfClass();
  if ((v11 & 1) != 0)
  {
    v13 = CFSTR("HUDontSetupProgrammableSwitchInAutomationActionEditorTitle");
    v14 = CFSTR("HUDontSetupProgrammableSwitchInAutomationActionEditorMessage");
LABEL_32:
    -[HUTriggerActionEditorContentViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", v13, v14);
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (!objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2AC8C8)
     || (objc_msgSend(v9, "containsActions") & 1) == 0))
  {
    v13 = CFSTR("HUTriggerActionEditorUnsupportedAccessoryTitle");
    v14 = CFSTR("HUTriggerActionEditorUnsupportedAccessoryMessage");
    goto LABEL_32;
  }
  v15 = -[HUTriggerActionEditorContentViewController _triggerForceDisableReasonsForActionItem:](self, "_triggerForceDisableReasonsForActionItem:", v9);
  if (!v15)
    goto LABEL_11;
  v16 = v15;
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fromSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v9);

  if ((v19 & 1) == 0)
  {
    v33 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v47[3] = &unk_1E6F57BA8;
    v48 = v9;
    v49 = v16;
    __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke((uint64_t)v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertTitle"), CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertTitle"), 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertCancelButton"), CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertCancelButton"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 1, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v38;
    v39 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertGoToSettingsButton"), CFSTR("HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertGoToSettingsButton"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v33;
    v46[1] = 3221225472;
    v46[2] = __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v46[3] = &__block_descriptor_40_e23_v16__0__UIAlertAction_8l;
    v46[4] = v16;
    objc_msgSend(v39, "actionWithTitle:style:handler:", v40, 0, v46);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTriggerActionEditorContentViewController _popAlertWithLocalizedTitle:localizedMessage:actions:](self, "_popAlertWithLocalizedTitle:localizedMessage:actions:", v35, v34, v42);

  }
  else
  {
LABEL_11:
    objc_opt_class();
    v20 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    objc_msgSend(v22, "sourceItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();

    LOBYTE(v22) = objc_opt_isKindOfClass();
    if ((v22 & 1) != 0)
    {
      objc_opt_class();
      v24 = v20;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v25;

      objc_opt_class();
      objc_msgSend(v26, "sourceItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v29 = v28;

      if (objc_msgSend(v29, "allowsAppleMusicAccount")
        && (objc_msgSend(v29, "supportsMediaAction") & 1) == 0)
      {
        v43 = objc_msgSend(v29, "mediaAccessoryItemType");
        switch(v43)
        {
          case 0:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            HFLogForCategory();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              v52 = v43;
              _os_log_error_impl(&dword_1B8E1E000, v44, OS_LOG_TYPE_ERROR, "Error: got media accessory item type %ld", buf, 0xCu);
            }

            break;
          case 1:
            v45 = CFSTR("HUTriggerActionEditorUnsupportedAppleTVMessage");
            goto LABEL_42;
          case 2:
          case 3:
            v45 = CFSTR("HUTriggerActionEditorUnsupportedHomePodMessage");
            goto LABEL_42;
          case 4:
            v45 = CFSTR("HUTriggerActionEditorUnsupportedHomePodStereoPairMessage");
LABEL_42:
            -[HUTriggerActionEditorContentViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", CFSTR("HUAlertSoftwareUpdateRequired"), v45);
            break;
          default:
            break;
        }
      }
      else
      {
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "home");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "hf_hasEnabledResident")
          && (objc_msgSend(v31, "hf_enabledResidentsSupportsMediaActions") & 1) == 0)
        {
          if (objc_msgSend(v29, "mediaAccessoryItemType") == 7)
            v32 = CFSTR("HUTriggerActionEditorUnsupportedResidentWithAirPortExpressMessage");
          else
            v32 = CFSTR("HUTriggerActionEditorUnsupportedResidentMessage");
          -[HUTriggerActionEditorContentViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", CFSTR("HUAlertSoftwareUpdateRequired"), v32);
        }

      }
    }
  }
LABEL_33:

}

id __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = CFSTR("Service");
  if ((isKindOfClass & 1) != 0)
    v3 = CFSTR("Scene");
  if ((*(_QWORD *)(a1 + 40) & 1) != 0)
    v4 = CFSTR("MustAllowNotifications");
  else
    v4 = CFSTR("MustAllowAccessWhileLocked");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HUTriggerActionEditor%@ToUse%@AlertMessageFormat"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(v5, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  +[HUTriggerBuilderItem settingsURLForForceDisableReasons:](HUTriggerBuilderItem, "settingsURLForForceDisableReasons:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "openURL:", v3);

}

- (void)_presentUnsupportedAlertWithTitle:(id)a3 message:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CEA2E8];
  v7 = a4;
  _HULocalizedStringWithDefaultValue(a3, a3, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v7, v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v12);

  -[HUControllableItemCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)_popAlertWithLocalizedTitle:(id)a3 localizedMessage:(id)a4 actions:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "addAction:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[HUControllableItemCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (id)_triggerBuilderFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  -[HUTriggerActionEditorContentViewController _updateTriggerBuilderActionSets](self, "_updateTriggerBuilderActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[HUTriggerActionEditorContentViewController _updateTriggerBuilderAnonymousActions](self, "_updateTriggerBuilderAnonymousActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HUTriggerActionEditorContentViewController__triggerBuilderFuture__block_invoke;
  v10[3] = &unk_1E6F4CD30;
  v10[4] = self;
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__HUTriggerActionEditorContentViewController__triggerBuilderFuture__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_canSelectMediaAccessoryItem:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "allowsAppleMusicAccount"))
    v5 = objc_msgSend(v4, "supportsMediaAction");
  else
    v5 = 1;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = v5 & objc_msgSend(v7, "hf_enabledResidentsSupportsMediaActions");
  return (char)v6;
}

- (void)_updateSelectedServicesAndActionSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anonymousActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_169);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v8);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "triggerActionSets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "namedActionSets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_172_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "triggerActionSets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anonymousActionSetBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mediaAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "mediaProfiles");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "na_flatMap:", &__block_literal_global_174_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUTriggerActionEditorContentViewController existingSelectedCharacteristics](self, "existingSelectedCharacteristics", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToSet:", v31))
  {
    -[HUTriggerActionEditorContentViewController existingSelectedActionSets](self, "existingSelectedActionSets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToSet:", v14) & 1) != 0)
    {
      -[HUTriggerActionEditorContentViewController existingAnonActionSetMediaProfiles](self, "existingAnonActionSetMediaProfiles");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToSet:", v20);

      if ((v24 & 1) != 0)
        goto LABEL_10;
      goto LABEL_9;
    }

  }
LABEL_9:
  -[HUTriggerActionEditorContentViewController setExistingSelectedCharacteristics:](self, "setExistingSelectedCharacteristics:", v31);
  -[HUTriggerActionEditorContentViewController setExistingSelectedActionSets:](self, "setExistingSelectedActionSets:", v14);
  -[HUTriggerActionEditorContentViewController setExistingAnonActionSetMediaProfiles:](self, "setExistingAnonActionSetMediaProfiles:", v20);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allDisplayedItems");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_5;
  v32[3] = &unk_1E6F57CB8;
  v33 = v14;
  v34 = v31;
  v35 = v20;
  objc_msgSend(v26, "na_filter:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31580]), "initWithFromSet:", v27);
  v29 = (void *)objc_msgSend(v28, "copy");
  -[HUSelectableServiceGridViewController setSelectedItems:](self, "setSelectedItems:", v29);

LABEL_10:
  -[HUTriggerActionEditorContentViewController _validateDoneButton](self, "_validateDoneButton");

}

id __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "characteristic");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

id __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_176);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  id v19;
  unsigned int v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_opt_class();
    objc_msgSend(v4, "homeKitObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v6;
      if (v7)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

    }
    v8 = 0;
LABEL_9:

    v11 = *(void **)(a1 + 32);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_6;
    v27[3] = &unk_1E6F57C90;
    v28 = v8;
    v12 = v8;
    v13 = objc_msgSend(v11, "na_any:", v27);

    goto LABEL_12;
  }
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC378))
  {
    v13 = 0;
    goto LABEL_14;
  }
  v14 = v3;
  objc_msgSend(v14, "services");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_7;
  v25[3] = &unk_1E6F4EE58;
  v26 = *(id *)(a1 + 40);
  v17 = objc_msgSend(v15, "na_any:", v25);

  objc_msgSend(v14, "accessories");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_10;
  v22[3] = &unk_1E6F4EE80;
  v23 = v14;
  v24 = *(id *)(a1 + 48);
  v19 = v14;
  v20 = objc_msgSend(v18, "na_any:", v22);

  v13 = v17 | v20;
  v12 = v26;
LABEL_12:

LABEL_14:
  return v13;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_8;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_9;
  v8[3] = &unk_1E6F4EE30;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (objc_msgSend(v3, "hf_isSiriEndpoint"))
  {
    objc_msgSend(*(id *)(a1 + 32), "services");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }
  v6 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_11;
  v10[3] = &unk_1E6F4EF10;
  v11 = v3;
  v7 = v3;
  LODWORD(v6) = objc_msgSend(v6, "na_any:", v10);
  v8 = (objc_msgSend(v7, "hf_isMediaAccessory") | v5) & v6;

  return v8;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (id)_updateTriggerBuilderActionSets
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerActionEditorContentViewController.m"), 546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.triggerBuilder"));

  }
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deletions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController _removeDeletedActionSetsItems:fromTriggerBuilder:](self, "_removeDeletedActionSetsItems:fromTriggerBuilder:", v8, v9);

  objc_msgSend(v5, "additions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController _addActionSetItems:toTriggerBuilder:inHome:](self, "_addActionSetItems:toTriggerBuilder:inHome:", v10, v11, v7);

  v12 = (void *)MEMORY[0x1E0D519C0];
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_removeDeletedActionSetsItems:(id)a3 fromTriggerBuilder:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          v13 = objc_opt_class();
          objc_msgSend(v12, "homeKitObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v14;
          if (!v15)
            goto LABEL_13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v15;
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class());

LABEL_13:
            v17 = 0;
          }

          if (v17)
          {
            objc_msgSend(v6, "triggerActionSets");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeActionSetIfPresent:", v17);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

}

- (void)_addActionSetItems:(id)a3 toTriggerBuilder:(id)a4 inHome:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          v14 = objc_opt_class();
          objc_msgSend(v13, "homeKitObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v15;
          if (!v16)
            goto LABEL_13;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
          v18 = v16;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class());

LABEL_13:
            v18 = 0;
          }

          if (v18)
          {
            objc_msgSend(v7, "triggerActionSets");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addActionSetIfNotPresent:", v18);

          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

}

- (id)_updateTriggerBuilderAnonymousActions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerActionEditorContentViewController.m"), 596, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.triggerBuilder"));

  }
  v34 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  objc_msgSend(v5, "deletions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_removeDeletedServiceItems:fromTriggerBuilder:", v9, v10);

  objc_msgSend(v5, "deletions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController triggerBuilder](self, "triggerBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerActionEditorContentViewController _updateOrRemoveDeletedMediaItems:fromTriggerBuilder:](self, "_updateOrRemoveDeletedMediaItems:fromTriggerBuilder:", v11, v12);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v5, "additions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EF2AC8C8))
        {
          objc_msgSend(v20, "currentStateActionBuildersForHome:", v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v13, "addObject:", v21);

        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v17);
  }

  v22 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "combineAllFutures:ignoringErrors:scheduler:", v13, 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v25 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke;
  v37[3] = &unk_1E6F4EF38;
  objc_copyWeak(&v39, &location);
  v26 = v34;
  v38 = v26;
  v27 = (id)objc_msgSend(v24, "addSuccessBlock:", v37);
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke_2;
  v35[3] = &unk_1E6F4E2D8;
  v28 = v26;
  v36 = v28;
  v29 = (id)objc_msgSend(v24, "addFailureBlock:", v35);
  v30 = v36;
  v31 = v28;

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

  return v31;
}

void __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
              objc_msgSend(WeakRetained, "triggerBuilder");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "triggerActionSets");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addAnonymousActionBuilder:", v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  v17 = *(void **)(v19 + 32);
  objc_msgSend(WeakRetained, "triggerBuilder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithResult:", v18);

}

uint64_t __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (void)_removeDeletedServiceItems:(id)a3 fromTriggerBuilder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v5, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "characteristic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v16);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v11);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v48;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v17)
  {
    v18 = v17;
    v43 = *(_QWORD *)v59;
    do
    {
      v19 = 0;
      v42 = v18;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(obj);
        v20 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * v19);
        v21 = &unk_1EF2AC378;
        if (objc_msgSend(v20, "conformsToProtocol:", v21))
          v22 = v20;
        else
          v22 = 0;
        v23 = v22;

        if (v23)
        {
          objc_msgSend(v23, "accessories");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "anyObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "hf_isSiriEndpoint") & 1) != 0)
          {
            objc_msgSend(v23, "services");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count");

            if (!v27)
            {
LABEL_42:

              goto LABEL_43;
            }
          }
          else
          {

          }
          v44 = v24;
          v45 = v23;
          v46 = v19;
          objc_msgSend(v20, "services");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v47 = v28;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          if (v29)
          {
            v30 = v29;
            v49 = *(_QWORD *)v55;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v55 != v49)
                  objc_enumerationMutation(v47);
                v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v31);
                v50 = 0u;
                v51 = 0u;
                v52 = 0u;
                v53 = 0u;
                objc_msgSend(v32, "characteristics");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v51;
                  do
                  {
                    v37 = 0;
                    do
                    {
                      if (*(_QWORD *)v51 != v36)
                        objc_enumerationMutation(v33);
                      objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v37), "uniqueIdentifier");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "objectForKeyedSubscript:", v38);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v39)
                      {
                        objc_msgSend(v5, "triggerActionSets");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v40, "removeAnonymousActionBuilder:", v39);

                      }
                      ++v37;
                    }
                    while (v35 != v37);
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
                  }
                  while (v35);
                }

                ++v31;
              }
              while (v31 != v30);
              v30 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
            }
            while (v30);
          }

          v18 = v42;
          v23 = v45;
          v19 = v46;
          v24 = v44;
          goto LABEL_42;
        }
LABEL_43:

        ++v19;
      }
      while (v19 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v18);
  }

}

- (void)_updateOrRemoveDeletedMediaItems:(id)a3 fromTriggerBuilder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = a4;
  objc_msgSend(v20, "triggerActionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anonymousActionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "mediaProfiles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF2AC378))
        {
          objc_msgSend(v15, "accessories");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __98__HUTriggerActionEditorContentViewController__updateOrRemoveDeletedMediaItems_fromTriggerBuilder___block_invoke;
          v21[3] = &unk_1E6F4EF10;
          v22 = v16;
          v17 = v16;
          objc_msgSend(v9, "na_filter:", v21);
          v18 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v18;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  if (v8)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v8, "setMediaProfiles:", v9);
      objc_msgSend(v20, "triggerActionSets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateAnonymousActionBuilder:", v8);
    }
    else
    {
      objc_msgSend(v20, "triggerActionSets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeAnonymousActionBuilder:", v8);
    }

  }
}

uint64_t __98__HUTriggerActionEditorContentViewController__updateOrRemoveDeletedMediaItems_fromTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (void)_validateDoneButton
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;
  -[HUTriggerActionEditorContentViewController effectiveNavigationItem](self, "effectiveNavigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

}

- (unint64_t)_triggerForceDisableReasonsForActionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[5];

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("forceDisableReasonsForSecureCharacteristicControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke;
  v12[3] = &unk_1E6F57CE0;
  v12[4] = v4;
  if (__87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke((uint64_t)v12))
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

uint64_t __87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return 1;
  result = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EF2AC8C8);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "actionsMayRequireDeviceUnlock");
  return result;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (UINavigationItem)effectiveNavigationItem
{
  return self->_effectiveNavigationItem;
}

- (unint64_t)forceDisableReasonsForSecureCharacteristicControl
{
  return self->_forceDisableReasonsForSecureCharacteristicControl;
}

- (void)setForceDisableReasonsForSecureCharacteristicControl:(unint64_t)a3
{
  self->_forceDisableReasonsForSecureCharacteristicControl = a3;
}

- (NSSet)existingSelectedCharacteristics
{
  return self->_existingSelectedCharacteristics;
}

- (void)setExistingSelectedCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_existingSelectedCharacteristics, a3);
}

- (NSSet)existingSelectedActionSets
{
  return self->_existingSelectedActionSets;
}

- (void)setExistingSelectedActionSets:(id)a3
{
  objc_storeStrong((id *)&self->_existingSelectedActionSets, a3);
}

- (NSSet)existingAnonActionSetMediaProfiles
{
  return self->_existingAnonActionSetMediaProfiles;
}

- (void)setExistingAnonActionSetMediaProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_existingAnonActionSetMediaProfiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAnonActionSetMediaProfiles, 0);
  objc_storeStrong((id *)&self->_existingSelectedActionSets, 0);
  objc_storeStrong((id *)&self->_existingSelectedCharacteristics, 0);
  objc_storeStrong((id *)&self->_effectiveNavigationItem, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
