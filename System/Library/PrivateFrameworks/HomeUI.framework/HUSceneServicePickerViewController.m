@implementation HUSceneServicePickerViewController

- (HUSceneServicePickerViewController)initWithActionSetBuilder:(id)a3 servicePickerDelegate:(id)a4
{
  id v7;
  id v8;
  HUServiceGridItemManager *v9;
  void *v10;
  HUServiceGridItemManager *v11;
  HUSceneServicePickerViewController *v12;
  HUSceneServicePickerViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v9 = [HUServiceGridItemManager alloc];
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUSceneServicePickerViewController, "defaultItemProviderCreatorWithOptions:", 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](v9, "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", self, 1, v10);

  v22.receiver = self;
  v22.super_class = (Class)HUSceneServicePickerViewController;
  v12 = -[HUSelectableServiceGridViewController initWithServiceGridItemManager:](&v22, sel_initWithServiceGridItemManager_, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionSetBuilder, a3);
    objc_storeWeak((id *)&v13->_servicePickerDelegate, v8);
    _HULocalizedStringWithDefaultValue(CFSTR("HUSceneServicePickerTitle"), CFSTR("HUSceneServicePickerTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneServicePickerViewController setTitle:](v13, "setTitle:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v13, sel__cancel_);
    -[HUSceneServicePickerViewController navigationItem](v13, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftBarButtonItem:", v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v13, sel__done_);
    -[HUSceneServicePickerViewController navigationItem](v13, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRightBarButtonItem:", v17);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSceneServicePickerViewController collectionView](v13, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", v19);

    -[HUSceneServicePickerViewController setModalInPresentation:](v13, "setModalInPresentation:", 1);
  }

  return v13;
}

- (HUSceneServicePickerViewController)initWithServiceGridItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithActionSetBuilder_servicePickerDelegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSceneServicePickerViewController.m"), 54, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSceneServicePickerViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUSceneServicePickerViewController servicePickerDelegate](self, "servicePickerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneServicePickerDidFinish:", self);

}

- (void)_done:(id)a3
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
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  -[HUSceneServicePickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v7);
  -[HUSceneServicePickerViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  objc_msgSend(v7, "startAnimating");
  -[HUSceneServicePickerViewController _updateActionSetBuilder](self, "_updateActionSetBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__HUSceneServicePickerViewController__done___block_invoke;
  v20[3] = &unk_1E6F4ED40;
  objc_copyWeak(&v21, &location);
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v20);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __44__HUSceneServicePickerViewController__done___block_invoke_2;
  v18[3] = &unk_1E6F4ED68;
  objc_copyWeak(&v19, &location);
  v13 = (id)objc_msgSend(v10, "addFailureBlock:", v18);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __44__HUSceneServicePickerViewController__done___block_invoke_4;
  v16[3] = &unk_1E6F4C0D8;
  v16[4] = self;
  v14 = v6;
  v17 = v14;
  v15 = (id)objc_msgSend(v10, "addCompletionBlock:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __44__HUSceneServicePickerViewController__done___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "servicePickerDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sceneServicePickerDidFinish:", WeakRetained);

}

void __44__HUSceneServicePickerViewController__done___block_invoke_2(uint64_t a1, void *a2)
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
  v6[2] = __44__HUSceneServicePickerViewController__done___block_invoke_3;
  v6[3] = &unk_1E6F4D988;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "handleError:retryBlock:cancelBlock:", v3, v6, 0);

}

uint64_t __44__HUSceneServicePickerViewController__done___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_done:", 0);
}

void __44__HUSceneServicePickerViewController__done___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightBarButtonItem:", v1);

}

- (void)didChangeSelection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUSceneServicePickerViewController;
  -[HUSelectableServiceGridViewController didChangeSelection](&v3, sel_didChangeSelection);
  -[HUSceneServicePickerViewController _validateDoneButton](self, "_validateDoneButton");
}

