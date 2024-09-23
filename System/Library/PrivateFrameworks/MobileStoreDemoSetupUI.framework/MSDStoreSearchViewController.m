@implementation MSDStoreSearchViewController

- (MSDStoreSearchViewController)init
{
  MSDStoreSearchViewController *v2;
  MSDStoreSearchViewController *v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MSDMapViewController *v10;
  MSDSearchResultViewController *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MSDStoreSearchViewController;
  v2 = -[MSDStoreSearchViewController init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSDStoreSearchViewController setUserLocation:](v2, "setUserLocation:", 0);
    -[MSDStoreSearchViewController setSelectedStore:](v3, "setSelectedStore:", 0);
    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreSearchViewController setDevice:](v3, "setDevice:", v4);

    v5 = dispatch_queue_create("com.apple.msdstoresearch", 0);
    -[MSDStoreSearchViewController setUpdateQueue:](v3, "setUpdateQueue:", v5);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("STORE_SEARCH_HEADER"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreSearchViewController setTitle:](v3, "setTitle:", v6);

    -[MSDStoreSearchViewController setCustomDetentIdentifier:](v3, "setCustomDetentIdentifier:", CFSTR("customMedium"));
    v7 = (void *)MEMORY[0x24BDF6D98];
    -[MSDStoreSearchViewController customDetentIdentifier](v3, "customDetentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_detentWithIdentifier:resolutionContextBlock:", v8, &__block_literal_global_4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreSearchViewController setCustomDetent:](v3, "setCustomDetent:", v9);

    v10 = -[MSDMapViewController initWithDelegate:]([MSDMapViewController alloc], "initWithDelegate:", v3);
    -[MSDStoreSearchViewController setMapViewController:](v3, "setMapViewController:", v10);

    v11 = -[MSDSearchResultViewController initWithDelegate:]([MSDSearchResultViewController alloc], "initWithDelegate:", v3);
    -[MSDStoreSearchViewController setSearchResultViewController:](v3, "setSearchResultViewController:", v11);

    v12 = objc_alloc(MEMORY[0x24BDF6BF8]);
    -[MSDStoreSearchViewController searchResultViewController](v3, "searchResultViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithRootViewController:", v13);
    -[MSDStoreSearchViewController setSheetContentViewController:](v3, "setSheetContentViewController:", v14);

    -[MSDStoreSearchViewController sheetContentViewController](v3, "sheetContentViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNavigationBarHidden:", 1);

  }
  return v3;
}

double __36__MSDStoreSearchViewController_init__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "_maximumDetentValue");
  return v2 * 0.4;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)MSDStoreSearchViewController;
  -[MSDStoreSearchViewController viewDidLoad](&v43, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
    v7 = v8;
  }
  -[MSDStoreSearchViewController mapViewController](self, "mapViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayoutMargins:", 0.0, 0.0, v7 * 0.4, 0.0);

  -[MSDStoreSearchViewController mapViewController](self, "mapViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController addChildViewController:](self, "addChildViewController:", v11);

  -[MSDStoreSearchViewController mapViewController](self, "mapViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDStoreSearchViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

  objc_msgSend(v13, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "safeAreaLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  objc_msgSend(v13, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "safeAreaLayoutGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v32;
  v42 = v13;
  objc_msgSend(v13, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v18;
  objc_msgSend(v13, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v31);
  -[MSDStoreSearchViewController mapViewController](self, "mapViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "didMoveToParentViewController:", self);

  v25 = (void *)MEMORY[0x24BDF6880];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("questionmark.circle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "systemButtonWithImage:target:action:", v26, self, sel__help_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v27);
  -[MSDStoreSearchViewController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRightBarButtonItem:", v28);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSDStoreSearchViewController;
  -[MSDStoreSearchViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MSDStoreSearchViewController _showSheet](self, "_showSheet");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDStoreSearchViewController;
  -[MSDStoreSearchViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[MSDStoreSearchViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MSDStoreSearchViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)didSelectStore:(id)a3 forViewController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[MSDStoreSearchViewController updateQueue](self, "updateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke;
  v8[3] = &unk_24F47D350;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "selectedStore");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "selectedStore"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40)),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedStore:", *(_QWORD *)(a1 + 40));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke_2;
    v7[3] = &unk_24F47D350;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    dispatch_sync(MEMORY[0x24BDAC9B8], v7);

  }
}

void __65__MSDStoreSearchViewController_didSelectStore_forViewController___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_lockSheetDetent");
  objc_msgSend(*(id *)(a1 + 32), "mapViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoomToStore:", *(_QWORD *)(a1 + 40));

}

- (void)didDeselectStore:(id)a3 forViewController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[MSDStoreSearchViewController updateQueue](self, "updateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke;
  v8[3] = &unk_24F47D350;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "selectedStore");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "selectedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "setSelectedStore:", 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke_2;
      block[3] = &unk_24F47D240;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __67__MSDStoreSearchViewController_didDeselectStore_forViewController___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_unlockSheetDetent");
  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isShowingSearchResult");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deselectAnnotation");

  }
}

