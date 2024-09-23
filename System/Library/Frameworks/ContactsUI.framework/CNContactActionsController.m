@implementation CNContactActionsController

void __44__CNContactActionsController_retrieveModels__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "modelsByActionTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setModelsByActionTypes:", v3);
  objc_msgSend(WeakRetained, "prepareNavigationListItems");
  objc_msgSend(WeakRetained, "displayedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadNavigationListView");

}

- (void)setModelsByActionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)prepareNavigationListItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionsController actionTypes](self, "actionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __56__CNContactActionsController_prepareNavigationListItems__block_invoke;
  v46[3] = &unk_1E204E1D8;
  v46[4] = self;
  objc_msgSend(v4, "_cn_filter:", v46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = v6;
  if (-[CNContactActionsController actionsOrder](self, "actionsOrder") == 1)
  {
    objc_msgSend(v6, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v9);
        -[CNContactActionsController navigationListItemForUserActionType:](self, "navigationListItemForUserActionType:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v3, "copy");
  -[CNContactActionsController displayedController](self, "displayedController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setItems:", v15);

  v17 = objc_msgSend(v3, "count");
  if (v17 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  -[CNContactActionsController displayedController](self, "displayedController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setExpandedItem:", v18);

  if (v17 == 1)
  -[CNContactActionsController delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    v37 = v6;
    v22 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = v3;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
          objc_msgSend(v28, "image");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactActionsController generateMenuForItem:image:withCurrentList:](self, "generateMenuForItem:image:withCurrentList:", v28, v29, v22);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v25);
    }

    if (objc_msgSend(v22, "count") == 1)
    {
      objc_msgSend(v22, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v6 = v37;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v22, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "children");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "mutableCopy");

        v22 = (void *)v34;
      }
    }
    else
    {
      v6 = v37;
    }
    -[CNContactActionsController delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v35, "contactActionsController:didUpdateWithMenu:", self, v36);

  }
}

- (void)generateMenuForItem:(id)a3 image:(id)a4 withCurrentList:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v30 = v10;
    v31 = v9;
    v12 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v8, "items");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (-[CNContactActionsController displayMenuIconAtTopLevel](self, "displayMenuIconAtTopLevel", v30))
          {
            v19 = 0;
          }
          else
          {
            objc_msgSend(v8, "image");
            v20 = objc_claimAutoreleasedReturnValue();
            v21 = v8;
            v22 = (void *)v20;
            v23 = v31;
            if (v20)
              v23 = (void *)v20;
            v19 = v23;

            v8 = v21;
          }
          -[CNContactActionsController generateMenuForItem:image:withCurrentList:](self, "generateMenuForItem:image:withCurrentList:", v18, v19, v12);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    if (-[CNContactActionsController displayMenuIconAtTopLevel](self, "displayMenuIconAtTopLevel"))
    {
      objc_msgSend(v8, "image");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v10 = v30;
    v9 = v31;
    v27 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(v8, "title", v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "menuWithTitle:image:identifier:options:children:", v28, v24, 0, 0, v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v29);
  }
  else
  {
    objc_msgSend(v8, "image");
    v25 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25;
    if (v25)
      v26 = (id)v25;
    else
      v26 = v9;
    -[CNContactActionsController actionForItem:withImage:](self, "actionForItem:withImage:", v8, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v24);
  }

}

- (BOOL)displayMenuIconAtTopLevel
{
  return self->_displayMenuIconAtTopLevel;
}

- (UIViewController)viewController
{
  UIViewController *viewController;
  CNUINavigationListViewController *v4;
  UIViewController *v5;

  viewController = self->_viewController;
  if (!viewController)
  {
    v4 = objc_alloc_init(CNUINavigationListViewController);
    -[CNUINavigationListViewController setDelegate:](v4, "setDelegate:", self);
    v5 = self->_viewController;
    self->_viewController = &v4->super;

    -[CNContactActionsController retrieveModels](self, "retrieveModels");
    viewController = self->_viewController;
  }
  return viewController;
}

- (id)actionForItem:(id)a3 withImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  CNContactActionsController *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3428];
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __54__CNContactActionsController_actionForItem_withImage___block_invoke;
  v18 = &unk_1E20504A8;
  v19 = v6;
  v20 = self;
  v11 = v6;
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, v10, 0, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  objc_msgSend(v11, "subtitle", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDiscoverabilityTitle:", v13);

  return v12;
}