- (void)itemManagerDidUpdate:(id)a3
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
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)HUSceneServicePickerViewController;
  -[HUSelectableServiceGridViewController itemManagerDidUpdate:](&v28, sel_itemManagerDidUpdate_, a3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HUSceneServicePickerViewController actionSetBuilder](self, "actionSetBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUSceneServicePickerViewController actionSetBuilder](self, "actionSetBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mediaProfiles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_flatMap:", &__block_literal_global_33_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUSceneServicePickerViewController existingActionSetCharacteristics](self, "existingActionSetCharacteristics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToSet:", v8) & 1) != 0)
  {
    -[HUSceneServicePickerViewController existingActionSetMediaProfiles](self, "existingActionSetMediaProfiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToSet:", v12);

    if ((v15 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  -[HUSceneServicePickerViewController setExistingActionSetCharacteristics:](self, "setExistingActionSetCharacteristics:", v8);
  -[HUSceneServicePickerViewController setExistingActionSetMediaProfiles:](self, "setExistingActionSetMediaProfiles:", v12);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allDisplayedItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_4;
  v25 = &unk_1E6F4EEA8;
  v26 = v8;
  v27 = v12;
  objc_msgSend(v17, "na_filter:", &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0D31580]);
  v20 = (void *)objc_msgSend(v19, "initWithFromSet:", v18, v22, v23, v24, v25);
  v21 = (void *)objc_msgSend(v20, "copy");
  -[HUSelectableServiceGridViewController setSelectedItems:](self, "setSelectedItems:", v21);

LABEL_10:
  -[HUSceneServicePickerViewController _validateDoneButton](self, "_validateDoneButton");

}

id __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
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

id __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_35);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mediaProfile");
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC378))
  {
    v4 = v3;
    objc_msgSend(v4, "services");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_5;
    v16[3] = &unk_1E6F4EE58;
    v17 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v5, "na_any:", v16);

    objc_msgSend(v4, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_7;
    v13[3] = &unk_1E6F4EE80;
    v14 = v4;
    v15 = *(id *)(a1 + 40);
    v9 = v4;
    v10 = objc_msgSend(v8, "na_any:", v13);

    v11 = v7 | v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_6;
  v6[3] = &unk_1E6F4EE30;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;

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
  if ((objc_msgSend(v3, "hf_isMediaAccessory") & 1) != 0 || v5)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "mediaProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUSceneServicePickerViewController;
  -[HUServiceGridViewController layoutOptionsForSection:](&v7, sel_layoutOptionsForSection_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!a3)
  {
    objc_msgSend(v5, "sectionTitleMargin");
    objc_msgSend(v5, "setSectionTitleMargin:", 40.0);
  }
  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUSceneServicePickerViewController;
  -[HUSelectableServiceGridViewController configureCell:forItem:](&v7, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setShouldColorDescription:", 0);

}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
LABEL_20:
    v6 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "sourceItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v13) = objc_opt_isKindOfClass();

  if ((v13 & 1) == 0)
  {
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC8C8))
    {
      v6 = objc_msgSend(v11, "containsActions");
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  v15 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_opt_class();
  objc_msgSend(v17, "sourceItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  v6 = -[HUSceneServicePickerViewController _canSelectMediaAccessoryItem:](self, "_canSelectMediaAccessoryItem:", v20);
LABEL_21:

  return v6;
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
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)HUSceneServicePickerViewController;
  v6 = a4;
  -[HUSelectableServiceGridViewController collectionView:didSelectItemAtIndexPath:](&v31, sel_collectionView_didSelectItemAtIndexPath_, a3, v6);
  -[HUItemCollectionViewController itemManager](self, "itemManager", v31.receiver, v31.super_class);
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

  objc_msgSend(v11, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    v13 = CFSTR("HUDontSetupProgrammableSwitchInSceneServicePickerTitle");
    v14 = CFSTR("HUDontSetupProgrammableSwitchInSceneServicePickerMessage");
LABEL_29:
    -[HUSceneServicePickerViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", v13, v14);
    goto LABEL_30;
  }
  if (!objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2AC8C8)
    || (objc_msgSend(v9, "containsActions") & 1) == 0)
  {
    v13 = CFSTR("HUSceneServicePickerUnsupportedAccessoryTitle");
    v14 = CFSTR("HUSceneServicePickerUnsupportedAccessoryMessage");
    goto LABEL_29;
  }
  objc_opt_class();
  v15 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "sourceItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v17) = objc_opt_isKindOfClass();

  if ((v17 & 1) != 0)
  {
    objc_opt_class();
    v19 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_opt_class();
    objc_msgSend(v21, "sourceItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (objc_msgSend(v24, "allowsAppleMusicAccount")
      && (objc_msgSend(v24, "supportsMediaAction") & 1) == 0)
    {
      v28 = objc_msgSend(v24, "mediaAccessoryItemType");
      switch(v28)
      {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          HFLogForCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v33 = v28;
            _os_log_error_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_ERROR, "Error: got media accessory item type %ld", buf, 0xCu);
          }

          break;
        case 1:
          v30 = CFSTR("HUSceneServicePickerUnsupportedAppleTVMessage");
          goto LABEL_38;
        case 2:
        case 3:
          v30 = CFSTR("HUSceneServicePickerUnsupportedHomePodMessage");
          goto LABEL_38;
        case 4:
          v30 = CFSTR("HUSceneServicePickerUnsupportedHomePodStereoPairMessage");
LABEL_38:
          -[HUSceneServicePickerViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", CFSTR("HUAlertSoftwareUpdateRequired"), v30);
          break;
        default:
          break;
      }
    }
    else
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v26, "hf_hasEnabledResident")
        && (objc_msgSend(v26, "hf_enabledResidentsSupportsMediaActions") & 1) == 0)
      {
        if (objc_msgSend(v24, "mediaAccessoryItemType") == 7)
          v27 = CFSTR("HUSceneServicePickerUnsupportedResidentWithAirPortExpressMessage");
        else
          v27 = CFSTR("HUSceneServicePickerUnsupportedResidentMessage");
        -[HUSceneServicePickerViewController _presentUnsupportedAlertWithTitle:message:](self, "_presentUnsupportedAlertWithTitle:message:", CFSTR("HUAlertSoftwareUpdateRequired"), v27);
      }

    }
  }
