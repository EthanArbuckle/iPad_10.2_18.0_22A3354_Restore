@implementation CNQuickActionsView

- (CNQuickActionsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CNQuickActionsView *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19[4] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CNQuickActionsView;
  v7 = -[CNQuickActionsView initWithFrame:](&v18, sel_initWithFrame_);
  v7->_showBackgroundPlatters = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  -[CNQuickActionsView setCollectionLayout:](v7, "setCollectionLayout:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v8, x, y, width, height);
  objc_msgSend(v9, "setScrollEnabled:", 0);
  objc_msgSend(v9, "setBackgroundColor:", 0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNQuickActionsView addSubview:](v7, "addSubview:", v9);
  -[CNQuickActionsView setCollectionView:](v7, "setCollectionView:", v9);
  v10 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 3, 0, v7, 3, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 1, 0, v7, 1, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 4, 0, v7, 4, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 2, 0, v7, 2, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v15);

  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("actionCell"));
  objc_msgSend(v9, "setDataSource:", v7);
  objc_msgSend(v9, "setDelegate:", v7);
  objc_msgSend((id)objc_opt_class(), "defaultCategories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionsView setCategories:](v7, "setCategories:", v16);

  return v7;
}

- (CNQuickActionsView)initWithContact:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CNQuickActionsView *v9;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = a3;
  v9 = -[CNQuickActionsView initWithFrame:](self, "initWithFrame:", v4, v5, v6, v7);
  -[CNQuickActionsView setContact:](v9, "setContact:", v8);

  return v9;
}

- (void)setContact:(id)a3
{
  CNContact *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact assertKeysAreAvailable:](v5, "assertKeysAreAvailable:", v7);

    objc_storeStrong((id *)&self->_contact, a3);
    -[CNQuickActionsView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[CNQuickActionsView _updateActions](self, "_updateActions");
  }

}

- (void)setInterspace:(double)a3
{
  id v4;

  -[CNQuickActionsView collectionLayout](self, "collectionLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumInteritemSpacing:", a3);

}

- (void)setSortsWithDuet:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_sortsWithDuet = a3;
  -[CNQuickActionsView actionsManager](self, "actionsManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortsWithDuet:", v3);

}

- (double)interspace
{
  void *v2;
  double v3;
  double v4;

  -[CNQuickActionsView collectionLayout](self, "collectionLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumInteritemSpacing");
  v4 = v3;

  return v4;
}

