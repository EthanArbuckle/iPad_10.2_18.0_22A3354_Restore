@implementation HUSceneActionEditorViewController

- (HUSceneActionEditorViewController)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  HUSceneActionEditorItemManager *v13;
  HUSceneActionEditorViewController *v14;
  HUSceneActionEditorViewController *v15;
  uint64_t v16;
  NSMutableDictionary *actionGridViewControllersByEditorType;
  objc_super v19;

  v6 = a3;
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D31140]);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "initWithHome:", v9);

  }
  objc_msgSend(v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (v11)
    v12 = a4;
  else
    v12 = 4;
  v13 = -[HUSceneActionEditorItemManager initWithActionSetBuilder:mode:delegate:]([HUSceneActionEditorItemManager alloc], "initWithActionSetBuilder:mode:delegate:", v6, v12, self);
  v19.receiver = self;
  v19.super_class = (Class)HUSceneActionEditorViewController;
  v14 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v19, sel_initWithItemManager_tableViewStyle_, v13, 1);
  v15 = v14;
  if (v14)
  {
    v14->_mode = v12;
    v14->_showCancelButton = 1;
    v14->_requiresPresentingViewControllerDismissal = 1;
    v16 = objc_opt_new();
    actionGridViewControllersByEditorType = v15->_actionGridViewControllersByEditorType;
    v15->_actionGridViewControllersByEditorType = (NSMutableDictionary *)v16;

  }
  return v15;
}

- (void)viewDidLoad
{
  unint64_t mode;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUSceneActionEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  mode = self->_mode;
  if (mode - 1 < 2)
  {
    v7 = CFSTR("HUSceneActionEditorNewTitle");
LABEL_7:
    _HULocalizedStringWithDefaultValue(v7, v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneActionEditorViewController setTitle:](self, "setTitle:", v4);
    goto LABEL_8;
  }
  if (mode - 3 >= 2)
  {
    if (mode)
      goto LABEL_9;
    v7 = CFSTR("HUSceneActionEditorEditTitle");
    goto LABEL_7;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneActionEditorViewController setTitle:](self, "setTitle:", v6);

LABEL_8:
LABEL_9:
  if (-[HUSceneActionEditorViewController showCancelButton](self, "showCancelButton"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
    -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Home.NewScene.Done"));

  -[HUSceneActionEditorViewController _validateDoneButton](self, "_validateDoneButton");
}

- (void)viewDidAppear:(BOOL)a3
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorViewController;
  -[HUItemTableViewController viewDidAppear:](&v15, sel_viewDidAppear_, a3);
  if (-[HUSceneActionEditorViewController _allowEditingNameAndIcon](self, "_allowEditingNameAndIcon")
    && !-[HUSceneActionEditorViewController hasViewEverAppeared](self, "hasViewEverAppeared")
    && -[HUSceneActionEditorViewController mode](self, "mode") == 2)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameAndIconItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
  -[HUSceneActionEditorViewController setHasViewEverAppeared:](self, "setHasViewEverAppeared:", 1);
  -[HUSceneActionEditorViewController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUSceneActionEditorViewController setNavigationBarTitleView:](self, "setNavigationBarTitleView:", v9);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionSetBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneActionEditorViewController navigationBarTitleView](self, "navigationBarTitleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "summaryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrimaryText:", v12);

  }
  if (!-[HUSceneActionEditorViewController mode](self, "mode"))
    objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:", 35);

}

- (NSSet)prioritizedAccessories
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prioritizedAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setPrioritizedAccessories:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrioritizedAccessories:", v4);

}