LABEL_30:

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

- (BOOL)_canSelectMediaAccessoryItem:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "allowsAppleMusicAccount"))
    v5 = objc_msgSend(v4, "supportsMediaAction");
  else
    v5 = 1;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "hf_hasEnabledResident"))
    v8 = objc_msgSend(v7, "hf_enabledResidentsSupportsMediaActions");
  else
    v8 = 1;
  v9 = v5 & v8;

  return v9;
}

- (id)_updateActionSetBuilder
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t jj;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v71;
  uint64_t v72;
  id obj;
  void *v74;
  uint64_t v75;
  uint64_t j;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  HUSceneServicePickerViewController *val;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id location;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v71 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  val = self;
  -[HUSelectableServiceGridViewController selectedItems](self, "selectedItems");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v126;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v126 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "characteristic");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v9, v11);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
    }
    while (v6);
  }

  -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_filter:", &__block_literal_global_135);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend(v74, "deletions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
  if (v75)
  {
    v72 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v75; ++j)
      {
        if (*(_QWORD *)v122 != v72)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
          NSLog(CFSTR("Unexpected item in selectedItems not conforming to HFServiceVendor: %@"), v14);
        if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC378))
        {
          objc_msgSend(v14, "services");
          v77 = (id)objc_claimAutoreleasedReturnValue();
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
          if (v79)
          {
            v78 = *(_QWORD *)v118;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v118 != v78)
                {
                  v16 = v15;
                  objc_enumerationMutation(v77);
                  v15 = v16;
                }
                v80 = v15;
                v17 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v15);
                v113 = 0u;
                v114 = 0u;
                v115 = 0u;
                v116 = 0u;
                objc_msgSend(v17, "characteristics");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
                if (v19)
                {
                  v20 = *(_QWORD *)v114;
                  do
                  {
                    for (k = 0; k != v19; ++k)
                    {
                      if (*(_QWORD *)v114 != v20)
                        objc_enumerationMutation(v18);
                      v22 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * k);
                      objc_msgSend(v22, "uniqueIdentifier");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = v23 == 0;

                      if (!v24)
                      {
                        objc_msgSend(v22, "uniqueIdentifier");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v84, "objectForKeyedSubscript:", v25);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v26)
                        {
                          -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v27, "removeAction:", v26);

                        }
                      }
                    }
                    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v113, v133, 16);
                  }
                  while (v19);
                }

                v111 = 0u;
                v112 = 0u;
                v109 = 0u;
                v110 = 0u;
                objc_msgSend(v17, "hf_lightProfiles");
                v82 = (id)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v109, v132, 16);
                if (v28)
                {
                  v86 = *(_QWORD *)v110;
                  do
                  {
                    for (m = 0; m != v28; ++m)
                    {
                      if (*(_QWORD *)v110 != v86)
                        objc_enumerationMutation(v82);
                      v30 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * m);
                      v105 = 0u;
                      v106 = 0u;
                      v107 = 0u;
                      v108 = 0u;
                      v31 = v85;
                      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
                      if (v32)
                      {
                        v33 = *(_QWORD *)v106;
                        while (2)
                        {
                          for (n = 0; n != v32; ++n)
                          {
                            if (*(_QWORD *)v106 != v33)
                              objc_enumerationMutation(v31);
                            v35 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * n);
                            objc_msgSend(v35, "lightProfile");
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            v37 = objc_msgSend(v36, "isEqual:", v30);

                            if (v37)
                            {
                              -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
                              v38 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v38, "removeAction:", v35);

                              goto LABEL_51;
                            }
                          }
                          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
                          if (v32)
                            continue;
                          break;
                        }
                      }
