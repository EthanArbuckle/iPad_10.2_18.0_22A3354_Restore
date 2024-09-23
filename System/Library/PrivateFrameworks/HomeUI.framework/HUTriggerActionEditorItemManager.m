@implementation HUTriggerActionEditorItemManager

- (HUTriggerActionEditorItemManager)initWithDelegate:(id)a3 showShortcutItem:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HUViewControllerTableViewItem *v8;
  HUViewControllerTableViewItem *v9;
  HUTriggerHeaderItem *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HUTriggerHeaderItem *v14;
  HUButtonItem *v15;
  void *v16;
  void *v17;
  HUButtonItem *v18;
  id v19;
  HUTriggerActionEditorItemManager *v20;
  HUTriggerActionEditorItemManager *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[2];

  v4 = a4;
  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = [HUViewControllerTableViewItem alloc];
  v9 = -[HFStaticItem initWithResults:](v8, "initWithResults:", MEMORY[0x1E0C9AA70]);
  objc_msgSend(v7, "addObject:", v9);
  if (v4)
  {
    v10 = [HUTriggerHeaderItem alloc];
    v29 = *MEMORY[0x1E0D30D18];
    v11 = v29;
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorShortcutSectionTitle"), CFSTR("HUTriggerActionEditorShortcutSectionTitle"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HFStaticItem initWithResults:](v10, "initWithResults:", v13);

    objc_msgSend(v7, "addObject:", v14);
    v15 = [HUButtonItem alloc];
    v27[0] = v11;
    _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerActionEditorConvertToShortcutTitle"), CFSTR("HUTriggerActionEditorConvertToShortcutTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = *MEMORY[0x1E0D30D70];
    v28[0] = v16;
    v28[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HFStaticItem initWithResults:](v15, "initWithResults:", v17);

    objc_msgSend(v7, "addObject:", v18);
  }
  else
  {
    v18 = 0;
    v14 = 0;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __70__HUTriggerActionEditorItemManager_initWithDelegate_showShortcutItem___block_invoke;
  v25[3] = &unk_1E6F50358;
  v19 = v7;
  v26 = v19;
  v24.receiver = self;
  v24.super_class = (Class)HUTriggerActionEditorItemManager;
  v20 = -[HFSimpleItemManager initWithDelegate:itemProvidersCreator:](&v24, sel_initWithDelegate_itemProvidersCreator_, v6, v25);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_gridItem, v9);
    objc_storeStrong((id *)&v21->_addShortcutHeader, v14);
    objc_storeStrong((id *)&v21->_addShortcutItem, v18);
    objc_msgSend(MEMORY[0x1E0D319D0], "comparatorWithSortedObjects:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFSimpleItemManager setItemComparator:](v21, "setItemComparator:", v22);

  }
  return v21;
}

id __70__HUTriggerActionEditorItemManager_initWithDelegate_showShortcutItem___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithItems:", v3);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionEditorItemManagerGridSectionIdentifier"));
  -[HUTriggerActionEditorItemManager gridItem](self, "gridItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v7);

  objc_msgSend(v4, "addObject:", v5);
  -[HUTriggerActionEditorItemManager addShortcutHeader](self, "addShortcutHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionEditorItemManagerShortcutsHeaderSectionIdentifier"));
    -[HUTriggerActionEditorItemManager addShortcutHeader](self, "addShortcutHeader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItems:", v11);

    objc_msgSend(v4, "addObject:", v9);
  }
  -[HUTriggerActionEditorItemManager addShortcutItem](self, "addShortcutItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUTriggerActionEditorItemManagerShortcutsItemSectionIdentifier"));
    -[HUTriggerActionEditorItemManager addShortcutItem](self, "addShortcutItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v15);

    objc_msgSend(v4, "addObject:", v13);
  }

  return v4;
}

- (HUButtonItem)addShortcutItem
{
  return self->_addShortcutItem;
}

- (void)setAddShortcutItem:(id)a3
{
  objc_storeStrong((id *)&self->_addShortcutItem, a3);
}

- (HUViewControllerTableViewItem)gridItem
{
  return self->_gridItem;
}

- (void)setGridItem:(id)a3
{
  objc_storeStrong((id *)&self->_gridItem, a3);
}

- (HUTriggerHeaderItem)addShortcutHeader
{
  return self->_addShortcutHeader;
}

- (void)setAddShortcutHeader:(id)a3
{
  objc_storeStrong((id *)&self->_addShortcutHeader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addShortcutHeader, 0);
  objc_storeStrong((id *)&self->_gridItem, 0);
  objc_storeStrong((id *)&self->_addShortcutItem, 0);
}

@end
