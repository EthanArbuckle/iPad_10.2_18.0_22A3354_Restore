@implementation CNInsetGroupsAndAccountsStyle

- (BOOL)isInset
{
  return 1;
}

- (id)backgroundColor
{
  return +[CNUIColorRepository groupsInsetBackgroundColor](CNUIColorRepository, "groupsInsetBackgroundColor");
}

- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6
{
  _BOOL8 v6;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a6;
  v9 = (objc_class *)MEMORY[0x1E0DC4098];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithAppearanceStyle:layoutEnvironment:", 2, v12);
  objc_msgSend(v13, "setStylesFirstItemAsHeader:", v6);
  objc_msgSend(v13, "setLeadingSwipeActionsConfigurationProvider:", v11);

  objc_msgSend(v13, "setTrailingSwipeActionsConfigurationProvider:", v10);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v13, v12);

  return v14;
}

- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNInsetGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke;
  aBlock[3] = &unk_1E2049B80;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (BOOL)shouldShowCellSelection
{
  return 0;
}

- (int64_t)buttonBehavior
{
  return 2;
}

- (id)cellAccessoriesForItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = [v4 alloc];
  v12.receiver = self;
  v12.super_class = (Class)CNInsetGroupsAndAccountsStyle;
  -[CNAccountsAndGroupsStyle cellAccessoriesForItem:](&v12, sel_cellAccessoriesForItem_, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v9, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));
  if ((v5 & 1) == 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

- (id)cellConfigurationUpdateHandler
{
  return &__block_literal_global_19;
}

void __63__CNInsetGroupsAndAccountsStyle_cellConfigurationUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v14 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v14;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatedConfigurationForState:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "color");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyTextColor:", v11);

    objc_msgSend(v9, "imageProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyAccessoryTintColor:", v13);

  }
}

void __78__CNInsetGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_splitViewControllerContext");

  if (v7)
    objc_msgSend(MEMORY[0x1E0DC39A8], "headerConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DC39A8], "prominentInsetGroupedHeaderConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setContentConfiguration:", v8);

}

@end