- (NSString)savedName
{
  void *v2;
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_actionGridViewControllerForEditorType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  -[HUSceneActionEditorViewController actionGridViewControllersByEditorType](self, "actionGridViewControllersByEditorType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HUSceneActionEditorViewController__actionGridViewControllerForEditorType___block_invoke;
  v9[3] = &unk_1E6F56598;
  v9[4] = self;
  v9[5] = a3;
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HUEmbeddedSceneActionGridViewController *__76__HUSceneActionEditorViewController__actionGridViewControllerForEditorType___block_invoke(uint64_t a1)
{
  HUEmbeddedSceneActionGridViewController *v2;
  void *v3;
  void *v4;
  HUEmbeddedSceneActionGridViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = [HUEmbeddedSceneActionGridViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUEmbeddedSceneActionGridViewController initWithActionSetBuilder:](v2, "initWithActionSetBuilder:", v4);

  -[ActionGridViewController setAllowsEditing:](v5, "setAllowsEditing:", objc_msgSend(*(id *)(a1 + 32), "mode") != 4);
  -[HUEmbeddedSceneActionGridViewController setSceneActionGridDelegate:](v5, "setSceneActionGridDelegate:", *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "prioritizedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActionGridViewController setDenylistedAccessories:](v5, "setDenylistedAccessories:", v8);
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "prioritizedAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ActionGridViewController setAllowlistedAccessories:](v5, "setAllowlistedAccessories:", v8);
LABEL_5:

  }
  return v5;
}

- (id)commitChanges
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) != 0)
  {
    -[HUSceneActionEditorViewController _updateActionSetBuilderName](self, "_updateActionSetBuilderName");
    -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", 0);
    -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v8);
    -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    objc_msgSend(v8, "startAnimating");
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionSetBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "commitItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke;
    v25[3] = &unk_1E6F4F4D0;
    objc_copyWeak(&v26, &location);
    v15 = (id)objc_msgSend(v13, "addSuccessBlock:", v25);
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_2;
    v23[3] = &unk_1E6F4ED68;
    objc_copyWeak(&v24, &location);
    v16 = (id)objc_msgSend(v13, "addFailureBlock:", v23);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_5;
    v21[3] = &unk_1E6F4C0D8;
    v21[4] = self;
    v17 = v7;
    v22 = v17;
    v18 = (id)objc_msgSend(v13, "addCompletionBlock:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  else
  {
    -[HUSceneActionEditorViewController presentationDelegate](self, "presentationDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishPresentation:animated:", self, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentationDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "finishPresentation:animated:", WeakRetained, 1);

}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_3;
  v8[3] = &unk_1E6F4C638;
  v9 = v3;
  v10 = WeakRetained;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "afterDelay:performBlock:", v8, 0.2);

}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_4;
  v4[3] = &unk_1E6F4D988;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "handleError:retryBlock:cancelBlock:", v3, v4, 0);

}

uint64_t __50__HUSceneActionEditorViewController_commitChanges__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_done:", 0);
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "setRightBarButtonItem:", v2);

  objc_msgSend(*(id *)(a1 + 32), "sceneEditorDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneEditorDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSetBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneEditor:didCommitActionSet:", v5, v7);

  }
}

- (void)_done:(id)a3
{
  id v3;

  v3 = -[HUSceneActionEditorViewController commitChanges](self, "commitChanges", a3);
}

- (void)_cancel:(id)a3
{
  id v4;
  id v5;

  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", 0);
  -[HUSceneActionEditorViewController presentationDelegate](self, "presentationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "finishPresentation:animated:", self, 1);

}

- (void)_changeServices:(id)a3
{
  HUActionSetAccessoryPickerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HUActionSetAccessoryPickerViewController *v10;

  -[HUSceneActionEditorViewController _updateActionSetBuilderName](self, "_updateActionSetBuilderName", a3);
  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", 0);
  v4 = [HUActionSetAccessoryPickerViewController alloc];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUActionSetAccessoryPickerViewController initWithActionSetBuilder:delegate:](v4, "initWithActionSetBuilder:delegate:", v6, self);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v10);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[HUSceneActionEditorViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endEditing:", 1);

  v9 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v7, 1);
}