- (void)_updateActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id from;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[CNQuickActionsView actionsManager](self, "actionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionsView contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = v4;
  }
  else
  {
LABEL_4:
    v10 = (void *)objc_opt_class();
    -[CNQuickActionsView contact](self, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionsManagerForContact:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNQuickActionsView categories](self, "categories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCategories:", v12);

    objc_msgSend(v9, "setSortsWithDuet:", -[CNQuickActionsView sortsWithDuet](self, "sortsWithDuet"));
    objc_msgSend(v9, "setUseDuetIfAvailable:", -[CNQuickActionsView useDuetIfAvailable](self, "useDuetIfAvailable"));
    -[CNQuickActionsView setActionsManager:](self, "setActionsManager:", v9);
    objc_msgSend(v9, "setDelegate:", self);
    objc_initWeak(&location, v9);
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__CNQuickActionsView__updateActions__block_invoke;
    v13[3] = &unk_1E204C6C0;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    objc_msgSend(v9, "updateActionsWithBlock:", v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)reloadData
{
  id v3;

  -[CNQuickActionsView updateContentSize](self, "updateContentSize");
  -[CNQuickActionsView collectionView](self, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)updateContentSize
{
  void *v3;
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  __int128 v11;

  -[CNQuickActionsView actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = (double *)MEMORY[0x1E0C9D820];
  v11 = *MEMORY[0x1E0C9D820];
  -[CNQuickActionsView _widthForButtonCount:itemSize:](self, "_widthForButtonCount:itemSize:", v4, &v11);
  if (v6 <= 0.0)
  {
    v7 = *v5;
    v8 = v5[1];
  }
  else
  {
    v7 = v6;
    v8 = *((double *)&v11 + 1);
    v9 = *(double *)&v11;
    -[CNQuickActionsView collectionLayout](self, "collectionLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItemSize:", v9, v8);

  }
  -[CNQuickActionsView setCachedContentSize:](self, "setCachedContentSize:", v7, v8);
  -[CNQuickActionsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNQuickActionsView;
  -[CNQuickActionsView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[CNQuickActionsView _updateActions](self, "_updateActions");
}

- (double)_widthForButtonCount:(int64_t)a3 itemSize:(CGSize *)a4
{
  int64_t v4;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  _QWORD v18[6];
  uint64_t v19;
  double *v20;
  uint64_t v21;
  const char *v22;
  __int128 v23;

  v4 = a3 - 1;
  if (a3 < 1)
    return 0.0;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x3010000000;
  v22 = "";
  v23 = *MEMORY[0x1E0C9D820];
  -[CNQuickActionsView actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__CNQuickActionsView__widthForButtonCount_itemSize___block_invoke;
  v18[3] = &unk_1E204C6E8;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);

  -[CNQuickActionsView collectionLayout](self, "collectionLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumInteritemSpacing");
  v11 = v10;

  if (-[CNQuickActionsView showTitles](self, "showTitles"))
    v12 = 60.0;
  else
    v12 = v20[4];
  v14 = v20[5];
  v15 = -[CNQuickActionsView showTitles](self, "showTitles");
  if (a4)
  {
    v16 = 0.0;
    if (v15)
      v16 = 25.0;
    a4->width = v12;
    a4->height = v14 + v16;
  }
  v13 = v11 * (double)v4 + (double)a3 * v12;
  _Block_object_dispose(&v19, 8);
  return v13;
}

- (double)maximumWidth
{
  void *v3;
  uint64_t v4;
  double result;

  -[CNQuickActionsView categories](self, "categories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CNQuickActionsView _widthForButtonCount:itemSize:](self, "_widthForButtonCount:itemSize:", v4, 0);
  return result;
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CNQuickActionsView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNQuickActionsView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForActionsView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)actionsManager:(id)a3 actionDidPerform:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNQuickActionsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNQuickActionsView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionsView:didPerformAction:", self, v8);

  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNQuickActionsView actions](self, "actions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("actionCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickActionsView actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAction:", v10);

  objc_msgSend(v7, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  objc_msgSend(v7, "setShowTitle:", -[CNQuickActionsView showTitles](self, "showTitles"));
  objc_msgSend(v7, "setShowBackgroundPlatter:", -[CNQuickActionsView showBackgroundPlatters](self, "showBackgroundPlatters"));

  return v7;
}

- (BOOL)quickActionButton:(id)a3 performAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BOOL v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;

  v6 = a3;
  v7 = a4;
  -[CNQuickActionsView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  -[CNQuickActionsView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForActionsView:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_7:
    v30 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "userActionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D13D88]);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionDiscoveringEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithDiscoveringEnvironment:", v14);

  -[CNQuickActionsView setPerformingAction:](self, "setPerformingAction:", v7);
  if ((objc_msgSend(v7, "isLongPress") & 1) != 0)
    goto LABEL_11;
  v16 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  -[CNQuickActionsView contact](self, "contact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __54__CNQuickActionsView_quickActionButton_performAction___block_invoke;
  v34[3] = &unk_1E204C710;
  v18 = v16;
  v35 = v18;
  v32 = v11;
  v19 = (id)objc_msgSend(v15, "consumer:actionModelsForContact:actionType:handler:", self, v17, v11, v34);

  objc_msgSend(v18, "future");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v20, "resultBeforeDate:error:", v21, &v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v33;

  objc_msgSend(v22, "defaultAction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v22, "defaultAction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNQuickActionsView performAction:](self, "performAction:", v29);

  }
  else if (!v22)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNQuickActionsView.m", 364, 5, CFSTR("Failed to retrieve default action with %@"), v25, v26, v27, v28, (uint64_t)v23);
  }

  v11 = v32;
  if (!v24)
LABEL_11:
    -[CNQuickActionsView showDisambiguationControllerWithDataSource:actionType:onController:sourceView:](self, "showDisambiguationControllerWithDataSource:actionType:onController:sourceView:", v15, v11, v10, v6);

  v30 = 1;
LABEL_13:

  return v30;
}

- (void)showDisambiguationControllerWithDataSource:(id)a3 actionType:(id)a4 onController:(id)a5 sourceView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNContactActionsController *v14;
  void *v15;
  void *v16;
  CNContactActionsController *v17;
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
  _QWORD v28[5];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = [CNContactActionsController alloc];
  -[CNQuickActionsView contact](self, "contact");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v14, "initWithContact:dataSource:actionTypes:", v15, v13, v16);

  -[CNQuickActionsView setActionsController:](self, "setActionsController:", v17);
  -[CNQuickActionsView actionsController](self, "actionsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __100__CNQuickActionsView_showDisambiguationControllerWithDataSource_actionType_onController_sourceView___block_invoke;
  v28[3] = &unk_1E204F7F0;
  v28[4] = self;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v23);

  -[CNQuickActionsView actionsController](self, "actionsController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContentViewController:", v25);

  objc_msgSend(v19, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "setSourceView:", v12);
    objc_msgSend(v12, "bounds");
    objc_msgSend(v27, "setSourceRect:");
  }
  objc_msgSend(v11, "presentViewController:animated:completion:", v19, 1, 0);

}

- (void)performAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CNQuickActionsView *v12;
  _QWORD v13[4];
  id v14;
  CNQuickActionsView *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  objc_msgSend(v4, "performActionWithContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__CNQuickActionsView_performAction___block_invoke;
  v13[3] = &unk_1E204C738;
  v8 = v4;
  v14 = v8;
  v15 = self;
  objc_msgSend(v6, "addSuccessBlock:", v13);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __36__CNQuickActionsView_performAction___block_invoke_2;
  v10[3] = &unk_1E204E4D8;
  v11 = v8;
  v12 = self;
  v9 = v8;
  objc_msgSend(v6, "addFailureBlock:", v10);

}

- (void)didDisambiguateActionType:(id)a3 withActionItem:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0D13D88];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionDiscoveringEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v9, "initWithDiscoveringEnvironment:", v11);

  -[CNQuickActionsView contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "consumer:didSelectItem:forContact:actionType:", self, v7, v12, v8);

}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];

  v5 = a4;
  -[CNQuickActionsView alertController](self, "alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNQuickActionsView_contactActionsController_didSelectAction___block_invoke;
  v7[3] = &unk_1E204F648;
  v7[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

  -[CNQuickActionsView performAction:](self, "performAction:", v5);
  -[CNQuickActionsView setActionsController:](self, "setActionsController:", 0);
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (BOOL)sortsWithDuet
{
  return self->_sortsWithDuet;
}

- (NSDictionary)titleTextAttributes
{
  return self->_titleTextAttributes;
}

- (void)setTitleTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (BOOL)showTitles
{
  return self->_showTitles;
}

- (void)setShowTitles:(BOOL)a3
{
  self->_showTitles = a3;
}

- (BOOL)showBackgroundPlatters
{
  return self->_showBackgroundPlatters;
}

- (void)setShowBackgroundPlatters:(BOOL)a3
{
  self->_showBackgroundPlatters = a3;
}

- (CNQuickActionsViewDelegate)delegate
{
  return (CNQuickActionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (UICollectionViewFlowLayout)collectionLayout
{
  return self->_collectionLayout;
}

- (void)setCollectionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLayout, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CGSize)cachedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedContentSize.width;
  height = self->_cachedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedContentSize:(CGSize)a3
{
  self->_cachedContentSize = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (CNQuickAction)performingAction
{
  return self->_performingAction;
}

- (void)setPerformingAction:(id)a3
{
  objc_storeStrong((id *)&self->_performingAction, a3);
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_performingAction, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleTextAttributes, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

uint64_t __63__CNQuickActionsView_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlertController:", 0);
}

void __36__CNQuickActionsView_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  NSLog(CFSTR("Did perform action %@"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "performingAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionsView:didPerformAction:", v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "setPerformingAction:", 0);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "performingAction");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userActionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didDisambiguateActionType:withActionItem:", v8, *(_QWORD *)(a1 + 32));

}

void __36__CNQuickActionsView_performAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  NSLog(CFSTR("Did fail to perform action %@, with error: %@"), *(_QWORD *)(a1 + 32), a2);
  objc_msgSend(*(id *)(a1 + 40), "setPerformingAction:", 0);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "performingAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userActionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDisambiguateActionType:withActionItem:", v4, *(_QWORD *)(a1 + 32));

}

uint64_t __100__CNQuickActionsView_showDisambiguationControllerWithDataSource_actionType_onController_sourceView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlertController:", 0);
}

