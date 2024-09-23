@implementation ReaderFormatViewController

- (ReaderFormatViewController)initWithReaderContext:(id)a3 provenance:(int64_t)a4
{
  id v7;
  ReaderFormatViewController *v8;
  void *v9;
  uint64_t v10;
  _SFSettingsAlertOptionsGroupController *fontGroupController;
  ReaderFormatViewController *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ReaderFormatViewController;
  v8 = -[ReaderFormatViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReaderFormatViewController setTitle:](v8, "setTitle:", v9);

    objc_storeStrong((id *)&v8->_readerContext, a3);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD5780]), "initWithReaderContext:", v7);
    fontGroupController = v8->_fontGroupController;
    v8->_fontGroupController = (_SFSettingsAlertOptionsGroupController *)v10;

    v8->_provenance = a4;
    v12 = v8;
  }

  return v8;
}

- (void)loadView
{
  id v3;
  void *v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSectionProvider:", &__block_literal_global_69);
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v7);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[ReaderFormatViewController setView:](self, "setView:", self->_collectionView);

}

id __38__ReaderFormatViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4098]), "initWithAppearanceStyle:layoutEnvironment:", 2, v4);
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CD55F0], "requiredHeight");
    objc_msgSend(v5, "setRowHeight:");
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v5, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  SFReaderAppearanceThemeSelector *v5;
  SFReaderAppearanceThemeSelector *themeSelector;
  void *v7;
  UICollectionViewCellRegistration *v8;
  UICollectionViewCellRegistration **cellRegistrations;
  UICollectionViewCellRegistration *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  UICollectionViewCellRegistration *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ReaderFormatViewController;
  -[ReaderFormatViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0CD55F0];
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke;
  v18[3] = &unk_1E9CFAB68;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v3, "themeSelectorWithBlock:", v18);
  v5 = (SFReaderAppearanceThemeSelector *)objc_claimAutoreleasedReturnValue();
  themeSelector = self->_themeSelector;
  self->_themeSelector = v5;

  -[SFReaderContext configurationManager](self->_readerContext, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFReaderAppearanceThemeSelector setSelectedTheme:](self->_themeSelector, "setSelectedTheme:", objc_msgSend(v7, "themeForAppearance:", -[SFReaderContext currentAppearance](self->_readerContext, "currentAppearance")));

  -[SFReaderAppearanceThemeSelector setAutoresizingMask:](self->_themeSelector, "setAutoresizingMask:", 18);
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke_2;
  v17[3] = &unk_1E9CFAB90;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v17);
  v8 = (UICollectionViewCellRegistration *)objc_claimAutoreleasedReturnValue();
  cellRegistrations = self->_cellRegistrations;
  v10 = self->_cellRegistrations[0];
  self->_cellRegistrations[0] = v8;

  v11 = (void *)MEMORY[0x1E0DC35C8];
  v12 = objc_opt_class();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke_3;
  v15[3] = &unk_1E9CFABB8;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v15);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = cellRegistrations[1];
  cellRegistrations[1] = (UICollectionViewCellRegistration *)v13;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 126), "setReaderTheme:forAppearance:", objc_msgSend(v6, "selectedTheme"), objc_msgSend(*((id *)WeakRetained + 126), "currentAppearance"));
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sf_didPerformFormatMenuAction:provenance:", 8, v4[127]);

  }
}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "isDescendantOfView:") & 1) == 0)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setFrame:");
    objc_msgSend(v3, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  }

}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id *WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[123], "attributedStringForValue:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v9);

    objc_msgSend(WeakRetained[123], "prepareView:forItem:value:", v10, v6, v6);
    objc_msgSend(v10, "setContentConfiguration:", v8);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  UICollectionView *collectionView;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ReaderFormatViewController;
  -[ReaderFormatViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  -[_SFSettingsAlertOptionsGroupController values](self->_fontGroupController, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ReaderFormatViewController_viewWillAppear___block_invoke;
  v8[3] = &unk_1E9CF7030;
  v8[4] = self;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

  }
  -[ReaderFormatViewController _updateCloseButton](self, "_updateCloseButton");
}

uint64_t __45__ReaderFormatViewController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "isSelectedValue:", a2);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReaderFormatViewController;
  -[ReaderFormatViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[ReaderFormatViewController _updateCloseButton](self, "_updateCloseButton");
}

- (void)_updateCloseButton
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v3 = -[ReaderFormatViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  -[ReaderFormatViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v3 & 1) != 0)
  {
    if (v5)
      objc_msgSend(v4, "setRightBarButtonItem:", 0);
  }
  else if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v7 = (void *)MEMORY[0x1E0DC3428];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __48__ReaderFormatViewController__updateCloseButton__block_invoke;
    v13 = &unk_1E9CF2C28;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", &stru_1E9CFDBB0, 0, 0, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithBarButtonSystemItem:primaryAction:", 24, v8, v10, v11, v12, v13);
    objc_msgSend(v4, "setRightBarButtonItem:", v9);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __48__ReaderFormatViewController__updateCloseButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (a4 == 2)
    return 0;
  if (a4 != 1)
    return 1;
  -[_SFSettingsAlertOptionsGroupController values](self->_fontGroupController, "values", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 1)
  {
    -[_SFSettingsAlertOptionsGroupController values](self->_fontGroupController, "values");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", self->_cellRegistrations[1], v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", self->_cellRegistrations[0], v7, &unk_1E9D62350);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == 1)
  {
    objc_msgSend(v5, "cellForItemAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEnabled");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  _SFSettingsAlertOptionsGroupController *fontGroupController;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "section") == 1)
  {
    fontGroupController = self->_fontGroupController;
    -[_SFSettingsAlertOptionsGroupController values](fontGroupController, "values");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertOptionsGroupController setSelectedValue:](fontGroupController, "setSelectedValue:", v7);

    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sf_didPerformFormatMenuAction:provenance:", 7, self->_provenance);

  }
}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_readerContext, 0);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_cellRegistrations[i], 0);
  objc_storeStrong((id *)&self->_fontGroupController, 0);
  objc_storeStrong((id *)&self->_themeSelector, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