- (void)didAssignStore:(id)a3 forViewController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_22A6E6000, v6, OS_LOG_TYPE_DEFAULT, "User selected store with store ID: %{public}@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__MSDStoreSearchViewController_didAssignStore_forViewController___block_invoke;
  v8[3] = &unk_24F47D350;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __65__MSDStoreSearchViewController_didAssignStore_forViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopUpdatingUserLocation");

  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupCompleteWithStoreID:", v3);

}

- (void)didSelectNoStoreForViewController:(id)a3
{
  NSObject *v3;
  MSDDefaultStoreViewController *v4;
  void *v5;
  uint8_t v6[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "User selected I Can't Find My Store", v6, 2u);
  }

  v4 = objc_alloc_init(MSDDefaultStoreViewController);
  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:andRemoveTopmostView:", v4, 0);

}

- (void)didDismissStoreListView:(id)a3 forViewController:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[MSDStoreSearchViewController updateQueue](self, "updateQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(v5, block);

}

void __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke_2;
  block[3] = &unk_24F47D240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

void __74__MSDStoreSearchViewController_didDismissStoreListView_forViewController___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mapViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deselectAnnotation");

}

- (void)didSelectStores:(id)a3 forViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  MSDStoreSearchViewController *v11;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[MSDStoreSearchViewController updateQueue](self, "updateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke;
    v9[3] = &unk_24F47D350;
    v10 = v6;
    v11 = self;
    dispatch_async(v8, v9);

  }
}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8[2];
  _QWORD v9[4];
  int8x16_t v10;
  _QWORD block[5];
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "selectedStore");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2
      || (v3 = (void *)v2,
          objc_msgSend(*(id *)(a1 + 40), "selectedStore"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqual:", v7),
          v4,
          v3,
          (v5 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "setSelectedStore:", v7);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_2;
      block[3] = &unk_24F47D350;
      block[4] = *(_QWORD *)(a1 + 40);
      v12 = v7;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_3;
    v9[3] = &unk_24F47D350;
    *(_OWORD *)v8 = *(_OWORD *)(a1 + 32);
    v6 = v8[0];
    v10 = vextq_s8(*(int8x16_t *)v8, *(int8x16_t *)v8, 8uLL);
    dispatch_sync(MEMORY[0x24BDAC9B8], v9);

  }
}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_lockSheetDetent");
  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showStoreInfo:", *(_QWORD *)(a1 + 40));

}

void __66__MSDStoreSearchViewController_didSelectStores_forViewController___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showStoreList:inDisplayMode:", *(_QWORD *)(a1 + 40), 2);

}

- (void)didDeselectStores:(id)a3 forViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  MSDStoreSearchViewController *v11;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[MSDStoreSearchViewController updateQueue](self, "updateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke;
    v9[3] = &unk_24F47D350;
    v10 = v6;
    v11 = self;
    dispatch_async(v8, v9);

  }
}

void __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "count") != 1)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectedStore");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 40), "selectedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v6);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setSelectedStore:", 0);

LABEL_5:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke_2;
      block[3] = &unk_24F47D240;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
      return;
    }
  }

}

void __68__MSDStoreSearchViewController_didDeselectStores_forViewController___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_unlockSheetDetent");
  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAllTopViews");

}

- (void)userLocationDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MSDStoreSearchViewController userLocation](self, "userLocation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController setUserLocation:](self, "setUserLocation:", v4);

  v5 = v6;
  if (!v6)
  {
    -[MSDStoreSearchViewController _updateViewWithSearchText:](self, "_updateViewWithSearchText:", 0);
    v5 = 0;
  }

}

- (void)_help:(id)a3
{
  NSObject *v3;
  MSDHelpMenuViewController *v4;
  void *v5;
  uint8_t v6[16];

  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22A6E6000, v3, OS_LOG_TYPE_DEFAULT, "User clicked help button", v6, 2u);
  }

  v4 = objc_alloc_init(MSDHelpMenuViewController);
  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:andRemoveTopmostView:", v4, 0);

}

