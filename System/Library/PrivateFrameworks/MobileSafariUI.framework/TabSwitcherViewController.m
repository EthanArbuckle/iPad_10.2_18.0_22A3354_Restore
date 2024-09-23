@implementation TabSwitcherViewController

- (TabSwitcherViewController)initWithTabController:(id)a3
{
  id v5;
  TabSwitcherViewController *v6;
  void *v7;
  void *v8;
  TabDocumentDropHandler *v9;
  TabDocumentDropHandler *dropHandler;
  uint64_t v11;
  NSHashTable *presentationObservers;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SFTabSwitcher *tabSwitcher;
  void *v20;
  TabSwitcherViewController *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TabSwitcherViewController;
  v6 = -[TabSwitcherViewController init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "browserWindowUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_dismissesOnUnlock = objc_msgSend(v7, "tabViewDismissesOnUnlockForWindowWithUUID:", v8);

    v9 = -[TabDocumentDropHandler initWithAlertPresentationViewController:]([TabDocumentDropHandler alloc], "initWithAlertPresentationViewController:", v6);
    dropHandler = v6->_dropHandler;
    v6->_dropHandler = v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    presentationObservers = v6->_presentationObservers;
    v6->_presentationObservers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v6->_tabController, a3);
    v13 = objc_alloc(MEMORY[0x1E0D4EDD0]);
    objc_msgSend(v5, "tabCollectionViewProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconPool");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabCollectionViewProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "snapshotPool");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "initWithTabIconPool:tabSnapshotPool:", v15, v17);
    tabSwitcher = v6->_tabSwitcher;
    v6->_tabSwitcher = (SFTabSwitcher *)v18;

    -[SFTabSwitcher setPresentationObserver:](v6->_tabSwitcher, "setPresentationObserver:", v6);
    objc_msgSend(v5, "tabGroupManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTabGroupObserver:", v6);

    v21 = v6;
  }

  return v6;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabSwitcherViewController;
  -[TabSwitcherViewController loadView](&v5, sel_loadView);
  -[TabSwitcherViewController addChildViewController:](self, "addChildViewController:", self->_tabSwitcher);
  -[TabSwitcherViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabSwitcher view](self->_tabSwitcher, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[SFTabSwitcher didMoveToParentViewController:](self->_tabSwitcher, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id location;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)TabSwitcherViewController;
  -[TabSwitcherViewController viewDidLoad](&v62, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x1E0D4EDD8]);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke;
  v59[3] = &unk_1E9CFA5A0;
  objc_copyWeak(&v60, &location);
  objc_msgSend(v3, "setItemSelectionHandler:", v59);
  v57[0] = v4;
  v57[1] = 3221225472;
  v57[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_2;
  v57[3] = &unk_1E9CFA5C8;
  objc_copyWeak(&v58, &location);
  objc_msgSend(v3, "setBorrowedCapsuleViewProvider:", v57);
  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_3;
  v55[3] = &unk_1E9CFA5F0;
  objc_copyWeak(&v56, &location);
  objc_msgSend(v3, "setBorrowedContentViewProvider:", v55);
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_4;
  v53[3] = &unk_1E9CFA618;
  objc_copyWeak(&v54, &location);
  objc_msgSend(v3, "setCanAddItemPredicate:", v53);
  v51[0] = v4;
  v51[1] = 3221225472;
  v51[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_5;
  v51[3] = &unk_1E9CFA640;
  objc_copyWeak(&v52, &location);
  objc_msgSend(v3, "setDidScrollToPageObserver:", v51);
  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_6;
  v49[3] = &unk_1E9CFA640;
  objc_copyWeak(&v50, &location);
  objc_msgSend(v3, "setDismissHandler:", v49);
  v47[0] = v4;
  v47[1] = 3221225472;
  v47[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_7;
  v47[3] = &unk_1E9CFA668;
  objc_copyWeak(&v48, &location);
  objc_msgSend(v3, "setDragItemProvider:", v47);
  v45[0] = v4;
  v45[1] = 3221225472;
  v45[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_8;
  v45[3] = &unk_1E9CFA690;
  objc_copyWeak(&v46, &location);
  objc_msgSend(v3, "setDropDestinationProvider:", v45);
  v43[0] = v4;
  v43[1] = 3221225472;
  v43[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_9;
  v43[3] = &unk_1E9CFA6B8;
  objc_copyWeak(&v44, &location);
  objc_msgSend(v3, "setDropHandler:", v43);
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_10;
  v41[3] = &unk_1E9CFA6E0;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v3, "setDropOperationProvider:", v41);
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_11;
  v39[3] = &unk_1E9CFA640;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v3, "setItemAddHandler:", v39);
  v37[0] = v4;
  v37[1] = 3221225472;
  v37[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_12;
  v37[3] = &unk_1E9CFA708;
  objc_copyWeak(&v38, &location);
  objc_msgSend(v3, "setItemCloseHandler:", v37);
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_13;
  v35[3] = &unk_1E9CFA730;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v3, "setItemCopyHandler:", v35);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_14;
  v33[3] = &unk_1E9CFA758;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v3, "setItemMoveHandler:", v33);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_15;
  v31[3] = &unk_1E9CFA780;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v3, "setItemPinHandler:", v31);
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_16;
  v29[3] = &unk_1E9CFA640;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v3, "setPageInsertionHandler:", v29);
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_17;
  v27[3] = &unk_1E9CFA7A8;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v3, "setPageRetitleHandler:", v27);
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_18;
  v25[3] = &unk_1E9CFA7D0;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v3, "setPageTitleMenuProvider:", v25);
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_19;
  v23[3] = &unk_1E9CFA7F8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v3, "setProfileMenuProvider:", v23);
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_20;
  v21[3] = &unk_1E9CFA820;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v3, "setRelinquishBorrowedCapsuleView:", v21);
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_21;
  v19[3] = &unk_1E9CFA848;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "setRelinquishBorrowedContentView:", v19);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_22;
  v17[3] = &unk_1E9CFA870;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "setRecentlyClosedMenuProvider:", v17);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_23;
  v15[3] = &unk_1E9CF9F10;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "setShowPagePickerSheet:", v15);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_24;
  v13[3] = &unk_1E9CF89E0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v3, "setSteadyStateObserver:", v13);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_25;
  v11[3] = &unk_1E9CF89E0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setTabOverviewVisibilityObserver:", v11);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_26;
  v9[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setToggleSidebarHandler:", v9);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_27;
  v7[3] = &unk_1E9CFA618;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setValidateDismissal:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_28;
  v5[3] = &unk_1E9CFA640;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "setWillScrollToPageObserver:", v5);
  -[SFTabSwitcher applyConfiguration:](self->_tabSwitcher, "applyConfiguration:", v3);
  -[TabSwitcherViewController _setNeedsApplyContent](self, "_setNeedsApplyContent");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_selectTabWithUUID:", v5);

  }
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_borrowCapsuleViewForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)WeakRetained + 132);
    v7 = (void *)v5[135];
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabWithUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabCollectionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabCollectionView:borrowContentViewControllerForItem:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_canAddItemOnPage:", v3);

  return v5;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didScrollToPage:", v3);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dismissToPage:", v3);

}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_dragItemsForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_dropDestinationForSession:proposedDestination:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = v5;
  v10 = v9;

  return v10;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performDropWithIntent:", v3);

}