- (void)_deleteScene:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionSetBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSceneActionEditorDeleteSceneConfirmationAlertTitle"), CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorDeleteSceneConfirmationAlertMessage"), CFSTR("HUSceneActionEditorDeleteSceneConfirmationAlertMessage"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    -[UITableViewController hu_actionSheetWithTitle:message:indexPath:](self, "hu_actionSheetWithTitle:message:indexPath:", v18, v19, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v21 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorDeleteSceneConfirmationButtonTitle"), CFSTR("HUSceneActionEditorDeleteSceneConfirmationButtonTitle"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke;
    v27[3] = &unk_1E6F4F440;
    objc_copyWeak(&v29, &location);
    v28 = v6;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 2, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v23);

    v24 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorDeleteSceneCancelButtonTitle"), CFSTR("HUSceneActionEditorDeleteSceneCancelButtonTitle"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, &__block_literal_global_133);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v26);

    -[HUSceneActionEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    NSLog(CFSTR("No action set to delete"));
  }

}

void __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "mode") == 3)
  {
    objc_msgSend(WeakRetained, "sceneEditorDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "itemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionSetBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneEditor:removeActionSetBuilderFromTrigger:", WeakRetained, v5);

    objc_msgSend(WeakRetained, "presentationDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "finishPresentation:animated:", WeakRetained, 1);

  }
  else
  {
    objc_msgSend(WeakRetained, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionSetBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteActionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke_2;
    v12[3] = &unk_1E6F4C0D8;
    v12[4] = WeakRetained;
    v13 = *(id *)(a1 + 32);
    v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v12);

  }
}

void __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    v5 = *MEMORY[0x1E0D309D8];
    objc_msgSend(*(id *)(a1 + 32), "editingName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_errorWithOperationType:failedItemName:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleError:", v7);

  }
  else
  {
    v9 = objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CB8238]);
    v10 = *(void **)(a1 + 32);
    if (!v9)
    {
      objc_msgSend(v10, "_done:", *(_QWORD *)(a1 + 40));
      goto LABEL_7;
    }
    objc_msgSend(v10, "presentationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "finishPresentation:animated:", *(_QWORD *)(a1 + 32), 1);
  }

LABEL_7:
}

- (void)_testScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  HUSceneActionEditorViewController *v19;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_characteristicValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_105);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__HUSceneActionEditorViewController__testScene___block_invoke_2;
  v17[3] = &unk_1E6F4F3F0;
  v18 = v6;
  v19 = self;
  v13 = v6;
  objc_msgSend(v11, "addSuccessBlock:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __48__HUSceneActionEditorViewController__testScene___block_invoke_5;
  v16[3] = &unk_1E6F4E2D8;
  v16[4] = self;
  v15 = (id)objc_msgSend(v14, "addFailureBlock:", v16);

}

uint64_t __48__HUSceneActionEditorViewController__testScene___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performValidation");
}

void __48__HUSceneActionEditorViewController__testScene___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "beginTransactionWithReason:", CFSTR("HUSceneActionEditorTransactionReasonTestScene"));
  objc_msgSend(*(id *)(a1 + 40), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_107_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_filter:", &__block_literal_global_109_2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "executeActions:", v7);

  objc_msgSend(*(id *)(a1 + 32), "commitTransactionWithReason:", CFSTR("HUSceneActionEditorTransactionReasonTestScene"));
}

uint64_t __48__HUSceneActionEditorViewController__testScene___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __48__HUSceneActionEditorViewController__testScene___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

void __48__HUSceneActionEditorViewController__testScene___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D30A50];
  objc_msgSend(*(id *)(a1 + 32), "editingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "savedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "hf_errorWithOperationType:failedItemName:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleError:", v7);

  if (!v5)
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
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
  char v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameAndIconItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionGridItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v5);

    if ((v11 & 1) == 0)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "isEqual:", v13);

      if ((v14 & 1) == 0)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "showInHomeDashboardItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "isEqual:", v16);

      }
    }
  }
  objc_opt_class();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  int v50;
  id v51;

  v51 = a3;
  v8 = a4;
  v9 = a5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nameAndIconItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v8)
  {
    v23 = objc_opt_class();
    v24 = v51;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v24;
      if (v25)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v23, objc_opt_class());

    }
    v26 = 0;
