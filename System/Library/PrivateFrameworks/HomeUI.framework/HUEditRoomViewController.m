@implementation HUEditRoomViewController

- (HUEditRoomViewController)initWithRoomBuilder:(id)a3 presentationDelegate:(id)a4 addRoomDelegate:(id)a5
{
  id v9;
  HUEditRoomItemManager *v10;
  void *v11;
  void *v12;
  HUEditRoomViewController *v13;
  HUEditRoomViewController *v14;
  id WeakRetained;
  void *v16;
  HUZoneModuleController *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HUZoneModuleController *zoneModuleController;
  id v24;
  id obj;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  id location;

  v9 = a3;
  obj = a4;
  v24 = a5;
  v10 = -[HUEditRoomItemManager initWithRoomBuilder:delegate:]([HUEditRoomItemManager alloc], "initWithRoomBuilder:delegate:", v9, self);
  objc_initWeak(&location, self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", 2);
  objc_msgSend(v11, "setHeaderMode:", 1);
  objc_msgSend(v11, "setFooterMode:", 1);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __85__HUEditRoomViewController_initWithRoomBuilder_presentationDelegate_addRoomDelegate___block_invoke;
  v27[3] = &unk_1E6F5A678;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v11, "setTrailingSwipeActionsConfigurationProvider:", v27);
  objc_msgSend(MEMORY[0x1E0CEA428], "layoutWithListConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HUEditRoomViewController;
  v13 = -[HUItemCollectionViewController initWithItemManager:collectionViewLayout:](&v26, sel_initWithItemManager_collectionViewLayout_, v10, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_presentationDelegate, obj);
    objc_storeWeak((id *)&v14->_addRoomDelegate, v24);
    objc_storeWeak((id *)&v14->_roomItemManager, v10);
    objc_storeStrong((id *)&v14->_roomBuilder, a3);
    WeakRetained = objc_loadWeakRetained((id *)&v14->_roomItemManager);
    objc_msgSend(WeakRetained, "zoneModule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [HUZoneModuleController alloc];
      v18 = objc_loadWeakRetained((id *)&v14->_roomItemManager);
      objc_msgSend(v18, "zoneModule");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFRoomBuilder room](v14->_roomBuilder, "room");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HUZoneModuleController initWithModule:room:](v17, "initWithModule:room:", v19, v20);
      zoneModuleController = v14->_zoneModuleController;
      v14->_zoneModuleController = (HUZoneModuleController *)v21;

    }
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v14;
}

id __85__HUEditRoomViewController_initWithRoomBuilder_presentationDelegate_addRoomDelegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "trailingSwipeActionsConfigurationForRowAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  HUWallpaperPickerInlineViewController *v4;
  HUWallpaperPickerInlineViewController *wallpaperPickerController;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HUEditRoomViewController;
  -[HUItemCollectionViewController viewDidLoad](&v31, sel_viewDidLoad);
  -[HUEditRoomViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell"))
  {
    v4 = objc_alloc_init(HUWallpaperPickerInlineViewController);
    wallpaperPickerController = self->_wallpaperPickerController;
    self->_wallpaperPickerController = v4;

  }
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0CEA380]);
  if (!v7)
  {
    v21 = (void *)objc_msgSend(v8, "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonPressed_);
    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItem:", v21);

    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftBarButtonItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("Home.Room.Cancel"));

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 3, self, sel_doneButtonPressed_);
    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRightBarButtonItem:", v25);

    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rightBarButtonItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setStyle:", 2);

    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "rightBarButtonItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEnabled:", 0);

    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rightBarButtonItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.Room.Save"));
    goto LABEL_8;
  }
  v9 = (void *)objc_msgSend(v8, "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Home.Room.Done"));

  -[HUEditRoomViewController addRoomDelegate](self, "addRoomDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hf_currentUserIsAdministrator");

    if (!v16)
    {
      -[HUEditRoomViewController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setHidesBackButton:", 1);
      goto LABEL_10;
    }
    v17 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomAddButtonTitle"), CFSTR("HUEditRoomAddButtonTitle"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v18, 0, self, sel_addButtonPressed_);
    -[HUEditRoomViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItem:", v19);

LABEL_8:
LABEL_10:

  }
  -[HUEditRoomViewController updateTitle](self, "updateTitle");
}

