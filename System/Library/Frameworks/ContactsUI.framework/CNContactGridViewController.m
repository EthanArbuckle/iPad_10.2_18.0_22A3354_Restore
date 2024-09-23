@implementation CNContactGridViewController

- (CNContactGridViewController)initWithDataSource:(id)a3
{
  id v4;
  CNContactGridViewLayout *v5;
  CNContactGridViewController *v6;
  CNContactGridViewController *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_alloc_init(CNContactGridViewLayout);
  v10.receiver = self;
  v10.super_class = (Class)CNContactGridViewController;
  v6 = -[CNContactGridViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, v5);
  v7 = v6;
  if (v4)
    -[CNContactGridViewController setDataSource:](v6, "setDataSource:", v4);
  -[CNContactGridViewController setGridLayout:](v7, "setGridLayout:", v5);
  v8 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v8, "setStyle:", 1001);
  objc_msgSend(v8, "setFallbackStyle:", -1);
  -[CNContactGridViewController setContactFormatter:](v7, "setContactFormatter:", v8);

  return v7;
}

- (CNContactGridViewController)initWithCollectionViewLayout:(id)a3
{
  return -[CNContactGridViewController initWithDataSource:](self, "initWithDataSource:", 0);
}

- (CNContactGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNContactGridViewController initWithDataSource:](self, "initWithDataSource:", 0, a4);
}

- (CNContactGridViewController)initWithCoder:(id)a3
{
  return -[CNContactGridViewController initWithDataSource:](self, "initWithDataSource:", 0);
}

