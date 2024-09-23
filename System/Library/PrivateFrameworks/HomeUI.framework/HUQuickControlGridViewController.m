@implementation HUQuickControlGridViewController

- (HUQuickControlGridViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12;
  HUQuickControlGridViewController *v13;
  HUQuickControlGridCollectionItemManager *v14;
  HUQuickControlCollectionViewController *v15;
  HUQuickControlCollectionViewController *collectionViewController;
  void *v17;
  objc_super v19;

  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlGridViewController;
  v13 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v19, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, v12, a4, a5, a6, a7);
  if (v13)
  {
    v14 = -[HUQuickControlGridCollectionItemManager initWithDelegate:controlItems:]([HUQuickControlGridCollectionItemManager alloc], "initWithDelegate:controlItems:", 0, v12);
    v15 = -[HUQuickControlCollectionViewController initWithItemManager:]([HUQuickControlCollectionViewController alloc], "initWithItemManager:", v14);
    collectionViewController = v13->_collectionViewController;
    v13->_collectionViewController = v15;

    -[HUQuickControlCollectionViewController setDisableItemUpdatesForOverrideCharacteristicValueChanges:](v13->_collectionViewController, "setDisableItemUpdatesForOverrideCharacteristicValueChanges:", 0);
    -[HUQuickControlGridViewController collectionViewController](v13, "collectionViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlGridViewController _subclass_configureQuickControlViewController:](v13, "_subclass_configureQuickControlViewController:", v17);

  }
  return v13;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlGridViewController;
  -[HUQuickControlViewController hu_preloadContent](&v7, sel_hu_preloadContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HUQuickControlGridViewController_hu_preloadContent__block_invoke;
  v6[3] = &unk_1E6F595A8;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53__HUQuickControlGridViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hu_preloadContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
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

  v44[4] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)HUQuickControlGridViewController;
  -[HUQuickControlGridViewController viewDidLoad](&v43, sel_viewDidLoad);
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v8);

  -[HUQuickControlGridViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v13);

  v31 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlGridViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v37;
  -[HUQuickControlGridViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v30;
  -[HUQuickControlGridViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v15;
  -[HUQuickControlGridViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v22);

  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didMoveToParentViewController:", self);

  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setScrollEnabled:", 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childQuickControlContentViewControllers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlGridViewController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)controlItemPredicate
{
  void *v2;
  HUQuickControlCompoundItemPredicate *v3;
  HUQuickControlGridItemPredicate *v4;
  void *v5;
  HUQuickControlCompoundItemPredicate *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HUQuickControlCompoundItemPredicate alloc];
  v8[0] = v2;
  v4 = objc_alloc_init(HUQuickControlGridItemPredicate);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUQuickControlCompoundItemPredicate initWithRequiredSubpredicates:optionalSubpredicates:](v3, "initWithRequiredSubpredicates:optionalSubpredicates:", MEMORY[0x1E0C9AA60], v5);

  return v6;
}

- (HUQuickControlCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

@end