LABEL_11:

    objc_msgSend(v26, "setDelegate:", self);
    objc_msgSend(v26, "setDisabled:", -[HUSceneActionEditorViewController _allowEditingNameAndIcon](self, "_allowEditingNameAndIcon") ^ 1);
    +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:](HUGridSceneCellLayoutOptions, "defaultOptionsForCellSizeSubclass:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextFieldFont:", v30);

    objc_msgSend(v26, "iconButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSelected:", 1);

    objc_msgSend(v26, "textField");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccessibilityIdentifier:", CFSTR("Home.NewScene.SceneName"));

    goto LABEL_23;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionGridItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v8);

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CEA478];
    v16 = v51;
    objc_msgSend(v15, "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

    objc_msgSend(v16, "setIgnoreRounding:", 1);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v9, "section"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSceneActionEditorViewController _actionGridViewControllerForEditorType:](self, "_actionGridViewControllerForEditorType:", +[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:](HUSceneActionEditorItemManager, "actionGridEditorTypeForSectionIdentifier:", v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setViewController:", v22);

    goto LABEL_24;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "deleteSceneItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "isEqual:", v34);

  if (v35)
  {
    v26 = v51;
    objc_msgSend(v26, "setDestructive:", 1);
    if (!-[HUSceneActionEditorViewController mode](self, "mode"))
    {
      v36 = CFSTR("Home.Scene.DeleteScene");
LABEL_22:
      objc_msgSend(v26, "setAccessibilityIdentifier:", v36);
    }
LABEL_23:

    goto LABEL_24;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "mediaItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v8, "isEqual:", v38);

  if (v39)
  {
    v40 = v51;
    objc_msgSend(v40, "setAccessoryType:", 1);
    objc_msgSend(v40, "setHideIcon:", 1);

    goto LABEL_24;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "showInHomeDashboardItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v8, "isEqual:", v42);

  if (!v43)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "testSceneItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v8, "isEqual:", v45);

    if (v46)
    {
      v47 = CFSTR("Home.Scene.TestScene");
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "changeServicesItem");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v8, "isEqual:", v49);

      if (!v50)
        goto LABEL_24;
      v47 = CFSTR("Home.Scene.ChangeAccessories");
    }
    objc_msgSend(v51, "setAccessibilityIdentifier:", v47);
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Wrong cell class"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v51;
    objc_msgSend(v26, "setDelegate:", self);
    v36 = CFSTR("Home.Scene.AddToHomeView");
    goto LABEL_22;
  }
LABEL_24:

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v6 = a6;
  v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUSceneActionEditorViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v21, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nameAndIconItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    v15 = objc_opt_class();
    v16 = v10;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v16;
      if (v17)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class(), v21.receiver, v21.super_class);

    }
    v18 = 0;
LABEL_9:

    objc_msgSend(v18, "setDisabled:", -[HUSceneActionEditorViewController _allowEditingNameAndIcon](self, "_allowEditingNameAndIcon") ^ 1);
  }

}

