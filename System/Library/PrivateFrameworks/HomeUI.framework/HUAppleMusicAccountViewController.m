@implementation HUAppleMusicAccountViewController

- (HUAppleMusicAccountViewController)initWithHFItem:(id)a3 mediaProfileContainer:(id)a4
{
  id v6;
  id v7;
  HUAppleMusicAccountItemManager *v8;
  HUAppleMusicAccountViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v8 = -[HUAppleMusicAccountItemManager initWithMediaProfileContainer:delegate:]([HUAppleMusicAccountItemManager alloc], "initWithMediaProfileContainer:delegate:", v7, self);

  v13.receiver = self;
  v13.super_class = (Class)HUAppleMusicAccountViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, v8, 1);
  if (v9)
  {
    objc_msgSend(v6, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountViewController setTitle:](v9, "setTitle:", v11);

  }
  return v9;
}

- (HUAppleMusicAccountViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  HUAppleMusicAccountViewController *v16;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &unk_1EF347468;
  v8 = v6;
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  if (objc_msgSend(v8, "conformsToProtocol:", v7))
    v10 = v9;
  else
    v10 = 0;
  v11 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v14);

LABEL_7:
    v11 = 0;
  }

  if (!v11)
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "-[HUAppleMusicAccountViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }

  }
  v16 = -[HUAppleMusicAccountViewController initWithHFItem:mediaProfileContainer:](self, "initWithHFItem:mediaProfileContainer:", v4, v11);

  return v16;
}

- (HUAppleMusicAccountViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HUAppleMusicAccountViewController *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicAccountViewController.m"), 72, CFSTR("HUAppleMusicAccountViewController initialized without HUHomeKitAccessorySettingsItemModule"));

  }
  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "mediaProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUAppleMusicAccountViewController initWithHFItem:mediaProfileContainer:](self, "initWithHFItem:mediaProfileContainer:", v7, v12);

  return v13;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HUAppleMusicAccountModuleController *v13;
  void *v14;
  HUAppleMusicAccountModuleController *v15;
  void *v16;
  uint64_t v17;
  HUPrimaryUserSettingsItemModuleController *v18;

  v5 = a3;
  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "appleMusicAccountModule");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v5)
  {
    v13 = [HUAppleMusicAccountModuleController alloc];
    objc_msgSend(v8, "appleMusicAccountModule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HUAppleMusicAccountModuleController initWithModule:](v13, "initWithModule:", v14);
    -[HUAppleMusicAccountViewController setAppleMusicAccountModuleController:](self, "setAppleMusicAccountModuleController:", v15);

    -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

    -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = (void *)v17;
    goto LABEL_10;
  }
  objc_msgSend(v8, "primaryUserSettingsItemModule");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v5)
  {
    v18 = -[HUItemModuleController initWithModule:]([HUPrimaryUserSettingsItemModuleController alloc], "initWithModule:", v5);
    -[HUAppleMusicAccountViewController setPrimaryUserModuleController:](self, "setPrimaryUserModuleController:", v18);

    -[HUAppleMusicAccountViewController primaryUserModuleController](self, "primaryUserModuleController");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicAccountViewController.m"), 93, CFSTR("Unknown module %@"), v5);

  v12 = 0;
LABEL_10:

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAppleMusicAccountViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HUAppleMusicAccountViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("HOAppleMusicAccountViewFooterViewReuseIdentifier"));

}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)HUAppleMusicAccountViewController;
  -[HUItemTableViewController itemModuleControllers](&v8, sel_itemModuleControllers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[HUAppleMusicAccountViewController primaryUserModuleController](self, "primaryUserModuleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return v3;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HUAppleMusicAccountModule_MusicActionsSectionIdentifier")))
  {
    -[HUAppleMusicAccountViewController _appleMusicFooterMessage](self, "_appleMusicFooterMessage");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9,
          v11 = -[HUAppleMusicAccountViewController _accessorySupportsMultiUser](self, "_accessorySupportsMultiUser"),
          v10,
          !v11))
    {
      v13 = 0;
      goto LABEL_8;
    }
    -[HUAppleMusicAccountViewController _appleMusicFooterView](self, "_appleMusicFooterView");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HUAppleMusicAccountViewController;
    -[HUItemTableViewController tableView:viewForHeaderInSection:](&v15, sel_tableView_viewForHeaderInSection_, v6, a4);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
