@implementation MFTimeZonePickerViewController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFTimeZonePickerViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1)
    dispatch_once(&log_onceToken_13, block);
  return (OS_os_log *)(id)log_log_13;
}

void __37__MFTimeZonePickerViewController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;

}

- (MFTimeZonePickerViewController)initWithCity:(id)a3
{
  id v5;
  MFTimeZonePickerViewController *v6;
  MFTimeZonePickerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTimeZonePickerViewController;
  v6 = -[MFTimeZonePickerViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currentCity, a3);

  return v7;
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *, void *, void *);
  void *v26;
  id v27;
  objc_super v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)MFTimeZonePickerViewController;
  -[MFTimeZonePickerViewController viewDidLoad](&v28, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFTimeZonePickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setSearchResultsUpdater:", self);
  objc_msgSend(v3, "setObscuresBackgroundDuringPresentation:", 0);
  _EFLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v6);

  -[MFTimeZonePickerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSearchController:", v3);
  _EFLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  -[MFTimeZonePickerViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  v10 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[MFTimeZonePickerViewController createCollectionViewLayout](self, "createCollectionViewLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke_2;
  v26 = &unk_1E5A69DF0;
  v15 = v13;
  v27 = v15;
  v16 = (void *)objc_msgSend(v14, "initWithCollectionView:cellProvider:", v12, &v23);
  -[MFTimeZonePickerViewController currentCity](self, "currentCity", v23, v24, v25, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFTimeZonePickerViewController setCurrentFilteredCities:](self, "setCurrentFilteredCities:", v18);
  v19 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v29 = &unk_1E5A9F418;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendSectionsWithIdentifiers:", v20);

  objc_msgSend(v19, "appendItemsWithIdentifiers:", v18);
  objc_msgSend(v16, "applySnapshot:animatingDifferences:", v19, 0);
  objc_msgSend(v12, "setDataSource:", v16);
  objc_msgSend(v12, "setDelegate:", self);
  -[MFTimeZonePickerViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v12);

  -[MFTimeZonePickerViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mf_pinToView:usingLayoutMargins:", v22, 0);

  -[MFTimeZonePickerViewController setCollectionView:](self, "setCollectionView:", v12);
  -[MFTimeZonePickerViewController setDataSource:](self, "setDataSource:", v16);

}

void __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);
  objc_msgSend(v8, "setContentConfiguration:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

id __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a4, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)createCollectionViewLayout
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MFTimeZonePickerViewController_createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E5A66EA8;
  v4 = v2;
  v8 = v4;
  v5 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v7);

  return v5;
}

id __60__MFTimeZonePickerViewController_createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFTimeZonePickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", &unk_1E5A9F418);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteItemsWithIdentifiers:", v7);
  objc_msgSend(v4, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v4, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFTimezoneHelper citiesMatchingName:](MFTimezoneHelper, "citiesMatchingName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MFTimeZonePickerViewController currentCity](self, "currentCity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MFTimeZonePickerViewController setCurrentFilteredCities:](self, "setCurrentFilteredCities:", v13);
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v13);
  objc_msgSend(v5, "applySnapshot:animatingDifferences:completion:", v6, 1, 0);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MFTimeZonePickerViewController currentFilteredCities](self, "currentFilteredCities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[MFTimeZonePickerViewController setCurrentCity:](self, "setCurrentCity:", v7);
    -[MFTimeZonePickerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZonePickerViewController:didSelectCity:", self, v7);

  }
  else
  {
    +[MFTimeZonePickerViewController log](MFTimeZonePickerViewController, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "displayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFTimeZonePickerViewController collectionView:didSelectItemAtIndexPath:].cold.1(v11, v14, v10);
    }

  }
  -[MFTimeZonePickerViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "popToRootViewControllerAnimated:", 1);

}

- (MFCity)currentCity
{
  return self->_currentCity;
}

- (void)setCurrentCity:(id)a3
{
  objc_storeStrong((id *)&self->_currentCity, a3);
}

- (MFTimeZonePickerViewControllerDelegate)delegate
{
  return (MFTimeZonePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)currentFilteredCities
{
  return self->_currentFilteredCities;
}

- (void)setCurrentFilteredCities:(id)a3
{
  objc_storeStrong((id *)&self->_currentFilteredCities, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_currentFilteredCities, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentCity, 0);
}

- (void)collectionView:(os_log_t)log didSelectItemAtIndexPath:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Time zone couldnt be created for time zone standard name: %{public}@", buf, 0xCu);

}

@end
