@implementation CNOutlineGroupsAndAccountsStyle

- (BOOL)isInset
{
  return 0;
}

- (id)backgroundColor
{
  return +[CNUIColorRepository groupsOutlineBackgroundColor](CNUIColorRepository, "groupsOutlineBackgroundColor");
}

- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0DC4098];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithAppearanceStyle:layoutEnvironment:", 3, v11);
  objc_msgSend(v12, "setSeparatorStyle:", 0);
  objc_msgSend(v12, "setLeadingSwipeActionsConfigurationProvider:", v10);

  objc_msgSend(v12, "setTrailingSwipeActionsConfigurationProvider:", v9);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4090]), "initWithConfiguration:layoutEnvironment:", v12, v11);

  return v13;
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
  aBlock[2] = __80__CNOutlineGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke;
  aBlock[3] = &unk_1E2049B80;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (int64_t)buttonBehavior
{
  return 1;
}

- (id)cellConfigurationUpdateHandler
{
  return &__block_literal_global_17133;
}

void __65__CNOutlineGroupsAndAccountsStyle_cellConfigurationUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  id v16;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v16 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v16;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "accompaniedSidebarCellConfiguration");
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
    objc_msgSend(v7, "applyTextViewTintColor:", v13);

    objc_msgSend(v9, "imageProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyAccessoryTintColor:", v15);

  }
}

void __80__CNOutlineGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke(uint64_t a1, void *a2, void *a3)
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
