@implementation TabGroupPickerViewController

- (TabGroupPickerViewController)initWithTabGroupProvider:(id)a3
{
  id v4;
  TabGroupPickerViewController *v5;
  TabGroupPickerViewController *v6;
  TabGroupPickerViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TabGroupPickerViewController;
  v5 = -[TabGroupPickerViewController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tabGroupProvider, v4);
    objc_msgSend(v4, "registerTabGroupManagerObserver:", v6);
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  UICollectionView *v10;
  UICollectionView *collectionView;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController loadView](&v21, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __40__TabGroupPickerViewController_loadView__block_invoke;
  v18[3] = &unk_1E9CF5010;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "setTrailingSwipeActionsConfigurationProvider:", v18);
  v5 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v12 = v4;
  v13 = 3221225472;
  v14 = __40__TabGroupPickerViewController_loadView__block_invoke_2;
  v15 = &unk_1E9CF5038;
  v6 = v3;
  v16 = v6;
  objc_copyWeak(&v17, &location);
  v7 = (void *)objc_msgSend(v5, "initWithSectionProvider:", &v12);
  v8 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = (UICollectionView *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v7);
  collectionView = self->_collectionView;
  self->_collectionView = v10;

  -[UICollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("TabGroupCollectionView"));
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDragDelegate:](self->_collectionView, "setDragDelegate:", self);
  -[UICollectionView setDropDelegate:](self->_collectionView, "setDropDelegate:", self);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[TabGroupPickerViewController setView:](self, "setView:", self->_collectionView);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