- (void)updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditRoomViewController setTitle:](self, "setTitle:", v5);

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAddRoomNameTitle"), CFSTR("HUAddRoomNameTitle"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditRoomViewController setTitle:](self, "setTitle:", v4);
  }

}

- (void)cancelButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: cancel button pressed", v6, 2u);
  }

  -[HUEditRoomViewController presentationDelegate](self, "presentationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editRoomViewControllerDidFinish:withNewRoom:", self, 0);

}

- (void)addButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: add button pressed", v6, 2u);
  }

  -[HUEditRoomViewController addRoomDelegate](self, "addRoomDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentAddRoomViewControllerForEditRoomViewController:", self);

}

- (void)doneButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id buf[2];

  v41 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "HUEditRoomViewController: done button pressed", (uint8_t *)buf, 2u);
  }

  -[HUEditRoomViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nameItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = v10;
    objc_msgSend(v11, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D319D0], "sanitizeUserEnteredHomeKitName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "room");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)v13;
  if (!objc_msgSend(v14, "length"))
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  objc_msgSend(v11, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v14);

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setName:", v14);

  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rightBarButtonItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController setSavedButtonBarItem:](self, "setSavedButtonBarItem:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v22);
  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

  objc_msgSend(v22, "startAnimating");
  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rightBarButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabled:", 0);

  objc_msgSend(v11, "textField");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v27, "canResignFirstResponder");

  if ((_DWORD)v26)
  {
    objc_msgSend(v11, "textField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resignFirstResponder");

  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v22);
  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRightBarButtonItem:", v29);

  objc_initWeak(buf, self);
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commitItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke;
  v50[3] = &unk_1E6F5A6A0;
  objc_copyWeak(&v51, buf);
  objc_msgSend(v32, "flatMap:", v50);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v48[0] = v33;
  v48[1] = 3221225472;
  v48[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_3;
  v48[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v49, buf);
  v35 = (id)objc_msgSend(v34, "addSuccessBlock:", v48);
  v46[0] = v33;
  v46[1] = 3221225472;
  v46[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_4;
  v46[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v47, buf);
  v36 = (id)objc_msgSend(v34, "addFailureBlock:", v46);
  v45[0] = v33;
  v45[1] = 3221225472;
  v45[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_6;
  v45[3] = &unk_1E6F4C610;
  v45[4] = self;
  v37 = (id)objc_msgSend(v34, "addCompletionBlock:", v45);
  v43[0] = v33;
  v43[1] = 3221225472;
  v43[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_7;
  v43[3] = &unk_1E6F5A6C8;
  v43[4] = self;
  v38 = v42;
  v44 = v38;
  v39 = (id)objc_msgSend(v34, "addSuccessBlock:", v43);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v51);
  objc_destroyWeak(buf);

}

id __46__HUEditRoomViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "zoneModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "zoneModuleController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishZoneNameEditing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_2;
    v10[3] = &unk_1E6F514A0;
    v11 = v3;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTitle");

}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_4(uint64_t a1, void *a2)
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
  v6[2] = __46__HUEditRoomViewController_doneButtonPressed___block_invoke_5;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doneButtonPressed:", 0);
}

uint64_t __46__HUEditRoomViewController_doneButtonPressed___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "savedButtonBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "setSavedButtonBarItem:", 0);
}

void __46__HUEditRoomViewController_doneButtonPressed___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "presentationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  if (v4 == v7)
  {
    v6 = 0;
  }
  else if (objc_msgSend(v4, "isEqual:"))
  {
    v6 = 0;
  }
  else
  {
    v6 = v7;
  }
  objc_msgSend(v3, "editRoomViewControllerDidFinish:withNewRoom:", v5, v6);

}