- (void)_showSheet
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalPresentationStyle:", 2);

  objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
  v5 = v4;
  v7 = v6;
  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredContentSize:", v5, v7);

  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sheetPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPrefersGrabberVisible:", 1);
  -[MSDStoreSearchViewController customDetent](self, "customDetent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDF6D98], "largeDetent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDetents:", v13);

  -[MSDStoreSearchViewController customDetentIdentifier](self, "customDetentIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLargestUndimmedDetentIdentifier:", v14);

  objc_msgSend(v10, "setDelegate:", self);
  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreSearchViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

}

- (void)_lockSheetDetent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDStoreSearchViewController customDetent](self, "customDetent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetents:", v6);

}

- (void)_unlockSheetDetent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[MSDStoreSearchViewController sheetContentViewController](self, "sheetContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDStoreSearchViewController customDetent](self, "customDetent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDF6D98], "largeDetent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDetents:", v7);

  objc_msgSend(v4, "_setIndexOfCurrentDetent:", 0);
}

- (void)_updateViewWithSearchText:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSDStoreSearchViewController updateQueue](self, "updateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke;
  v7[3] = &unk_24F47D350;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD block[5];

  v2 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_2;
  block[3] = &unk_24F47D240;
  block[4] = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x24BDAC9B8];
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 32), "_searchStoreWithText:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_3;
  v7[3] = &unk_24F47D4E0;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_sync(v3, v7);

}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showInProgress");

}

void __58__MSDStoreSearchViewController__updateViewWithSearchText___block_invoke_3(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "mapViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotateStores:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 48) != 0;
  objc_msgSend(*(id *)(a1 + 32), "searchResultViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showStoreList:inDisplayMode:", *(_QWORD *)(a1 + 40), v3);

}

- (id)_searchStoreWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  dispatch_semaphore_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = dispatch_semaphore_create(0);
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BE676D8]);
  -[MSDStoreSearchViewController userLocation](self, "userLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[MSDStoreSearchViewController userLocation](self, "userLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x24BE676C8]);

    v11 = (void *)MEMORY[0x24BDD16E0];
    -[MSDStoreSearchViewController userLocation](self, "userLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinate");
    objc_msgSend(v11, "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v14, *MEMORY[0x24BE676D0]);

  }
  defaultLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_22A6E6000, v15, OS_LOG_TYPE_DEFAULT, "Searching for stores with options: %{public}@", buf, 0xCu);
  }

  -[MSDStoreSearchViewController device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__MSDStoreSearchViewController__searchStoreWithText___block_invoke;
  v20[3] = &unk_24F47D508;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v16, "searchStoreWithOptions:completion:", v6, v20);

  defaultLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A6E6000, v17, OS_LOG_TYPE_DEFAULT, "Waiting for store search results...", buf, 2u);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)v22[5], 0xFFFFFFFFFFFFFFFFLL);
  v18 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __53__MSDStoreSearchViewController__searchStoreWithText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  MSDStoreInfo *v16;
  MSDStoreInfo *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!a3)
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v16 = [MSDStoreInfo alloc];
          v17 = -[MSDStoreInfo initWithDict:](v16, "initWithDict:", v14, (_QWORD)v18);
          objc_msgSend(v15, "addObject:", v17);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (NSString)customDetentIdentifier
{
  return self->_customDetentIdentifier;
}

- (void)setCustomDetentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_customDetentIdentifier, a3);
}

- (UISheetPresentationControllerDetent)customDetent
{
  return self->_customDetent;
}

- (void)setCustomDetent:(id)a3
{
  objc_storeStrong((id *)&self->_customDetent, a3);
}

- (MSDMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void)setMapViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mapViewController, a3);
}

- (MSDSearchResultViewController)searchResultViewController
{
  return self->_searchResultViewController;
}

- (void)setSearchResultViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultViewController, a3);
}

- (UINavigationController)sheetContentViewController
{
  return self->_sheetContentViewController;
}

- (void)setSheetContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sheetContentViewController, a3);
}

- (CLLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (MSDKManagedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (MSDStoreInfo)selectedStore
{
  return self->_selectedStore;
}

- (void)setSelectedStore:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedStore, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_sheetContentViewController, 0);
  objc_storeStrong((id *)&self->_searchResultViewController, 0);
  objc_storeStrong((id *)&self->_mapViewController, 0);
  objc_storeStrong((id *)&self->_customDetent, 0);
  objc_storeStrong((id *)&self->_customDetentIdentifier, 0);
}

@end