id __40__TabGroupPickerViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_swipeActionsConfigurationForIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __40__TabGroupPickerViewController_loadView__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id *WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  double v16;
  char v17;
  double v18;
  id v19;
  void *v20;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v6, "contentInsets");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = objc_loadWeakRetained(WeakRetained + 121);
    v15 = v14;
    v16 = 12.0;
    if (a2)
    {
      if (a2 == 1)
      {
        if ((objc_msgSend(v14, "hasMultipleProfiles") & 1) == 0
          || (objc_msgSend(v15, "privateTabGroupIfAvailable"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v18 = v9,
              !v20))
        {
          v16 = 0.0;
          v18 = 0.0;
        }
      }
      else if (a2 != 3 || (v17 = objc_msgSend(v14, "hasMultipleProfiles"), v16 = 0.0, v18 = 0.0, (v17 & 1) != 0))
      {
        v16 = 12.0;
        v18 = v9;
      }
    }
    else
    {
      v18 = 10.0;
    }
    objc_msgSend(v6, "setContentInsets:", v18, v11, v16, v13);
    v19 = v6;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *doneButton;
  UIBarButtonItem *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  UICollectionView *collectionView;
  id v24;
  id v25;
  id v26;
  id v27;
  UICollectionViewDiffableDataSource *v28;
  UICollectionViewDiffableDataSource *dataSource;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[TabGroupPickerViewController _updateTitle](self, "_updateTitle");
  -[TabGroupPickerViewController editButtonItem](self, "editButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabGroupPickerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped);
  doneButton = self->_doneButton;
  self->_doneButton = v5;

  v7 = self->_doneButton;
  -[TabGroupPickerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x1E0DC35C8];
  v10 = objc_opt_class();
  v11 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke;
  v46[3] = &unk_1E9CF5060;
  objc_copyWeak(&v47, &location);
  objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, v46);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC35C8];
  v14 = objc_opt_class();
  v44[0] = v11;
  v44[1] = 3221225472;
  v44[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_2;
  v44[3] = &unk_1E9CF5088;
  objc_copyWeak(&v45, &location);
  objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC35C8];
  v17 = objc_opt_class();
  v42[0] = v11;
  v42[1] = 3221225472;
  v42[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_3;
  v42[3] = &unk_1E9CF5060;
  objc_copyWeak(&v43, &location);
  objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, v42);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC35C8];
  v20 = objc_opt_class();
  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_4;
  v40[3] = &unk_1E9CF5060;
  objc_copyWeak(&v41, &location);
  objc_msgSend(v19, "registrationWithCellClass:configurationHandler:", v20, v40);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0DC35E8]);
  collectionView = self->_collectionView;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_5;
  v35[3] = &unk_1E9CF50B0;
  v24 = v18;
  v36 = v24;
  v25 = v12;
  v37 = v25;
  v26 = v21;
  v38 = v26;
  v27 = v15;
  v39 = v27;
  v28 = (UICollectionViewDiffableDataSource *)objc_msgSend(v22, "initWithCollectionView:cellProvider:", collectionView, v35);
  dataSource = self->_dataSource;
  self->_dataSource = v28;

  v30 = objc_alloc_init(MEMORY[0x1E0DC35F0]);
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_6;
  v33[3] = &unk_1E9CF50D8;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v30, "setCanReorderItemHandler:", v33);
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_7;
  v31[3] = &unk_1E9CF5100;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v30, "setDidReorderHandler:", v31);
  -[UICollectionViewDiffableDataSource setReorderingHandlers:](self->_dataSource, "setReorderingHandlers:", v30);
  -[TabGroupPickerViewController _reloadData](self, "_reloadData");
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v12 = objc_loadWeakRetained(WeakRetained + 121);
      objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageForTabGroup:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setImage:", v14);

      if (!objc_msgSend(v12, "hasMultipleProfiles")
        || (objc_msgSend(v9, "isNamed") & 1) != 0
        || (objc_msgSend(v9, "isPrivateBrowsing") & 1) != 0)
      {
        objc_msgSend(v9, "displayTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v15);
      }
      else
      {
        objc_msgSend(v12, "activeProfile");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc(MEMORY[0x1E0CB3778]);
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "displayTitle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ — %@"), v15, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v27, "initWithString:", v30);

        v33 = *MEMORY[0x1E0DC1140];
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAttribute:value:range:", v33, v32, objc_msgSend(v15, "length"), objc_msgSend(v31, "length") - objc_msgSend(v15, "length"));

        objc_msgSend(v13, "setAttributedText:", v31);
      }

      objc_msgSend(v13, "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfLines:", 2);

      objc_msgSend(v7, "setContentConfiguration:", v13);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_checkmarkAccessoryForTabGroup:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safari_addObjectUnlessNil:", v18);

      objc_msgSend(v11, "_moreButtonAccessoryForTabGroup:inCell:", v9, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "safari_addObjectUnlessNil:", v19);

      if (!objc_msgSend(v8, "section") && objc_msgSend(v9, "isNamed"))
      {
        v20 = objc_alloc_init(MEMORY[0x1E0DC3598]);
        objc_msgSend(v20, "setDisplayedState:", 1);
        objc_msgSend(v17, "addObject:", v20);

      }
      v34[0] = CFSTR("Title");
      objc_msgSend(v9, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = CFSTR("isPrivate");
      v35[0] = v21;
      v22 = objc_msgSend(v9, "isPrivateBrowsing");
      v23 = CFSTR("false");
      if (v22)
        v23 = CFSTR("true");
      v35[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      WBSMakeAccessibilityIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessibilityIdentifier:", v25);

      objc_msgSend(v7, "setAccessories:", v17);
    }

  }
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "row");
    if (v8)
    {
      if (v8 != 1)
      {
LABEL_7:
        objc_msgSend(v14, "setContentConfiguration:", v7);

        goto LABEL_8;
      }
      v9 = objc_loadWeakRetained(WeakRetained + 121);
      objc_msgSend(v9, "moveLocalTabsToNewGroupTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v10);

      v11 = CFSTR("CreateNewTabGroupFromLocalTabsCell");
    }
    else
    {
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v9);
      v11 = CFSTR("CreateNewEmptyTabGroupCell");
    }

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v12);

    objc_msgSend(v14, "setAccessibilityIdentifier:", v11);
    v13 = objc_msgSend(v14, "accessibilityTraits");
    objc_msgSend(v14, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660] | v13);
    goto LABEL_7;
  }
LABEL_8:

}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id *WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    v10 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(v10, "imageForTabGroup:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v11);

    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("PrivateTabGroup"));
    objc_msgSend(v15, "setContentConfiguration:", v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_checkmarkAccessoryForTabGroup:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_addObjectUnlessNil:", v13);

    objc_msgSend(WeakRetained, "_moreButtonAccessoryForTabGroup:inCell:", v6, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_addObjectUnlessNil:", v14);

    objc_msgSend(v15, "setAccessories:", v12);
  }

}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("person.crop.rectangle.stack"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    objc_msgSend(v6, "activeProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondaryText:", v11);

    objc_msgSend(v3, "setContentConfiguration:", v7);
    v12 = objc_alloc(MEMORY[0x1E0DC3590]);
    objc_msgSend(v6, "menuForSwitchingProfiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithMenu:", v13);

    objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ProfileSwitcher"));
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessories:", v15);

  }
}