unint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((_QWORD *)WeakRetained + 135);
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabGroupWithUUID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPrivateBrowsing");

    v14 = +[TabDocumentDropHandler proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:](TabDocumentDropHandler, "proposedOperationForSession:intoWindowWithPrivateBrowsingEnabled:", v6, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_addItemOnPage:", v3);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_12(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_closeItems:", v5);
    objc_msgSend(v4, "_applyContent");
  }

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_13(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_tabsForItems:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_copyLinksForTabs:", v5);

  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_moveSections:toPage:", v8, v5);
    objc_msgSend(v7, "_applyContent");
  }

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setItems:arePinned:", v7, a3);
    objc_msgSend(v6, "_applyContent");
  }

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_16(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_addPage:", v5);
    objc_msgSend(v4, "_applyContent");
  }

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_setTitle:forPage:", v5, v8);
    objc_msgSend(v7, "_applyContent");
  }

}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_menuElementsForPage:withSuggestedActions:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuForSwitchingProfilesQuickly");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_20(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relinquishBorrowedCapsuleView:", v3);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)WeakRetained + 132);
    v9 = (void *)v7[135];
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabWithUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tabCollectionItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tabCollectionView:relinquishBorrowedContentViewController:forItem:", v7, v13, v12);

  }
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_22(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recentlyClosedTabsMenuForTabGroupWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_23(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentTabGroupPickerSheet:", v3);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_24(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_isInSteadyStateDidChange:", a2);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_25(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabOverviewVisibilityDidChange:", a2);

}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_26(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "container");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "toggleSidebar");

}

uint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_27(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_validateDismissalToPage:", v3);

  return v5;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_28(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_willScrollToPage:", v3);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabSwitcherViewController;
  -[TabSwitcherViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[TabSwitcherViewController applyContentIfNeeded](self, "applyContentIfNeeded");
}

- (id)_borrowCapsuleViewForItem:(id)a3
{
  TabController *tabController;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;

  tabController = self->_tabController;
  objc_msgSend(a3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabWithUUID:](tabController, "tabWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    objc_msgSend(WeakRetained, "borrowCapsuleViewForTab:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)detachCapsuleForActiveTab
{
  void *v3;
  void *v4;

  -[TabSwitcherViewController _itemForActiveTab](self, "_itemForActiveTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[SFTabSwitcher detachBorrowedCapsuleForItem:](self->_tabSwitcher, "detachBorrowedCapsuleForItem:", v3);
    v3 = v4;
  }

}

- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4
{
  -[SFTabSwitcher setBorrowedContentSize:obscuredInsets:](self->_tabSwitcher, "setBorrowedContentSize:obscuredInsets:", a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right);
}

- (void)_setNeedsApplyContent
{
  self->_updateInfo.needsApplyContent = 1;
}

- (void)setNeedsApplyContentAnimated:(BOOL)a3
{
  BOOL animated;
  void *v6;
  void *v7;
  _QWORD v8[5];

  animated = self->_updateInfo.animated;
  if (!self->_updateInfo.animated && a3)
    animated = self->_hasCompletedLaunch;
  self->_updateInfo.animated = animated;
  -[TabSwitcherViewController _setNeedsApplyContent](self, "_setNeedsApplyContent", a3);
  -[TabSwitcherViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  v7 = (void *)*MEMORY[0x1E0DC4730];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__TabSwitcherViewController_setNeedsApplyContentAnimated___block_invoke;
  v8[3] = &unk_1E9CF1900;
  v8[4] = self;
  objc_msgSend(v7, "_performBlockAfterCATransactionCommits:", v8);
}

uint64_t __58__TabSwitcherViewController_setNeedsApplyContentAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyContentIfNeeded");
}

- (void)_applyContent
{
  SFTabSwitcher *tabSwitcher;
  void *v4;

  tabSwitcher = self->_tabSwitcher;
  -[TabSwitcherViewController _makeContent](self, "_makeContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFTabSwitcher applyContent:](tabSwitcher, "applyContent:", v4);

  self->_updateInfo.animated = 0;
  self->_updateInfo.needsApplyContent = 0;
}

- (void)applyContentIfNeeded
{
  $C447D214FC5A5E129F85D28292D8C5FC *p_updateInfo;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SFTabSwitcher *tabSwitcher;
  NSUUID *identifierOfPageToScrollTo;
  id v10;
  id v11;
  _QWORD v12[5];

  p_updateInfo = &self->_updateInfo;
  if (self->_updateInfo.needsApplyContent && !self->_updateInfo.ignoreCount)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D4EE30]);
    if (p_updateInfo->animated
      && -[SFTabSwitcher isVisible](self->_tabSwitcher, "isVisible")
      && objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"))
    {
      if (p_updateInfo->identifierOfPageToScrollTo)
        objc_msgSend(MEMORY[0x1E0D4EBA8], "tabOverviewSwitcherScroll");
      else
        objc_msgSend(MEMORY[0x1E0D4EBA8], "tabOverviewUpdate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAnimationSettings:", v4, v10);

    }
    if (p_updateInfo->identifierOfPageToScrollTo)
    {
      v5 = (void *)MEMORY[0x1E0D4EE18];
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EDF8]), "initWithIdentifier:", p_updateInfo->identifierOfPageToScrollTo);
      objc_msgSend(v5, "scrollPositionWithPage:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTargetScrollPosition:", v7);

    }
    tabSwitcher = self->_tabSwitcher;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__TabSwitcherViewController_applyContentIfNeeded__block_invoke;
    v12[3] = &unk_1E9CF1900;
    v12[4] = self;
    -[SFTabSwitcher performTransaction:withUpdates:](tabSwitcher, "performTransaction:withUpdates:", v10, v12, v10);
    identifierOfPageToScrollTo = p_updateInfo->identifierOfPageToScrollTo;
    p_updateInfo->identifierOfPageToScrollTo = 0;

  }
}