- (void)nameFieldTextChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D319D0];
  objc_msgSend(a3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizeUserEnteredHomeKitName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;

  -[HUEditRoomViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  -[HUEditRoomViewController setModalInPresentation:](self, "setModalInPresentation:", v7);
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[HUEditRoomViewController zoneModuleController](self, "zoneModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHost:", self);

  -[HUEditRoomViewController zoneModuleController](self, "zoneModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  return v3;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wallpaperThumbnailItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wallpaperPickerItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "isEqual:", v13);

    }
  }
  objc_opt_class();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v14;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  objc_super v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)HUEditRoomViewController;
  -[HUItemCollectionViewController configureCell:forItem:](&v70, sel_configureCell_forItem_, v6, v7);
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (!v10)
  {
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "chooseWallpaperItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "isEqual:", v16);

    if (v17)
    {
      v11 = v6;
      +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContentConfiguration:", v18);

      v19 = objc_alloc_init(MEMORY[0x1E0CEA3E8]);
      v71[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessories:", v20);

      v14 = CFSTR("Home.Room.ChooseFromExisting");
      goto LABEL_5;
    }
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cameraItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v22))
    {

    }
    else
    {
      -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v7, "isEqual:", v24);

      if (!v25)
      {
        -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "wallpaperThumbnailItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v7, "isEqual:", v37);

        if (v38)
        {
          v39 = v6;
          objc_msgSend(v39, "setDelegate:", self);
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bounds");
          v42 = v41;
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bounds");
          v45 = v42 / v44;

          objc_msgSend(v39, "setImageSize:", round(v45 * 244.0));
          objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("Home.Room.WallpaperThumbnail"));
          -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "wallpaperBuilder");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "wallpaperEditCollectionFuture");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __50__HUEditRoomViewController_configureCell_forItem___block_invoke;
          v68[3] = &unk_1E6F55AA0;
          v69 = v39;
          v11 = v39;
          v49 = (id)objc_msgSend(v48, "addSuccessBlock:", v68);

          goto LABEL_14;
        }
        -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "wallpaperPickerItem");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v7, "isEqual:", v51);

        if (!v52)
          goto LABEL_15;
        -[HUEditRoomViewController wallpaperPickerController](self, "wallpaperPickerController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setDelegate:", self);

        objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "allNamedWallpapersForWallpaperCollectionType:", 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUEditRoomViewController wallpaperPickerController](self, "wallpaperPickerController");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setNamedWallpapers:", v55);

        objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "allNamedWallpaperThumbnailsForWallpaperCollectionType:", 1);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUEditRoomViewController wallpaperPickerController](self, "wallpaperPickerController");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setNamedWallpaperThumbnails:", v58);

        v11 = v6;
        objc_msgSend(v11, "setUseDefaultCellBackgroundColor:", 1);
        -[HUEditRoomViewController wallpaperPickerController](self, "wallpaperPickerController");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setViewController:", v60);

        objc_msgSend(v11, "setAllowSelfSizing:", 1);
        -[HUEditRoomViewController wallpaperPickerController](self, "wallpaperPickerController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUEditRoomViewController collectionView](self, "collectionView");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "frame");
        objc_msgSend(v61, "setImageSizeToFitWidth:forNumberOfWallpapers:", 3, v63);

        -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "wallpaperBuilder");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "wallpaperEditCollectionFuture");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __50__HUEditRoomViewController_configureCell_forItem___block_invoke_2;
        v67[3] = &unk_1E6F55AA0;
        v67[4] = self;
        v66 = (id)objc_msgSend(v65, "addSuccessBlock:", v67);

        goto LABEL_13;
      }
    }
    v11 = v6;
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v7, "isEqual:", v27);

    +[HUListContentConfigurationUtilities buttonStyleConfigurationForItem:isDestructive:](HUListContentConfigurationUtilities, "buttonStyleConfigurationForItem:isDestructive:", v7, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentConfiguration:", v29);
    objc_msgSend(v11, "setAccessories:", MEMORY[0x1E0C9AA60]);
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cameraItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v7, "isEqual:", v31);

    if (v32)
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Home.Room.TakePhoto"));
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v7, "isEqual:", v34);

    if (v35)
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Home.Room.RemoveRoom"));
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v6, "textField");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  objc_msgSend(v11, "setAutocapitalizationType:", 1);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setClearButtonMode:", 1);
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_nameFieldTextChanged_, 917504);
  v14 = CFSTR("Home.Room.RoomName");