id __43__TabGroupPickerViewController_viewDidLoad__block_invoke_5(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  _QWORD *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      v10 = objc_msgSend(v9, "isPrivateBrowsing");
      v11 = a1 + 5;
      if (v10)
        v11 = a1 + 4;
      goto LABEL_9;
    case 1:
      v11 = a1 + 4;
      goto LABEL_9;
    case 2:
      v11 = a1 + 7;
      goto LABEL_9;
    case 3:
      v11 = a1 + 6;
LABEL_9:
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *v11, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

uint64_t __43__TabGroupPickerViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[123], "indexPathForItemIdentifier:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "section"))
      v7 = 0;
    else
      v7 = objc_msgSend(v3, "isNamed");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "difference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasChanges"))
  {
    objc_msgSend(v3, "insertions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      objc_msgSend(v15, "initialSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifiersInSectionWithIdentifier:", &unk_1E9D62038);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "finalSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemIdentifiersInSectionWithIdentifier:", &unk_1E9D62038);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "indexOfObject:", v6);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "lastObject");
      else
        objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)WeakRetained + 1000) = 1;
      v14 = objc_loadWeakRetained((id *)WeakRetained + 121);
      objc_msgSend(v14, "moveTabGroup:beforeOrAfterTabGroup:", v6, v13);

      *((_BYTE *)WeakRetained + 1000) = 0;
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[TabGroupPickerViewController _reloadData](self, "_reloadData");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[TabGroupPickerViewController _reloadDataIfNeeded](self, "_reloadDataIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void (**willDisappear)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  willDisappear = (void (**)(void))self->_willDisappear;
  if (willDisappear)
    willDisappear[2]();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  UIBarButtonItem *doneButton;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController setEditing:animated:](&v9, sel_setEditing_animated_, a3, a4);
  if (a3)
  {
    -[TabGroupPickerViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);

    -[UICollectionView setEditing:](self->_collectionView, "setEditing:", 1);
    -[TabGroupPickerViewController _removeDataUnrelatedToTabGroups](self, "_removeDataUnrelatedToTabGroups");
  }
  else
  {
    doneButton = self->_doneButton;
    -[TabGroupPickerViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", doneButton);

    -[UICollectionView setEditing:](self->_collectionView, "setEditing:", 0);
    -[TabGroupPickerViewController _reloadData](self, "_reloadData");
  }
}

- (void)_removeDataUnrelatedToTabGroups
{
  id v3;

  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteSectionsWithIdentifiers:", &unk_1E9D62850);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v3, 1);

}

- (void)doneButtonTapped
{
  id v2;

  -[TabGroupPickerViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setNeedsReloadData
{
  id v2;

  self->_needsReloadData = !self->_isReordering;
  -[TabGroupPickerViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_reloadDataIfNeeded
{
  if (self->_needsReloadData)
    -[TabGroupPickerViewController _reloadData](self, "_reloadData");
}

- (void)_reloadData
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  if (-[TabGroupPickerViewController isViewLoaded](self, "isViewLoaded")
    && WeakRetained
    && !self->_isReordering)
  {
    if (-[UICollectionView hasUncommittedUpdates](self->_collectionView, "hasUncommittedUpdates"))
    {
      self->_needsReloadData = 1;
    }
    else
    {
      self->_needsReloadData = 0;
      v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
      -[TabGroupPickerViewController _updateTitle](self, "_updateTitle");
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E9D62868);
      v5 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(WeakRetained, "unnamedTabGroup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "namedTabGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v8);

      objc_msgSend(WeakRetained, "privateTabGroupIfAvailable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UICollectionView isEditing](self->_collectionView, "isEditing")
        && objc_msgSend(WeakRetained, "hasMultipleProfiles"))
      {
        v21[0] = CFSTR("Profile Switcher");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, &unk_1E9D62068);

        v20 = CFSTR("Profile Switcher");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v11);

      }
      v12 = objc_msgSend(WeakRetained, "hasMultipleProfiles");
      objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &unk_1E9D62038);
      if (v12)
      {
        objc_msgSend(v4, "reloadItemsWithIdentifiers:", v7);
        if (v9)
        {
          v19 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, &unk_1E9D62080);

          v18 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v14);

        }
      }
      else
      {
        if (v9)
        {
          v17 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, &unk_1E9D62038);

        }
        objc_msgSend(v4, "reloadItemsWithIdentifiers:", v7);
      }
      if (!-[UICollectionView isEditing](self->_collectionView, "isEditing"))
      {
        objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E9D62880, &unk_1E9D62050);
        objc_msgSend(WeakRetained, "moveLocalTabsToNewGroupTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E9D62898, &unk_1E9D62050);
          objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", &unk_1E9D62898);
        }
      }
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v4, 1);

    }
  }

}

- (void)_enumerateTabGroupSectionsWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  char v14;
  unsigned __int8 v15;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v5 = 0;
  v13 = 976;
  v6 = 1;
  while (1)
  {
    v14 = v6;
    v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v13), "numberOfItemsInSection:", v5, v13);
    if (v7 >= 1)
      break;