uint64_t __49__TabSwitcherViewController_applyContentIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyContent");
}

- (id)_itemForActiveTab
{
  void *v3;
  void *v4;

  -[TabSwitcherViewController _activeTab](self, "_activeTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_itemForTab:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  __int16 v37;
  __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUIDString:", v6);

  if (v7)
  {
    -[TabController tabDocumentWithUUID:](self->_tabController, "tabDocumentWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EDF0]), "initWithIdentifier:", v7);
    objc_msgSend(v9, "setCanBeClosed:", -[TabController canCloseWBTab:](self->_tabController, "canCloseWBTab:", v4));
    objc_msgSend(v9, "setCanBeCopied:", objc_msgSend(v4, "hasLinkToCopy"));
    objc_msgSend(v9, "setCanBePinned:", -[TabController isTabPinnable:](self->_tabController, "isTabPinnable:", v4));
    objc_msgSend(v9, "setIsInteractivelyInserted:", objc_msgSend(v8, "isInteractivelyInserted"));
    objc_msgSend(v9, "setMediaStateIcon:", objc_msgSend(v8, "mediaStateIcon"));
    objc_initWeak((id *)location, self);
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __41__TabSwitcherViewController__itemForTab___block_invoke;
    v29 = &unk_1E9CFA898;
    objc_copyWeak(&v31, (id *)location);
    v10 = v7;
    v30 = v10;
    objc_msgSend(v9, "setSearchPredicate:", &v26);
    -[TabController tabWithUUID:](self->_tabController, "tabWithUUID:", v10, v26, v27, v28, v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsUnread:", objc_msgSend(v11, "isUnread"));
    objc_msgSend(v11, "shareParticipants");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShareParticipants:", v12);

    -[TabSwitcherViewController _titleForTab:](self, "_titleForTab:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v13);

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[TabController tabGroupRelatedToTabWithUUID:](self->_tabController, "tabGroupRelatedToTabWithUUID:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v17 = v15;
      if (objc_msgSend(v4, "isInUnnamedTabGroup"))
        v18 = CFSTR("YES");
      else
        v18 = CFSTR("NO");
      v19 = v18;
      if (objc_msgSend(v4, "isPinned"))
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      v21 = v20;
      if (objc_msgSend(v4, "isPrivateBrowsing"))
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v23 = v22;
      objc_msgSend(v14, "profileIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544642;
      *(_QWORD *)&location[4] = v8;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v23;
      v39 = 2114;
      v40 = v24;
      v41 = 2114;
      v42 = v25;
      _os_log_fault_impl(&dword_1D7CA3000, v17, OS_LOG_TYPE_FAULT, "Unexpectedly found tab with invalid UUID %{public}@. inUnnamedGroup = %{public}@; pinned = %{public}@; private ="
        " %{public}@; profileIdentifier = %{public}@; tabGroupUUID = %{public}@",
        location,
        0x3Eu);

    }
    v9 = 0;
  }

  return v9;
}

uint64_t __41__TabSwitcherViewController__itemForTab___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(WeakRetained, "_itemWithIdentifier:matchesSearchQuery:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

- (id)_makeContent
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  TabSwitcherViewController *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0D4EDE0]);
  if (-[TabController hasMultipleProfiles](self->_tabController, "hasMultipleProfiles"))
  {
    -[TabController activeProfile](self->_tabController, "activeProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D4EE10]);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:", v6);

    objc_msgSend(v4, "symbolImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    v9 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(v4, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_colorWithWBSNamedColorOption:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v11);

  }
  else
  {
    v7 = 0;
  }
  -[TabSwitcherViewController _tabGroups](self, "_tabGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __41__TabSwitcherViewController__makeContent__block_invoke;
  v20 = &unk_1E9CFA8E8;
  v21 = v7;
  v22 = self;
  v13 = v7;
  objc_msgSend(v12, "safari_mapObjectsUsingBlock:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPages:", v14, v17, v18, v19, v20);

  objc_msgSend(v3, "setProfileForInsertedPages:", v13);
  -[TabSwitcherViewController _itemForActiveTab](self, "_itemForActiveTab");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectedItem:", v15);

  return v3;
}

id __41__TabSwitcherViewController__makeContent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v31[4];
  id v32;
  id location;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  v6 = objc_msgSend(v2, "isPrivateBrowsing");
  v7 = objc_msgSend(v2, "isNamed");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EDF8]), "initWithIdentifier:", v5);
  objc_msgSend(v8, "setAllowsLargeTitle:", v7);
  objc_msgSend(v8, "setAllowsRetitling:", v7);
  if ((v7 & 1) != 0)
  {
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsSharing:", objc_msgSend(v9, "areSharedTabGroupsEnabled"));

    if (!v6)
    {
LABEL_3:
      objc_msgSend(v8, "setImage:", 0);
      objc_msgSend(v8, "setItemsCanMoveBetweenPages:", 1);
      v10 = *(_QWORD *)(a1 + 32);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v8, "setAllowsSharing:", 0);
    if (!v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.raised.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v11);

  objc_msgSend(v8, "setItemsCanMoveBetweenPages:", 0);
  v10 = 0;
LABEL_6:
  objc_msgSend(v8, "setProfile:", v10);
  objc_msgSend(v2, "displayTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE20]), "initWithIdentifier:", v5);
  objc_msgSend(v13, "setIsPinned:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "pinnedWBTabsForTabGroup:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __41__TabSwitcherViewController__makeContent__block_invoke_2;
  v35[3] = &unk_1E9CFA8C0;
  v35[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItems:", v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EE20]), "initWithIdentifier:", v5);
  objc_msgSend(v2, "tabs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __41__TabSwitcherViewController__makeContent__block_invoke_3;
  v34[3] = &unk_1E9CFA8C0;
  v34[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v18, "safari_mapAndFilterObjectsUsingBlock:", v34);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setItems:", v19);

  v36[0] = v13;
  v36[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSections:", v20);

  if (v6)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isPrivateBrowsingLocked");

    if (v22)
    {
      objc_initWeak(&location, *(id *)(a1 + 40));
      v23 = (void *)MEMORY[0x1E0D4EE00];
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __41__TabSwitcherViewController__makeContent__block_invoke_4;
      v31[3] = &unk_1E9CF25A0;
      objc_copyWeak(&v32, &location);
      objc_msgSend(v23, "lockedPrivateBrowsingOverlayWithUnlockHandler:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOverlay:", v24);

      objc_msgSend(v8, "setIsLocked:", 1);
      objc_msgSend(MEMORY[0x1E0D4EE08], "lockedPrivateBrowsing");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPeekingOverlay:", v25);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      if ((objc_msgSend(v8, "hasAnyItems") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D4EE00], "emptyPrivateBrowsing");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setOverlay:", v26);

      }
      objc_msgSend(MEMORY[0x1E0D4EE08], "privateBrowsing");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPeekingOverlay:", v27);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "cachedTabSwitcherShareConfigurationForTabGroup:", v2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v8, "setShareConfiguration:", v28);

  return v8;
}

uint64_t __41__TabSwitcherViewController__makeContent__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_itemForTab:", a2);
}

id __41__TabSwitcherViewController__makeContent__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isPinned") & 1) != 0
    || (v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1080),
        objc_msgSend(v3, "uuid"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = objc_msgSend(v4, "isTabWithUUIDBeingHiddenFromTabView:", v5),
        v5,
        (v4 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemForTab:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __41__TabSwitcherViewController__makeContent__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tabController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "authenticateToUnlockPrivateBrowsing");

}

- (void)_performIgnoringContentUpdates:(id)a3
{
  $C447D214FC5A5E129F85D28292D8C5FC *p_updateInfo;

  p_updateInfo = &self->_updateInfo;
  ++self->_updateInfo.ignoreCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --p_updateInfo->ignoreCount;
}

- (id)_titleForTab:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "title");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "absoluteString");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", URLSimplificationOptionsForTabTitle, 1, 0);
    else
      _WBSLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

- (id)_dragItemsForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[TabSwitcherViewController _tabForItem:](self, "_tabForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TabController dragItemForTab:tabItem:](self->_tabController, "dragItemForTab:tabItem:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)_dropDestinationForSession:(id)a3 proposedDestination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isPinned"))
  {

    goto LABEL_5;
  }
  v9 = +[TabDocumentDropHandler canPinAllItemsInSession:](TabDocumentDropHandler, "canPinAllItemsInSession:", v6);

  if (v9)
  {
LABEL_5:
    v20 = v7;
    goto LABEL_6;
  }
  objc_msgSend(v7, "page");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D4EE20]);
  objc_msgSend(v7, "section");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithIdentifier:", v14);

  objc_msgSend(v11, "firstUnpinnedTab");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0D4EDE8]);
  objc_msgSend(v7, "page");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "initWithPage:section:droppingBefore:", v19, v15, v17);