- (CNContactActionsControllerDelegate)delegate
{
  return (CNContactActionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)navigationListItemForUserActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNUINavigationListItem *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  CNUINavigationListItem *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactActionsController imageForActionType:](self, "imageForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionsController actionsDataSource](self, "actionsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consumer:localizedDisplayNameForActionType:", self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNUINavigationListItem initWithTitle:image:]([CNUINavigationListItem alloc], "initWithTitle:image:", v7, v5);
  -[CNUINavigationListItem setIdentifier:](v8, "setIdentifier:", v4);
  -[CNContactActionsController modelForActionType:](self, "modelForActionType:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactActionsController generateFaceTimeListItemsOnly](self, "generateFaceTimeListItemsOnly"))
  {
    +[CNUINavigationListItem faceTimeNavigationListItemsForUserActionListModel:](CNUINavigationListItem, "faceTimeNavigationListItemsForUserActionListModel:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUINavigationListItem setItems:](v8, "setItems:", v10);

    goto LABEL_32;
  }
  if (-[CNContactActionsController generateFavoritesListItemsOnly](self, "generateFavoritesListItemsOnly"))
    +[CNUINavigationListItem favoritesNavigationListItemsForUserActionListModel:](CNUINavigationListItem, "favoritesNavigationListItemsForUserActionListModel:", v9);
  else
    +[CNUINavigationListItem navigationListItemsForUserActionListModel:](CNUINavigationListItem, "navigationListItemsForUserActionListModel:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v5;
  v38 = v4;
  -[CNUINavigationListItem setItems:](v8, "setItems:", v11, v7);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CNUINavigationListItem items](v8, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_23;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v41;
  do
  {
    v17 = 0;
    v39 = v14;
    do
    {
      if (*(_QWORD *)v41 != v16)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
      objc_msgSend(v18, "setParent:", v8);
      objc_msgSend(v18, "defaultItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v18, "defaultItem");
        v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        v15 = v20;
        goto LABEL_14;
      }
      objc_msgSend(v9, "defaultAction");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v23 = v15;
        v24 = v12;
        v25 = v8;
        v26 = v9;
        objc_msgSend(v9, "defaultAction");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "content");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 == v28)
        {
          v20 = v18;
          v9 = v26;
          v8 = v25;
          v12 = v24;
          v15 = v23;
          v14 = v39;
          goto LABEL_13;
        }
        v9 = v26;
        v8 = v25;
        v12 = v24;
        v15 = v23;
        v14 = v39;
      }
LABEL_14:
      ++v17;
    }
    while (v14 != v17);
    v29 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    v14 = v29;
  }
  while (v29);
LABEL_23:

  -[CNUINavigationListItem setDefaultItem:](v8, "setDefaultItem:", v15);
  v5 = v37;
  v4 = v38;
  if (v15)
  {
    v30 = v9;
    objc_opt_class();
    objc_msgSend(v15, "content");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v33)
      +[CNUINavigationListItem localizedLabelForActionItem:usingPropertyLabel:](CNUINavigationListItem, "localizedLabelForActionItem:usingPropertyLabel:", v33, 0);
    else
      objc_msgSend(v15, "title");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUINavigationListItem setSubtitle:](v8, "setSubtitle:", v34);
    v9 = v30;
  }

  v7 = v36;
LABEL_32:

  return v8;
}

uint64_t __56__CNContactActionsController_prepareNavigationListItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "modelForActionType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEmpty") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)modelForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactActionsController modelsByActionTypes](self, "modelsByActionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)modelsByActionTypes
{
  return self->_modelsByActionTypes;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (id)imageForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[CNContactActionsController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "cnui_carPlayUserActionSymbolImageForActionType:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CNContactActionsController shouldUseOutlinedActionGlyphStyle](self, "shouldUseOutlinedActionGlyphStyle"))
      objc_msgSend(MEMORY[0x1E0DC3870], "cnui_userActionOutlinedSymbolImageForActionType:scale:withColor:", v4, 3, 0);
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "cnui_userActionSymbolImageForActionType:scale:withColor:", v4, 3, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)shouldUseOutlinedActionGlyphStyle
{
  return self->_shouldUseOutlinedActionGlyphStyle;
}

- (BOOL)generateFavoritesListItemsOnly
{
  return self->_generateFavoritesListItemsOnly;
}

- (BOOL)generateFaceTimeListItemsOnly
{
  return self->_generateFaceTimeListItemsOnly;
}

- (NSArray)actionTypes
{
  return self->_actionTypes;
}

- (int64_t)actionsOrder
{
  return self->_actionsOrder;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0D13D88], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactActionsController descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __44__CNContactActionsController_retrieveModels__block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "actionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __44__CNContactActionsController_retrieveModels__block_invoke_2;
  v12 = &unk_1E204FB90;
  objc_copyWeak(&v14, a1 + 6);
  v7 = v3;
  v13 = v7;
  objc_msgSend(v4, "consumer:actionModelsForContact:actionType:handler:", v5, v6, v7, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "addObject:", v8, v9, v10, v11, v12);
  objc_destroyWeak(&v14);

}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactActionsController)initWithContact:(id)a3 actionTypes:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactActionsController *v13;

  v6 = (objc_class *)MEMORY[0x1E0D13D88];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionDiscoveringEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithDiscoveringEnvironment:", v11);

  v13 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](self, "initWithContact:dataSource:actionTypes:", v8, v12, v7);
  return v13;
}