- (void)itemManagerDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUSceneActionEditorViewController;
  -[HUItemTableViewController itemManagerDidUpdate:](&v9, sel_itemManagerDidUpdate_, a3);
  -[HUSceneActionEditorViewController _validateDoneButton](self, "_validateDoneButton");
  -[HUSceneActionEditorViewController navigationBarTitleView](self, "navigationBarTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSetBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrimaryText:", v8);

  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6;
  char isKindOfClass;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSceneActionEditorViewController;
  if (-[HUItemTableViewController shouldHideSeparatorsForCell:indexPath:](&v9, sel_shouldHideSeparatorsForCell_indexPath_, v6, a4)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)childViewControllersToPreload
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[HUSceneActionEditorItemManager allActionGridEditorSectionIdentifiers](HUSceneActionEditorItemManager, "allActionGridEditorSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HUSceneActionEditorViewController_childViewControllersToPreload__block_invoke;
  v7[3] = &unk_1E6F56640;
  v7[4] = self;
  objc_msgSend(v3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __66__HUSceneActionEditorViewController_childViewControllersToPreload__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionIndexForDisplayedSectionIdentifier:", v3);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_actionGridViewControllerForEditorType:", +[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:](HUSceneActionEditorItemManager, "actionGridEditorTypeForSectionIdentifier:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUSceneActionEditorSceneNamePlaceholderText"), CFSTR("HUSceneActionEditorSceneNamePlaceholderText"), 1);
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[HUSceneActionEditorViewController editingName](self, "editingName", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[HUSceneActionEditorViewController savedName](self, "savedName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", a3, a4, a5);
  -[HUSceneActionEditorViewController navigationBarTitleView](self, "navigationBarTitleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summaryView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUSceneActionEditorViewController editingName](self, "editingName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrimaryText:", v7);

  }
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  -[HUSceneActionEditorViewController _updateActionSetBuilderName](self, "_updateActionSetBuilderName", a3, a4);
  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", 0);
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemSectionForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "headerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    objc_msgSend(v5, "headerSecondaryText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryText:", v8);

    objc_msgSend(v6, "directionalLayoutMargins");
    objc_msgSend(v6, "setDirectionalLayoutMargins:");
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
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
  void *v15;
  BOOL v16;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedItemAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeServicesItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    v16 = 1;
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "testSceneItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v11)
    {
      v16 = 1;
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteSceneItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v13)
      {
        v16 = 1;
      }
      else
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mediaItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v7 == v15;

      }
    }

  }
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUSceneActionEditorViewController;
  v7 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v18.receiver, v18.super_class);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeServicesItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v11)
  {
    -[HUSceneActionEditorViewController _changeServices:](self, "_changeServices:", v9);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "testSceneItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v13)
    {
      -[HUSceneActionEditorViewController _testScene:](self, "_testScene:", v9);
    }
    else
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deleteSceneItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v15)
      {
        -[HUSceneActionEditorViewController _deleteScene:indexPath:](self, "_deleteScene:indexPath:", v9, v6);
      }
      else
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mediaItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v17)
          -[HUSceneActionEditorViewController _presentMediaSelection](self, "_presentMediaSelection");
      }
    }
  }

}

- (void)_updateActionSetBuilderName
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  id v23;
  id v24;

  v4 = (void *)MEMORY[0x1E0D319D0];
  -[HUSceneActionEditorViewController editingName](self, "editingName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sanitizeUserEnteredHomeKitName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", v6);

  -[HUSceneActionEditorViewController editingName](self, "editingName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7
    || (v8 = (void *)v7,
        -[HUSceneActionEditorViewController editingName](self, "editingName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        v8,
        !v10))
  {
    -[HUSceneActionEditorViewController savedName](self, "savedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", v12);

    -[HUSceneActionEditorViewController editingName](self, "editingName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nameAndIconItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController textFieldForVisibleItem:](self, "textFieldForVisibleItem:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);

  }
  -[HUSceneActionEditorViewController editingName](self, "editingName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionSetBuilder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setName:", v18);

  -[HUSceneActionEditorViewController _validateDoneButton](self, "_validateDoneButton");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "instructionsItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v24, "updateResultsForItems:senderSelector:", v22, a2);

}

- (void)_validateDoneButton
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSetBuilder");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    objc_msgSend(v10, "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "length") != 0;
  }
  else
  {
    v7 = 0;
  }
  -[HUSceneActionEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v7);

  if (v6)
}