LABEL_6:
  return v20;
}

- (void)_performDropWithIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TabDocumentDropHandler *dropHandler;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  TabSwitcherViewController *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabGroupUUID:](self->_tabController, "setActiveTabGroupUUID:", v8);

  dropHandler = self->_dropHandler;
  objc_msgSend(v4, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__TabSwitcherViewController__performDropWithIntent___block_invoke;
  v13[3] = &unk_1E9CFA910;
  v14 = v5;
  v15 = self;
  v16 = v4;
  v11 = v4;
  v12 = v5;
  -[TabDocumentDropHandler dropItemsForSession:withInsertionHandler:](dropHandler, "dropItemsForSession:withInsertionHandler:", v10, v13);

  -[TabSwitcherViewController applyContentIfNeeded](self, "applyContentIfNeeded");
}

void __52__TabSwitcherViewController__performDropWithIntent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPinned");

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 1080);
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tabWithUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "currentTabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v9);

  }
  else
  {
    v12 = *(void **)(v6 + 1080);
    if ((_DWORD)v5)
      objc_msgSend(v12, "pinnedTabs");
    else
      objc_msgSend(v12, "currentTabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
  }

  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(*(_QWORD *)(a1 + 40) + 1080);
  objc_msgSend(v13, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "dropTabsAtIndex:pinned:dropSession:dragItems:", v11, v5, v15, v17);

}

- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity
{
  return (UIPanGestureRecognizer *)-[SFTabSwitcher panGestureRecognizerForTrackingPinchTranslationVelocity](self->_tabSwitcher, "panGestureRecognizerForTrackingPinchTranslationVelocity");
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)-[SFTabSwitcher pinchGestureRecognizer](self->_tabSwitcher, "pinchGestureRecognizer");
}

- (void)_addItemOnPage:(id)a3
{
  id v4;
  void *v5;
  TabController *tabController;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  SFTabSwitcher *tabSwitcher;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLocked") && objc_msgSend(v5, "isPrivateBrowsingLocked"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke;
    v22[3] = &unk_1E9CF4650;
    v22[4] = self;
    v23 = v4;
    objc_msgSend(v5, "authenticateToUnlockPrivateBrowsingWithCompletionHandler:", v22);

  }
  else
  {
    tabController = self->_tabController;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController appendWBTabInTabGroupWithUUID:](tabController, "appendWBTabInTabGroupWithUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke_2;
    v20[3] = &unk_1E9CF1830;
    v20[4] = self;
    v21 = v9;
    v11 = v9;
    -[TabSwitcherViewController _performIgnoringContentUpdates:](self, "_performIgnoringContentUpdates:", v20);
    -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "webExtensionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didOpenTab:", v12);

    objc_msgSend(v12, "displayNewTabOverridePageIfNecessary");
    -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0D4EE30]);
    objc_msgSend(MEMORY[0x1E0D4EBA8], "tabOverviewScroll");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnimationSettings:", v16);

    objc_msgSend(v15, "setInsertedItemToDismissTo:", v14);
    objc_msgSend(MEMORY[0x1E0D4EE18], "scrollPositionWithItem:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTargetScrollPosition:", v17);

    tabSwitcher = self->_tabSwitcher;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke_3;
    v19[3] = &unk_1E9CF1900;
    v19[4] = self;
    -[SFTabSwitcher performTransaction:withUpdates:](tabSwitcher, "performTransaction:withUpdates:", v15, v19);

  }
}

uint64_t __44__TabSwitcherViewController__addItemOnPage___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_addItemOnPage:", *(_QWORD *)(result + 40));
  return result;
}

void __44__TabSwitcherViewController__addItemOnPage___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setActiveTabUUID:", v2);

}

uint64_t __44__TabSwitcherViewController__addItemOnPage___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyContent");
}