- (void)setDataSource:(id)a3
{
  CNContactDataSource *v5;
  CNContactDataSource *dataSource;
  CNContactDataSource *v7;

  v5 = (CNContactDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    v7 = v5;
    -[CNContactDataSource setDelegate:](dataSource, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[CNContactDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    v5 = v7;
  }

}

- (NSArray)inlineActionsCategories
{
  NSArray *inlineActionsCategories;

  inlineActionsCategories = self->_inlineActionsCategories;
  if (inlineActionsCategories)
    return inlineActionsCategories;
  +[CNQuickActionsView defaultCategories](CNQuickActionsView, "defaultCategories");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateItemSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CNContactGridCell *v17;

  -[CNContactGridViewController avatarMargins](self, "avatarMargins");
  v4 = v3;
  -[CNContactGridViewController avatarSize](self, "avatarSize");
  v6 = v4 + v5;
  -[CNContactGridViewController avatarMargins](self, "avatarMargins");
  v8 = v6 + v7;
  v17 = -[CNContactGridCell initWithFrame:]([CNContactGridCell alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v8, 200.0);
  -[CNContactGridViewController _configureCell:](self, "_configureCell:", v17);
  -[CNContactGridCell setContact:](v17, "setContact:", 0);
  -[CNContactGridCell contentView](v17, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1112014848;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 200.0, v10, v11);
  v13 = v12;
  v15 = v14;

  -[CNContactGridViewController gridLayout](self, "gridLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setItemSize:", v13, v15);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactGridViewController;
  -[CNContactGridViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[CNContactGridViewController backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[CNContactGridViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

  -[CNContactGridViewController gridLayout](self, "gridLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSectionInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v6, "setMinimumLineSpacing:", 0.0);
  -[CNContactGridViewController _updateItemSize](self, "_updateItemSize");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CGRect v13;

  -[CNContactGridViewController gridLayout](self, "gridLayout");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfColumns:", -[CNContactGridViewController numberOfColumns](self, "numberOfColumns"));
  -[CNContactGridViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v13);
  v5 = (double)-[CNContactGridViewController numberOfColumns](self, "numberOfColumns");
  -[CNContactGridViewController avatarMargins](self, "avatarMargins");
  v7 = v6;
  -[CNContactGridViewController avatarSize](self, "avatarSize");
  v9 = v7 + v8;
  -[CNContactGridViewController avatarMargins](self, "avatarMargins");
  v11 = (Width - v5 * (v9 + v10))
      / (double)(-[CNContactGridViewController numberOfColumns](self, "numberOfColumns") - 1)
      + -1.0;

  if (v11 < 0.0)
  {
    ceil((1.0 - v11)* (double)(-[CNContactGridViewController numberOfColumns](self, "numberOfColumns") - 1)/ (double)(2 * -[CNContactGridViewController numberOfColumns](self, "numberOfColumns")));
    -[CNContactGridViewController avatarMargins](self, "avatarMargins");
    v11 = 0.0;
    -[CNContactGridViewController setAvatarMargins:](self, "setAvatarMargins:");
    -[CNContactGridViewController _updateItemSize](self, "_updateItemSize");
  }
  objc_msgSend(v12, "setMinimumInteritemSpacing:", v11);

}

- (void)_configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNContactGridViewController avatarSize](self, "avatarSize");
  objc_msgSend(v4, "setAvatarSize:");
  -[CNContactGridViewController avatarMargins](self, "avatarMargins");
  objc_msgSend(v4, "setAvatarMargins:");
  -[CNContactGridViewController nameTextAttributes](self, "nameTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNameTextAttributes:", v5);

  -[CNContactGridViewController contactFormatter](self, "contactFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactFormatter:", v6);

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setShowsContactOnTap:", -[CNContactGridViewController inlineActionsEnabled](self, "inlineActionsEnabled") ^ 1);
  -[CNContactGridViewController inlineActionsCategories](self, "inlineActionsCategories");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionCategories:", v7);

}

- (int64_t)_globalIndexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  -[CNContactGridViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "range");
    v9 = v8 + objc_msgSend(v4, "row");

  }
  else
  {
    v9 = objc_msgSend(v4, "item");
  }

  return v9;
}

- (id)_indexPathForGlobalIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CNContactGridViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      while (2)
      {
        v11 = 0;
        v12 = v9 + v8;
        v13 = a3;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "range", (_QWORD)v20);
          a3 = v13 - v14;
          if (v13 < v14)
          {
            v12 = v9 + v11;
            a3 = v13;
            goto LABEL_14;
          }
          ++v11;
          v13 -= v14;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v9 = v12;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_14:

    v15 = (void *)MEMORY[0x1E0CB36B0];
    v16 = a3;
    v17 = v12;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB36B0];
    v16 = a3;
    v17 = 0;
  }
  objc_msgSend(v15, "indexPathForItem:inSection:", v16, v17, (_QWORD)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_contactAtIndexPath:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = -[CNContactGridViewController _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3);
  -[CNContactGridViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactGridViewController descriptorForRequiredKeys](self, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertKeysAreAvailable:", v9);

  return v7;
}

- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  void (**v25)(_QWORD);
  _QWORD aBlock[4];
  id v27;
  CNContactGridViewController *v28;

  v4 = a4;
  v6 = a3;
  -[CNContactGridViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridViewController gridLayout](self, "gridLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v6)
  {
    objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_6:
    v12 = 0;
    if (v6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v11 = 0;
  if (!v8)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_4:
    objc_msgSend(v11, "animationBlockForPreparingToShowActions");
    v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_7:
  v13 = 0;
LABEL_8:
  objc_msgSend(v10, "setSelectedIndexPath:", v6);
  -[CNContactGridViewController setGridLayout:](self, "setGridLayout:", v10);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke;
  aBlock[3] = &unk_1E2050400;
  v15 = v8;
  v27 = v15;
  v28 = self;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v4)
  {
    v17 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_2;
    v20[3] = &unk_1E204D5D8;
    v21 = v12;
    v24 = v13;
    v22 = v7;
    v23 = v10;
    v25 = v16;
    objc_msgSend(v17, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v20, 0);

    v18 = v21;
  }
  else
  {
    objc_msgSend(v7, "setCollectionViewLayout:animated:", v10, 0);
    if (v13)
      v13[2](v13);
    objc_msgSend(v12, "completionBlockForHidingActions");
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v19;
    if (v19)
      (*(void (**)(uint64_t))(v19 + 16))(v19);
    v16[2](v16);
  }

}

- (void)setIndexPathOfContactWithExpandedInlineActions:(id)a3
{
  -[CNContactGridViewController setIndexPathOfContactWithExpandedInlineActions:animated:](self, "setIndexPathOfContactWithExpandedInlineActions:animated:", a3, 1);
}

- (NSIndexPath)indexPathOfContactWithExpandedInlineActions
{
  void *v2;
  void *v3;

  -[CNContactGridViewController gridLayout](self, "gridLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexPath *)v3;
}

- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  if (a3 < 0)
  {
    -[CNContactGridViewController setIndexPathOfContactWithExpandedInlineActions:animated:](self, "setIndexPathOfContactWithExpandedInlineActions:animated:", 0, a4);
  }
  else
  {
    -[CNContactGridViewController _indexPathForGlobalIndex:](self, "_indexPathForGlobalIndex:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactGridViewController setIndexPathOfContactWithExpandedInlineActions:animated:](self, "setIndexPathOfContactWithExpandedInlineActions:animated:", v6, v4);

  }
}

- (void)setIndexOfContactWithExpandedInlineActions:(int64_t)a3
{
  -[CNContactGridViewController setIndexOfContactWithExpandedInlineActions:animated:](self, "setIndexOfContactWithExpandedInlineActions:animated:", a3, 1);
}

- (int64_t)indexOfContactWithExpandedInlineActions
{
  void *v3;
  int64_t v4;

  -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CNContactGridViewController _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", v3);
  else
    v4 = -1;

  return v4;
}

- (void)preloadInlineActionsForContactsAtIndexes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *preloadedActionsManagers;
  void *v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (!self->_preloadedActionsManagers)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CNContactGridViewController setPreloadedActionsManagers:](self, "setPreloadedActionsManagers:", v5);

    v4 = v15;
  }
  v6 = objc_msgSend(v4, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    do
    {
      -[CNContactGridViewController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNQuickActionsView actionsManagerForContact:](CNQuickActionsView, "actionsManagerForContact:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactGridViewController inlineActionsCategories](self, "inlineActionsCategories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCategories:", v12);

      preloadedActionsManagers = self->_preloadedActionsManagers;
      objc_msgSend(v10, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](preloadedActionsManagers, "setObject:forKey:", v11, v14);

      objc_msgSend(v11, "updateActionsWithBlock:", 0);
      v7 = objc_msgSend(v15, "indexGreaterThanIndex:", v7);

    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (CNKeyDescriptor)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  -[CNContactGridViewController contactFormatter](self, "contactFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  +[CNQuickActionsView descriptorForRequiredKeys](CNQuickActionsView, "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CNContactGridViewController descriptorForRequiredKeys]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNKeyDescriptor *)v9;
}

- (void)willBeginPreviewInteractionForAvatarView:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNContactGridViewController collectionView](self, "collectionView", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[CNContactGridViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)actionsView:(id)a3 willShowActions:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactGridViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNContactGridViewController _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", v8);

      -[CNContactGridViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "gridViewController:willShowInlineActions:forContactAtIndex:", self, v11, v9);

    }
  }

}