- (BOOL)_allowEditingNameAndIcon
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUSceneActionEditorViewController mode](self, "mode") == 4)
  {
    v5 = 0;
  }
  else
  {
    if (_MergedGlobals_4_2 != -1)
      dispatch_once(&_MergedGlobals_4_2, &__block_literal_global_145);
    v6 = (id)qword_1EF226AC0;
    objc_msgSend(v4, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "actionSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionSetType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "containsObject:", v9);

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

void __61__HUSceneActionEditorViewController__allowEditingNameAndIcon__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8228];
  v6[0] = *MEMORY[0x1E0CB8238];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB8210];
  v6[2] = *MEMORY[0x1E0CB8240];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E0CB8218];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1EF226AC0;
  qword_1EF226AC0 = v4;

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v6 = a3;
  -[HUSceneActionEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showInHomeDashboardItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionSetBuilder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShowInHomeDashboard:", v4);

  }
  v15 = (void *)MEMORY[0x1E0D31170];
  objc_msgSend(v9, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D20]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v9, v4, v17, self);

}

- (void)_servicePickerDidFinish
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[HUSceneActionEditorViewController _validateDoneButton](self, "_validateDoneButton");
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemsToHideWhenEmpty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instructionsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "updateResultsForItems:senderSelector:", v8, a2);

  -[HUSceneActionEditorViewController actionGridViewControllersByEditorType](self, "actionGridViewControllersByEditorType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke;
  v15[3] = &__block_descriptor_40_e40_v16__0__HUItemCollectionViewController_8l;
  v15[4] = a2;
  objc_msgSend(v12, "na_each:", v15);

  v14[0] = v13;
  v14[1] = 3221225472;
  v14[2] = __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke_2;
  v14[3] = &unk_1E6F4D988;
  v14[4] = self;
  -[HUSceneActionEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);

}

void __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  objc_msgSend(a2, "itemManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 32));

}

void __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "diffableDataSourceDisabled");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "tableView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:withRowAnimation:", v5, 5);

  }
  else
  {
    objc_msgSend(v4, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemSectionForSectionIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "itemManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadUIRepresentationForSections:withAnimation:", v9, 0);

    }
  }
}

- (void)nameAndIconEditorCellDidTapIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUSymbolIconPickerViewController *v10;
  void *v11;
  id v12;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDescriptor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSetBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconTintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HUSymbolIconPickerViewController sceneIconDescriptors](HUSymbolIconPickerViewController, "sceneIconDescriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUSymbolIconPickerViewController initWithIconDescriptors:selectedIconDescriptor:selectedTintColor:delegate:]([HUSymbolIconPickerViewController alloc], "initWithIconDescriptors:selectedIconDescriptor:selectedTintColor:delegate:", v9, v12, v8, self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v10);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  -[HUSceneActionEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)iconPickerDidCancel:(id)a3
{
  -[HUSceneActionEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[HUSceneActionEditorViewController _sendSceneIconEditEventDidChangeColor:didChangeIcon:](self, "_sendSceneIconEditEventDidChangeColor:didChangeIcon:", 0, 0);
}

- (void)iconPicker:(id)a3 didPickIcon:(id)a4 withTintColor:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;

  v54 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v53 = v9;
  if (!v9)
  {
    v22 = 0;
    if (v10)
      goto LABEL_11;
LABEL_8:
    v23 = 0;
    v24 = v53;
    goto LABEL_16;
  }
  objc_opt_class();
  v12 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionSetBuilder");
    v52 = v11;
    v16 = a2;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "iconDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20) ^ 1;

    v22 = v21;
    a2 = v16;
    v11 = v52;

  }
  else
  {
    v22 = 0;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionSetBuilder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIconDescriptor:", v12);

  if (!v11)
    goto LABEL_8;
LABEL_11:
  -[HUItemTableViewController itemManager](self, "itemManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "actionSetBuilder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "iconTintColor");
  v29 = objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "actionSetBuilder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "actionSet");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32 | v29;

  if (v33
    || (objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v11, "isEqual:", v34),
        v34,
        (v35 & 1) == 0))
  {
    v23 = objc_msgSend((id)v29, "isEqual:", v11) ^ 1;
  }
  else
  {
    v23 = 0;
  }
  v24 = v53;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "actionSetBuilder");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setIconTintColor:", v11);