LABEL_5:
  objc_msgSend(v11, "setAccessibilityIdentifier:", v14);
LABEL_14:

LABEL_15:
}

void __50__HUEditRoomViewController_configureCell_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "processedImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);
  objc_msgSend(v3, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "type") != 2;
  objc_msgSend(*(id *)(a1 + 32), "setContentMode:", 2 * v3);

}

void __50__HUEditRoomViewController_configureCell_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "processedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "wallpaperPickerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wallpaper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCustomWallpaper:image:", v7, v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "wallpaperPickerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wallpaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedWallpaper:animated:", v9, 0);

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
    goto LABEL_4;
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chooseWallpaperItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v8) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wallpaperThumbnailItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
    v9 = -1;
    goto LABEL_6;
  }
LABEL_5:
  v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v11) & 1) != 0)
  {
    objc_msgSend(v9, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (!v14)
      goto LABEL_9;
  }
  else
  {

  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chooseWallpaperItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v16))
  {
LABEL_8:

LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "wallpaperThumbnailItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v18) & 1) != 0)
  {

    goto LABEL_8;
  }
  v30 = v6;
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v9, "isEqual:", v22);

  if ((v23 & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wallpaperPickerItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v9, "isEqual:", v25);

    if ((v26 & 1) == 0)
    {
      -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nameItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v9, "isEqual:", v28);

      if ((v29 & 1) == 0)
      {
        v31.receiver = self;
        v31.super_class = (Class)HUEditRoomViewController;
        v6 = v30;
        v19 = -[HUItemCollectionViewController collectionView:shouldHighlightItemAtIndexPath:](&v31, sel_collectionView_shouldHighlightItemAtIndexPath_, v30, v7);
        goto LABEL_10;
      }
    }
    v19 = 0;
  }
  v6 = v30;
