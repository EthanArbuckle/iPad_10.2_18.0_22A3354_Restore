@implementation HUFaceRecognitionAddPersonViewController

- (HUFaceRecognitionAddPersonViewController)initWithSignificantEvent:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HUFaceRecognitionAddPersonItemManager *v9;
  HUFaceRecognitionAddPersonItemManager *addPersonItemManager;
  HUFaceRecognitionAddPersonSearchBar *v11;
  HUFaceRecognitionAddPersonItemManager *v12;
  HUFaceRecognitionAddPersonViewController *v13;
  uint64_t v14;
  UIBarButtonItem *doneButton;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  HUFaceRecognitionAddPersonSearchBar *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "faceClassification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    NSLog(CFSTR("Face classification on significant event %@ is nil!"), v6);
  v9 = -[HUFaceRecognitionAddPersonItemManager initWithSignificantEvent:home:delegate:]([HUFaceRecognitionAddPersonItemManager alloc], "initWithSignificantEvent:home:delegate:", v6, v7, 0);

  addPersonItemManager = self->_addPersonItemManager;
  self->_addPersonItemManager = v9;

  v11 = objc_alloc_init(HUFaceRecognitionAddPersonSearchBar);
  v12 = self->_addPersonItemManager;
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  v13 = -[HUSearchableItemTableViewController initWithItemManager:tableViewStyle:searchBar:searchBarPosition:](&v23, sel_initWithItemManager_tableViewStyle_searchBar_searchBarPosition_, v12, 0, v11, 0);
  if (v13)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel__donePressed_);
    doneButton = v13->_doneButton;
    v13->_doneButton = (UIBarButtonItem *)v14;

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionAddPersonViewControllerTitle"), CFSTR("HUFaceRecognitionAddPersonViewControllerTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionAddPersonViewController setTitle:](v13, "setTitle:", v16);

    -[HUFaceRecognitionAddPersonViewController addPersonItemManager](v13, "addPersonItemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "faceCropImageFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__HUFaceRecognitionAddPersonViewController_initWithSignificantEvent_home___block_invoke;
    v21[3] = &unk_1E6F4D138;
    v22 = v11;
    v19 = (id)objc_msgSend(v18, "addSuccessBlock:", v21);

  }
  return v13;
}

void __74__HUFaceRecognitionAddPersonViewController_initWithSignificantEvent_home___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "faceCropView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

- (HUFaceRecognitionAddPersonViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSignificantEvent_home_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionAddPersonViewController.m"), 51, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionAddPersonViewController initWithItemManager:tableViewStyle:searchBar:searchBarPosition:]",
    v9);

  return 0;
}

- (void)updateForSearch
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  -[HUSearchableItemTableViewController updateForSearch](&v8, sel_updateForSearch);
  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;
  -[HUFaceRecognitionAddPersonViewController doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  void *v4;

  objc_msgSend(a3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A90]);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CEA718];
  v8 = a4;
  objc_msgSend(v7, "cellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  objc_msgSend(v8, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30A90]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v13);

  objc_msgSend(v9, "imageProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMaximumSize:", 44.0, 44.0);

  objc_msgSend(v9, "imageProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", 22.0);

  objc_msgSend(v6, "setContentConfiguration:", v9);
  objc_opt_class();
  v18 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v18;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "setAvatarSize:", 44.0);
  objc_msgSend(v18, "setAccessoryType:", 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  HUFaceRecognitionAddPersonViewController *v19;
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v21, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "person");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUFaceRecognitionAddPersonViewController addPersonItemManager](self, "addPersonItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "associateFaceClassificationWithExistingPerson:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__HUFaceRecognitionAddPersonViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_1E6F4D160;
    v17 = v6;
    v18 = v7;
    v19 = self;
    v20 = v11;
    v15 = (id)objc_msgSend(v14, "addCompletionBlock:", v16);

  }
}

void __78__HUFaceRecognitionAddPersonViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:", v11);

    objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addPersonViewControllerDidFinish:", *(_QWORD *)(a1 + 48));

    }
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D303F8]);
  objc_msgSend(*(id *)(a1 + 56), "person");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30400]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E0D30300]);
  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 4, v9);

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  -[HUSearchableItemTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUTableViewController setSectionContentInsetFollowsLayoutMargins:](self, "setSectionContentInsetFollowsLayoutMargins:", 0);
  -[HUFaceRecognitionAddPersonViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslucent:", 0);

  -[HUFaceRecognitionAddPersonViewController doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionAddPersonViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[HUFaceRecognitionAddPersonViewController doneButton](self, "doneButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  -[HUItemTableViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

}

- (void)_donePressed:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  HUFaceRecognitionAddPersonViewController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Done pressed", buf, 0xCu);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D303F8]);
  -[HUFaceRecognitionAddPersonViewController addPersonItemManager](self, "addPersonItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E0D30400]);
  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUFaceRecognitionAddPersonViewController doneButton](self, "doneButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", 0);

  -[HUFaceRecognitionAddPersonViewController addPersonItemManager](self, "addPersonItemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "associateFaceClassificationWithNewPersonNamed:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke;
  v22[3] = &unk_1E6F4D188;
  v22[4] = self;
  v16 = v5;
  v23 = v16;
  objc_msgSend(v14, "addSuccessBlock:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke_2;
  v20[3] = &unk_1E6F4D1B0;
  v20[4] = self;
  v21 = v16;
  v18 = v16;
  v19 = (id)objc_msgSend(v17, "addFailureBlock:", v20);

}

uint64_t __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPersonViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  return objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 4, *(_QWORD *)(a1 + 40));
}

uint64_t __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleError:", v4);

  objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v4, *MEMORY[0x1E0D30300]);
  return objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 4, *(_QWORD *)(a1 + 40));
}

- (HUFaceRecognitionAddPersonViewControllerDelegate)delegate
{
  return (HUFaceRecognitionAddPersonViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUFaceRecognitionAddPersonItemManager)addPersonItemManager
{
  return self->_addPersonItemManager;
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_addPersonItemManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
