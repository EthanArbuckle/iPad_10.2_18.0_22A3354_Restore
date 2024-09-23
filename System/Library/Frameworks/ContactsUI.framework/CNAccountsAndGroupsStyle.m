@implementation CNAccountsAndGroupsStyle

+ (id)styleForTraitCollection:(id)a3
{
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (objc_msgSend(a3, "_splitViewControllerContext") == 2)
  {
    v3 = &styleForTraitCollection__outlineStyle;
    v4 = (void *)styleForTraitCollection__outlineStyle;
    if (!styleForTraitCollection__outlineStyle)
      goto LABEL_5;
  }
  else
  {
    v3 = &styleForTraitCollection__insetStyle;
    v4 = (void *)styleForTraitCollection__insetStyle;
    if (!styleForTraitCollection__insetStyle)
    {
LABEL_5:
      v5 = objc_opt_new();
      v6 = (void *)*v3;
      *v3 = v5;

      v4 = (void *)*v3;
    }
  }
  return v4;
}

- (BOOL)isInset
{
  return 0;
}

- (id)backgroundColor
{
  return 0;
}

- (id)parentCellAccessories
{
  id v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC3588]);
  objc_msgSend(v2, "setStyle:", 1);
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6
{
  return 0;
}

- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3
{
  return 0;
}

- (id)cellConfigurationUpdateHandler
{
  return 0;
}

- (BOOL)shouldShowCellSelection
{
  return 1;
}

- (int64_t)buttonBehavior
{
  return 0;
}

- (id)cellAccessoriesForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "contactCountString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v5);
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(v3, "groupSymbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v8, 0);
    objc_msgSend(v4, "addObject:", v9);

  }
  if (objc_msgSend(v3, "canDelete"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3558]);
    objc_msgSend(v4, "addObject:", v10);

  }
  return v4;
}

- (id)cellAccessoriesForContextMenuPreviewForItem:(id)a3
{
  void *v3;
  void *v4;

  -[CNAccountsAndGroupsStyle cellAccessoriesForItem:](self, "cellAccessoriesForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_32_17144);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__CNAccountsAndGroupsStyle_cellAccessoriesForContextMenuPreviewForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v2, "setHidden:", 1);
  return v2;
}

@end