LABEL_6:
    v6 = 0;
    v5 = 1;
    if ((v14 & 1) == 0)
      goto LABEL_7;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v4[2](v4, v11, v10, &v15);
    v12 = v15;

    if (v12)
      break;
    if (v8 == ++v9)
      goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)_shouldShowCheckmarkForTabGroup:(id)a3
{
  TabGroupProvider **p_tabGroupProvider;
  id v4;
  id WeakRetained;
  void *v6;
  char v7;

  p_tabGroupProvider = &self->_tabGroupProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tabGroupProvider);
  objc_msgSend(WeakRetained, "activeTabGroupOrTabGroupVisibleInSwitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  return v7;
}

- (id)_checkmarkAccessoryForTabGroup:(id)a3
{
  id v3;

  if (-[TabGroupPickerViewController _shouldShowCheckmarkForTabGroup:](self, "_shouldShowCheckmarkForTabGroup:", a3))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    objc_msgSend(v3, "setDisplayedState:", 2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_moreButtonAccessoryForTabGroup:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isPrivateBrowsing")
    && (+[Application sharedApplication](Application, "sharedApplication"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isPrivateBrowsingLocked"),
        v8,
        (v9 & 1) != 0)
    || (objc_msgSend(v6, "isNamed") & 1) == 0 && !objc_msgSend(v6, "hasTextForPasteboard"))
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v7, "moreButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "background");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPreferredSymbolConfigurationForImage:", v14);

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v15);

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v11, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setShowsMenuAsPrimaryAction:", 1);
      objc_msgSend(v7, "setMoreButton:", v16);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    objc_msgSend(WeakRetained, "menuForTabGroup:variant:", v6, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "moreButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMenu:", v18);

    v20 = objc_alloc(MEMORY[0x1E0DC3550]);
    objc_msgSend(v7, "moreButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithCustomView:placement:", v21, 1);

    objc_msgSend(v22, "setDisplayedState:", 1);
  }

  return v22;
}

- (id)_swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    v5 = 0;
  }
  else
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isNamed"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
      objc_msgSend(WeakRetained, "swipeActionsConfigurationForTabGroup:forPickerSheet:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  if (objc_msgSend(WeakRetained, "hasMultipleProfiles"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabGroupPickerViewController setTitle:](self, "setTitle:", v7);

  }
  else
  {
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabGroupPickerViewController setTitle:](self, "setTitle:", v4);
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v6 = a4;
  if (objc_msgSend(v6, "section") <= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "contextMenuConfigurationForTabGroup:variant:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v7 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  objc_msgSend(WeakRetained, "namedTabGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (objc_msgSend(v7, "section") <= 0 && objc_msgSend(v7, "row") <= 0)
  {
    v11 = (void *)MEMORY[0x1E0CB36B0];
    v12 = 1;
  }
  else
  {
    if (objc_msgSend(v7, "section") <= 0 && objc_msgSend(v7, "row") <= v10)
    {
      v13 = v7;
      goto LABEL_7;
    }
    v11 = (void *)MEMORY[0x1E0CB36B0];
    v12 = v10;
  }
  objc_msgSend(v11, "indexPathForRow:inSection:", v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v14 = v13;

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  TabGroupPickerViewController *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  v9 = objc_msgSend(v7, "section");
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      v14 = objc_msgSend(v7, "row") == 1;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __72__TabGroupPickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      v18 = &unk_1E9CF5128;
      v19 = self;
      v20 = v7;
      objc_msgSend(WeakRetained, "createTabGroupFromExistingTabs:completionHandler:", v14, &v15);

    }
  }
  else
  {
    -[TabGroupPickerViewController presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didSwitchToTabGroupFromLocation:", 4);

    if ((objc_msgSend(WeakRetained, "scrollTabSwitcherToTabGroupIfShowing:", v11) & 1) == 0)
    {
      objc_msgSend(v11, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setActiveTabGroupUUID:", v13);

    }
  }
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1, v15, v16, v17, v18, v19);

}

void __72__TabGroupPickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "row") == 1;
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCreateTabGroupFromLocation:prepopulatedWithTabs:", 4, v4);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if ((-[TabGroupPickerViewController isEditing](self, "isEditing") & 1) != 0 || objc_msgSend(v6, "section"))
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isNamed"))
    {
      objc_msgSend(MEMORY[0x1E0DC3758], "_sf_itemWithTabGroup:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v7;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a5;
  if (objc_msgSend(v6, "section"))
  {
    v7 = 0;
  }
  else
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isNamed"))
      v7 = 3;
    else
      v7 = 0;

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:intent:", v7, 1);

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (id)willDisappear
{
  return self->_willDisappear;
}

- (void)setWillDisappear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willDisappear, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
}

@end