- (void)_addPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0DCCB38]);
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController deviceIdentifier](self->_tabController, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithTitle:uuid:deviceIdentifier:", v8, v6, v9);

  -[TabController activeProfileIdentifier](self->_tabController, "activeProfileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProfileIdentifier:", v11);

  -[TabSwitcherViewController _tabGroups](self, "_tabGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController tabGroupManager](self->_tabController, "tabGroupManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isNamed"))
    v15 = v13;
  else
    v15 = 0;
  v16 = (id)objc_msgSend(v14, "insertTabGroup:afterTabGroup:", v10, v15);

  objc_msgSend(v4, "sections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(v4, "sections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabSwitcherViewController _moveSections:toPage:](self, "_moveSections:toPage:", v19, v4);
  }
  else
  {
    -[TabController tabGroupManager](self->_tabController, "tabGroupManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__TabSwitcherViewController__addPage___block_invoke;
    v21[3] = &unk_1E9CF78F8;
    v21[4] = self;
    objc_msgSend(v19, "updateTabsInTabGroupWithUUID:persist:usingBlock:", v6, 1, v21);
  }

  -[TabSwitcherViewController _updateShareConfigurationForPage:](self, "_updateShareConfigurationForPage:", v4);
  objc_msgSend(v10, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabGroupUUID:](self->_tabController, "setActiveTabGroupUUID:", v20);

}

void __38__TabSwitcherViewController__addPage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DCCB30];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  v4 = a2;
  objc_msgSend(v3, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPageTabWithDeviceIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendTabs:", v7);

}

- (BOOL)_canAddItemOnPage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[TabController canAddNewTabInTabGroup:withTabCount:](self->_tabController, "canAddNewTabInTabGroup:withTabCount:", v5, objc_msgSend(v4, "itemCount"));
  else
    v6 = 0;

  return v6;
}

- (void)_closeItems:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _tabsForItems:](self, "_tabsForItems:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[TabController closeWBTabs:](self->_tabController, "closeWBTabs:", v5);
}

- (void)_moveSections:(id)a3 toPage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v13), "items");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TabSwitcherViewController _tabsForItems:](self, "_tabsForItems:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__TabSwitcherViewController__moveSections_toPage___block_invoke;
  v19[3] = &unk_1E9CF2990;
  v19[4] = self;
  v20 = v8;
  v21 = v16;
  v17 = v16;
  v18 = v8;
  -[TabSwitcherViewController _performIgnoringContentUpdates:](self, "_performIgnoringContentUpdates:", v19);
  -[TabSwitcherViewController applyContentIfNeeded](self, "applyContentIfNeeded");

}

uint64_t __50__TabSwitcherViewController__moveSections_toPage___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 1080), "moveWBTabs:toTabGroup:", a1[5], a1[6]);
}

- (void)_setItems:(id)a3 arePinned:(BOOL)a4
{
  _BOOL8 v4;
  TabController *tabController;
  id v6;

  v4 = a4;
  tabController = self->_tabController;
  -[TabSwitcherViewController _tabsForItems:](self, "_tabsForItems:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController setWBTabs:arePinned:](tabController, "setWBTabs:arePinned:", v6, v4);

}

- (void)_setTitle:(id)a3 forPage:(id)a4
{
  TabController *tabController;
  id v6;
  void *v7;
  id v8;

  tabController = self->_tabController;
  v6 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController setTitle:forTabGroupWithUUID:](tabController, "setTitle:forTabGroupWithUUID:", v6, v7);

}

- (BOOL)_itemWithIdentifier:(id)a3 matchesSearchQuery:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _tabWithUUID:](self, "_tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TabController tabCollectionViewProvider](self->_tabController, "tabCollectionViewProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "tabItem:matchesSearchText:", v8, v6);

  return (char)self;
}

- (void)beginSearching
{
  -[SFTabSwitcher beginSearching](self->_tabSwitcher, "beginSearching");
}

- (void)beginSearchingWithSearchString:(id)a3
{
  -[SFTabSwitcher beginSearchingWithQuery:](self->_tabSwitcher, "beginSearchingWithQuery:", a3);
}

- (void)beginRenamingVisibleTabGroup
{
  -[SFTabSwitcher beginRetitlingVisiblePage](self->_tabSwitcher, "beginRetitlingVisiblePage");
}

- (void)cancelRenamingVisibleTabGroup
{
  -[SFTabSwitcher cancelRetitlingVisiblePage](self->_tabSwitcher, "cancelRetitlingVisiblePage");
}

- (void)scrollToNextTabGroup
{
  -[SFTabSwitcher scrollToNextPage](self->_tabSwitcher, "scrollToNextPage");
}

- (void)scrollToPreviousTabGroup
{
  -[SFTabSwitcher scrollToPreviousPage](self->_tabSwitcher, "scrollToPreviousPage");
}

- (void)didCompleteLaunch
{
  self->_hasCompletedLaunch = 1;
}

- (UIEdgeInsets)browserContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SFTabSwitcher browserContentInsets](self->_tabSwitcher, "browserContentInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setBrowserContentInsets:(UIEdgeInsets)a3
{
  -[SFTabSwitcher setBrowserContentInsets:](self->_tabSwitcher, "setBrowserContentInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (CGRect)capsuleReferenceFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SFTabSwitcher capsuleReferenceFrame](self->_tabSwitcher, "capsuleReferenceFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCapsuleReferenceFrame:(CGRect)a3
{
  -[SFTabSwitcher setCapsuleReferenceFrame:](self->_tabSwitcher, "setCapsuleReferenceFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (double)linkedPanGesturePageWidth
{
  double result;

  -[SFTabSwitcher linkedPanGesturePageWidth](self->_tabSwitcher, "linkedPanGesturePageWidth");
  return result;
}

- (void)setLinkedPanGesturePageWidth:(double)a3
{
  -[SFTabSwitcher setLinkedPanGesturePageWidth:](self->_tabSwitcher, "setLinkedPanGesturePageWidth:", a3);
}

- (void)setDismissesOnUnlock:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_dismissesOnUnlock != a3)
  {
    v3 = a3;
    self->_dismissesOnUnlock = a3;
    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TabController browserWindowUUID](self->_tabController, "browserWindowUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTabViewDismissesOnUnlock:forWindowWithUUID:", v3, v5);

  }
}

- (void)dismissForUnlockingAnimated:(BOOL)a3
{
  SFTabSwitcher *tabSwitcher;
  id v6;
  _QWORD v7[5];

  -[TabSwitcherViewController setDismissesOnUnlock:](self, "setDismissesOnUnlock:", 0);
  if (a3)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D4EE30]);
    objc_msgSend(v6, "setPrefersDetachedTransition:", 1);
    tabSwitcher = self->_tabSwitcher;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__TabSwitcherViewController_dismissForUnlockingAnimated___block_invoke;
    v7[3] = &unk_1E9CF1900;
    v7[4] = self;
    -[SFTabSwitcher performTransaction:withUpdates:](tabSwitcher, "performTransaction:withUpdates:", v6, v7);

  }
  else
  {
    -[TabSwitcherViewController dismissAnimated:](self, "dismissAnimated:", 0);
  }
}