uint64_t __54__CNQuickActionsView_quickActionButton_performAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __52__CNQuickActionsView__widthForButtonCount_itemSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageTintColor:", v5);

  objc_msgSend(v4, "imageForContext:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "size");
  v8 = v7;
  v10 = v9;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(double *)(v11 + 32);
  v13 = ceil(v8);
  if (v12 < v13)
    v12 = v13;
  *(double *)(v11 + 32) = v12;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(double *)(v14 + 40);
  v16 = ceil(v10);
  if (v15 < v16)
    v15 = v16;
  *(double *)(v14 + 40) = v15;
}

void __36__CNQuickActionsView__updateActions__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v2, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v2, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionsView:willShowActions:", v2, v4);

  }
  objc_msgSend(v2, "setActions:", v4);
  objc_msgSend(v2, "reloadData");

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  +[CNQuickActionsManager descriptorForRequiredKeys](CNQuickActionsManager, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0D13D88], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNQuickActionsView descriptorForRequiredKeys]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)hasActionsForContact:(id)a3
{
  return +[CNQuickActionsManager hasActionsForContact:](CNQuickActionsManager, "hasActionsForContact:", a3);
}

+ (id)defaultCategories
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CNQuickActionCategoryAudioCall;
  v3[1] = CNQuickActionCategoryVideoCall;
  v3[2] = CNQuickActionCategoryInstantMessage;
  v3[3] = CNQuickActionCategoryMail;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)actionsManagerForContact:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = a3;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = a3;
    objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", v5, v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", MEMORY[0x1E0C9AA60]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