LABEL_51:

                    }
                    v28 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v109, v132, 16);
                  }
                  while (v28);
                }

                v15 = v80 + 1;
              }
              while (v80 + 1 != v79);
              v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
            }
            while (v79);
          }

        }
      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v135, 16);
    }
    while (v75);
  }

  -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "mediaAction");
  v83 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v83, "mediaProfiles");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v74, "deletions");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v102;
    do
    {
      for (ii = 0; ii != v41; ++ii)
      {
        if (*(_QWORD *)v102 != v42)
          objc_enumerationMutation(v40);
        v44 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * ii);
        if ((objc_msgSend(v44, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
          NSLog(CFSTR("Unexpected item in selectedItems not conforming to HFServiceVendor: %@"), v44);
        v45 = v44;
        objc_msgSend(v45, "accessories");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "anyObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "hf_isSiriEndpoint"))
        {
          objc_msgSend(v45, "services");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "count") != 0;

        }
        else
        {
          v49 = 0;
        }

        if (((objc_msgSend(v45, "conformsToProtocol:", &unk_1EF2AC378) ^ 1 | v49) & 1) == 0)
        {
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_2;
          v99[3] = &unk_1E6F4EF10;
          v100 = v46;
          objc_msgSend(v87, "na_filter:", v99);
          v50 = objc_claimAutoreleasedReturnValue();

          v87 = (void *)v50;
        }

      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
    }
    while (v41);
  }

  if (v83)
  {
    if (objc_msgSend(v87, "count"))
    {
      objc_msgSend(v83, "setMediaProfiles:", v87);
      -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "updateAction:", v83);
    }
    else
    {
      -[HUSceneServicePickerViewController actionSetBuilder](val, "actionSetBuilder");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "removeAction:", v83);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  objc_msgSend(v74, "additions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "updates");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setByAddingObjectsFromSet:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v95, v129, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v96;
    do
    {
      for (jj = 0; jj != v56; ++jj)
      {
        if (*(_QWORD *)v96 != v57)
          objc_enumerationMutation(v55);
        v59 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * jj);
        if ((objc_msgSend(v59, "conformsToProtocol:", &unk_1EF2AC8C8) & 1) == 0)
          NSLog(CFSTR("Unexpected item in selectedItems not conforming to HFActionBuilderFactory: %@"), v59);
        if (objc_msgSend(v59, "conformsToProtocol:", &unk_1EF2AC8C8))
        {
          objc_msgSend(v59, "currentStateActionBuildersForHome:", v81);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
            objc_msgSend(v52, "addObject:", v60);

        }
      }
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v95, v129, 16);
    }
    while (v56);
  }

  v61 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "combineAllFutures:ignoringErrors:scheduler:", v52, 0, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, val);
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_3;
  v91[3] = &unk_1E6F4EF38;
  objc_copyWeak(&v93, &location);
  v64 = v71;
  v92 = v64;
  v65 = (id)objc_msgSend(v63, "addSuccessBlock:", v91);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_4;
  v89[3] = &unk_1E6F4E2D8;
  v66 = v64;
  v90 = v66;
  v67 = (id)objc_msgSend(v63, "addFailureBlock:", v89);
  v68 = v90;
  v69 = v66;

  objc_destroyWeak(&v93);
  objc_destroyWeak(&location);

  return v69;
}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
              objc_msgSend(WeakRetained, "actionSetBuilder", v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addAction:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v17 = *(void **)(v19 + 32);
  objc_msgSend(WeakRetained, "actionSetBuilder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishWithResult:", v18);

}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
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
  -[HUSceneServicePickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

}

- (HUSceneServicePickerViewControllerDelegate)servicePickerDelegate
{
  return (HUSceneServicePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_servicePickerDelegate);
}

- (void)setServicePickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_servicePickerDelegate, a3);
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (NSSet)existingActionSetCharacteristics
{
  return self->_existingActionSetCharacteristics;
}

- (void)setExistingActionSetCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_existingActionSetCharacteristics, a3);
}

- (NSSet)existingActionSetMediaProfiles
{
  return self->_existingActionSetMediaProfiles;
}

- (void)setExistingActionSetMediaProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_existingActionSetMediaProfiles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingActionSetMediaProfiles, 0);
  objc_storeStrong((id *)&self->_existingActionSetCharacteristics, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
  objc_destroyWeak((id *)&self->_servicePickerDelegate);
}

@end