LABEL_10:

  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HUWallpaperPickerViewController *v13;
  void *v14;
  void *v15;
  int v16;
  HUWallpaperPickerViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  _QWORD v46[5];
  __CFString *v47;
  _QWORD v48[5];
  objc_super v49;

  v6 = a4;
  v49.receiver = self;
  v49.super_class = (Class)HUEditRoomViewController;
  v7 = a3;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v49, sel_collectionView_didSelectItemAtIndexPath_, v7, v6);
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 1);
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cameraItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = (HUWallpaperPickerViewController *)objc_alloc_init(MEMORY[0x1E0CEA648]);
    -[HUWallpaperPickerViewController setDelegate:](v13, "setDelegate:", self);
    -[HUWallpaperPickerViewController setSourceType:](v13, "setSourceType:", 1);
    -[HUWallpaperPickerViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 0);
    -[HUEditRoomViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
LABEL_12:

    goto LABEL_13;
  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "chooseWallpaperItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {
    v17 = [HUWallpaperPickerViewController alloc];
    _HULocalizedStringWithDefaultValue(CFSTR("HUEditRoomNamedWallpaperSectionTitle"), CFSTR("HUEditRoomNamedWallpaperSectionTitle"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUWallpaperPickerViewController initWithCollectionType:namedSectionTitle:delegate:](v17, "initWithCollectionType:namedSectionTitle:delegate:", 1, v18, self);

    -[HUEditRoomViewController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pushViewController:animated:", v13, 1);

    goto LABEL_12;
  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "wallpaperThumbnailItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v9, "isEqual:", v21);

  if (v22)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v13 = (HUWallpaperPickerViewController *)objc_claimAutoreleasedReturnValue();
    -[HUWallpaperPickerViewController wallpaperBuilder](v13, "wallpaperBuilder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wallpaperEditCollectionFuture");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v48[3] = &unk_1E6F55AA0;
    v48[4] = self;
    v25 = (id)objc_msgSend(v24, "addSuccessBlock:", v48);
LABEL_11:

    goto LABEL_12;
  }
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v9, "isEqual:", v27);

  if (v28)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v32 = &stru_1E6F60E80;
    if (v30)
      v32 = (__CFString *)v30;
    v33 = v32;

    HULocalizedStringWithFormat(CFSTR("HUEditRoomRemoveAlertTitle"), CFSTR("%@"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);
    v13 = (HUWallpaperPickerViewController *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", 0, v13, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "actionWithTitle:style:handler:", v41, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("Home.Room.RemoveRoom.Cancel"));
    v42 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HURemoveTitle"), CFSTR("HURemoveTitle"), 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v46[3] = &unk_1E6F526C8;
    v46[4] = self;
    v47 = v33;
    v44 = v33;
    objc_msgSend(v42, "actionWithTitle:style:handler:", v43, 2, v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "setAccessibilityIdentifier:", CFSTR("Home.Rome.RemoveRoom.Remove"));
    objc_msgSend(v23, "addAction:", v24);
    objc_msgSend(v23, "addAction:", v45);
    -[HUEditRoomViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

    goto LABEL_11;
  }
LABEL_13:

}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUWallpaperEditingViewController *v4;
  void *v5;
  HUWallpaperEditingViewController *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "originalImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [HUWallpaperEditingViewController alloc];
  objc_msgSend(v3, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:](v4, "initWithWallpaper:image:delegate:", v5, v7, *(_QWORD *)(a1 + 32));
  -[HUWallpaperEditingViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(*(id *)(a1 + 32), "roomItemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "roomBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRoom:completionHandler:", v8, v9);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v15[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v16, &location);
  v11 = (id)objc_msgSend(v4, "addSuccessBlock:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5;
  v13[3] = &unk_1E6F4E2D8;
  v14 = *(id *)(a1 + 40);
  v12 = (id)objc_msgSend(v4, "addFailureBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editRoomViewControllerDidFinish:withNewRoom:", WeakRetained, 0);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E6F5A6F0;
  v4[4] = WeakRetained;
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v4, 0);

}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "roomItemManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "roomBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home:didRemoveRoom:", v4, v6);

  }
}

void __68__HUEditRoomViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30A30];
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *MEMORY[0x1E0D305A8];
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, v6, v8, 0, 0);

}

- (id)trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  HUEditRoomViewController *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &unk_1EF348330;
  if (objc_msgSend(v6, "conformsToProtocol:", v7))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: User swiped for trailing actions on item: %@", buf, 0x16u);
  }

  if (objc_msgSend(v9, "hf_canDeleteItem"))
  {
    objc_initWeak((id *)buf, self);
    v11 = (void *)MEMORY[0x1E0CEA4C0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUDeleteTitle"), CFSTR("HUDeleteTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E6F5A760;
    v19 = v9;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 1, v12, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CEAA28];
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationWithActions:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "hf_deleteItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
  v13[3] = &unk_1E6F5A718;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_msgSend(v10, "addSuccessBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "addFailureBlock:", &__block_literal_global_198);

  objc_destroyWeak(&v14);
}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "zoneModuleController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "module");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314C0], "requestToReloadItemProviders:senderSelector:", v3, sel_tableView_editActionsForRowAtIndexPath_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "performItemUpdateRequest:", v5);

}

void __79__HUEditRoomViewController_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v3, *MEMORY[0x1E0D30A38]);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUEditRoomViewController;
  v9 = a5;
  -[HUItemCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v16, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, v9);
  -[HUItemCollectionViewController itemManager](self, "itemManager", v16.receiver, v16.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v13) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "room");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v8, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeFirstResponder");