- (void)setShouldUseOutlinedActionGlyphStyle:(BOOL)a3
{
  self->_shouldUseOutlinedActionGlyphStyle = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactActionsController)initWithContact:(id)a3 dataSource:(id)a4 actionTypes:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNContactActionsController *v12;
  CNContactActionsController *v13;
  NSDictionary *modelsByActionTypes;
  void *v15;
  CNContactActionsController *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactActionsController;
  v12 = -[CNContactActionsController init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    objc_storeStrong((id *)&v13->_actionTypes, a5);
    objc_storeStrong((id *)&v13->_actionsDataSource, a4);
    modelsByActionTypes = v13->_modelsByActionTypes;
    v13->_modelsByActionTypes = (NSDictionary *)MEMORY[0x1E0C9AA70];

    +[CNUINavigationListStyleProvider defaultStyle](CNUINavigationListStyleProvider, "defaultStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_navigationListStyle, v15);

    v16 = v13;
  }

  return v13;
}

- (void)setGenerateFavoritesListItemsOnly:(BOOL)a3
{
  self->_generateFavoritesListItemsOnly = a3;
}

- (void)setDisplayMenuIconAtTopLevel:(BOOL)a3
{
  self->_displayMenuIconAtTopLevel = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[CNContactActionsController cancelModels](self, "cancelModels");
  v3.receiver = self;
  v3.super_class = (Class)CNContactActionsController;
  -[CNContactActionsController dealloc](&v3, sel_dealloc);
}

void __44__CNContactActionsController_retrieveModels__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(_QWORD);
  _QWORD aBlock[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNContactActionsController_retrieveModels__block_invoke_3;
  aBlock[3] = &unk_1E204FF10;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v5[2](v5);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

- (void)retrieveModels
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id *, void *);
  void *v9;
  CNContactActionsController *v10;
  id v11;
  id v12;
  id location;

  -[CNContactActionsController cancelModels](self, "cancelModels");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[CNContactActionsController actionTypes](self, "actionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __44__CNContactActionsController_retrieveModels__block_invoke;
  v9 = &unk_1E2048E78;
  v10 = self;
  objc_copyWeak(&v12, &location);
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v6);

  -[CNContactActionsController setModelCancelables:](self, "setModelCancelables:", v5, v6, v7, v8, v9, v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)cancelModels
{
  id v2;

  -[CNContactActionsController modelCancelables](self, "modelCancelables");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_each:", *MEMORY[0x1E0D13710]);

}

- (NSArray)modelCancelables
{
  return self->_modelCancelables;
}

- (void)setModelCancelables:(id)a3
{
  objc_storeStrong((id *)&self->_modelCancelables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypes, 0);
  objc_destroyWeak((id *)&self->_navigationListStyle);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_modelCancelables, 0);
  objc_storeStrong((id *)&self->_modelsByActionTypes, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setNavigationListStyle:(id)a3
{
  objc_storeWeak((id *)&self->_navigationListStyle, a3);
  -[CNContactActionsController styleUpdated](self, "styleUpdated");
}

- (void)styleUpdated
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[CNContactActionsController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  -[CNContactActionsController navigationListStyle](self, "navigationListStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationListStyle:", v6);

  -[CNContactActionsController retrieveModels](self, "retrieveModels");
}

- (void)setActionsOrder:(int64_t)a3
{
  id v4;

  if (self->_actionsOrder != a3)
  {
    self->_actionsOrder = a3;
    -[CNContactActionsController prepareNavigationListItems](self, "prepareNavigationListItems");
    -[CNContactActionsController displayedController](self, "displayedController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadNavigationListView");

  }
}

- (void)navigationListController:(id)a3 didSelectItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_opt_class();
  objc_msgSend(v6, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    goto LABEL_9;
  objc_opt_class();
  objc_msgSend(v6, "defaultItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  v12 = v11;

  if (v12)
  {
LABEL_9:
    -[CNContactActionsController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactActionsController:didSelectAction:", self, v7);

  }
  else
  {
    objc_msgSend(v6, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
      objc_msgSend(v16, "toggleItem:", v6);
  }

}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void)setActionsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_actionsDataSource, a3);
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (CNUINavigationListStyle)navigationListStyle
{
  return (CNUINavigationListStyle *)objc_loadWeakRetained((id *)&self->_navigationListStyle);
}

- (void)setGenerateFaceTimeListItemsOnly:(BOOL)a3
{
  self->_generateFaceTimeListItemsOnly = a3;
}

void __54__CNContactActionsController_actionForItem_withImage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "content");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v8;
  else
    v2 = 0;
  v3 = v2;

  if (!v3)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "defaultItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v8 = v6;

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactActionsController:didSelectAction:", *(_QWORD *)(a1 + 40), v8);

}

+ (id)supportedActionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0D13D88], "allSupportedActionTypes");
}

- (BOOL)actionsReversed
{
  return -[CNContactActionsController actionsOrder](self, "actionsOrder") == 1;
}

- (void)setActionsReversed:(BOOL)a3
{
  -[CNContactActionsController setActionsOrder:](self, "setActionsOrder:", a3);
}

@end
