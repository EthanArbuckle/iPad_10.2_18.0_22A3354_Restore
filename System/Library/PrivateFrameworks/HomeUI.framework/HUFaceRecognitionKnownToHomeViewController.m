@implementation HUFaceRecognitionKnownToHomeViewController

- (HUFaceRecognitionKnownToHomeViewController)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HUFaceRecognitionKnownToHomeViewController *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  char v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v21.receiver = self;
  v21.super_class = (Class)HUFaceRecognitionKnownToHomeViewController;
  v6 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v21, sel_initWithItemManager_tableViewStyle_, v5, 1);
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke;
    v18[3] = &unk_1E6F4C518;
    v19 = v4;
    objc_msgSend(v5, "setHomeCreator:", v18);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
    v12 = v7;
    v13 = 3221225472;
    v14 = __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_2;
    v15 = &unk_1E6F5ADD0;
    objc_copyWeak(&v16, &location);
    v17 = v8;
    objc_msgSend(v5, "setItemProviderCreator:", &v12);
    objc_msgSend(MEMORY[0x1E0D31858], "policyWithDecision:", 0, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReadPolicy:", v9);

    _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionKnownToHouseViewControllerTitle"), CFSTR("HUFaceRecognitionKnownToHouseViewControllerTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUFaceRecognitionKnownToHomeViewController setTitle:](v6, "setTitle:", v10);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

id __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (*(_BYTE *)(a1 + 40))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31378]), "initForMode:home:", 1, v4);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31440]), "initWithHome:", v4);

    objc_msgSend(v6, "setFilter:", &__block_literal_global_205);
  }
  objc_msgSend(WeakRetained, "setHomePersonItemProvider:", v6);

  objc_msgSend(WeakRetained, "homePersonItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __59__HUFaceRecognitionKnownToHomeViewController_initWithHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (HUFaceRecognitionKnownToHomeViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionKnownToHomeViewController.m"), 60, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionKnownToHomeViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  HUFaceRecognitionKnownToHomeViewController *v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  -[HUItemTableViewController hu_preloadContent](self, "hu_preloadContent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
  v15[3] = &unk_1E6F4E968;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = a5;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  HUFaceRecognitionPersonEditorViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HUFaceRecognitionPersonEditorViewController *v7;
  void *v8;
  void *v9;
  HUFaceRecognitionPersonEditorViewController *v10;
  void *v11;
  _QWORD v13[4];
  HUFaceRecognitionPersonEditorViewController *v14;

  v2 = [HUFaceRecognitionPersonEditorViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUFaceRecognitionPersonEditorViewController initWithPerson:personManager:home:](v2, "initWithPerson:personManager:home:", v3, v4, v6);

  -[HUFaceRecognitionPersonEditorViewController setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v7, *(unsigned __int8 *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2;
  v13[3] = &unk_1E6F514A0;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __115__HUFaceRecognitionKnownToHomeViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
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
  objc_msgSend(v18, "setAccessoryType:", 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HUFaceRecognitionPersonEditorViewController *v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUFaceRecognitionKnownToHomeViewController;
  v6 = a4;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  -[HUItemTableViewController itemManager](self, "itemManager", v14.receiver, v14.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF347D90))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = -[HUFaceRecognitionPersonEditorViewController initWithPersonLikeItem:]([HUFaceRecognitionPersonEditorViewController alloc], "initWithPersonLikeItem:", v10);
  -[HUFaceRecognitionPersonEditorViewController setDelegate:](v11, "setDelegate:", self);
  -[HUFaceRecognitionKnownToHomeViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);

}

- (void)personEditorViewController:(id)a3 didUpdateItem:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2544A8))
    v6 = v14;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "homeKitObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchingItemForHomeKitObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v11, "updateResultsForItems:senderSelector:", v12, a2);

  }
}

- (HFItemProvider)homePersonItemProvider
{
  return self->_homePersonItemProvider;
}

- (void)setHomePersonItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_homePersonItemProvider, a3);
}

- (HFItemManager)knownPersonItemManager
{
  return self->_knownPersonItemManager;
}

- (void)setKnownPersonItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_knownPersonItemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownPersonItemManager, 0);
  objc_storeStrong((id *)&self->_homePersonItemProvider, 0);
}

@end