LABEL_5:

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  UIImage *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[HUEditRoomViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB6D0]);
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  v7 = objc_alloc(MEMORY[0x1E0D319F0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithType:assetIdentifier:cropInfo:", 1, v9, 0);

  objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processOriginalImageFromWallpaper:originalImage:", v10, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HUEditRoomViewController presentWallpaperEditingViewControllerWithImage:wallpaper:](self, "presentWallpaperEditingViewControllerWithImage:wallpaper:", v12, v10);
}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  id v6;
  id v7;

  -[HUEditRoomViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  -[HUEditRoomViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "popToViewController:animated:", self, 1);

}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0D319F0];
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  objc_msgSend(v6, "UUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customWallpaperWithAssetIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController updateWallpaper:image:](self, "updateWallpaper:image:", v9, v7);

}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
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
  id v25;
  id v26;

  v6 = (void *)MEMORY[0x1E0D319F0];
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customWallpaperWithAssetIdentifier:", v11);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setOriginalCustomImage:", v8);
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wallpaperBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWallpaper:image:", v26, v8);

  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "wallpaperPickerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForItem:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayedItemAtIndexPath:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager:didUpdateResultsForItem:atIndexPath:](self, "itemManager:didUpdateResultsForItem:atIndexPath:", v20, v19, v17);

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "room");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wallpaperBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "commitWallpaper");

  }
}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wallpaperBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWallpaper:image:", v8, v7);

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wallpaperBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "commitWallpaper");

  }
}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperEditCollectionFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HUEditRoomViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke;
  v8[3] = &unk_1E6F55AA0;
  v8[4] = self;
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v8);

}

void __70__HUEditRoomViewController_wallpaperPickerRequestOpenWallpaperEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "originalImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentWallpaperEditingViewControllerWithImage:wallpaper:", v6, v5);
}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  -[HUEditRoomViewController updateWallpaper:image:](self, "updateWallpaper:image:", a4, a5);
  -[HUEditRoomViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)wallpaperEditingDidCancel:(id)a3
{
  -[HUEditRoomViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4
{
  id v6;
  id v7;
  HUWallpaperEditingViewController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HUWallpaperEditingViewController initWithWallpaper:image:delegate:]([HUWallpaperEditingViewController alloc], "initWithWallpaper:image:delegate:", v6, v7, self);

  -[HUEditRoomViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wallpaperBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWallpaper:image:", v7, v6);

  -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HUEditRoomViewController roomBuilder](self, "roomBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaperBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "commitWallpaper");

  }
  v15 = +[HUWallpaperPickerInlineViewController useWallpaperPickerCell](HUWallpaperPickerInlineViewController, "useWallpaperPickerCell");
  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "wallpaperPickerItem");
  else
    objc_msgSend(v16, "wallpaperThumbnailItem");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[HUEditRoomViewController roomItemManager](self, "roomItemManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "indexPathForItem:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager:didUpdateResultsForItem:atIndexPath:](self, "itemManager:didUpdateResultsForItem:atIndexPath:", v20, v21, v19);

}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (HUEditRoomViewControllerPresentationDelegate)presentationDelegate
{
  return (HUEditRoomViewControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (HUEditRoomViewControllerAddRoomDelegate)addRoomDelegate
{
  return (HUEditRoomViewControllerAddRoomDelegate *)objc_loadWeakRetained((id *)&self->_addRoomDelegate);
}

- (HUZoneModuleController)zoneModuleController
{
  return self->_zoneModuleController;
}

- (void)setZoneModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_zoneModuleController, a3);
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerController
{
  return self->_wallpaperPickerController;
}

- (void)setWallpaperPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperPickerController, a3);
}

- (HUEditRoomItemManager)roomItemManager
{
  return (HUEditRoomItemManager *)objc_loadWeakRetained((id *)&self->_roomItemManager);
}

- (void)setRoomItemManager:(id)a3
{
  objc_storeWeak((id *)&self->_roomItemManager, a3);
}

- (UITextField)editingTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_editingTextField);
}

- (void)setEditingTextField:(id)a3
{
  objc_storeWeak((id *)&self->_editingTextField, a3);
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_destroyWeak((id *)&self->_editingTextField);
  objc_destroyWeak((id *)&self->_roomItemManager);
  objc_storeStrong((id *)&self->_wallpaperPickerController, 0);
  objc_storeStrong((id *)&self->_zoneModuleController, 0);
  objc_destroyWeak((id *)&self->_addRoomDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_roomBuilder, 0);
}

@end