LABEL_8:

  return v13;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("HUAppleMusicAccountModule_MusicActionsSectionIdentifier")))
  {
    v12.receiver = self;
    v12.super_class = (Class)HUAppleMusicAccountViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v12, sel_tableView_viewForFooterInSection_, v6, a4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  if (!-[HUAppleMusicAccountViewController _accessorySupportsMultiUser](self, "_accessorySupportsMultiUser"))
  {
    -[HUAppleMusicAccountViewController _appleMusicFooterView](self, "_appleMusicFooterView");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HUPrimaryUserSettingsUserSectionIdentifier")))
    v7 = 0.01;
  else
    v7 = *MEMORY[0x1E0CEBC10];

  return v7;
}

- (void)appleMusicModuleController:(id)a3 willPresentContext:(id)a4 account:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptTitle"), CFSTR("HUAppleMusicPromptTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v8);

  if (v7)
  {
    objc_msgSend(v7, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUsername:", v9);

    objc_msgSend(v13, "setIsUsernameEditable:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptReason"), CFSTR("HUAppleMusicPromptReason"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("\n\n%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReason:", v12);

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicPromptReason"), CFSTR("HUAppleMusicPromptReason"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setReason:", v10);
  }

  objc_msgSend(v13, "setPresentingViewController:", self);
}

- (void)appleMusicModuleControllerDidUpdateAuthenticationState:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "state") == 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v13, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "state") != 3;

  }
  -[HUAppleMusicAccountViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v5);

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfSections");

  if (v11 >= 2)
    objc_msgSend(v9, "addIndex:", 1);
  -[HUAppleMusicAccountViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_reloadSectionHeaderFooters:withRowAnimation:", v9, 100);

}

- (void)appleMusicModuleControllerPresentSignInFlow:(id)a3
{
  id v4;
  void *v5;
  HUAppleMusicAccountViewController *v6;
  HUAppleMusicAccountViewController *v7;
  HUAppleMusicAccountViewController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;

  v4 = a3;
  -[HUAppleMusicAccountViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[UITableViewController hu_getSelectedCell](v8, "hu_getSelectedCell");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_initWeak(&location, v6);
  v10 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountSignInActionSheetTitle"), CFSTR("HUAppleMusicAccountSignInActionSheetTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hu_actionSheetWithTitle:message:anchorView:", 0, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountActionSheetChangeDefaultAccountButtonTitle"), CFSTR("HUAppleMusicAccountActionSheetChangeDefaultAccountButtonTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke;
  v22 = &unk_1E6F56E30;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v15, v19, v20, v21, v22);

  v16 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountActionSheetCancelButtonTitle"), CFSTR("HUAppleMusicAccountActionSheetCancelButtonTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v18);

  -[HUAppleMusicAccountViewController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v12, 1, 0);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText"), CFSTR("HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hu_alertControllerWithActivityIndicatorAndTitle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAppleMusicLoadingViewController:", v8);

  objc_msgSend(WeakRetained, "appleMusicLoadingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_2;
  v10[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v11, v4);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, v10);

  objc_destroyWeak(&v11);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appleMusicAccountModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kickOffManualLogin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_3;
  v6[3] = &unk_1E6F4E380;
  objc_copyWeak(&v7, v1);
  objc_msgSend(v4, "addCompletionBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAccountArbitrationFuture:", v5);

  objc_destroyWeak(&v7);
}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appleMusicLoadingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_4;
    v11[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v12, v7);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v11);
    objc_destroyWeak(&v12);
  }

}

void __81__HUAppleMusicAccountViewController_appleMusicModuleControllerPresentSignInFlow___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAppleMusicLoadingViewController:", 0);
  objc_msgSend(WeakRetained, "setAccountArbitrationFuture:", 0);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  HUAppleMusicAccountViewController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31970], "musicLoginURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "module");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "state");

    if ((v15 & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      v16 = (void *)MEMORY[0x1E0CEA2E8];
      _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText"), CFSTR("HUMediaSystemAppleMusicAccountEditorViewControllerLoadingText"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hu_alertControllerWithActivityIndicatorAndTitle:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAppleMusicAccountViewController setAppleMusicLoadingViewController:](self, "setAppleMusicLoadingViewController:", v18);

      objc_initWeak((id *)buf, self);
      -[HUAppleMusicAccountViewController appleMusicLoadingViewController](self, "appleMusicLoadingViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
      v21[3] = &unk_1E6F4DD08;
      objc_copyWeak(&v22, (id *)buf);
      -[HUAppleMusicAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, v21);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }

  return 0;
}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appleMusicAccountModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kickOffManualLogin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_2;
  v6[3] = &unk_1E6F4E380;
  objc_copyWeak(&v7, v1);
  objc_msgSend(v4, "addCompletionBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAccountArbitrationFuture:", v5);

  objc_destroyWeak(&v7);
}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appleMusicLoadingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_3;
    v11[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v12, v7);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v11);
    objc_destroyWeak(&v12);
  }

}

void __88__HUAppleMusicAccountViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAppleMusicLoadingViewController:", 0);
  objc_msgSend(WeakRetained, "setAccountArbitrationFuture:", 0);

}

- (id)_appleMusicFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUAppleMusicAccountViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("HOAppleMusicAccountViewFooterViewReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setType:", 1);
  -[HUAppleMusicAccountViewController _appleMusicFooterMessage](self, "_appleMusicFooterMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v5);

  objc_msgSend(v4, "messageTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  return v4;
}

- (id)_appleMusicFooterMessage
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = -[HUAppleMusicAccountViewController _accessorySupportsMultiUser](self, "_accessorySupportsMultiUser");
  -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signInMessage:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length")
    && -[HUAppleMusicAccountViewController _accessorySupportsMultiUser](self, "_accessorySupportsMultiUser"))
  {
    -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "explicitAccountSignedInMessage");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