LABEL_16:
  -[HUItemTableViewController itemManager](self, "itemManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "nameAndIconItem");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithObject:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v38, "updateResultsForItems:senderSelector:", v42, a2);

  -[HUSceneActionEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) == 0)
  {
    -[HUSceneActionEditorViewController navigationBarTitleView](self, "navigationBarTitleView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "summaryView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "baseIconView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "configuration");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      v48 = (void *)objc_msgSend(v47, "copyWithIconDescriptor:", v24);
      -[HUSceneActionEditorViewController navigationBarTitleView](self, "navigationBarTitleView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "summaryView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "baseIconView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setConfiguration:", v48);

    }
  }
  -[HUSceneActionEditorViewController _sendSceneIconEditEventDidChangeColor:didChangeIcon:](self, "_sendSceneIconEditEventDidChangeColor:didChangeIcon:", v23, v22);

}

- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a4)
  {
    v6 = a4;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionSetBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIconDescriptor:", v6);

  }
  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nameAndIconItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v9, "updateResultsForItems:senderSelector:", v13, a2);

  -[HUSceneActionEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentMediaSelection
{
  void *v3;
  HUMediaSelectionViewController *v4;
  void *v5;
  id v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSetBuilder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[HUMediaSelectionViewController initWithActionSetBuilder:]([HUMediaSelectionViewController alloc], "initWithActionSetBuilder:", v6);
  -[HUMediaSelectionViewController setDelegate:](v4, "setDelegate:", self);
  -[HUSceneActionEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (void)sceneActionGridViewController:(id)a3 didUpdate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (objc_msgSend(a4, "na_any:", &__block_literal_global_153_0))
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[HUItemTableViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v11, "updateResultsForItems:senderSelector:", v9, a2);

  }
}

uint64_t __77__HUSceneActionEditorViewController_sceneActionGridViewController_didUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "containingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mediaItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v11, "updateResultsForItems:senderSelector:", v15, a2);

    }
  }

}

- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4
{
  const __CFString *v4;

  v4 = CFSTR("HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
  if (a4 != 1)
    v4 = 0;
  if (a4)
    return (id)v4;
  else
    return CFSTR("HUSceneMediaPickerUnavailableMusicAppUninstalledPromptMessage");
}

- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3
{
  return CFSTR("HUSceneMediaActionPlayUnavailableMessage");
}

- (void)_sendSceneIconEditEventDidChangeColor:(BOOL)a3 didChangeIcon:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
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
  _BOOL8 v20;
  void *v21;
  id v22;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30448];
  v22 = v7;
  if (v5 || v4)
  {
    objc_msgSend(v7, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAB0], v8);
    if (v5)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionSetBuilder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "iconTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E0D30440]);

    }
    if (v4)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionSetBuilder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E0D30450]);

    }
  }
  else
  {
    objc_msgSend(v7, "na_safeSetObject:forKey:", MEMORY[0x1E0C9AAA0], v8);
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionSetBuilder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E0D30458]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 38, v22);
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (HUSceneEditorDelegate)sceneEditorDelegate
{
  return (HUSceneEditorDelegate *)objc_loadWeakRetained((id *)&self->_sceneEditorDelegate);
}

- (void)setSceneEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sceneEditorDelegate, a3);
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTitleView, a3);
}

- (NSString)editingName
{
  return self->_editingName;
}

- (void)setEditingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (NSMutableDictionary)actionGridViewControllersByEditorType
{
  return self->_actionGridViewControllersByEditorType;
}

- (BOOL)hasViewEverAppeared
{
  return self->_hasViewEverAppeared;
}

- (void)setHasViewEverAppeared:(BOOL)a3
{
  self->_hasViewEverAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGridViewControllersByEditorType, 0);
  objc_storeStrong((id *)&self->_editingName, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_destroyWeak((id *)&self->_sceneEditorDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