uint64_t __57__TabSwitcherViewController_dismissForUnlockingAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (id)_menuElementsForPage:(id)a3 withSuggestedActions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    -[TabSwitcherViewController _manageTabGroupsMenu](self, "_manageTabGroupsMenu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isLocked") & 1) == 0)
    {
      -[TabSwitcherViewController _menuForTabGroup:withSuggestedActions:](self, "_menuForTabGroup:withSuggestedActions:", v8, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_manageTabGroupsMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController submenuForSwitchingProfiles](self->_tabController, "submenuForSwitchingProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.on.square"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __49__TabSwitcherViewController__manageTabGroupsMenu__block_invoke;
  v14 = &unk_1E9CF2C28;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8, v11, v12, v13, v14);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __49__TabSwitcherViewController__manageTabGroupsMenu__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_presentTabGroupPickerSheet:", v3);

}

- (id)_menuForTabGroup:(id)a3 withSuggestedActions:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v7);

  +[TabMenuProvider sortMenuForTabGroup:dataSource:](TabMenuProvider, "sortMenuForTabGroup:dataSource:", v8, self->_tabController);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_addObjectUnlessNil:", v10);

  v11 = +[TabMenuProvider copyLinksActionForTabGroup:](TabMenuProvider, "copyLinksActionForTabGroup:", v8);
  objc_msgSend(v9, "safari_addObjectUnlessNil:", v11);

  -[TabController tabMenuProviderDataSource](self->_tabController, "tabMenuProviderDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TabMenuProvider bookmarkActionForTabGroup:dataSource:](TabMenuProvider, "bookmarkActionForTabGroup:dataSource:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safari_addObjectUnlessNil:", v13);
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E9CFDBB0, 0, 0, 1, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_isInSteadyStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_presentationObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "tabCollectionView:didChangeSteadyState:", self, v3, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_presentTabGroupPickerSheet:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  objc_msgSend(WeakRetained, "showTabGroupPicker:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke;
  v7[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "setWillDisappear:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke(uint64_t a1)
{
  id WeakRetained;
  dispatch_time_t v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_time(0, 320000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke_2;
    block[3] = &unk_1E9CF1900;
    block[4] = WeakRetained;
    dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "clearHighlightedCapsule");
}

- (void)_dismiss
{
  id v3;

  -[TabSwitcherViewController applyContentIfNeeded](self, "applyContentIfNeeded");
  -[SFTabSwitcher visiblePage](self->_tabSwitcher, "visiblePage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _dismissToPage:](self, "_dismissToPage:", v3);

}

- (void)_dismissToPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TabController *tabController;
  void *v8;
  void *v9;
  id WeakRetained;
  SFTabSwitcher *tabSwitcher;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a3;
  if (-[SFTabSwitcher isVisible](self->_tabSwitcher, "isVisible")
    && -[TabSwitcherViewController _validateDismissalToPage:](self, "_validateDismissalToPage:", v4))
  {
    -[TabSwitcherViewController _defaultTabToSelectOnPage:](self, "_defaultTabToSelectOnPage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      tabController = self->_tabController;
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(tabController) = -[TabController isTabWithUUIDBeingHiddenFromTabView:](tabController, "isTabWithUUIDBeingHiddenFromTabView:", v8);

      if ((_DWORD)tabController)
      {
        -[TabController clearHiddenTabForExplanationView](self->_tabController, "clearHiddenTabForExplanationView");
        -[TabSwitcherViewController _applyContent](self, "_applyContent");
      }
      objc_msgSend(v6, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TabSwitcherViewController _selectTabWithUUID:](self, "_selectTabWithUUID:", v9);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(WeakRetained, "tabCollectionViewCanDismiss:", self) & 1) == 0)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXTabView();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "Request to dismiss tab overview vetoed by delegate", v14, 2u);
        }
      }
      else
      {
        tabSwitcher = self->_tabSwitcher;
        -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFTabSwitcher dismissToItem:](tabSwitcher, "dismissToItem:", v12);

      }
    }

  }
}

- (id)_defaultTabToSelectOnPage:(id)a3
{
  void *v4;
  void *v5;

  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TabController defaultTabToSelectInTabGroup:](self->_tabController, "defaultTabToSelectInTabGroup:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_switchToItemToActivateAnimated:(BOOL)a3
{
  TabCollectionItem *itemToActivate;
  _BOOL4 v5;
  TabController *tabController;
  void *v7;
  void *v8;
  void *v9;
  TabCollectionItem *v10;
  BOOL v11;
  SFTabSwitcher *tabSwitcher;
  void *v13;
  void *v14;

  itemToActivate = self->_itemToActivate;
  if (!itemToActivate)
    return 0;
  v5 = a3;
  tabController = self->_tabController;
  -[TabCollectionItem UUID](itemToActivate, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabWithUUID:](tabController, "tabWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wbTab");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_itemToActivate;
  self->_itemToActivate = 0;

  v11 = v9 != 0;
  if (v9)
  {
    if (v5)
    {
      -[TabSwitcherViewController _applyContent](self, "_applyContent");
      tabSwitcher = self->_tabSwitcher;
      -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTabSwitcher animateSwitchingToItem:](tabSwitcher, "animateSwitchingToItem:", v13);

    }
    objc_msgSend(v9, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController setActiveTabUUID:](self->_tabController, "setActiveTabUUID:", v14);

  }
  return v11;
}