- (void)actionsView:(id)a3 didPerformAction:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactGridViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNContactGridViewController _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", v8);

      objc_opt_class();
      v10 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      if (v12)
      {
        objc_msgSend(v12, "propertyAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "propertyItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contactProperty");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      -[CNContactGridViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "gridViewController:didPerformAction:forContactAtIndex:withContactProperty:", self, v10, v9, v15);

    }
  }

}

- (void)contactDataSourceDidChange:(id)a3
{
  id v3;

  -[CNContactGridViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CNContactGridViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
    v5 = objc_msgSend(v4, "count");
  else
    v5 = 1;

  return v5;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  void *v11;

  -[CNContactGridViewController dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "range");
    v10 = v9;
  }
  else
  {
    -[CNContactGridViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count");

  }
  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGridViewController _configureCell:](self, "_configureCell:", v7);
  -[CNContactGridViewController _contactAtIndexPath:](self, "_contactAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactGridViewController preloadedActionsManagers](self, "preloadedActionsManagers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActionsManager:", v11);

  objc_msgSend(v7, "setContact:", v8);
  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v11;
  char v12;

  v5 = a4;
  if (-[CNContactGridViewController inlineActionsEnabled](self, "inlineActionsEnabled"))
  {
    -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "isEqual:", v5) & 1) != 0
      || (-[CNContactGridViewController delegate](self, "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_opt_respondsToSelector(),
          v8,
          (v9 & 1) == 0))
    {
      v12 = 1;
    }
    else
    {
      v10 = -[CNContactGridViewController _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", v5);
      -[CNContactGridViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "gridViewController:shouldShowInlineActionsForContactAtIndex:", self, v10);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a4;
  -[CNContactGridViewController indexPathOfContactWithExpandedInlineActions](self, "indexPathOfContactWithExpandedInlineActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", v8) & 1) != 0)
    v7 = 0;
  else
    v7 = v8;
  -[CNContactGridViewController setIndexPathOfContactWithExpandedInlineActions:](self, "setIndexPathOfContactWithExpandedInlineActions:", v7);

}

- (CNContactGridViewControllerDelegate)delegate
{
  return (CNContactGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactDataSource)dataSource
{
  return self->_dataSource;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (BOOL)inlineActionsEnabled
{
  return self->_inlineActionsEnabled;
}

- (void)setInlineActionsEnabled:(BOOL)a3
{
  self->_inlineActionsEnabled = a3;
}

- (void)setInlineActionsCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (CGSize)avatarSize
{
  double width;
  double height;
  CGSize result;

  width = self->_avatarSize.width;
  height = self->_avatarSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAvatarSize:(CGSize)a3
{
  self->_avatarSize = a3;
}

- (UIEdgeInsets)avatarMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_avatarMargins.top;
  left = self->_avatarMargins.left;
  bottom = self->_avatarMargins.bottom;
  right = self->_avatarMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAvatarMargins:(UIEdgeInsets)a3
{
  self->_avatarMargins = a3;
}

- (int64_t)monogrammerStyle
{
  return self->_monogrammerStyle;
}

- (void)setMonogrammerStyle:(int64_t)a3
{
  self->_monogrammerStyle = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)setNameTextAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (CNContactGridViewLayout)gridLayout
{
  return (CNContactGridViewLayout *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setGridLayout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (NSMutableDictionary)preloadedActionsManagers
{
  return self->_preloadedActionsManagers;
}

- (void)setPreloadedActionsManagers:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedActionsManagers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloadedActionsManagers, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_inlineActionsCategories, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "_globalIndexForIndexPath:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gridViewController:didHideInlineActionsForContactAtIndex:", *(_QWORD *)(a1 + 40), v4);

    }
  }
}

void __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "completionBlockForHidingActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_3;
  v7[3] = &unk_1E204D5B0;
  v8 = v2;
  v9 = *(id *)(a1 + 64);
  v6 = v2;
  objc_msgSend(v4, "setCollectionViewLayout:animated:completion:", v5, 1, v7);

}

uint64_t __87__CNContactGridViewController_setIndexPathOfContactWithExpandedInlineActions_animated___block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 32);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

@end