LABEL_6:
    if (objc_msgSend(v6, "length"))
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
    else
      v10 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "length")
    || -[HUAppleMusicAccountViewController _accessorySupportsMultiUser](self, "_accessorySupportsMultiUser"))
  {
    goto LABEL_6;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
  -[HUAppleMusicAccountViewController appleMusicAccountModuleController](self, "appleMusicAccountModuleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "numberOfKnownAccounts");

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3778]);
    v15 = (void *)MEMORY[0x1E0CB3498];
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountSignInUsingADifferentAppleID"), CFSTR("HUAppleMusicAccountSignInUsingADifferentAppleID"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31970], "musicLoginURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_attributedString:withAppendedLinkString:linkURL:", v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "initWithAttributedString:", v18);

    v10 = (void *)v19;
  }
LABEL_11:

  return v10;
}

- (BOOL)_accessorySupportsMultiUser
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "appleMusicAccountModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_homePodSupportsMultiUser");

  return v8;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  HUAppleMusicAccountViewController *v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[HUAppleMusicAccountViewController accountArbitrationFuture](self, "accountArbitrationFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || (-[HUAppleMusicAccountViewController appleMusicLoadingViewController](self, "appleMusicLoadingViewController"),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v8))
  {
    v12.receiver = self;
    v12.super_class = (Class)HUAppleMusicAccountViewController;
    -[HUAppleMusicAccountViewController presentViewController:animated:completion:](&v12, sel_presentViewController_animated_completion_, v8, v6, v9);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke;
    v13[3] = &unk_1E6F5A4F8;
    v14 = v8;
    v18 = v6;
    v16 = v9;
    objc_copyWeak(&v17, &location);
    v15 = self;
    -[HUAppleMusicAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v13);
    objc_destroyWeak(&v17);

  }
  objc_destroyWeak(&location);

}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_2;
  v6[3] = &unk_1E6F5A4D0;
  v8 = *(id *)(a1 + 48);
  objc_copyWeak(&v9, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 32);
  v5.receiver = v3;
  v5.super_class = (Class)HUAppleMusicAccountViewController;
  objc_msgSendSuper2(&v5, sel_presentViewController_animated_completion_, v2, v4, v6);

  objc_destroyWeak(&v9);
}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_alloc(MEMORY[0x1E0D51998]);
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_3;
  v7[3] = &unk_1E6F4F4D0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v6 = (void *)objc_msgSend(v4, "initWithTargetObject:finalizer:", v5, v7);
  objc_msgSend(WeakRetained, "setAppleMusicLoadingViewControllerDeallocationSentinel:", v6);

  objc_destroyWeak(&v8);
}

void __79__HUAppleMusicAccountViewController_presentViewController_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appleMusicLoadingViewController");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    objc_msgSend(WeakRetained, "accountArbitrationFuture");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_5:

      goto LABEL_6;
    }
    v4 = (void *)v3;
    objc_msgSend(WeakRetained, "accountArbitrationFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFinished");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "appleMusicLoadingViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v2, 1, 0);
      goto LABEL_5;
    }
  }
LABEL_6:
  objc_msgSend(WeakRetained, "setAppleMusicLoadingViewControllerDeallocationSentinel:", 0);

}

- (HUAppleMusicAccountModuleController)appleMusicAccountModuleController
{
  return self->_appleMusicAccountModuleController;
}

- (void)setAppleMusicAccountModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicAccountModuleController, a3);
}

- (HUPrimaryUserSettingsItemModuleController)primaryUserModuleController
{
  return self->_primaryUserModuleController;
}

- (void)setPrimaryUserModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUserModuleController, a3);
}

- (NAFuture)accountArbitrationFuture
{
  return self->_accountArbitrationFuture;
}

- (void)setAccountArbitrationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_accountArbitrationFuture, a3);
}

- (NADeallocationSentinel)appleMusicLoadingViewControllerDeallocationSentinel
{
  return self->_appleMusicLoadingViewControllerDeallocationSentinel;
}

- (void)setAppleMusicLoadingViewControllerDeallocationSentinel:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicLoadingViewControllerDeallocationSentinel, a3);
}

- (UIAlertController)appleMusicLoadingViewController
{
  return self->_appleMusicLoadingViewController;
}

- (void)setAppleMusicLoadingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicLoadingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicLoadingViewController, 0);
  objc_storeStrong((id *)&self->_appleMusicLoadingViewControllerDeallocationSentinel, 0);
  objc_storeStrong((id *)&self->_accountArbitrationFuture, 0);
  objc_storeStrong((id *)&self->_primaryUserModuleController, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountModuleController, 0);
}

@end