- (BOOL)_validateDismissalToPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;

  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isPrivateBrowsing"))
    {
      +[Application sharedApplication](Application, "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isPrivateBrowsingLocked");

      v7 = v6 ^ 1;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_didScrollToPage:(id)a3
{
  void *v5;
  void *v6;
  TabSwitcherViewController *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSettledPage, a3);
    -[TabController persistActiveTabGroupOrTabGroupVisibleInSwitcher](self->_tabController, "persistActiveTabGroupOrTabGroupVisibleInSwitcher");
    -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "isPrivateBrowsing") & 1) == 0)
        -[TabSwitcherViewController setDismissesOnUnlock:](self, "setDismissesOnUnlock:", 0);
      v7 = self;
      if (-[TabSwitcherViewController presentationState](v7, "presentationState") == 1)
      {

LABEL_8:
        -[TabController didFocusTabGroup:](self->_tabController, "didFocusTabGroup:", v6);
        goto LABEL_9;
      }
      v8 = -[TabSwitcherViewController presentationState](v7, "presentationState");

      if (v8 == 2)
        goto LABEL_8;
    }
LABEL_9:

  }
}

- (void)scrollToTabGroup:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v6, "initWithUUIDString:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EDF8]), "initWithIdentifier:", v9);
  -[SFTabSwitcher scrollToPage:](self->_tabSwitcher, "scrollToPage:", v8);

}

- (void)setNeedsScrollToTabGroup:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  NSUUID *v8;
  NSUUID *identifierOfPageToScrollTo;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (NSUUID *)objc_msgSend(v6, "initWithUUIDString:", v7);
  identifierOfPageToScrollTo = self->_updateInfo.identifierOfPageToScrollTo;
  self->_updateInfo.identifierOfPageToScrollTo = v8;

  -[TabSwitcherViewController setNeedsApplyContentAnimated:](self, "setNeedsApplyContentAnimated:", 1);
}

- (WBTabGroup)visibleTabGroup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SFTabSwitcher visiblePage](self->_tabSwitcher, "visiblePage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TabController tabGroupManager](self->_tabController, "tabGroupManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabGroupWithUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (WBTabGroup *)v7;
}

- (void)_updateShareConfigurationForPage:(id)a3
{
  void *v4;
  void *v5;
  TabController *tabController;
  _QWORD v7[5];

  -[TabSwitcherViewController _tabGroupForPage:](self, "_tabGroupForPage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TabController cachedTabSwitcherShareConfigurationForTabGroup:](self->_tabController, "cachedTabSwitcherShareConfigurationForTabGroup:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      tabController = self->_tabController;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __62__TabSwitcherViewController__updateShareConfigurationForPage___block_invoke;
      v7[3] = &unk_1E9CF8228;
      v7[4] = self;
      -[TabController tabSwitcherShareConfigurationForTabGroup:completion:](tabController, "tabSwitcherShareConfigurationForTabGroup:completion:", v4, v7);
    }
  }

}

uint64_t __62__TabSwitcherViewController__updateShareConfigurationForPage___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setNeedsApplyContentAnimated:", 0);
  return result;
}

- (UIBarButtonItem)sidebarToggleBarButtonItem
{
  return (UIBarButtonItem *)-[SFTabSwitcher sidebarToggleBarButtonItem](self->_tabSwitcher, "sidebarToggleBarButtonItem");
}

- (void)beginAnimatedSizeTransition
{
  -[SFTabSwitcher beginAnimatedSizeTransition](self->_tabSwitcher, "beginAnimatedSizeTransition");
}

- (void)endAnimatedSizeTransition
{
  -[SFTabSwitcher endAnimatedSizeTransition](self->_tabSwitcher, "endAnimatedSizeTransition");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  SFTabSwitcher *tabSwitcher;
  id v6;
  _QWORD v7[5];

  tabSwitcher = self->_tabSwitcher;
  v6 = a4;
  -[SFTabSwitcher beginAnimatedSizeTransition](tabSwitcher, "beginAnimatedSizeTransition");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__TabSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E9CFA938;
  v7[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

}

uint64_t __80__TabSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "endAnimatedSizeTransition");
}

- (BOOL)showsSidebarToggle
{
  return -[SFTabSwitcher showsSidebarToggle](self->_tabSwitcher, "showsSidebarToggle");
}

- (void)setShowsSidebarToggle:(BOOL)a3
{
  -[SFTabSwitcher setShowsSidebarToggle:](self->_tabSwitcher, "setShowsSidebarToggle:", a3);
}

- (id)_activeTab
{
  void *v2;
  void *v3;

  -[TabController activeTabDocument](self->_tabController, "activeTabDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_selectTabWithUUID:(id)a3
{
  NSString **p_uuidOfTabBeingSelected;
  NSString *v6;
  id v7;

  p_uuidOfTabBeingSelected = &self->_uuidOfTabBeingSelected;
  objc_storeStrong((id *)&self->_uuidOfTabBeingSelected, a3);
  v7 = a3;
  -[TabController setActiveTabUUID:](self->_tabController, "setActiveTabUUID:", v7);
  v6 = *p_uuidOfTabBeingSelected;
  *p_uuidOfTabBeingSelected = 0;

}

- (id)_tabForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _tabWithUUID:](self, "_tabWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_tabGroupForPage:(id)a3
{
  TabController *tabController;
  void *v4;
  void *v5;
  void *v6;

  tabController = self->_tabController;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController tabGroupWithUUID:](tabController, "tabGroupWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_tabGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabController privateTabGroupIfAvailable](self->_tabController, "privateTabGroupIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  -[TabController unnamedTabGroup](self->_tabController, "unnamedTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  -[TabController namedTabGroups](self->_tabController, "namedTabGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)_tabsForItems:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__TabSwitcherViewController__tabsForItems___block_invoke;
  v4[3] = &unk_1E9CFA960;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __43__TabSwitcherViewController__tabsForItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tabForItem:", a2);
}

- (id)_tabWithUUID:(id)a3
{
  return -[TabController wbTabWithUUID:](self->_tabController, "wbTabWithUUID:", a3);
}

- (BOOL)becomeFirstResponder
{
  return -[SFTabSwitcher becomeFirstResponder](self->_tabSwitcher, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[SFTabSwitcher isVisible](self->_tabSwitcher, "isVisible");
}

- (id)undoManager
{
  return -[TabController undoManager](self->_tabController, "undoManager");
}

- (SFAnimationSettings)animationSettingsForCapsuleSelectionGesture
{
  return (SFAnimationSettings *)objc_msgSend(MEMORY[0x1E0D4EBA8], "quickTabSwitcherPan");
}

- (SFAnimationSettings)animationSettingsForCapsuleSelectionUpdate
{
  return (SFAnimationSettings *)objc_msgSend(MEMORY[0x1E0D4EBA8], "quickTabSwitcherUpdate");
}

- (BOOL)drivesCapsuleSelection
{
  return 1;
}

- (BOOL)isSendingTrailingAction
{
  return -[SFTabSwitcher isSelectingInteractivelyInsertedItem](self->_tabSwitcher, "isSelectingInteractivelyInsertedItem");
}

- (double)pageWidth
{
  double result;

  -[SFTabSwitcher quickTabSwitcherPageWidth](self->_tabSwitcher, "quickTabSwitcherPageWidth");
  return result;
}

- (void)animateSwitchingToItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TabSwitcherViewController capsuleIndexProvider](self, "capsuleIndexProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabAtCollectionViewIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "wbTab");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabSwitcherViewController _itemForTab:](self, "_itemForTab:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SFTabSwitcher animateSwitchingToItem:](self->_tabSwitcher, "animateSwitchingToItem:", v7);
    objc_msgSend(v10, "wbTab");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabController setActiveTabUUID:](self->_tabController, "setActiveTabUUID:", v9);

  }
}

- (void)didReceiveLinkedPanGesture:(id)a3
{
  -[SFTabSwitcher didReceivePanGesture:](self->_tabSwitcher, "didReceivePanGesture:", a3);
}

- (CGRect)frameForItemLinkedToCapsuleAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[TabSwitcherViewController capsuleIndexProvider](self, "capsuleIndexProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabAtCollectionViewIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SFTabSwitcher quickTabSwitcherFrameForItemWithIdentifier:](self->_tabSwitcher, "quickTabSwitcherFrameForItemWithIdentifier:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)willPresent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionViewWillPresent:", self);

}

- (void)willDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionViewWillDismiss:", self);

}

- (void)didPresent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionViewDidPresent:", self);

}

- (void)didDismiss
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tabCollectionViewDidDismiss:", self);

}

- (void)didCancelDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabCollectionViewDidCancelDismissal:", self);

}

- (int64_t)itemDragContentType
{
  return 6;
}

- (NSArray)items
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)addPresentationObserver:(id)a3
{
  -[NSHashTable addObject:](self->_presentationObservers, "addObject:", a3);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__TabSwitcherViewController_dismissAnimated___block_invoke;
  aBlock[3] = &unk_1E9CF1900;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    (*((void (**)(void *))v4 + 2))(v4);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "safari_performWithoutRetargetingAnimations:", v4);

}

uint64_t __45__TabSwitcherViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (int64_t)presentationState
{
  int64_t result;

  result = -[SFTabSwitcher presentationState](self->_tabSwitcher, "presentationState");
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

- (void)presentAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  v3 = a3;
  if (!-[TabSwitcherViewController _switchToItemToActivateAnimated:](self, "_switchToItemToActivateAnimated:"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__TabSwitcherViewController_presentAnimated___block_invoke;
    aBlock[3] = &unk_1E9CF1900;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v3)
      (*((void (**)(void *))v5 + 2))(v5);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "safari_performWithoutRetargetingAnimations:", v5);

  }
}

uint64_t __45__TabSwitcherViewController_presentAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "present");
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

- (void)removePresentationObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_presentationObservers, "removeObject:", a3);
}

- (SFTabCollectionSearchController)searchController
{
  return 0;
}

- (void)test_scrollToTopWithoutAnimation
{
  -[SFTabSwitcher scrollVisiblePageToTopWithoutAnimation](self->_tabSwitcher, "scrollVisiblePageToTopWithoutAnimation");
}

- (TabOverviewToolbar)toolbar
{
  return 0;
}

- (double)desiredSnapshotScale
{
  return 1.5;
}

- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  uint64_t v4;

  v4 = -[SFTabSwitcher visibleSnapshotLimitForBounds:traitCollection:](self->_tabSwitcher, "visibleSnapshotLimitForBounds:traitCollection:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v4 & ~(v4 >> 63);
}

- (unint64_t)snapshotBorderOptions
{
  if (tabSnapshotHasTransparentBorderPadding())
    return 15;
  else
    return 0;
}

- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result
{
  double v3;

  v3 = fmax(result.height, result.width * 1.5) + 200.0;
  result.height = v3;
  return result;
}

- (BOOL)tabOverviewIsVisible
{
  return -[SFTabSwitcher tabOverviewIsVisible](self->_tabSwitcher, "tabOverviewIsVisible");
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  -[TabSwitcherViewController setNeedsApplyContentAnimated:](self, "setNeedsApplyContentAnimated:", 1, a4);
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  -[TabSwitcherViewController setNeedsApplyContentAnimated:](self, "setNeedsApplyContentAnimated:", 1);
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  -[TabSwitcherViewController setNeedsApplyContentAnimated:](self, "setNeedsApplyContentAnimated:", 1, a4, a5);
}

- (void)tabGroupManagerDidUpdateProfiles:(id)a3
{
  -[TabSwitcherViewController setNeedsApplyContentAnimated:](self, "setNeedsApplyContentAnimated:", 1);
}

- (CollectionViewTabIndexProviding)capsuleIndexProvider
{
  return (CollectionViewTabIndexProviding *)objc_loadWeakRetained((id *)&self->_capsuleIndexProvider);
}

- (void)setCapsuleIndexProvider:(id)a3
{
  objc_storeWeak((id *)&self->_capsuleIndexProvider, a3);
}

- (BOOL)defersActivation
{
  return self->_defersActivation;
}

- (void)setDefersActivation:(BOOL)a3
{
  self->_defersActivation = a3;
}

- (TabThumbnailCollectionViewDelegate)delegate
{
  return (TabThumbnailCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TabCollectionItem)itemToActivate
{
  return self->_itemToActivate;
}

- (void)setItemToActivate:(id)a3
{
  objc_storeStrong((id *)&self->_itemToActivate, a3);
}

- (TabSwitcherViewControllerContaining)container
{
  return (TabSwitcherViewControllerContaining *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (BOOL)dismissesOnUnlock
{
  return self->_dismissesOnUnlock;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (SFTabSwitcher)tabSwitcher
{
  return self->_tabSwitcher;
}

- (NSString)uuidOfTabBeingSelected
{
  return self->_uuidOfTabBeingSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfTabBeingSelected, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_itemToActivate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_capsuleIndexProvider);

  objc_storeStrong((id *)&self->_tabSwitcher, 0);
  objc_storeStrong((id *)&self->_presentationObservers, 0);
  objc_storeStrong((id *)&self->_lastSettledPage, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
}

@end
