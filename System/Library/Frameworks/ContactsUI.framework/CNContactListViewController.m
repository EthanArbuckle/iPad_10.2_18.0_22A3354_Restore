@implementation CNContactListViewController

- (id)_contactAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    -[CNContactListViewController _sections](self, "_sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    {
      v6 = objc_msgSend(v4, "row");
    }
    else
    {
      v8 = objc_msgSend(v4, "section");
      if (v8 >= objc_msgSend(v5, "count"))
      {
        v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "range");
      v6 = v10 + objc_msgSend(v4, "row");

    }
    -[CNContactDataSource contacts](self->_dataSource, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") <= v6)
    {
      v7 = 0;
    }
    else
    {
      -[CNContactDataSource contacts](self->_dataSource, "contacts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNContactDataSource indexSections](self->_dataSource, "indexSections", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(v8, "range"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionViewIndexPathForDataSourceIndexPath:](self, "collectionViewIndexPathForDataSourceIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateMeContactBannerContentsWithTopKeyline:(BOOL)a3
{
  _BOOL4 v3;
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
  _QWORD v19[2];

  v3 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController preferredForNameMeContact](self, "preferredForNameMeContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController meContactBanner](self, "meContactBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController contactStore](self, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContactStore:", v8);

  if (v6)
  {
    -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactListViewController.m"), 2884, CFSTR("Avatar Controller should be created in init"));

    }
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContacts:", v10);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "emptyContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContacts:", v11);

  }
  -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAvatarView:", v14);

  -[CNContactListViewController meContactBannerFootnoteLabel](self, "meContactBannerFootnoteLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController meContactBannerFootnoteValue](self, "meContactBannerFootnoteValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMeContact:footnoteTitle:footnoteValue:", v6, v15, v16);

  if (v3)
    -[CNContactListViewController updateMeContactBannerTopKeyline](self, "updateMeContactBannerTopKeyline");

}

id __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "contactListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "listAppearanceForTraitCollection:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", v9);
  objc_msgSend(v10, "setHeaderMode:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke_2;
  v13[3] = &unk_1E204AAE8;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v10, "setItemSeparatorHandler:", v13);
  objc_msgSend(*(id *)(a1 + 32), "applyContactListStyleToCollectionLayoutConfiguration:", v10);
  objc_msgSend(v10, "setTrailingSwipeActionsConfigurationProvider:", *(_QWORD *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "layoutSectionForLayoutConfiguration:layoutEnvironment:section:contactListStyleApplier:shouldDisplaySupplementaryHeaderItemForSection:headerViewsFloat:directionalLayoutMargins:collectionViewIsShowingIndexBar:contentUnavailable:", v10, v6, a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 104), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

double __51__CNContactListViewController_createCollectionView__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isViewLoaded") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "directionalLayoutMargins");
    v4 = v3;

  }
  else
  {
    v4 = *MEMORY[0x1E0DC3298];
  }

  return v4;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a2);

  return v5;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isDuplicatesRowSection:", a2)
    && (objc_msgSend(WeakRetained, "duplicatesController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "wantsToDisplayNewDuplicatesBanner:", 3),
        v4,
        v5))
  {
    objc_msgSend(WeakRetained, "duplicatesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPerformingMerge") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(WeakRetained, "duplicatesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isInMergeCooldown:", 3);

    }
  }
  else if ((objc_msgSend(WeakRetained, "isContentUnavailableRowSection:", a2) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(WeakRetained, "isLimitedAccessTipRowSection:", a2) ^ 1;
  }

  return v7;
}

- (id)dataSourceIndexPathForCollectionViewIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CNContactListViewController dataSourceSectionIndexForCollectionViewSection:](self, "dataSourceSectionIndexForCollectionViewSection:", objc_msgSend(v4, "section"));
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_msgSend(v4, "item");

  return (id)objc_msgSend(v6, "indexPathForItem:inSection:", v7, v5);
}

- (id)collectionViewIndexPathForDataSourceIndexPath:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB36B0];
  v5 = a3;
  v6 = objc_msgSend(v5, "item");
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v4, "indexPathForItem:inSection:", v6, -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount") + v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)dataSourceSectionIndexForCollectionViewSection:(int64_t)a3
{
  int64_t v4;

  v4 = -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount");
  return (a3 - v4) & ~((a3 - v4) >> 63);
}

- (BOOL)shouldDisplaySupplementaryHeaderItemForSection:(int64_t)a3
{
  BOOL v5;
  void *v7;

  if (-[CNContactListViewController hasNoContacts](self, "hasNoContacts"))
    return 0;
  if (!-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
  {
    if (!-[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", a3)
      && !-[CNContactListViewController isCreateNewContactRowSection:](self, "isCreateNewContactRowSection:", a3)
      && !-[CNContactListViewController isContentUnavailableRowSection:](self, "isContentUnavailableRowSection:", a3)
      && !-[CNContactListViewController isLimitedAccessTipRowSection:](self, "isLimitedAccessTipRowSection:", a3))
    {
      -[CNContactListViewController _sections](self, "_sections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (unint64_t)objc_msgSend(v7, "count") > 1;

      return v5;
    }
    return 0;
  }
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  int64_t v6;
  int64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  if (-[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", a4)
    || -[CNContactListViewController isCreateNewContactRowSection:](self, "isCreateNewContactRowSection:", a4)
    || -[CNContactListViewController isContentUnavailableRowSection:](self, "isContentUnavailableRowSection:", a4)
    || -[CNContactListViewController isLimitedAccessTipRowSection:](self, "isLimitedAccessTipRowSection:", a4))
  {
    return 1;
  }
  v8 = -[CNContactListViewController dataSourceSectionIndexForCollectionViewSection:](self, "dataSourceSectionIndexForCollectionViewSection:", a4);
  -[CNContactListViewController _sections](self, "_sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    -[CNContactDataSource contacts](self->_dataSource, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "count");
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "range");
    v6 = v11;
  }

  return v6;
}

- (id)_sections
{
  return (id)-[CNContactDataSource sections](self->_dataSource, "sections");
}

- (BOOL)isCreateNewContactRowSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CNContactListViewController shouldDisplayCreateNewContactAsRow](self, "shouldDisplayCreateNewContactAsRow");
  if (v5)
    LOBYTE(v5) = -[CNContactListViewController createNewContactRowSection](self, "createNewContactRowSection") == a3;
  return v5;
}

- (BOOL)isContentUnavailableRowSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CNContactListViewController isDisplayingContentUnavailableViewAsCell](self, "isDisplayingContentUnavailableViewAsCell");
  if (v5)
    LOBYTE(v5) = -[CNContactListViewController contentUnavailableRowSection](self, "contentUnavailableRowSection") == a3;
  return v5;
}

- (BOOL)isDuplicatesRowSection:(int64_t)a3
{
  BOOL result;

  result = -[CNContactListViewController isShowingDuplicatesBanner](self, "isShowingDuplicatesBanner");
  if (a3)
    return 0;
  return result;
}

- (int64_t)additionalSectionsAtTopCount
{
  _BOOL4 v4;
  uint64_t v5;

  if (-[CNContactListViewController isDisplayingContentUnavailableViewAsCell](self, "isDisplayingContentUnavailableViewAsCell"))
  {
    return 1;
  }
  v4 = -[CNContactListViewController isShowingDuplicatesBanner](self, "isShowingDuplicatesBanner");
  v5 = -[CNContactListViewController shouldDisplayCreateNewContactAsRow](self, "shouldDisplayCreateNewContactAsRow");
  return v5 + v4 + -[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip");
}

- (BOOL)isDisplayingContentUnavailableViewAsCell
{
  void *v2;
  BOOL v3;

  -[CNContactListViewController cellContentUnavailableConfiguration](self, "cellContentUnavailableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIContentUnavailableConfiguration)cellContentUnavailableConfiguration
{
  return self->_cellContentUnavailableConfiguration;
}

- (BOOL)isShowingDuplicatesBanner
{
  return self->_isShowingDuplicatesBanner;
}

- (BOOL)shouldDisplayCreateNewContactAsRow
{
  _BOOL4 v3;

  v3 = -[CNContactListViewController collectionViewShouldDisplayCreateNewContact](self, "collectionViewShouldDisplayCreateNewContact");
  if (v3)
    LOBYTE(v3) = !-[CNContactListViewController hasNoContacts](self, "hasNoContacts");
  return v3;
}

- (BOOL)collectionViewShouldDisplayCreateNewContact
{
  _BOOL4 v3;

  v3 = -[CNContactListViewController shouldDisplayAddNewContactRow](self, "shouldDisplayAddNewContactRow");
  if (v3)
    LOBYTE(v3) = -[CNContactListViewController isViewingTopLevelAllContacts](self, "isViewingTopLevelAllContacts");
  return v3;
}

- (BOOL)shouldDisplayAddNewContactRow
{
  return self->_shouldDisplayAddNewContactRow;
}

- (BOOL)hasNoContacts
{
  BOOL v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[CNContactDataSource isLoading](self->_dataSource, "isLoading") & 1) != 0)
  {
    return 0;
  }
  -[CNContactDataSource contacts](self->_dataSource, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") == 0;

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  _BOOL4 v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  _BOOL4 v32;
  _BOOL8 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id from;
  id location;
  _QWORD v44[4];
  __CFString *v45;
  _QWORD v46[5];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CNContactListContentUnavailableCellIdentifier"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController cellContentUnavailableConfiguration](self, "cellContentUnavailableConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setContentConfiguration:](v8, "setContentConfiguration:", v9);
LABEL_6:

    goto LABEL_7;
  }
  if (-[CNContactListViewController isPathToDuplicatesBanner:](self, "isPathToDuplicatesBanner:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CNContactListDuplicatesBannerIdentifier"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setDelegate:](v8, "setDelegate:", self);
    -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setContactListStyleApplier:](v8, "setContactListStyleApplier:", v10);

    if (!self->_duplicatesController)
    {
      -[__CFString updateWithCount:](v8, "updateWithCount:", -[CNContactListViewController newDuplicatesCountToDisplay](self, "newDuplicatesCountToDisplay"));
      goto LABEL_7;
    }
    -[CNContactListViewController duplicatesController](self, "duplicatesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decorateBannerViewCell:", v8);
    goto LABEL_6;
  }
  if (-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CNContactListAddNewContactCellIdentifier"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString defaultContentConfiguration](v8, "defaultContentConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("ADD_NEW_CONTACT_CELL_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v14);

    +[CNUIColorRepository contactListAddNewContactLabelTextColor](CNUIColorRepository, "contactListAddNewContactLabelTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v15);

    -[__CFString setContentConfiguration:](v8, "setContentConfiguration:", v12);
    v17 = objc_alloc_init(MEMORY[0x1E0DC3570]);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v46[3] = &unk_1E204F648;
    v46[4] = self;
    objc_msgSend(v17, "setActionHandler:", v46);
    objc_msgSend(v17, "setDisplayedState:", 0);
    v47[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setAccessories:](v8, "setAccessories:", v18);

  }
  else if (-[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CNContactListLimitedAccessTipIdentifier"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString setDelegate:](v8, "setDelegate:", self);
    -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setContactListStyleApplier:](v8, "setContactListStyleApplier:", v19);

    -[CNContactListViewController appName](self, "appName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString updateWithAppName:isLimited:](v8, "updateWithAppName:isLimited:", v20, +[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")));

  }
  else
  {
    -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 6)
    {
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CNLimitedAccessContactListCellIdentifier"), v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController contactFormatter](self, "contactFormatter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setContactFormatter:", v23);

      objc_msgSend(v22, "setUserInteractionEnabled:", -[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v7));
      objc_msgSend(v22, "setContact:", v21);
      objc_msgSend(v22, "setCaption:", -[CNContactListViewController limitedAccessContactCaption](self, "limitedAccessContactCaption"));
      objc_msgSend(v22, "setIsShowingSearchResult:", -[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"));
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v44[3] = &unk_1E204B4A8;
      v8 = v22;
      v45 = v8;
      -[CNContactListViewController setImageForContact:imageUpdateBlock:](self, "setImageForContact:imageUpdateBlock:", v21, v44);
      v24 = v45;
    }
    else
    {
      v25 = -[CNContactListViewController isHandlingSearch](self, "isHandlingSearch");
      v26 = CFSTR("CNContactListCellIdentifier");
      if (v25)
        v26 = CFSTR("CNSearchListCellIdentifier");
      v24 = v26;
      objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v24, v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setContactListStyleApplier:](v8, "setContactListStyleApplier:", v27);

      -[CNContactListViewController contactFormatter](self, "contactFormatter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setContactFormatter:](v8, "setContactFormatter:", v28);

      -[CNContactDataSource contactMatchInfos](self->_dataSource, "contactMatchInfos");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", v30);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      objc_initWeak(&from, v8);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
      v39[3] = &unk_1E204AD80;
      v31 = v39;
      objc_copyWeak(&v40, &from);
      objc_copyWeak(&v41, &location);
      -[__CFString setContactMatchInfo:completionBlock:](v8, "setContactMatchInfo:completionBlock:", v37, v39);
      -[__CFString setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", -[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v7));
      -[__CFString setContact:](v8, "setContact:", v21);
      v32 = -[CNContactListViewController shouldDisplayEmergencyContacts](self, "shouldDisplayEmergencyContacts");
      if (v32)
      {
        objc_msgSend(v21, "identifier");
        v31 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v33 = -[CNContactListViewController isContactWithIdentifierEmergencyContact:](self, "isContactWithIdentifierEmergencyContact:", v31);
      }
      else
      {
        v33 = 0;
      }
      -[__CFString setIsEmergencyContact:](v8, "setIsEmergencyContact:", v33, v37);
      if (v32)

      objc_msgSend(v21, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setIsMeCard:](v8, "setIsMeCard:", -[CNContactListViewController isContactWithIdentifierMeContactOrLinkedToMeContact:](self, "isContactWithIdentifierMeContactOrLinkedToMeContact:", v34));

      if (objc_msgSend(v6, "allowsMultipleSelectionDuringEditing"))
        v35 = objc_msgSend(v6, "isEditing");
      else
        v35 = 0;
      -[__CFString setAllowsMultiSelection:](v8, "setAllowsMultiSelection:", v35);
      -[__CFString setAllowsMultiSelectContextMenus:](v8, "setAllowsMultiSelectContextMenus:", -[CNContactListViewController shouldEnableMultiSelectContextMenus](self, "shouldEnableMultiSelectContextMenus"));
      if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
      {
        -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applyContactListStyleToSearchCell:", v8);
      }
      else
      {
        -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "applyContactListStyleToCell:", v8);
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }
LABEL_7:

  return v8;
}

- (BOOL)isHandlingSearch
{
  return self->_isHandlingSearch;
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (BOOL)isPathToCreateNewContactRow:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (-[CNContactListViewController shouldDisplayCreateNewContactAsRow](self, "shouldDisplayCreateNewContactAsRow"))
  {
    -[CNContactListViewController pathToCreateNewContactRow](self, "pathToCreateNewContactRow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isPathToContentUnavailableRow:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (-[CNContactListViewController isDisplayingContentUnavailableViewAsCell](self, "isDisplayingContentUnavailableViewAsCell"))
  {
    -[CNContactListViewController pathToContentUnavailableRow](self, "pathToContentUnavailableRow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (BOOL)shouldEnableMultiSelectContextMenus
{
  void *v3;
  int v4;

  if (-[CNContactListViewController allowsMultiSelectContextMenus](self, "allowsMultiSelectContextMenus"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEditing") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)allowsMultiSelectContextMenus
{
  return self->_allowsMultiSelectContextMenus;
}

- (BOOL)shouldDisplayEmergencyContacts
{
  return self->_shouldDisplayEmergencyContacts;
}

- (BOOL)isPathToDuplicatesBanner:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (-[CNContactListViewController isShowingDuplicatesBanner](self, "isShowingDuplicatesBanner"))
  {
    -[CNContactListViewController pathToDuplicatesBanner](self, "pathToDuplicatesBanner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isContactWithIdentifierMeContactOrLinkedToMeContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactListViewController preferredForNameMeContact](self, "preferredForNameMeContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v4);

    if ((v8 & 1) != 0)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v6, "linkedContacts", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v11 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v4);

            if ((v14 & 1) != 0)
            {
              LOBYTE(v9) = 1;
              goto LABEL_15;
            }
          }
          v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (CNContact)preferredForNameMeContact
{
  CNContactDataSource *dataSource;
  void *v4;
  void *v5;
  CNContact *v6;
  CNContact *preferredForNameMeContact;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->_preferredForNameMeContact && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dataSource = self->_dataSource;
    objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysForPreferredForNameMeContact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactDataSource preferredForNameMeContactWithKeysToFetch:](dataSource, "preferredForNameMeContactWithKeysToFetch:", v5);
    v6 = (CNContact *)objc_claimAutoreleasedReturnValue();
    preferredForNameMeContact = self->_preferredForNameMeContact;
    self->_preferredForNameMeContact = v6;

  }
  return self->_preferredForNameMeContact;
}

- (BOOL)isContactWithIdentifierEmergencyContact:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CNContactListViewController emergencyContactIdentifiers](self, "emergencyContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSSet)emergencyContactIdentifiers
{
  return self->_emergencyContactIdentifiers;
}

- (id)_contactAtCollectionViewIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4
    || -[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", objc_msgSend(v4, "section"))|| -[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v5)|| -[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v5)|| -[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v5))
  {
    v6 = 0;
  }
  else
  {
    -[CNContactListViewController dataSourceIndexPathForCollectionViewIndexPath:](self, "dataSourceIndexPathForCollectionViewIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController _contactAtIndexPath:](self, "_contactAtIndexPath:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)canSelectContactAtCollectionViewIndexPath:(id)a3
{
  CNContactListViewController *v3;
  void *v4;

  v3 = self;
  -[CNContactListViewController dataSourceIndexPathForCollectionViewIndexPath:](self, "dataSourceIndexPathForCollectionViewIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[CNContactListViewController canSelectContactAtIndexPath:](v3, "canSelectContactAtIndexPath:", v4);

  return (char)v3;
}

- (BOOL)canSelectContactAtIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  id v8;
  char v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNContactListViewController _contactAtIndexPath:](self, "_contactAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "contactListViewController:canSelectContact:", self, v7);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)descriptorForRequiredKeysForPreferredForNameMeContact
{
  if (descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_token_11 != -1)
    dispatch_once(&descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_token_11, &__block_literal_global_449);
  return (id)descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11;
}

- (void)updateMeContactBannerTopKeyline
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;

  -[CNContactListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  -[CNContactListViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 - v7;

  -[CNContactListViewController meContactBanner](self, "meContactBanner");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  -[CNContactListViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  v14 = v13;
  -[CNContactListViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMargins");
  objc_msgSend(v17, "setTopSeparatorWithInset:andLength:", v8, v11 - (v14 + v16));

}

- (void)setupMeBannerAvatarController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNAvatarViewController *v13;
  void *v14;
  void *v15;
  id v16;

  -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNContactListViewController contactStore](self, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainContactStore");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0D13D48]);
    -[CNContactListViewController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultSchedulerProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithContactStore:schedulerProvider:", v16, v7);

    objc_msgSend(v8, "setProhibitedSources:", 8);
    -[CNContactListViewController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultSchedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13D28], "rendererWithLikenessResolver:schedulerProvider:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNAvatarViewControllerSettings settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:](CNAvatarViewControllerSettings, "settingsWithLikenessResolver:likenessRenderer:contactStore:threeDTouchEnabled:schedulerProvider:backgroundStyle:", v8, v11, v16, 0, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNAvatarViewController initWithSettings:]([CNAvatarViewController alloc], "initWithSettings:", v12);
    -[CNContactListViewController setMeBannerAvatarController:](self, "setMeBannerAvatarController:", v13);

    -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObjectViewControllerDelegate:", self);

    -[CNContactListViewController meBannerAvatarController](self, "meBannerAvatarController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

  }
}

- (CNAvatarViewController)meBannerAvatarController
{
  return self->_meBannerAvatarController;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNContactStore)contactStore
{
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactDataSource store](self->_dataSource, "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactListViewController environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inProcessContactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CNContactStore *)v3;
}

- (void)setMeBannerAvatarController:(id)a3
{
  objc_storeStrong((id *)&self->_meBannerAvatarController, a3);
}

- (NSString)meContactBannerFootnoteValue
{
  return self->_meContactBannerFootnoteValue;
}

- (NSString)meContactBannerFootnoteLabel
{
  return self->_meContactBannerFootnoteLabel;
}

id __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;

  v5 = a3;
  v6 = a1[5];
  v7 = a2;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, objc_msgSend(v7, "section"));
  v9 = objc_msgSend(v7, "row");
  v10 = a1[6];
  v11 = objc_msgSend(v7, "section");

  if (((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11) & 1) != 0)
  {
    v12 = v9 == v8 - 1;
    v13 = (void *)a1[4];
    (*(void (**)(void))(a1[7] + 16))();
    objc_msgSend(v13, "applyCellSeparatorInsetStyleToConfiguration:superviewDirectionalLayoutMargins:itemWantsFullLengthBottomSeparator:", v5, v12);
  }
  else
  {
    objc_msgSend(v5, "setTopSeparatorVisibility:", 2);
    objc_msgSend(v5, "setBottomSeparatorVisibility:", 2);
  }
  return v5;
}

+ (id)layoutSectionForLayoutConfiguration:(id)a3 layoutEnvironment:(id)a4 section:(int64_t)a5 contactListStyleApplier:(id)a6 shouldDisplaySupplementaryHeaderItemForSection:(id)a7 headerViewsFloat:(BOOL)a8 directionalLayoutMargins:(id)a9 collectionViewIsShowingIndexBar:(id)a10 contentUnavailable:(id)a11
{
  id v14;
  id v15;
  id v16;
  double (*v17)(id);
  uint64_t (**v18)(_QWORD);
  double (**v19)(_QWORD);
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  _QWORD v46[4];
  id v47;
  int64_t v48;
  BOOL v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = (double (*)(id))*((_QWORD *)a11 + 2);
  v18 = (uint64_t (**)(_QWORD))a10;
  v19 = (double (**)(_QWORD))a9;
  v20 = a6;
  v21 = v17(a11);
  if (v21 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v14, v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v21;
    v23 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sizeWithWidthDimension:heightDimension:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0DC3350];
    v50[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "verticalGroupWithLayoutSize:subitems:", v26, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v32 = v19[2](v19);
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = v18[2](v18);
  objc_msgSend(v20, "applyContactListDirectionalLayoutMargins:toLayoutSection:collectionViewIsShowingIndexBar:", v31, v39, v32, v34, v36, v38);

  objc_msgSend(v31, "boundarySupplementaryItems");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __257__CNContactListViewController_layoutSectionForLayoutConfiguration_layoutEnvironment_section_contactListStyleApplier_shouldDisplaySupplementaryHeaderItemForSection_headerViewsFloat_directionalLayoutMargins_collectionViewIsShowingIndexBar_contentUnavailable___block_invoke;
  v46[3] = &unk_1E204AAC0;
  v47 = v16;
  v48 = a5;
  v49 = a8;
  v41 = v16;
  objc_msgSend(v40, "_cn_compactMap:", v46);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBoundarySupplementaryItems:", v42);

  return v31;
}

double __51__CNContactListViewController_createCollectionView__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentUnavailableCellHeight");
  v3 = v2;

  return v3;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "collectionViewIsShowingIndexBar");

  return v2;
}

- (double)contentUnavailableCellHeight
{
  _BOOL4 v3;
  double result;
  void *v5;
  double Height;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;

  v3 = -[CNContactListViewController isDisplayingContentUnavailableViewAsCell](self, "isDisplayingContentUnavailableViewAsCell");
  result = 0.0;
  if (v3)
  {
    -[CNContactListViewController collectionView](self, "collectionView", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    Height = CGRectGetHeight(v14);

    -[CNContactListViewController contactListHeaderHeight](self, "contactListHeaderHeight");
    v8 = v7;
    -[CNContactListViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directionalLayoutMargins");
    v11 = v10;
    v13 = v12;

    return Height - v8 - v11 - v13;
  }
  return result;
}

- (BOOL)collectionViewIsShowingIndexBar
{
  BOOL v3;
  void *v4;

  if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
    return 0;
  -[CNContactDataSource sections](self->_dataSource, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v3;
}

id __257__CNContactListViewController_layoutSectionForLayoutConfiguration_layoutEnvironment_section_contactListStyleApplier_shouldDisplaySupplementaryHeaderItemForSection_headerViewsFloat_directionalLayoutMargins_collectionViewIsShowingIndexBar_contentUnavailable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "elementKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48A8]);

  if (v5 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(v3, "setPinToVisibleBounds:", *(unsigned __int8 *)(a1 + 48));
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __51__CNContactListViewController_createCollectionView__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "shouldDisplaySupplementaryHeaderItemForSection:", a2);

  return v4;
}

- (BOOL)isValidIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "section") != 0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(v5, "section") & 0x8000000000000000) == 0)
  {
    v6 = objc_msgSend(v5, "section");
    -[CNContactListViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= objc_msgSend(v7, "numberOfSections")
      || objc_msgSend(v5, "row") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v5, "row") < 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v5, "row");
      -[CNContactListViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v5, "section"));

      if (v8 < v10)
      {
        v11 = 1;
        goto LABEL_13;
      }
    }
  }
  CNUILogContactList();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "invalid indexPath: %@", (uint8_t *)&v14, 0xCu);
  }

  v11 = 0;
LABEL_13:

  return v11;
}

void __56__CNContactListViewController_bundleCanManageDuplicates__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberWithBool:", objc_msgSend(&unk_1E20D3838, "containsObject:", v1));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)bundleCanManageDuplicates_cn_once_object_24;
  bundleCanManageDuplicates_cn_once_object_24 = v2;

}

void __53__CNContactListViewController__updateCountStringNow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  id v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v10 = v3;

  v4 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isEditing"))
      v5 = objc_msgSend(v10, "allowsMultipleSelectionDuringEditing");
    else
      v5 = 0;
    if (!objc_msgSend(*(id *)(a1 + 32), "shouldDisplayCount") || v5)
    {
      objc_msgSend(v10, "setContactCount:", 0);
      objc_msgSend(v10, "setDuplicateCount:", 0);
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = objc_msgSend(v10, "contactCount") == v8;
    v4 = v10;
    if (!v9)
    {
      objc_msgSend(v10, "setContactCount:", v8);
      objc_msgSend(*(id *)(a1 + 32), "_contactCountTelemetry:", v8);
      objc_msgSend(*(id *)(a1 + 32), "updateDuplicatesCountBanner");
LABEL_13:
      v4 = v10;
    }
  }

}

- (void)updateDuplicatesCountBanner
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__CNContactListViewController_updateDuplicatesCountBanner__block_invoke;
  v2[3] = &unk_1E204F320;
  v2[4] = self;
  -[CNContactListViewController fetchDuplicatesCountWithCompletionBlock:](self, "fetchDuplicatesCountWithCompletionBlock:", v2);
}

- (BOOL)shouldDisplayCount
{
  return self->_shouldDisplayCount;
}

- (void)fetchDuplicatesCountWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundSchedulerWithQualityOfService:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E204F9B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)_contactCountTelemetry:(unint64_t)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  _QWORD block[5];

  v4 = *(double *)&_LargeDatabasesSignpostLastContactsCountLogTimestamp + 60.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  if (v4 < v7)
  {
    _LargeDatabasesSignpostLogQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__CNContactListViewController__contactCountTelemetry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a3;
    dispatch_async(v8, block);

  }
}

void __54__CNContactListViewController__contactCountTelemetry___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  _LargeDatabasesSignpostLastContactsCountLogTimestamp = v3;

  if (*(_QWORD *)(a1 + 32) >= 0xBB8uLL)
  {
    if (_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_token_2 != -1)
      dispatch_once(&_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_token_2, &__block_literal_global_5_27046);
    v4 = (id)_LargeDatabasesMediumSeveritySignpostLogHandle_cn_once_object_2;
    if (os_signpost_enabled(v4))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 134349056;
      v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_18AC56000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HighContactsCount", " enableTelemetry=YES %{public, signpost.telemetry:number1, name=ContactsCount}lu", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CNContactListViewSearchController *v5;
  void *v6;
  CNContactListViewSearchController *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
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
  _BOOL8 v27;
  void *v28;
  void *v29;
  CNContactListSearchController *v30;
  void *v31;
  CNContactListSearchController *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  CNContactListPrivacyTitleView *v38;
  void *v39;
  void *v40;
  CNContactListPrivacyTitleView *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController viewDidLoad](&v58, sel_viewDidLoad);
  -[CNContactListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ContactsListView"));

  if (-[CNContactListViewController presentsSearchUI](self, "presentsSearchUI"))
  {
    v4 = (void *)-[CNContactDataSource copyWithZone:](self->_dataSource, "copyWithZone:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "reset");
    v5 = [CNContactListViewSearchController alloc];
    -[CNContactListViewController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactListViewController initWithDataSource:searchable:environment:shouldUseLargeTitle:](v5, "initWithDataSource:searchable:environment:shouldUseLargeTitle:", v4, 0, v6, 0);
    -[CNContactListViewController setSearchResultsController:](self, "setSearchResultsController:", v7);

    v8 = -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType");
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLimitedAccessPickerType:", v8);

    v10 = -[CNContactListViewController limitedAccessContactCaption](self, "limitedAccessContactCaption");
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLimitedAccessContactCaption:", v10);

    v12 = -[CNContactListViewController disableContextMenus](self, "disableContextMenus");
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDisableContextMenus:", v12);

    v14 = -[CNContactListViewController shouldAllowDrags](self, "shouldAllowDrags");
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldAllowDrags:", v14);

    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldAllowDrops:", 0);

    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setShouldDisplayCount:", 0);

    -[CNContactListViewController contactFormatter](self, "contactFormatter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContactFormatter:", v18);

    -[CNContactListViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v20);

    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDelegate:", v22);

    -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContactListStyleApplier:", v25);

    v27 = -[CNContactListViewController allowsMultiSelectContextMenus](self, "allowsMultiSelectContextMenus");
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsMultiSelectContextMenus:", v27);

    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShouldHideDuplicates:", 1);

    v30 = [CNContactListSearchController alloc];
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[CNContactListSearchController initWithSearchResultsController:](v30, "initWithSearchResultsController:", v31);

    -[CNContactListSearchController setSearchResultsUpdater:](v32, "setSearchResultsUpdater:", self);
    -[CNContactListSearchController setRestorationIdentifier:](v32, "setRestorationIdentifier:", CFSTR("UISearchControllerRestorationIdentifier"));
    -[CNContactListSearchController setDelegate:](v32, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListSearchController searchBar](v32, "searchBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTintColor:", v33);

    -[CNContactListViewController setSearchController:](self, "setSearchController:", v32);
    -[CNContactListViewController navigationItem](self, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSearchController:", v32);

    -[CNContactListViewController navigationItem](self, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setHidesSearchBarWhenScrolling:", 0);

    if (-[CNContactListViewController hasPickerPrivacyUI](self, "hasPickerPrivacyUI"))
    {
      -[CNContactListViewController setShouldShowLimitedAccessTip:](self, "setShouldShowLimitedAccessTip:", +[CNPrivateAccessAggregator shouldShowPickerTipForBundleIdentifier:](CNPrivateAccessAggregator, "shouldShowPickerTipForBundleIdentifier:", self->_limitedAccessAppBundleId));
      v37 = -[CNContactListViewController shouldShowLimitedAccessTip](self, "shouldShowLimitedAccessTip") ^ 1;
      v38 = [CNContactListPrivacyTitleView alloc];
      -[CNContactListViewController navigationItem](self, "navigationItem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "title");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[CNContactListPrivacyTitleView initWithTitle:hasIcon:](v38, "initWithTitle:hasIcon:", v40, v37);

      -[CNContactListViewController navigationItem](self, "navigationItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTitleView:", v41);

    }
    -[CNContactListViewController navigationItem](self, "navigationItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setPreferredSearchBarPlacement:", 2);

    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "featureFlags");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isFeatureEnabled:", 15);

    if (v46)
    {
      -[CNContactListViewController navigationItem](self, "navigationItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setBackButtonDisplayMode:", 2);

    }
    -[CNContactListViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
    -[CNContactListSearchController searchBar](v32, "searchBar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("SEARCH_LOCAL_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPlaceholder:", v50);

    objc_msgSend(v48, "setAutoresizingMask:", 2);
    objc_msgSend(v48, "setAutocorrectionType:", 1);
    objc_msgSend(v48, "setDelegate:", self);
    objc_msgSend(v48, "sizeToFit");
    objc_msgSend(v48, "setAutoresizingMask:", 2);
    -[CNContactListViewController setSearchBar:](self, "setSearchBar:", v48);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = *MEMORY[0x1E0DC54D8];
    objc_msgSend(v48, "searchField");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObserver:selector:name:object:", self, sel__searchBarDidEndEditing_, v52, v53);

  }
  if (-[CNContactListViewController shouldAllowDrags](self, "shouldAllowDrags"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDragSourceDelegate:", self);

  }
  if (-[CNContactListViewController shouldAllowDrops](self, "shouldAllowDrops"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDragDestinationDelegate:", self);

  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_dismissKeyboard);
  objc_msgSend(v56, "setCancelsTouchesInView:", 0);
  -[CNContactListViewController collectionView](self, "collectionView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addGestureRecognizer:", v56);

}

- (CNContactListViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (BOOL)shouldAllowDrags
{
  return self->_shouldAllowDrags;
}

- (void)setupContactListForMultiSelectContextMenus
{
  int v3;
  void *v4;
  int v5;
  id v6;

  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded")
    && -[CNContactListViewController shouldEnableMultiSelectContextMenus](self, "shouldEnableMultiSelectContextMenus"))
  {
    v3 = -[CNContactListViewController isHandlingSearch](self, "isHandlingSearch");
    -[CNContactListViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsMultipleSelection");

    if (v3 == v5)
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsMultipleSelection:", v3 ^ 1u);

    }
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", obj);

  }
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
    -[CNContactListViewController applyStyle](self, "applyStyle");
}

- (void)setContactFormatter:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactListViewController contactFormatter](self, "contactFormatter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_contactFormatter, a3);
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContactFormatter:", v7);

  }
}

- (void)setAllowsMultiSelectContextMenus:(BOOL)a3
{
  if (self->_allowsMultiSelectContextMenus != a3)
  {
    self->_allowsMultiSelectContextMenus = a3;
    -[CNContactListViewController setupContactListForMultiSelectContextMenus](self, "setupContactListForMultiSelectContextMenus");
  }
}

- (CNContactListViewController)initWithDataSource:(id)a3 environment:(id)a4 shouldUseLargeTitle:(BOOL)a5
{
  return -[CNContactListViewController initWithDataSource:searchable:environment:shouldUseLargeTitle:](self, "initWithDataSource:searchable:environment:shouldUseLargeTitle:", a3, 1, a4, a5);
}

- (CNContactListViewController)visibleListViewController
{
  CNContactListViewController *v3;

  if (-[CNContactListViewController isSearching](self, "isSearching"))
  {
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v3 = (CNContactListViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (CNContactDataSource)dataSource
{
  void *v3;
  CNContactDataSource *v4;

  if (-[CNContactListViewController isSearching](self, "isSearching"))
  {
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataSource");
    v4 = (CNContactDataSource *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_dataSource;
  }
  return v4;
}

- (BOOL)isSearching
{
  return -[CNContactListSearchController isActive](self->_searchController, "isActive");
}

- (BOOL)shouldAllowDrops
{
  return self->_shouldAllowDrops;
}

- (void)setShouldHideDuplicates:(BOOL)a3
{
  self->_shouldHideDuplicates = a3;
}

- (void)setShouldDisplayCount:(BOOL)a3
{
  self->_shouldDisplayCount = a3;
}

- (void)setShouldAllowDrops:(BOOL)a3
{
  self->_shouldAllowDrops = a3;
}

- (void)setShouldAllowDrags:(BOOL)a3
{
  self->_shouldAllowDrags = a3;
}

- (void)setSearchResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsController, a3);
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (void)setDisableContextMenus:(BOOL)a3
{
  self->_disableContextMenus = a3;
}

- (BOOL)presentsSearchUI
{
  return self->_presentsSearchUI;
}

- (BOOL)disableContextMenus
{
  return self->_disableContextMenus;
}

- (CNContactListViewControllerDelegate)delegate
{
  return (CNContactListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)initializeDuplicateContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (-[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
  {
    if (!self->_isDuplicatesLaunching)
    {
      -[CNContactListViewController setIsDuplicatesLaunching:](self, "setIsDuplicatesLaunching:", 1);
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "schedulerProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mainThreadScheduler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__CNContactListViewController_initializeDuplicateContacts__block_invoke;
      v7[3] = &unk_1E204F648;
      v7[4] = self;
      v6 = (id)objc_msgSend(v5, "afterDelay:performBlock:", v7, 4.0);

    }
  }
}

- (void)refreshDuplicates
{
  void *v3;
  id v4;

  if (-[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts")
    && !self->_isDuplicatesLaunching)
  {
    if (self->_duplicatesController)
    {
      -[CNContactListViewController duplicatesController](self, "duplicatesController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "resetDuplicates");

      -[CNContactListViewController duplicatesController](self, "duplicatesController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "findDuplicates");

    }
    else
    {
      -[CNContactListViewController initializeDuplicateContacts](self, "initializeDuplicateContacts");
    }
  }
}

- (BOOL)canManageDuplicateContacts
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 8);

  return v5
      && !-[CNContactListViewController shouldHideDuplicates](self, "shouldHideDuplicates")
      && -[CNContactListViewController bundleCanManageDuplicates](self, "bundleCanManageDuplicates")
      && -[CNContactListViewController isViewingTopLevelAllContacts](self, "isViewingTopLevelAllContacts");
}

- (BOOL)shouldHideDuplicates
{
  return self->_shouldHideDuplicates;
}

- (BOOL)bundleCanManageDuplicates
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFeatureEnabled:", 8);

  if (!v4)
    return 0;
  if (bundleCanManageDuplicates_cn_once_token_24 != -1)
    dispatch_once(&bundleCanManageDuplicates_cn_once_token_24, &__block_literal_global_515);
  return objc_msgSend((id)bundleCanManageDuplicates_cn_once_object_24, "BOOLValue");
}

- (BOOL)isViewingTopLevelAllContacts
{
  return self->_isViewingTopLevelAllContacts;
}

- (void)setIsDuplicatesLaunching:(BOOL)a3
{
  self->_isDuplicatesLaunching = a3;
}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __84__CNContactListViewController_descriptorForRequiredKeysForPreferredForNameMeContact__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNAvatarViewController descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarViewController, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v1;
  +[CNContactListBannerView descriptorForRequiredKeys](CNContactListBannerView, "descriptorForRequiredKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactListViewController descriptorForRequiredKeysForPreferredForNameMeContact]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11;
  descriptorForRequiredKeysForPreferredForNameMeContact_cn_once_object_11 = v5;

}

- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5 shouldScroll:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;

  v6 = a6;
  v8 = a4;
  -[CNContactDataSource indexPathForContact:](self->_dataSource, "indexPathForContact:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[CNContactListViewController collectionViewIndexPathForDataSourceIndexPath:](self, "collectionViewIndexPathForDataSourceIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CNContactListViewController isValidIndexPath:](self, "isValidIndexPath:", v11);
    if (v12)
    {
      if (v6)
      {
        -[CNContactListViewController selectItemAtIndexPath:animated:scrollPosition:](self, "selectItemAtIndexPath:animated:scrollPosition:", v11, v8, a5);
      }
      else
      {
        -[CNContactListViewController collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v11, v8, a5);

      }
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  CNContactListViewController *v21;
  id v22;
  unint64_t v23;
  BOOL v24;

  v6 = a4;
  v8 = a3;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __77__CNContactListViewController_selectItemAtIndexPath_animated_scrollPosition___block_invoke;
  v20 = &unk_1E204AD30;
  v23 = a5;
  v21 = self;
  v9 = v8;
  v22 = v9;
  v24 = v6;
  v10 = (void (**)(_QWORD))_Block_copy(&v17);
  if (-[CNContactListViewController isValidIndexPath:](self, "isValidIndexPath:", v9, v17, v18, v19, v20, v21))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v9, v6, a5);

    -[CNContactListViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEditing") & 1) != 0)
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "allowsMultipleSelectionDuringEditing");

      if ((v14 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    -[CNContactListViewController deselectAllItemsExceptIndexPath:](self, "deselectAllItemsExceptIndexPath:", v9);
  }
LABEL_7:
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded")
    && (-[CNContactListViewController collectionView](self, "collectionView"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "window"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    v10[2](v10);
  }
  else
  {
    -[CNContactListViewController performWhenViewIsLaidOut:](self, "performWhenViewIsLaidOut:", v10);
  }

}

- (void)performWhenViewIsLaidOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CNContactListViewController pendingLayoutBlocks](self, "pendingLayoutBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = _Block_copy(v5);
  objc_msgSend(v8, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController setPendingLayoutBlocks:](self, "setPendingLayoutBlocks:", v7);

}

- (void)setPendingLayoutBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, a3);
}

- (NSArray)pendingLayoutBlocks
{
  return self->_pendingLayoutBlocks;
}

- (void)deselectAllItemsExceptIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CNContactListViewController *v10;

  v4 = a3;
  -[CNContactListViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CNContactListViewController_deselectAllItemsExceptIndexPath___block_invoke;
  v8[3] = &unk_1E204AC70;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "_cn_each:", v8);

}

- (CNContactListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6
{
  id v11;
  id v12;
  void *v13;
  CNContactListViewController *v14;
  NSArray *pendingLayoutBlocks;
  void *v16;
  void *v17;
  CNDuplicateContactsController *duplicatesController;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CNContactListViewController *v23;
  objc_super v25;

  v11 = a3;
  v12 = a5;
  +[CNContactListViewController collectionViewLayout](CNContactListViewController, "collectionViewLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)CNContactListViewController;
  v14 = -[CNContactListViewController initWithCollectionViewLayout:](&v25, sel_initWithCollectionViewLayout_, v13);

  if (v14)
  {
    -[CNContactListViewController setClearsSelectionOnViewWillAppear:](v14, "setClearsSelectionOnViewWillAppear:", 0);
    objc_storeStrong((id *)&v14->_environment, a5);
    objc_storeStrong((id *)&v14->_dataSource, a3);
    v14->_presentsSearchUI = a4;
    v14->_isHandlingSearch = !a4;
    pendingLayoutBlocks = v14->_pendingLayoutBlocks;
    v14->_pendingLayoutBlocks = (NSArray *)MEMORY[0x1E0C9AA60];

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "displayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController setTitle:](v14, "setTitle:", v16);
    }
    else
    {
      CNContactsUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController setTitle:](v14, "setTitle:", v17);

    }
    v14->_shouldUseLargeTitle = a6;
    v14->_shouldDisplayCount = 1;
    v14->_shouldAllowDrags = 1;
    v14->_shouldAllowDrops = 1;
    v14->_shouldDisplayEmergencyContacts = 1;
    v14->_allowsEditingActions = 1;
    v14->_allowsListEditing = 1;
    v14->_suggestionsControllerHeight = 0.0;
    duplicatesController = v14->_duplicatesController;
    v14->_duplicatesController = 0;

    v14->_isDuplicatesLaunching = 0;
    v14->_shouldSearchBarBecomeFirstResponder = 1;
    -[CNContactListViewController setDefinesPresentationContext:](v14, "setDefinesPresentationContext:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v14, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0C96870], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v14, sel_contactStoreDidChangeWithNotification_, *MEMORY[0x1E0D136D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v14, sel__applicationEnteringForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v14, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    v23 = v14;
  }

  return v14;
}

+ (id)collectionViewLayout
{
  return (id)objc_msgSend((id)objc_opt_class(), "collectionViewLayoutWithFloatingHeaderViews:contactListStyleApplier:trailingSwipeActionsProvider:shouldDisplaySupplementaryHeaderItemForSection:shouldShowSeparatorsForSection:directionalLayoutMargins:collectionViewIsShowingIndexBar:numberOfItemsInSection:contentUnavailable:", 1, 0, 0, &__block_literal_global_25207, &__block_literal_global_192, &__block_literal_global_194, &__block_literal_global_196, &__block_literal_global_198, &__block_literal_global_200);
}

+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 trailingSwipeActionsProvider:(id)a5 shouldDisplaySupplementaryHeaderItemForSection:(id)a6 shouldShowSeparatorsForSection:(id)a7 directionalLayoutMargins:(id)a8 collectionViewIsShowingIndexBar:(id)a9 numberOfItemsInSection:(id)a10 contentUnavailable:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
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
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  BOOL v58;
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __305__CNContactListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_trailingSwipeActionsProvider_shouldDisplaySupplementaryHeaderItemForSection_shouldShowSeparatorsForSection_directionalLayoutMargins_collectionViewIsShowingIndexBar_numberOfItemsInSection_contentUnavailable___block_invoke;
  v48[3] = &unk_1E204AB10;
  v49 = v16;
  v50 = v22;
  v51 = v19;
  v52 = v20;
  v56 = v23;
  v57 = a1;
  v53 = v17;
  v54 = v18;
  v58 = a3;
  v55 = v21;
  v47 = v23;
  v45 = v21;
  v44 = v18;
  v43 = v17;
  v42 = v20;
  v41 = v19;
  v25 = v22;
  v26 = v16;
  v27 = (void *)objc_msgSend(v24, "initWithSectionProvider:", v48);
  objc_msgSend(v27, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sizeWithWidthDimension:heightDimension:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v32, CFSTR("CNContactListLayoutHeaderIdentifier"), 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", *MEMORY[0x1E0DC53E0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sizeWithWidthDimension:heightDimension:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v37, CFSTR("CNContactListLayoutFooterIdentifier"), 5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v33;
  v59[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBoundarySupplementaryItems:", v39);

  objc_msgSend(v27, "setConfiguration:", v28);
  return v27;
}

uint64_t __53__CNContactListViewController__updateCountStringNow___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadView
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[CNContactListViewController createCollectionView](self, "createCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
  {

    goto LABEL_5;
  }
  v4 = objc_opt_respondsToSelector();

  v5 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "_setSectionHeaderFooterPadding:", 8.0);
LABEL_5:
    v5 = v6;
  }
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListCellIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNLimitedAccessContactListCellIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNSearchListCellIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListDuplicatesBannerIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListAddNewContactCellIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListContentUnavailableCellIdentifier"));
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListLimitedAccessTipIdentifier"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A8], CFSTR("CNContactListSectionHeaderFooterIdentifier"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListLayoutHeaderIdentifier"), CFSTR("CNContactListHeaderViewIdentifier"));
  objc_msgSend(v6, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("CNContactListLayoutFooterIdentifier"), CFSTR("CNContactListCountFooterViewIdentifier"));
  -[CNContactListViewController setCollectionView:](self, "setCollectionView:", v6);
  -[CNContactListViewController _updateCountStringNow:](self, "_updateCountStringNow:", 0);
  -[CNContactListViewController updateIsViewingTopLevelAllContacts](self, "updateIsViewingTopLevelAllContacts");
  -[CNContactListViewController refreshTableViewHeader](self, "refreshTableViewHeader");

}

- (void)updateIsViewingTopLevelAllContacts
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
  {
    self->_isViewingTopLevelAllContacts = 0;
  }
  else
  {
    objc_opt_class();
    -[CNContactListViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    if (v5)
    {
      if (-[CNContactListViewController isShowingAllContacts](self, "isShowingAllContacts"))
      {
        self->_isViewingTopLevelAllContacts = 1;
      }
      else
      {
        -[CNContactListViewController contactStore](self, "contactStore");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        objc_msgSend(v6, "containersMatchingPredicate:error:", 0, &v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
        {
          self->_isViewingTopLevelAllContacts = 1;
        }
        else
        {
          objc_msgSend(v5, "filter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "containerIdentifiers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "count");
          self->_isViewingTopLevelAllContacts = v10 == objc_msgSend(v7, "count");

        }
      }
    }
    else
    {
      self->_isViewingTopLevelAllContacts = 0;
    }

  }
}

- (void)refreshTableViewHeader
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (v4 <= 0.0)
  {

  }
  else
  {
    -[CNContactListViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;

    if (v7 > 0.0)
    {
      -[CNContactListViewController view](self, "view");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      -[CNContactListViewController refreshTableViewHeaderWithSize:](self, "refreshTableViewHeaderWithSize:", v8, v9);

      return;
    }
  }
  CNUILogContactList();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[CNContactListViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    -[CNContactListViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    *(_DWORD *)buf = 134218240;
    v21 = v16;
    v22 = 2048;
    v23 = v18;
    _os_log_debug_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEBUG, "Attempted to refresh list header view when superview has width or height of 0.0 (%.2f x %.2f), skipping refresh", buf, 0x16u);

  }
  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v13 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNContactListViewController setListHeaderView:](self, "setListHeaderView:", v13);

  }
}

- (BOOL)isShowingAllContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "showsEverything");
  else
    v7 = 0;

  return v7;
}

- (id)createCollectionView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CNContactListCollectionView *v8;
  CNContactListCollectionView *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  v3 = -[CNContactListViewController isHandlingSearch](self, "isHandlingSearch");
  objc_initWeak(location, self);
  v10 = [CNContactListCollectionView alloc];
  v11 = (void *)objc_opt_class();
  -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController trailingSwipeActionsConfigurationProvider](self, "trailingSwipeActionsConfigurationProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__CNContactListViewController_createCollectionView__block_invoke;
  v22[3] = &unk_1E204AB38;
  objc_copyWeak(&v23, location);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __51__CNContactListViewController_createCollectionView__block_invoke_2;
  v20[3] = &unk_1E204AB38;
  objc_copyWeak(&v21, location);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __51__CNContactListViewController_createCollectionView__block_invoke_3;
  v18[3] = &unk_1E204AB60;
  objc_copyWeak(&v19, location);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __51__CNContactListViewController_createCollectionView__block_invoke_4;
  v16[3] = &unk_1E204AB88;
  objc_copyWeak(&v17, location);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __51__CNContactListViewController_createCollectionView__block_invoke_5;
  v14[3] = &unk_1E204ABB0;
  objc_copyWeak(&v15, location);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __51__CNContactListViewController_createCollectionView__block_invoke_6;
  v12[3] = &unk_1E204ABD8;
  objc_copyWeak(&v13, location);
  objc_msgSend(v11, "collectionViewLayoutWithFloatingHeaderViews:contactListStyleApplier:trailingSwipeActionsProvider:shouldDisplaySupplementaryHeaderItemForSection:shouldShowSeparatorsForSection:directionalLayoutMargins:collectionViewIsShowingIndexBar:numberOfItemsInSection:contentUnavailable:", !v3, v4, v5, v22, v20, v18, v16, v14, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactListCollectionView initWithFrame:collectionViewLayout:](v10, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CNContactListCollectionView setDragDelegate:](v8, "setDragDelegate:", self);
  -[CNContactListCollectionView setDropDelegate:](v8, "setDropDelegate:", self);
  -[CNContactListCollectionView setSelectionFollowsFocus:](v8, "setSelectionFollowsFocus:", 1);
  -[CNContactListCollectionView setCountViewDelegate:](v8, "setCountViewDelegate:", self);
  -[CNContactListCollectionView setContactListCollectionViewDelegate:](v8, "setContactListCollectionViewDelegate:", self);
  -[CNContactListCollectionView _setAllowsVisibleCellUpdatesDuringUpdateAnimations:](v8, "_setAllowsVisibleCellUpdatesDuringUpdateAnimations:", 1);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
  return v8;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__CNContactListViewController_trailingSwipeActionsConfigurationProvider__block_invoke;
  v5[3] = &unk_1E204AC00;
  objc_copyWeak(&v6, &location);
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_updateCountStringNow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];

  v3 = a3;
  objc_opt_class();
  -[CNContactListViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke;
    aBlock[3] = &unk_1E204F648;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (v3)
    {
      (*((void (**)(void *))v8 + 2))(v8);
    }
    else
    {
      dispatch_get_global_queue(9, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke_2;
      v11[3] = &unk_1E204FB40;
      v12 = v9;
      dispatch_async(v10, v11);

    }
  }
}

- (void)refreshTableViewHeaderWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  __int128 v17;
  double v18;
  double v19;
  BOOL v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  double v28;
  double v29;
  _BOOL4 v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  _BOOL8 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  NSObject *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  BOOL v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  void *v77;
  _QWORD v78[5];
  _QWORD v79[4];
  id v80;
  CNContactListViewController *v81;
  id v82;
  id v83;
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  double v87;
  double v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  BOOL v95;
  BOOL v96;
  BOOL v97;
  uint8_t buf[16];
  uint64_t v99;
  double *v100;
  uint64_t v101;
  const char *v102;
  __int128 v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;

  height = a3.height;
  width = a3.width;
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__25712;
  v110 = __Block_byref_object_dispose__25713;
  v111 = 0;
  -[CNContactListViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContactListViewController shouldDisplayMeContactBanner](self, "shouldDisplayMeContactBanner");
  v8 = -[CNContactListViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController");
  objc_msgSend(v6, "contentOffset");
  v10 = v9;
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactListViewController isSearchController](self, "isSearchController"))
  {
    v14 = 0;
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  if (!-[CNContactListViewController shouldDisplayTipContentView](self, "shouldDisplayTipContentView")
    || -[CNContactListViewController isSearching](self, "isSearching"))
  {
    -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 != 0;

    goto LABEL_6;
  }
  v14 = 0;
  v16 = 1;
LABEL_7:
  if (-[CNContactListViewController shouldDisplayMeContactBanner](self, "shouldDisplayMeContactBanner"))
    -[CNContactListViewController setupMeBannerAvatarController](self, "setupMeBannerAvatarController");
  if (-[CNContactListViewController shouldDisplayListHeaderView](self, "shouldDisplayListHeaderView"))
  {
    v76 = v14;
    v99 = 0;
    v100 = (double *)&v99;
    v101 = 0x4010000000;
    v102 = "";
    v17 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v103 = *MEMORY[0x1E0C9D648];
    v105 = *((_QWORD *)&v17 + 1);
    v104 = width;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustedContentInset");
    v19 = v12 + v18;
    v20 = v12 + v18 == 0.0;
    if (v14)
    {
      -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 != 0;

    }
    else
    {
      v23 = 0;
    }
    v29 = *MEMORY[0x1E0C9D820];
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v30 = v19 == 0.0 && v23;
    if ((v16 | v30) == 1)
    {
      -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      LODWORD(v32) = 1148846080;
      LODWORD(v33) = 1132068864;
      objc_msgSend(v31, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v100[6], 0.0, v32, v33);
      v35 = v34;
      v37 = v36;
      if (v31)
      {
        objc_msgSend(v77, "addObject:", v31);
        v74 = v35;
        if (v7)
        {
          v38 = 0;
          goto LABEL_30;
        }
        goto LABEL_39;
      }
      CNUILogContactList();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v40, OS_LOG_TYPE_ERROR, "Attempting to display tipContentView when view is nil", buf, 2u);
      }

      if (!v7)
      {
        v74 = v35;
        v31 = 0;
LABEL_39:
        v39 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v35 = *MEMORY[0x1E0C9D820];
      if (!v7)
      {
        v31 = 0;
        v39 = 0;
        v74 = *MEMORY[0x1E0C9D820];
        v37 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_40:
        v47 = v28;
        v44 = v29;
LABEL_41:
        v49 = v23;
        if (v8)
        {
          -[CNContactListViewController suggestionsController](self, "suggestionsController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "view");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          -[CNContactListViewController view](self, "view");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "bounds");
          v54 = v53;
          -[CNContactListViewController suggestionsControllerHeight](self, "suggestionsControllerHeight");
          v28 = v55;

          -[CNContactListViewController suggestionsController](self, "suggestionsController");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "willMoveToParentViewController:", self);

          objc_msgSend(v77, "addObject:", v51);
          -[CNContactListViewController suggestionsController](self, "suggestionsController");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNContactListViewController addChildViewController:](self, "addChildViewController:", v57);
          v29 = v54 + -10.0;

        }
        else
        {
          v51 = 0;
        }
        v100[7] = v37 + v47 + v28;
        -[CNContactListViewController setEstimatedListHeaderViewHeight:](self, "setEstimatedListHeaderViewHeight:", v74);
        -[CNContactListViewController listHeaderView](self, "listHeaderView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          -[CNContactListViewController listHeaderView](self, "listHeaderView");
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = (void *)v107[5];
          v107[5] = v59;

          objc_msgSend((id)v107[5], "bounds");
          v27 = v61 != v100[7];
          objc_msgSend((id)v107[5], "setFrame:", v100[4], v100[5], v100[6], v100[7]);
          v62 = v20;
        }
        else
        {
          v63 = objc_alloc(MEMORY[0x1E0DC3F10]);
          v64 = objc_msgSend(v63, "initWithFrame:", v100[4], v100[5], v100[6], v100[7]);
          v62 = v20;
          v65 = (void *)v107[5];
          v107[5] = v64;

          v27 = 1;
        }
        v66 = MEMORY[0x1E0C809B0];
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke;
        v79[3] = &unk_1E204AE40;
        v67 = v51;
        v85 = &v106;
        v87 = v29;
        v88 = v28;
        v80 = v67;
        v81 = self;
        v68 = v31;
        v82 = v68;
        v89 = v75;
        v90 = v37;
        v69 = v39;
        v83 = v69;
        v91 = v44;
        v92 = v47;
        v95 = v76;
        v96 = v62;
        v93 = v10;
        v94 = v12;
        v97 = v49;
        v84 = v6;
        v86 = &v99;
        v70 = (void *)objc_msgSend(v79, "copy");
        v71 = _Block_copy(v70);
        objc_msgSend(v13, "addObject:", v71);

        v78[0] = v66;
        v78[1] = 3221225472;
        v78[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_5;
        v78[3] = &unk_1E204AE68;
        v78[4] = &v106;
        objc_msgSend(v77, "enumerateObjectsUsingBlock:", v78);

        _Block_object_dispose(&v99, 8);
        goto LABEL_48;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", v35);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v41, "userInterfaceIdiom") != 1;

    v31 = 0;
LABEL_30:
    -[CNContactListViewController updateMeContactBannerContentsWithTopKeyline:](self, "updateMeContactBannerContentsWithTopKeyline:", v38, v74);
    -[CNContactListViewController meContactBanner](self, "meContactBanner");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController meContactBanner](self, "meContactBanner");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "sizeThatFits:", width, height);
    v44 = v43;
    v46 = v45;

    if (v38)
      v47 = v46 + 1.0;
    else
      v47 = v46;
    if (v39)
    {
      objc_msgSend(v77, "addObject:", v39);
    }
    else
    {
      CNUILogContactList();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v48, OS_LOG_TYPE_ERROR, "Attempting to display meContactBanner when view is nil", buf, 2u);
      }

      v39 = 0;
    }
    goto LABEL_41;
  }
  if (!v7)
  {
    -[CNContactListViewController environment](self, "environment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "launchCheckinRegistrar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "checkInLaunchTasks:", 2);

  }
  -[CNContactListBannerView removeFromSuperview](self->_meContactBanner, "removeFromSuperview");
  -[CNContactSuggestionsViewController view](self->_suggestionsController, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeFromSuperview");

  v27 = 0;
LABEL_48:
  -[CNContactListViewController setListHeaderView:](self, "setListHeaderView:", v107[5]);
  objc_msgSend(v6, "setContentOffset:", v10, v12);
  objc_msgSend(v13, "_cn_each:", &__block_literal_global_458);
  if (v27 || -[CNContactListViewController headerViewNeedsUpdate](self, "headerViewNeedsUpdate"))
  {
    self->_headerViewNeedsUpdate = 0;
    -[CNContactListViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    -[CNContactListViewController collectionView](self, "collectionView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "collectionViewLayout");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "invalidateLayout");

  }
  _Block_object_dispose(&v106, 8);

}

- (CNContactListBannerView)meContactBanner
{
  CNContactListBannerView *meContactBanner;
  CNContactListBannerView *v4;
  CNContactListBannerView *v5;

  meContactBanner = self->_meContactBanner;
  if (!meContactBanner)
  {
    v4 = objc_alloc_init(CNContactListBannerView);
    v5 = self->_meContactBanner;
    self->_meContactBanner = v4;

    -[CNContactListBannerView setDelegate:](self->_meContactBanner, "setDelegate:", self);
    meContactBanner = self->_meContactBanner;
  }
  return meContactBanner;
}

- (BOOL)shouldDisplayListHeaderView
{
  BOOL v3;
  BOOL v4;
  BOOL v5;
  void *v6;

  v3 = -[CNContactListViewController shouldDisplayMeContactBanner](self, "shouldDisplayMeContactBanner");
  v4 = -[CNContactListViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController");
  if (-[CNContactListViewController isSearchController](self, "isSearchController"))
  {
    v5 = 0;
  }
  else
  {
    if (-[CNContactListViewController shouldDisplayTipContentView](self, "shouldDisplayTipContentView")
      && !-[CNContactListViewController isSearching](self, "isSearching"))
    {
      return 1;
    }
    -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v3 || v5 || v4;
}

- (BOOL)shouldDisplayMeContactBanner
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  if (!self->_shouldDisplayMeContactBanner)
    return 0;
  -[CNContactListViewController preferredForNameMeContact](self, "preferredForNameMeContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[CNContactListViewController meContactBannerFootnoteLabel](self, "meContactBannerFootnoteLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4 = 1;
  }
  else
  {
    -[CNContactListViewController meContactBannerFootnoteValue](self, "meContactBannerFootnoteValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6 != 0;

  }
  return v4;
}

- (BOOL)shouldDisplayTipContentView
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tipKitContentView
{
  void *v2;
  void *v3;

  +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTipView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldDisplaySuggestionsController
{
  return self->_shouldDisplaySuggestionsController
      && -[CNContactListViewController isViewingTopLevelAllContacts](self, "isViewingTopLevelAllContacts");
}

- (BOOL)isSearchController
{
  return 0;
}

- (void)setListHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_listHeaderView, a3);
}

- (void)setEstimatedListHeaderViewHeight:(double)a3
{
  self->_estimatedListHeaderViewHeight = a3;
}

- (UIView)listHeaderView
{
  return self->_listHeaderView;
}

- (void)setShouldDisplayMeContactBanner:(BOOL)a3
{
  if (self->_shouldDisplayMeContactBanner != a3)
  {
    self->_shouldDisplayMeContactBanner = a3;
    -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  }
}

- (BOOL)selectContact:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  return -[CNContactListViewController selectContact:animated:scrollPosition:shouldScroll:](self, "selectContact:animated:scrollPosition:shouldScroll:", a3, a4, a5, 1);
}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addSubview:", v5);

}

- (void)_applicationEnteringForeground:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_requestRefreshWithUserAction:", 0);
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 8);

  if (v6)
    -[CNContactListViewController refreshDuplicates](self, "refreshDuplicates");
}

void __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (*v4)(void);
  id v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  if (v5 && objc_msgSend(v5, "duplicateCount") != *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v5, "setDuplicateCount:");
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

uint64_t __58__CNContactListViewController_updateDuplicatesCountBanner__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "refreshDuplicatesBanner");
  return result;
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (!a3)
  {
    if (-[CNContactListViewController isSearching](self, "isSearching"))
    {
      -[CNContactListViewController searchBar](self, "searchBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", v5);

    }
  }
}

void __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "allDuplicatesCountToDisplay");
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactListViewController_fetchDuplicatesCountWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E204AD58;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v2;
  objc_msgSend(v5, "performBlock:", v7);

}

- (int64_t)allDuplicatesCountToDisplay
{
  if (self->_duplicatesController
    && -[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
  {
    return -[CNDuplicateContactsController allDuplicatesCount](self->_duplicatesController, "allDuplicatesCount");
  }
  else
  {
    return 0;
  }
}

void __63__CNContactListViewController_deselectAllItemsExceptIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deselectItemAtIndexPath:animated:", v4, 0);

  }
}

void __53__CNContactListViewController__updateCountStringNow___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CNContactListViewController__updateCountStringNow___block_invoke_3;
  block[3] = &unk_1E204FB40;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (int64_t)numberOfSections
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = *MEMORY[0x1E0D137F8];
  -[CNContactListViewController _sections](self, "_sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CNContactListViewController _sections](self, "_sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count");

  }
  return -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount") + v5;
}

- (void)refreshTableViewHeaderIfVisible
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactListViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNContactListViewController view](self, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      -[CNContactListViewController refreshTableViewHeaderIfVisibleWithSize:](self, "refreshTableViewHeaderIfVisibleWithSize:", v5, v6);

    }
  }
}

- (id)indexTitlesForCollectionView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x1E0D137F8];
  -[CNContactListViewController _sections](self, "_sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[CNContactDataSource indexSections](self->_dataSource, "indexSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  double v42;
  void *v43;
  double v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  int8x16_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGRect v56;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "frame");
    objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutDirection");

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutMargins");
      v13 = v12;
      objc_msgSend(*(id *)(a1 + 40), "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutMargins");
      v10 = v10 - (v13 + v15);

    }
    v16 = *(double *)(a1 + 112);
    v17 = *(void **)(a1 + 32);
    if (v17)
    {
      objc_msgSend(v17, "frame");
      v19 = v18;
      objc_msgSend(*(id *)(a1 + 32), "frame");
      v8 = v8 + v19 + v20;
    }
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", v6, v8, v10, v16);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layoutMargins");
      v29 = v28;
      objc_msgSend(*(id *)(a1 + 40), "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "safeAreaInsets");
      v26 = v26 - (v29 + v31);

    }
    v32 = *(double *)(a1 + 128);
    v33 = *(void **)(a1 + 48);
    if (v33)
    {
      objc_msgSend(v33, "frame");
      v35 = v34;
      objc_msgSend(*(id *)(a1 + 48), "frame");
      v24 = v24 + v35 + v36;
    }
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", v22, v24, v26, v32);
  }
  if (*(_BYTE *)(a1 + 152))
  {
    v37 = *(void **)(a1 + 40);
    if (*(_BYTE *)(a1 + 153))
    {
      if (*(_BYTE *)(a1 + 154))
      {
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_2;
        v45[3] = &unk_1E204AE18;
        v46 = *(id *)(a1 + 48);
        v38 = *(id *)(a1 + 64);
        v39 = *(_OWORD *)(a1 + 104);
        v52 = *(_OWORD *)(a1 + 136);
        v53 = v39;
        v40 = *(_QWORD *)(a1 + 40);
        v47 = v38;
        v48 = v40;
        v49 = *(id *)(a1 + 56);
        v50 = *(id *)(a1 + 32);
        v41 = *(_OWORD *)(a1 + 88);
        v54 = *(_OWORD *)(a1 + 120);
        v55 = v41;
        v51 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
        objc_msgSend(v37, "performWhenViewIsLaidOut:", v45);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "tipKitDismissTip");
      }
    }
    else
    {
      v42 = *(double *)(a1 + 144);
      objc_msgSend(*(id *)(a1 + 40), "tipKitContentView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "bounds");
      v44 = v42 - CGRectGetHeight(v56);

      objc_msgSend(*(id *)(a1 + 40), "tipKitDismissTip");
      objc_msgSend(*(id *)(a1 + 64), "setContentOffset:", *(double *)(a1 + 136), v44);
    }
  }
}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "emergencyContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNHealthStoreManager identifiersForContactMatchingEmergencyContacts:contactStore:](CNHealthStoreManager, "identifiersForContactMatchingEmergencyContacts:contactStore:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_2;
  v10[3] = &unk_1E2050400;
  v10[4] = WeakRetained;
  v11 = v8;
  v9 = v8;
  objc_msgSend(WeakRetained, "performWhenViewIsLaidOut:", v10);

}

void __45__CNContactListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isSearching")
    && objc_msgSend(*(id *)(a1 + 32), "shouldSearchBarBecomeFirstResponder"))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFirstResponder");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchBar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "becomeFirstResponder");

    }
  }
}

- (void)tipKitStartObservation
{
  id v3;

  +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tipKitStartObservation:", self);

}

- (void)setTipKitContext:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tipKitSetSiriTipContext:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD block[5];
  objc_super v25;

  v3 = a3;
  if (!-[CNContactListViewController isCurrentViewStillOpen](self, "isCurrentViewStillOpen"))
  {
    v25.receiver = self;
    v25.super_class = (Class)CNContactListViewController;
    -[CNContactListViewController viewWillAppear:](&v25, sel_viewWillAppear_, v3);
    -[CNContactListViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    -[CNContactListViewController configureNavigationBarForLargeTitles](self, "configureNavigationBarForLargeTitles");
    -[CNContactListViewController splitViewController](self, "splitViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          -[CNContactListViewController splitViewController](self, "splitViewController"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isCollapsed"),
          v7,
          v6,
          v8))
    {
      -[CNContactListViewController deselectAllSelectedIndexPathsAnimated:](self, "deselectAllSelectedIndexPathsAnimated:", v3);
      -[CNContactListViewController adjustTableViewOffsetForIncomingSearchUI](self, "adjustTableViewOffsetForIncomingSearchUI");
    }
    if (!-[CNContactListViewController isSearchController](self, "isSearchController"))
      -[CNContactListViewController tipKitStartObservation](self, "tipKitStartObservation");
    -[CNContactListViewController indexPathToSelect](self, "indexPathToSelect");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[CNContactListViewController listHeaderView](self, "listHeaderView");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        -[CNContactListViewController indexPathToSelect](self, "indexPathToSelect");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CNContactListViewController isValidIndexPath:](self, "isValidIndexPath:", v13);

        if (v14)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __46__CNContactListViewController_viewWillAppear___block_invoke;
          block[3] = &unk_1E204F648;
          block[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], block);
        }
      }
      else
      {

      }
    }
    if (+[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
    {
      -[CNContactListViewController setupViewWithLimitedAccessContactSelection](self, "setupViewWithLimitedAccessContactSelection");
      if (+[CNLimitedAccessPickerSupport shouldLimitedAccessPickerSupportSelectAll:](CNLimitedAccessPickerSupport, "shouldLimitedAccessPickerSupportSelectAll:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
      {
        -[CNContactListViewController addSelectButtonView](self, "addSelectButtonView");
      }
      if (!+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithLists:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessWithLists:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))-[CNContactListViewController disableSearchUI](self, "disableSearchUI");
    }
    if (-[CNContactListViewController hasPickerPrivacyUI](self, "hasPickerPrivacyUI"))
    {
      objc_opt_class();
      -[CNContactListViewController navigationItem](self, "navigationItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;

      -[CNContactListViewController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v20);

    }
    -[CNContactListViewController applyStyle](self, "applyStyle");
    -[CNContactListViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEditing") & 1) != 0)
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "allowsMultipleSelectionDuringEditing");

      if (v23)
      {
        -[CNContactListViewController _updateCountStringNow:](self, "_updateCountStringNow:", 1);
        -[CNContactListViewController updateSelectedContactCount](self, "updateSelectedContactCount");
      }
    }
    else
    {

    }
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[CNContactListViewController pendingLayoutBlocks](self, "pendingLayoutBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_317);

  -[CNContactListViewController setPendingLayoutBlocks:](self, "setPendingLayoutBlocks:", MEMORY[0x1E0C9AA60]);
  if (-[CNContactListViewController pendingSearchControllerActivation](self, "pendingSearchControllerActivation"))
  {
    -[CNContactListViewController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActive:", 1);

    -[CNContactListViewController setPendingSearchControllerActivation:](self, "setPendingSearchControllerActivation:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
  {

  }
  else
  {
    -[CNContactListViewController meContactBanner](self, "meContactBanner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CNContactListViewController updateMeContactBannerTopKeyline](self, "updateMeContactBannerTopKeyline");
  }
  -[CNContactListViewController layoutSelectButtonView](self, "layoutSelectButtonView");
}

- (void)viewDidAppear:(BOOL)a3
{
  CNContactListViewController *v4;
  char v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _QWORD block[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[CNContactListViewController setIsCurrentViewStillOpen:](self, "setIsCurrentViewStillOpen:", 1);
  -[CNContactListViewController setDidDeleteContact:](self, "setDidDeleteContact:", 0);
  -[CNContactDataSource delegate](self->_dataSource, "delegate");
  v4 = (CNContactListViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[CNContactDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
  if (!-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
    -[UICollectionViewController _cnui_updateAccountsRefreshControl](self, "_cnui_updateAccountsRefreshControl");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CNContactListViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[CNContactListViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  if ((v5 & 1) != 0 || v8 != v11)
    -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  if (-[CNContactListViewController shouldEnableMultiSelectContextMenus](self, "shouldEnableMultiSelectContextMenus"))
    -[CNContactListViewController setupContactListForMultiSelectContextMenus](self, "setupContactListForMultiSelectContextMenus");
  if (-[CNContactListViewController shouldDisplayEmergencyContacts](self, "shouldDisplayEmergencyContacts"))
    -[CNContactListViewController startHandlingEmergencyContacts](self, "startHandlingEmergencyContacts");
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  int64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController _sections](self, "_sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  if (a3 < 0 || v5 <= a3)
  {
    CNUILogContactList();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218240;
      v12 = a3;
      v13 = 2048;
      v14 = v6;
      _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Requesting header title for index out of bounds: %ld, sectionCount: %ld", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v8;
}

- (void)startHandlingEmergencyContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  -[CNContactListViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    -[CNContactListViewController contactStore](self, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "healthStoreManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke;
    v17[3] = &unk_1E204FEE8;
    objc_copyWeak(&v19, &location);
    v8 = v4;
    v18 = v8;
    objc_msgSend(v6, "registerMedicalIDDataHandler:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setMedicalIDLookupRegistrationToken:](self, "setMedicalIDLookupRegistrationToken:", v9);
    v10 = (void *)MEMORY[0x1E0D139B8];
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_5;
    v14[3] = &unk_1E2050400;
    v11 = v6;
    v15 = v11;
    v12 = v9;
    v16 = v12;
    objc_msgSend(v10, "tokenWithCancelationBlock:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldUseLargeTitle
{
  return self->_shouldUseLargeTitle;
}

- (BOOL)shouldEmbedContentUnavailableViewInCell
{
  void *v2;
  BOOL v3;
  CGRect v5;

  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v3 = !CGRectIsEmpty(v5);

  return v3;
}

- (void)setMedicalIDLookupToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLookupToken, a3);
}

- (void)setMedicalIDLookupRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDLookupRegistrationToken, a3);
}

- (void)setDidDeleteContact:(BOOL)a3
{
  self->_didDeleteContact = a3;
}

- (void)setCellContentUnavailableConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cellContentUnavailableConfiguration, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (BOOL)pendingSearchControllerActivation
{
  return self->_pendingSearchControllerActivation;
}

- (CNContactDataSource)originalDataSource
{
  return self->_dataSource;
}

- (CNCancelable)medicalIDLookupToken
{
  return self->_medicalIDLookupToken;
}

- (NSIndexPath)indexPathToSelect
{
  return self->_indexPathToSelect;
}

- (id)filteredSearchString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "fullTextString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)didUpdateContentForAvatarViewController:(id)a3
{
  void *v3;
  id v4;

  -[CNContactListViewController environment](self, "environment", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchCheckinRegistrar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInLaunchTasks:", 2);

}

- (BOOL)didDeleteContact
{
  return self->_didDeleteContact;
}

- (void)deselectAllSelectedIndexPathsAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CNContactSuggestionsViewController *suggestionsController;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  BOOL v15;
  _QWORD v16[5];
  BOOL v17;
  _QWORD v18[5];
  BOOL v19;

  -[CNContactListViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedItems");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (-[CNContactListViewController isSearching](self, "isSearching"))
  {
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = *MEMORY[0x1E0D137F8];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v13) & 1) == 0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke;
    v18[3] = &unk_1E204ACE0;
    v18[4] = self;
    v19 = a3;
    objc_msgSend(v13, "_cn_each:", v18);
  }
  if (((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v8) & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_2;
    v16[3] = &unk_1E204ACE0;
    v16[4] = self;
    v17 = a3;
    objc_msgSend(v8, "_cn_each:", v16);
  }
  suggestionsController = self->_suggestionsController;
  if (suggestionsController)
  {
    -[CNContactSuggestionsViewController collectionView](suggestionsController, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathsForSelectedItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v12) & 1) == 0)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_3;
      v14[3] = &unk_1E204ACE0;
      v14[4] = self;
      v15 = a3;
      objc_msgSend(v12, "_cn_each:", v14);
    }

  }
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  CNContactListViewController *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  CNContactListViewController *v43;

  v4 = a3;
  if (!-[CNContactListViewController hasNoContacts](self, "hasNoContacts"))
  {
    v6 = 0;
    goto LABEL_6;
  }
  if (!-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch")
    && !-[CNContactListViewController isShowingServerSearch](self, "isShowingServerSearch"))
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatedConfigurationForState:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[CNContactListViewController shouldDisplayMeContactBanner](self, "shouldDisplayMeContactBanner"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.crop.circle.fill"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v9);

    }
    -[CNContactListViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_1EE020538);

    if (v11)
    {
      -[CNContactListViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = objc_msgSend(v12, "isAddContactButtonShowing");
      else
        v13 = 0;

    }
    else
    {
      v13 = 0;
    }
    CNContactsUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO_CONTACTS"), &stru_1E20507A8, CFSTR("Localized"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v15);

    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NO_CONTACTS_HINT"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSecondaryText:", v17);

    v18 = -[CNContactListViewController showingGroup](self, "showingGroup");
    v19 = -[CNContactListViewController collectionViewShouldDisplayCreateNewContact](self, "collectionViewShouldDisplayCreateNewContact");
    if (v13 && v18)
    {
      if (-[CNContactListViewController allowsListEditing](self, "allowsListEditing"))
      {
        CNContactsUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACTS_TO_LIST_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "buttonProperties");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "configuration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTitle:", v21);

        v24 = (void *)MEMORY[0x1E0DC3428];
        CNContactsUIBundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACTS_TO_LIST_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke_2;
        v37 = &unk_1E2050228;
        v38 = self;
        v27 = &v34;
LABEL_21:
        objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v27, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "buttonProperties");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setPrimaryAction:", v32);

        goto LABEL_6;
      }
    }
    else if (((v13 | v19) & 1) == 0)
    {
      goto LABEL_6;
    }
    CNContactsUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTitle:", v29);

    v24 = (void *)MEMORY[0x1E0DC3428];
    CNContactsUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CREATE_NEW_CONTACT_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke;
    v42 = &unk_1E2050228;
    v43 = self;
    v27 = &v39;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatedConfigurationForState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v6;
}

- (void)configureNavigationBarForLargeTitles
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[CNContactListViewController shouldUseLargeTitle](self, "shouldUseLargeTitle"))
  {
    -[CNContactListViewController navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersLargeTitles:", 1);

  }
  if (-[CNContactListViewController shouldUseLargeTitle](self, "shouldUseLargeTitle"))
    v5 = 1;
  else
    v5 = 2;
  -[CNContactListViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLargeTitleDisplayMode:", v5);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("CNContactListLayoutFooterIdentifier")))
  {
    v17 = objc_msgSend(v9, "isEqualToString:", CFSTR("CNContactListLayoutHeaderIdentifier"));
    -[CNContactListViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      objc_msgSend(v18, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("CNContactListHeaderViewIdentifier"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundConfiguration:", v20);

      -[CNContactListViewController listHeaderView](self, "listHeaderView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHeaderView:", v16);
      goto LABEL_17;
    }
    objc_msgSend(v18, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("CNContactListSectionHeaderFooterIdentifier"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListViewController dataSourceIndexPathForCollectionViewIndexPath:](self, "dataSourceIndexPathForCollectionViewIndexPath:", v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]);
    if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
    {
      -[CNContactListViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", objc_msgSend(v16, "section"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applyContactListStyleToSearchHeader:withTitle:", v12, v22);
    }
    else
    {
      if (!v21)
      {
        objc_msgSend(v12, "setContentConfiguration:", 0);
        goto LABEL_17;
      }
      -[CNContactListViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "traitCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "layoutDirection");

      -[CNContactListViewController titleForHeaderInSection:](self, "titleForHeaderInSection:", objc_msgSend(v16, "section"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        +[CNContactListStyleApplier applyDefaultContactListStyleToHeaderFooter:withTitle:isRTL:](CNContactListStyleApplier, "applyDefaultContactListStyleToHeaderFooter:withTitle:isRTL:", v12, v22, v26 == 1);
        goto LABEL_15;
      }
      -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applyContactListStyleToHeaderFooter:withTitle:isRTL:", v12, v22, v26 == 1);
    }

LABEL_15:
    goto LABEL_17;
  }
  -[CNContactListViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("CNContactListCountFooterViewIdentifier"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundConfiguration:", v13);

  objc_msgSend(v12, "setShouldHideCountFooter:", +[CNLimitedAccessPickerSupport isPickerLimitedAccess:](CNLimitedAccessPickerSupport, "isPickerLimitedAccess:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")));
  objc_opt_class();
  v14 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    objc_msgSend(v16, "setContactCountView:", v12);
    objc_msgSend(v12, "setDelegate:", self);
  }
LABEL_17:

  return v12;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    objc_msgSend(v7, "cancelAsyncOperations");

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)applyStyle
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];

  -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyContactListStyleToSearchBar:", v4);

  -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyContactListStyleToNavigationBar:", v7);

  -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyContactListStyleToCollectionView:", v9);

  -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController meContactBanner](self, "meContactBanner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContactListStyleApplier:", v10);

  if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
  {
    -[CNContactListViewController contactListStyleApplier](self, "contactListStyleApplier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContactListStyleApplier:", v12);

  }
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = *MEMORY[0x1E0D137F8];
      -[CNContactListViewController collectionView](self, "collectionView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexPathsForVisibleItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v16 + 16))(v16, v17))
      {

      }
      else
      {
        -[CNContactListViewController collectionView](self, "collectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "window");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __41__CNContactListViewController_applyStyle__block_invoke;
          v21[3] = &unk_1E204F648;
          v21[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v21);
        }
      }
    }
  }
}

- (void)adjustTableViewOffsetForIncomingSearchUI
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  if (v5 == 0.0)
  {
    v6 = *MEMORY[0x1E0D137F8];
    -[CNContactListViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v8))
    {
      v9 = -[CNContactListViewController didDeleteContact](self, "didDeleteContact");

      if (!v9)
        return;
    }
    else
    {

    }
    if (-[CNContactListViewController presentsSearchUI](self, "presentsSearchUI"))
    {
      if (-[CNContactListViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
      {
        -[CNContactListViewController searchController](self, "searchController");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[CNContactListViewController searchController](self, "searchController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "searchBar");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[CNContactListViewController collectionView](self, "collectionView");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "contentOffset");
            v16 = v15;

            -[CNContactListViewController navigationController](self, "navigationController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "navigationBar");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "bounds");
            v20 = v19;

            -[CNContactListViewController collectionView](self, "collectionView");
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setContentOffset:", v16, v20);

          }
        }
      }
    }
  }
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNContactListViewController cellContentUnavailableConfiguration](self, "cellContentUnavailableConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController contentUnavailableConfigurationForState:](self, "contentUnavailableConfigurationForState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNContactListViewController shouldEmbedContentUnavailableViewInCell](self, "shouldEmbedContentUnavailableViewInCell");
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  -[CNContactListViewController setCellContentUnavailableConfiguration:](self, "setCellContentUnavailableConfiguration:", v7);
  -[CNContactListViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v8);
  -[CNContactListViewController cellContentUnavailableConfiguration](self, "cellContentUnavailableConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v9 && (!v11 || !v9 || (objc_msgSend(v11, "isEqual:", v9) & 1) == 0))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (id)_contentUnavailableConfigurationState
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController _contentUnavailableConfigurationState](&v6, sel__contentUnavailableConfigurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController filteredSearchString](self, "filteredSearchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchControllerText:", v4);

  return v3;
}

+ (id)emptyContact
{
  if (emptyContact_cn_once_token_15 != -1)
    dispatch_once(&emptyContact_cn_once_token_15, &__block_literal_global_462);
  return (id)emptyContact_cn_once_object_15;
}

void __43__CNContactListViewController_emptyContact__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97200]);
  v1 = (void *)emptyContact_cn_once_object_15;
  emptyContact_cn_once_object_15 = (uint64_t)v0;

}

double __51__CNContactListViewController_collectionViewLayout__block_invoke_6()
{
  return 0.0;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_5()
{
  return 0;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_4()
{
  return 0;
}

double __51__CNContactListViewController_collectionViewLayout__block_invoke_3()
{
  return *MEMORY[0x1E0DC3298];
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke_2()
{
  return 1;
}

uint64_t __51__CNContactListViewController_collectionViewLayout__block_invoke()
{
  return 0;
}

- (CNContactListViewController)initWithDataSource:(id)a3 shouldUseLargeTitle:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CNContactListViewController *v8;

  v4 = a4;
  v6 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactListViewController initWithDataSource:environment:shouldUseLargeTitle:](self, "initWithDataSource:environment:shouldUseLargeTitle:", v6, v7, v4);

  return v8;
}

- (CNContactListViewController)initWithCollectionViewLayout:(id)a3
{
  return -[CNContactListViewController initWithDataSource:shouldUseLargeTitle:](self, "initWithDataSource:shouldUseLargeTitle:", 0, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CNContactListViewController medicalIDLookupToken](self, "medicalIDLookupToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[CNContactListViewController setMedicalIDLookupToken:](self, "setMedicalIDLookupToken:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController dealloc](&v5, sel_dealloc);
}

- (void)setDataSource:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNContactListViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("dataSource"));
  objc_storeStrong((id *)&self->_dataSource, a3);
  -[CNContactDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
  -[CNContactListViewController searchResultsController](self, "searchResultsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v8, "copyWithZone:", 0);
  objc_msgSend(v5, "setDataSource:", v6);

  if (-[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
  {
    if (self->_duplicatesController)
    {
      -[CNContactListViewController duplicatesController](self, "duplicatesController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataSource:", self->_dataSource);

    }
    -[CNContactListViewController refreshDuplicates](self, "refreshDuplicates");
  }
  -[CNContactListViewController refreshActionHelper](self, "refreshActionHelper");
  -[CNContactListViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dataSource"));
  -[CNContactListViewController contactDataSourceDidChange:](self, "contactDataSourceDidChange:", v8);

}

- (CNDuplicateContactsController)duplicatesController
{
  cn_objectResultWithObjectLock();
  return (CNDuplicateContactsController *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)setupDuplicatesController
{
  CNDuplicateContactsController *v3;
  CNDuplicateContactsController *duplicatesController;

  v3 = -[CNDuplicateContactsController initWithDataSource:environment:delegate:]([CNDuplicateContactsController alloc], "initWithDataSource:environment:delegate:", self->_dataSource, self->_environment, self);
  duplicatesController = self->_duplicatesController;
  self->_duplicatesController = v3;

  -[CNContactListViewController setIsDuplicatesLaunching:](self, "setIsDuplicatesLaunching:", 0);
  return self->_duplicatesController;
}

- (unint64_t)globalIndexForCollectionViewIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  if (-[CNContactListViewController isDuplicatesRowSection:](self, "isDuplicatesRowSection:", objc_msgSend(v4, "section")))
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[CNContactListViewController dataSourceIndexPathForCollectionViewIndexPath:](self, "dataSourceIndexPathForCollectionViewIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "section");
    -[CNContactListViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if ((v7 & 0x8000000000000000) != 0 || v7 >= objc_msgSend(v9, "count"))
      {
        v5 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "range");
        v5 = v11 + objc_msgSend(v6, "row");

      }
    }
    else
    {
      v5 = objc_msgSend(v6, "item");
    }

  }
  return v5;
}

- (id)indexPathForGlobalIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v23;
      while (2)
      {
        v12 = 0;
        v13 = v10 + v9;
        v14 = a3;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "range", (_QWORD)v22);
          a3 = v14 - v15;
          if (v14 < v15)
          {
            v13 = v10 + v12;
            a3 = v14;
            goto LABEL_14;
          }
          ++v12;
          v14 -= v15;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v10 = v13;
        if (v9)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_14:

    v16 = (void *)MEMORY[0x1E0CB36B0];
    v17 = a3;
    v18 = v13;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB36B0];
    v17 = a3;
    v18 = 0;
  }
  objc_msgSend(v16, "indexPathForItem:inSection:", v17, v18, (_QWORD)v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionViewIndexPathForDataSourceIndexPath:](self, "collectionViewIndexPathForDataSourceIndexPath:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)allowsEditingActions
{
  if (self->_allowsEditingActions)
    return !-[CNContactListViewController isContactProviderDataSource](self, "isContactProviderDataSource");
  else
    return 0;
}

- (BOOL)isContactProviderDataSource
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "filteredContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type") == 1003;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNContactListActionHelper)actionHelper
{
  CNContactListActionHelper *actionHelper;
  CNContactListActionHelper *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactListActionHelper *v9;
  CNContactListActionHelper *v10;

  actionHelper = self->_actionHelper;
  if (!actionHelper)
  {
    v4 = [CNContactListActionHelper alloc];
    -[CNContactListViewController contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController contactFormatter](self, "contactFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController undoManager](self, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNContactListActionHelper initWithContactStore:environment:contactFormatter:undoManager:](v4, "initWithContactStore:environment:contactFormatter:undoManager:", v5, v6, v7, v8);
    v10 = self->_actionHelper;
    self->_actionHelper = v9;

    -[CNContactListActionHelper setDelegate:](self->_actionHelper, "setDelegate:", self);
    -[CNContactListActionHelper setIncludesContactOrbActions:](self->_actionHelper, "setIncludesContactOrbActions:", 1);
    -[CNContactListActionHelper setIncludesEditingActions:](self->_actionHelper, "setIncludesEditingActions:", -[CNContactListViewController allowsEditingActions](self, "allowsEditingActions"));
    actionHelper = self->_actionHelper;
  }
  return actionHelper;
}

- (void)refreshActionHelper
{
  if (self->_actionHelper)
    -[CNContactListActionHelper setIncludesEditingActions:](self->_actionHelper, "setIncludesEditingActions:", -[CNContactListViewController allowsEditingActions](self, "allowsEditingActions"));
}

- (id)contactsForActionsAtIndexPaths:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke;
  v9[3] = &unk_1E204AC28;
  v9[4] = self;
  v10 = v5 > 1;
  objc_msgSend(v4, "_cn_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_filter:", &__block_literal_global_281);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactForActionsAtIndexPath:(id)a3 forMultiSelectAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CNContactDataSource *dataSource;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  _QWORD v20[2];

  v4 = a4;
  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dataSource = self->_dataSource;
  +[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:](CNContactListActionHelper, "descriptorForRequiredKeysForMultiSelectAction:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactDataSource completeContactFromContact:fromMainStoreOnly:keysToFetch:](dataSource, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v7, 1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isEqual:", v12);

  if ((_DWORD)v9)
  {
    CNUILogContactList();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "NSNull returned when attempting to refetch contact at  indexPath: %@, contact: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return !-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch", a3, a4)
      && -[CNContactListViewController shouldEnableMultiSelectContextMenus](self, "shouldEnableMultiSelectContextMenus");
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = !-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v7)
    && !-[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v7)
    && (!objc_msgSend(v6, "isEditing")
     || (objc_msgSend(v6, "allowsMultipleSelectionDuringEditing") & 1) == 0)
    && -[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v7);

  return v8;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v6;
  char v7;
  void *v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "isEditing"))
    v7 = objc_msgSend(v10, "allowsMultipleSelectionDuringEditing");
  else
    v7 = 0;
  objc_msgSend(v10, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2 && (v7 & 1) == 0)
    -[CNContactListViewController deselectAllItemsExceptIndexPath:](self, "deselectAllItemsExceptIndexPath:", v6);
  -[CNContactListViewController showCardForSelectedContactAtIndexPath:](self, "showCardForSelectedContactAtIndexPath:", v6);

}

- (void)showCardForSelectedContactAtIndexPath:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:")
    && !-[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v9))
  {
    -[CNContactListViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
      {
        +[CNUIDataCollectionSearchSession currentSession](CNUIDataCollectionSearchSession, "currentSession");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "didSelectResult:", v6);

      }
      -[CNContactListViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactListViewController:didSelectContact:shouldScrollToContact:", self, v6, 0);

    }
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;

  v6 = a4;
  if (objc_msgSend(v6, "count")
    && (-[CNContactListViewController shouldEnableMultiSelectContextMenus](self, "shouldEnableMultiSelectContextMenus")
     || objc_msgSend(v6, "count") == 1))
  {
    -[CNContactListViewController contextMenuConfigurationForContactsAtIndexPaths:](self, "contextMenuConfigurationForContactsAtIndexPaths:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contextMenuConfigurationForContactsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[5];
  id v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CNContactListViewController containsPathToDuplicatesBanner:](self, "containsPathToDuplicatesBanner:", v4)
    && !-[CNContactListViewController containsPathToCreateNewContactRow:](self, "containsPathToCreateNewContactRow:", v4)&& !-[CNContactListViewController containsPathToContentUnavailableRow:](self, "containsPathToContentUnavailableRow:", v4)&& !-[CNContactListViewController containsPathToLimitedAccessTipRow:](self, "containsPathToLimitedAccessTipRow:", v4)&& !-[CNContactListViewController disableContextMenus](self, "disableContextMenus"))
  {
    -[CNContactListViewController contactsForActionsAtIndexPaths:](self, "contactsForActionsAtIndexPaths:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForItemAtIndexPath:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      if (!-[CNContactListViewController isHandlingSearch](self, "isHandlingSearch"))
      {
        v17 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_2;
        aBlock[3] = &unk_1E204CB08;
        aBlock[4] = self;
        v18 = v7;
        v25 = v18;
        v13 = v13;
        v26 = v13;
        v19 = _Block_copy(aBlock);
        v20 = (void *)MEMORY[0x1E0DC36B8];
        v22[0] = v17;
        v22[1] = 3221225472;
        v22[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_3;
        v22[3] = &unk_1E204E930;
        v23 = v18;
        objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", &stru_1E20507A8, v22, v19);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      if (+[CNQuickActionsManager hasActionsForContact:](CNQuickActionsManager, "hasActionsForContact:", v10))
      {
        -[CNContactListViewController actionHelper](self, "actionHelper");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "searchMenuActionProviderForContacts:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0DC36B8];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke;
        v27[3] = &unk_1E204E930;
        v28 = v7;
        objc_msgSend(v16, "configurationWithIdentifier:previewProvider:actionProvider:", &stru_1E20507A8, v27, v15);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        goto LABEL_7;
      }
    }
    else
    {
      CNUILogContactList();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "contextMenuConfiguration on non-contact: %@", buf, 0xCu);

      }
    }
    v5 = 0;
    goto LABEL_19;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  _QWORD v12[5];

  v6 = a5;
  -[CNContactListViewController actionHelper](self, "actionHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
  {
    -[CNContactListViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __104__CNContactListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v12[3] = &unk_1E204F648;
      v12[4] = self;
      objc_msgSend(v6, "addCompletion:", v12);
    }
  }

}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CNContactListViewController actionHelper](self, "actionHelper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "willDisplayMenuWithContextMenuInteraction:", v7);
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v5;

  -[CNContactListViewController actionHelper](self, "actionHelper", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willDismissMenu");

}

- (void)action:(id)a3 presentViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  objc_msgSend(v21, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", v7);

    -[CNContactListViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v21, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  }
  -[CNContactListViewController splitViewController](self, "splitViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    -[CNContactListViewController splitViewController](self, "splitViewController");
  else
    -[CNContactListViewController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentViewController:animated:completion:", v21, 1, 0);

}

- (void)actionDidFinish:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  id v24;

  if (objc_msgSend(a3, "shouldReloadListOnCompletion"))
  {
    -[CNContactListViewController reloadContacts](self, "reloadContacts");
    -[CNContactListViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathsForSelectedItems");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    -[CNContactListViewController deselectAllSelectedIndexPathsAnimated:](self, "deselectAllSelectedIndexPathsAnimated:", 0);
    -[CNContactListViewController splitViewController](self, "splitViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          -[CNContactListViewController splitViewController](self, "splitViewController"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isCollapsed"),
          v7,
          v6,
          v8))
    {
      -[CNContactListViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_24:

        return;
      }
      -[CNContactListViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resetContactViewController");
LABEL_23:

      goto LABEL_24;
    }
    -[CNContactListViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[CNContactListViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentlyDisplayedContact");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11
        && -[CNContactListViewController selectContact:animated:scrollPosition:](self, "selectContact:animated:scrollPosition:", v11, 1, 0))
      {
LABEL_15:
        if (-[CNContactListViewController selectContact:animated:scrollPosition:](self, "selectContact:animated:scrollPosition:", v11, 1, 0))
        {
LABEL_17:
          if (-[CNContactListViewController selectContact:animated:scrollPosition:](self, "selectContact:animated:scrollPosition:", v11, 1, 0))
          {
            -[CNContactListViewController delegate](self, "delegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_respondsToSelector();

            if ((v20 & 1) == 0)
              goto LABEL_23;
            -[CNContactListViewController delegate](self, "delegate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "contactListViewController:updatedSelectedContact:", self, v11);
LABEL_22:

            goto LABEL_23;
          }
LABEL_20:
          -[CNContactListViewController delegate](self, "delegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_opt_respondsToSelector();

          if ((v23 & 1) == 0)
            goto LABEL_23;
          -[CNContactListViewController delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "resetContactViewController");
          goto LABEL_22;
        }
LABEL_16:
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactListViewController _contactAtIndexPath:](self, "_contactAtIndexPath:", v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v18;
        if (!v18)
          goto LABEL_20;
        goto LABEL_17;
      }
    }
    else
    {
      v11 = 0;
    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      objc_msgSend(v24, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    if (!v11)
      goto LABEL_16;
    goto LABEL_15;
  }
}

- (void)listActionHelper:(id)a3 didUpdateWithMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v6 = a3;
  v7 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  -[CNContactListViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextMenuInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke;
  v11[3] = &unk_1E204ACB8;
  v13 = v14;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "updateVisibleMenuWithBlock:", v11);

  _Block_object_dispose(v14, 8);
}

- (id)contextMenuInteraction
{
  void *v2;
  void *v3;

  -[CNContactListViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactListViewController;
  -[CNContactListViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  if (!-[CNContactListViewController isSearchController](self, "isSearchController"))
    -[CNContactListViewController tipKitStopObservation](self, "tipKitStopObservation");
  -[CNContactListViewController updatelimitedAccessContactSelection](self, "updatelimitedAccessContactSelection");
  -[CNContactListViewController selectButtonView](self, "selectButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactListViewController selectButtonView](self, "selectButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[CNContactListViewController setSelectButtonView:](self, "setSelectButtonView:", 0);
  }
  -[CNContactListViewController setIsCurrentViewStillOpen:](self, "setIsCurrentViewStillOpen:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListViewController;
  v7 = a4;
  -[CNContactListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E204B480;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E204B480;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)reconfigureVisibleItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *MEMORY[0x1E0D137F8];
      -[CNContactListViewController collectionView](self, "collectionView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathsForVisibleItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) == 0)
      {
        -[CNContactListViewController collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          return;
        -[CNContactListViewController collectionView](self, "collectionView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[CNContactListViewController collectionView](self, "collectionView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "indexPathsForVisibleItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reconfigureItemsAtIndexPaths:", v9);

      }
    }
  }
}

- (void)reloadVisibleItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *MEMORY[0x1E0D137F8];
      -[CNContactListViewController collectionView](self, "collectionView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathsForVisibleItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) & 1) == 0)
      {
        -[CNContactListViewController collectionView](self, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "window");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          return;
        -[CNContactListViewController collectionView](self, "collectionView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[CNContactListViewController collectionView](self, "collectionView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "indexPathsForVisibleItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "reloadItemsAtIndexPaths:", v9);

      }
    }
  }
}

- (void)performWhenSearchCompleted:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  -[CNContactListViewController searchResultsController](self, "searchResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchCompletionBlock:", v5);

}

- (void)disableSearchUI
{
  void *v3;
  void *v4;

  self->_presentsSearchUI = 0;
  self->_isHandlingSearch = 0;
  -[CNContactListViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactListViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSearchController:", 0);

    -[CNContactListViewController setSearchResultsController:](self, "setSearchResultsController:", 0);
    -[CNContactListViewController setSearchController:](self, "setSearchController:", 0);
    -[CNContactListViewController setSearchBar:](self, "setSearchBar:", 0);
  }
}

- (void)setupForMultiSelection
{
  void *v3;
  id v4;

  -[CNContactListViewController setAllowsMultiSelection:](self, "setAllowsMultiSelection:", 1);
  if (-[CNContactListViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController"))
  {
    -[CNContactListViewController suggestionsController](self, "suggestionsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsMultiSelection:", 1);

  }
  if (!-[CNContactListViewController shouldAllowSearchForMultiSelect](self, "shouldAllowSearchForMultiSelect"))
    -[CNContactListViewController disableSearchUI](self, "disableSearchUI");
  -[CNContactListViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v4, "setEditing:", 1);

}

- (NSArray)selectedContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (self->_suggestionsController)
  {
    -[CNContactListViewController suggestionsController](self, "suggestionsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedContacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

  }
  return (NSArray *)v5;
}

- (id)limitedAccessTotalSelectedContacts
{
  void *v3;
  void *v4;

  if (-[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 5)
    -[CNContactListViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
  else
    -[CNContactListViewController limitedAccessContactsFromCurrentSelection](self, "limitedAccessContactsFromCurrentSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactSuggestionsViewController *suggestionsController;
  id v13;

  v5 = a5;
  v6 = a3;
  v13 = a4;
  -[CNContactDataSource indexPathForContact:](self->_dataSource, "indexPathForContact:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionViewIndexPathForDataSourceIndexPath:](self, "collectionViewIndexPathForDataSourceIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNContactListViewController isValidIndexPath:](self, "isValidIndexPath:", v9))
    goto LABEL_11;
  -[CNContactListViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, v5, 0);

    if (!-[CNContactListViewController shouldDisplayListHeaderView](self, "shouldDisplayListHeaderView")
      || !objc_msgSend(v9, "isEqual:", v8))
    {
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v9, "item"), objc_msgSend(v9, "section") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setIndexPathToSelect:](self, "setIndexPathToSelect:", v11);
  }
  else
  {
    objc_msgSend(v10, "deselectItemAtIndexPath:animated:", v9, v5);
  }

LABEL_8:
  suggestionsController = self->_suggestionsController;
  if (suggestionsController)
    -[CNContactSuggestionsViewController setCellStateSelected:forContact:animated:](suggestionsController, "setCellStateSelected:forContact:animated:", v6, v13, v5);
  -[CNContactListViewController updateInResponseToLimitedAccessSelectionChanged](self, "updateInResponseToLimitedAccessSelectionChanged");
LABEL_11:

}

- (void)scrollTopToContactWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  CNContactListViewController *v17;
  id v18;

  v5 = a3;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke;
  v16 = &unk_1E2050400;
  v17 = self;
  v18 = v5;
  v6 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(&v13);
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded", v13, v14, v15, v16, v17))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[CNContactListViewController pendingSearchQuery](self, "pendingSearchQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v7[2](v7);
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  -[CNContactListViewController pendingSearchQuery](self, "pendingSearchQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[CNContactListViewController performWhenSearchCompleted:](self, "performWhenSearchCompleted:", v7);
  else
    -[CNContactListViewController performWhenViewIsLaidOut:](self, "performWhenViewIsLaidOut:", v7);
LABEL_9:

}

- (void)scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  CNContactListViewController *v18;
  id v19;
  unint64_t v20;
  BOOL v21;

  v8 = a3;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __79__CNContactListViewController_scrollToItemAtIndexPath_animated_scrollPosition___block_invoke;
  v17 = &unk_1E204AD30;
  v18 = self;
  v19 = v8;
  v20 = a5;
  v21 = a4;
  v9 = v8;
  v10 = (void (**)(_QWORD))_Block_copy(&v14);
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded", v14, v15, v16, v17, v18)
    && (-[CNContactListViewController collectionView](self, "collectionView"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "window"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    v10[2](v10);
  }
  else
  {
    -[CNContactListViewController pendingSearchQuery](self, "pendingSearchQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[CNContactListViewController performWhenSearchCompleted:](self, "performWhenSearchCompleted:", v10);
    else
      -[CNContactListViewController performWhenViewIsLaidOut:](self, "performWhenViewIsLaidOut:", v10);
  }

}

- (void)reloadContacts
{
  -[CNContactDataSource reload](self->_dataSource, "reload");
  -[CNContactListViewController refreshDuplicates](self, "refreshDuplicates");
}

- (void)updateSelectedContactCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "updateSelectedContactCount");
    -[CNContactListViewController updateInResponseToLimitedAccessSelectionChanged](self, "updateInResponseToLimitedAccessSelectionChanged");
    v5 = v6;
  }

}

- (void)contactStoreDidChangeWithNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CNUIContactsEnvironment defaultSchedulerProvider](self->_environment, "defaultSchedulerProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CNContactListViewController_contactStoreDidChangeWithNotification___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  -[CNContactListViewController reloadContacts](self, "reloadContacts", a3);
  -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
}

- (void)_searchBarDidEndEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  -[CNContactListViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactListViewController searchBar](self, "searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resignFirstResponder");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CNContactListViewController__searchBarDidEndEditing___block_invoke;
    block[3] = &unk_1E204F648;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (BOOL)hasSearchPrefix
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;

  v3 = -[CNContactListViewController isSearching](self, "isSearching");
  if (v3)
  {
    v4 = *MEMORY[0x1E0D13850];
    -[CNContactListViewController currentSearchString](self, "currentSearchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    LOBYTE(v3) = v4;
  }
  return v3;
}

- (void)searchForString:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a5;
  if (v10)
  {
    -[CNContactListSearchController setActive:](self->_searchController, "setActive:", 1);
    if (self->_shouldSearchBarBecomeFirstResponder)
      -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
    -[CNContactListViewController setSearchCompletionBlock:](self, "setSearchCompletionBlock:", v7);
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("effectiveFilter"), 0, 0);

    -[UISearchBar setText:](self->_searchBar, "setText:", v10);
  }
  else
  {
    -[CNContactListViewController setSearchCompletionBlock:](self, "setSearchCompletionBlock:", 0);
    -[CNContactListSearchController setActive:](self->_searchController, "setActive:", 0);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD);
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("effectiveFilter")))
  {
    -[CNContactListViewController searchCompletionBlock](self, "searchCompletionBlock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CNContactListViewController searchCompletionBlock](self, "searchCompletionBlock");
      v14 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController setSearchCompletionBlock:](self, "setSearchCompletionBlock:", 0);
      v14[2](v14);

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CNContactListViewController;
    -[CNContactListViewController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (NSString)currentSearchString
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactListViewController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactListViewController searchBar](self, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;

  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_NAV_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackButtonTitle:", v5);

  +[CNUIDataCollectionSearchSession begin](CNUIDataCollectionSearchSession, "begin");
  if (CNUIIsFaceTime())
    goto LABEL_6;
  -[CNContactListViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isOpaque") & 1) == 0)
  {

    goto LABEL_6;
  }
  v8 = -[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers");

  if (v8)
  {
LABEL_6:
    -[CNContactListViewController collectionView](self, "collectionView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v4 = a3;
  -[CNContactListViewController pendingSearchQuery](self, "pendingSearchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactListViewController pendingSearchQuery](self, "pendingSearchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[CNContactListViewController setPendingSearchQuery:](self, "setPendingSearchQuery:", 0);
  }
  v8 = -[CNContactListViewController shouldSearchBarBecomeFirstResponder](self, "shouldSearchBarBecomeFirstResponder");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CNContactListViewController_didPresentSearchController___block_invoke;
  v10[3] = &unk_1E204C4D0;
  v12 = v8;
  v11 = v4;
  v9 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  id v5;

  -[CNContactListViewController searchBar](self, "searchBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_1E20507A8);

  -[CNContactListViewController searchController](self, "searchController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", v5);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[CNContactListViewController searchBar](self, "searchBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(&stru_1E20507A8, "isEqual:", v24);
  v7 = v6;
  if (v6)
  {
    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[CNContactListViewController searchResultsController](self, "searchResultsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reset");

    }
  }
  -[CNContactListViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  -[CNContactDataSource filter](self->_dataSource, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v14, "setFullTextString:", v24);
  -[CNContactListViewController searchResultsController](self, "searchResultsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "isEqual:", v17);

  if ((v18 & 1) == 0)
  {
    +[CNUIDataCollectionSearchSession currentSession](CNUIDataCollectionSearchSession, "currentSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchStringDidChange");

    -[CNContactListViewController searchResultsController](self, "searchResultsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFilter:", v14);

    if ((v7 & 1) == 0)
    {
      -[CNContactListViewController searchResultsController](self, "searchResultsController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v23, "reloadAsynchronously");
      else
        objc_msgSend(v23, "reload");

    }
  }

}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  id v5;

  +[CNUIDataCollectionSearchSession end](CNUIDataCollectionSearchSession, "end", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactDataSource displayName](self->_dataSource, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setTitle:](self, "setTitle:", v4);

  }
  -[CNContactListViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

}

- (void)didDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactListViewController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackButtonTitle:", 0);

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[CNContactDataSource shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled](self->_dataSource, "shouldReturnToAccountsAndGroupsViewAfterSearchIsCanceled"))
  {
    -[CNContactListViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentGroupsViewController:", 0);

  }
  -[CNContactListViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearServerSearchIfNeeded:", 0);

}

- (BOOL)showingGroup
{
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    v6 = objc_msgSend(v5, "filterShowsSingleGroup");
  else
    v6 = 0;

  return v6;
}

- (BOOL)isShowingServerSearch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v7;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    v7 = objc_msgSend(v6, "isServerFilter");
  else
    v7 = 0;

  return v7;
}

- (BOOL)isShowingCustomTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;

  objc_opt_class();
  -[CNContactListViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "customDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)contactDataSourceDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CNContactListViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSchedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke;
  v9[3] = &unk_1E2050400;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)contactDataSourceDisplayNameDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setTitle:](self, "setTitle:", v4);

  }
}

- (void)reloadTitle
{
  id v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactDataSource displayName](self->_dataSource, "displayName");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setTitle:](self, "setTitle:", v3);

  }
}

- (void)contactDataSourceMeContactDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSchedulerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CNContactListViewController_contactDataSourceMeContactDidChange___block_invoke;
  v7[3] = &unk_1E204F648;
  v7[4] = self;
  objc_msgSend(v6, "performBlock:", v7);

}

- (void)updateAdditionalSectionsAtTop
{
  -[CNContactListViewController setIsShowingDuplicatesBanner:](self, "setIsShowingDuplicatesBanner:", -[CNContactListViewController shouldShowDuplicateBannerView](self, "shouldShowDuplicateBannerView"));
}

- (void)setImageForContact:(id)a3 imageUpdateBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  CNAvatarImageRenderer *v9;
  void *v10;
  CNAvatarImageRenderer *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[CNContactListViewController avatarRenderer](self, "avatarRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [CNAvatarImageRenderer alloc];
    +[CNAvatarImageRendererSettings defaultSettingsWithCacheSize:](CNAvatarImageRendererSettings, "defaultSettingsWithCacheSize:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNAvatarImageRenderer initWithSettings:](v9, "initWithSettings:", v10);
    -[CNContactListViewController setAvatarRenderer:](self, "setAvatarRenderer:", v11);

  }
  -[CNContactListViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "layoutDirection") == 1;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v13, 0, 48.0, 48.0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListViewController avatarRenderer](self, "avatarRenderer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "avatarImageForContacts:scope:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v19);

}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuggested") ^ 1;

  return v5;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  char v6;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v5 = a4;
  if (!-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v5))
  {
    if (-[CNContactListViewController isPathToDuplicatesBanner:](self, "isPathToDuplicatesBanner:", v5)
      || -[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v5)
      || -[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v5)
      || !-[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v5)|| -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 5)
    {
      v6 = 0;
      goto LABEL_9;
    }
    -[CNContactListViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v11, "contactListViewController:shouldSelectContact:atIndexPath:", self, v10, v5);

      goto LABEL_9;
    }
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v8;

  v5 = a4;
  if (-[CNContactListViewController isPathToDuplicatesBanner:](self, "isPathToDuplicatesBanner:", v5))
  {
    v6 = -[CNContactListViewController canPerformDuplicatesMerge](self, "canPerformDuplicatesMerge");
    goto LABEL_8;
  }
  if (-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v5))
  {
    -[CNContactListViewController createNewContactTapped](self, "createNewContactTapped");
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (-[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v5)
    || -[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v5))
  {
    goto LABEL_7;
  }
  v8 = -[CNContactListViewController canSelectContactAtCollectionViewIndexPath:](self, "canSelectContactAtCollectionViewIndexPath:", v5);
  if (v5)
    v6 = v8;
  else
    v6 = 0;
LABEL_8:

  return v6;
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEditing")
    && (objc_msgSend(v4, "allowsMultipleSelectionDuringEditing") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (!-[CNContactListViewController isPathToDuplicatesBanner:](self, "isPathToDuplicatesBanner:", v6)
    && !-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v6)
    && !-[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v6)
    && !-[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v6))
  {
    if (self->_suggestionsController
      && -[CNContactListViewController allowsMultiSelection](self, "allowsMultiSelection"))
    {
      -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactSuggestionsViewController setCellStateSelected:forContact:animated:](self->_suggestionsController, "setCellStateSelected:forContact:animated:", 1, v7, 0);

    }
    -[CNContactListViewController updateSelectedContactCount](self, "updateSelectedContactCount");
    if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsMultipleSelection");

      if (v9)
      {
        objc_msgSend(v12, "indexPathsForSelectedItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11 <= 1)
          -[CNContactListViewController showCardForSelectedContactAtIndexPath:](self, "showCardForSelectedContactAtIndexPath:", v6);
      }
    }
  }

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CNContactListViewController updateSelectedContactCount](self, "updateSelectedContactCount");
  if (self->_suggestionsController && -[CNContactListViewController allowsMultiSelection](self, "allowsMultiSelection"))
  {
    -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setCellStateSelected:forContact:animated:](self->_suggestionsController, "setCellStateSelected:forContact:animated:", 0, v5, 0);

  }
}

- (void)refreshTableViewHeaderIfVisibleWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNContactListViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[CNContactListViewController refreshTableViewHeaderWithSize:](self, "refreshTableViewHeaderWithSize:", width, height);
  }
}

- (double)contactListHeaderHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0.0;
  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  return v6;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = a3;
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    -[CNContactListViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaInsets");
    v7 = 0.0 - (v6 + 1.0);

    -[CNContactListViewController collectionView](self, "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentOffset:animated:", v3, 0.0, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController scrollToItemAtIndexPath:animated:scrollPosition:](self, "scrollToItemAtIndexPath:animated:scrollPosition:");
  }

}

- (void)refreshTableViewHeaderForContactChanges
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  int v15;
  int v16;

  if (!-[CNContactListViewController isSearchController](self, "isSearchController"))
  {
    if (-[CNContactListViewController shouldDisplayTipContentView](self, "shouldDisplayTipContentView")
      || (-[CNContactListViewController tipKitContentView](self, "tipKitContentView"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
    }
  }
  v4 = -[CNContactListViewController shouldDisplayMeContactBanner](self, "shouldDisplayMeContactBanner");
  v5 = -[CNContactListViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController");
  -[CNContactSuggestionsViewController viewIfLoaded](self->_suggestionsController, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListViewController meContactBanner](self, "meContactBanner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = 1;
  else
    v10 = v5;
  if (v4 && v9 && (v10 & 1) == 0)
  {
    -[CNContactListViewController updateMeContactBannerContentsWithTopKeyline:](self, "updateMeContactBannerContentsWithTopKeyline:", 0);
  }
  else
  {
    if (v9)
      v11 = 1;
    else
      v11 = v4;
    if (v7)
      v12 = v5;
    else
      v12 = 0;
    v13 = v12 & (v11 ^ 1);
    v14 = v13 | v10;
    v15 = v13 ^ 1;
    if (v14)
      v16 = v15;
    else
      v16 = v11;
    if (v16 == 1)
      -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  }
}

- (void)setNeedsHeaderViewUpdate
{
  self->_headerViewNeedsUpdate = 1;
}

- (void)setShouldDisplaySuggestionsController:(BOOL)a3
{
  if (self->_shouldDisplaySuggestionsController != a3)
  {
    self->_shouldDisplaySuggestionsController = a3;
    if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
      -[CNContactListViewController refreshTableViewHeader](self, "refreshTableViewHeader");
  }
}

- (CNContactSuggestionsViewController)suggestionsController
{
  CNContactSuggestionsViewController *suggestionsController;
  CNContactSuggestionsViewController *v4;
  CNContactSuggestionsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  suggestionsController = self->_suggestionsController;
  if (!suggestionsController)
  {
    v4 = objc_alloc_init(CNContactSuggestionsViewController);
    v5 = self->_suggestionsController;
    self->_suggestionsController = v4;

    -[CNContactSuggestionsViewController setDelegate:](self->_suggestionsController, "setDelegate:", self);
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUGGESTED"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setSuggestionsHeaderTitle:](self->_suggestionsController, "setSuggestionsHeaderTitle:", v7);

    -[CNContactSuggestionsViewController setAllowsMultiSelection:](self->_suggestionsController, "setAllowsMultiSelection:", -[CNContactListViewController allowsMultiSelection](self, "allowsMultiSelection"));
    -[CNContactListViewController suggestionsInteractionDomains](self, "suggestionsInteractionDomains");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setInteractionDomains:](self->_suggestionsController, "setInteractionDomains:", v8);

    -[CNContactListViewController suggestedContacts](self, "suggestedContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionsViewController setOverrideSuggestedContacts:](self->_suggestionsController, "setOverrideSuggestedContacts:", v9);

    suggestionsController = self->_suggestionsController;
  }
  return suggestionsController;
}

- (void)setMeContactBannerFootnoteLabel:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_meContactBannerFootnoteLabel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_meContactBannerFootnoteLabel, a3);
    -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
    v5 = v6;
  }

}

- (void)setMeContactBannerFootnoteValue:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_meContactBannerFootnoteValue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_meContactBannerFootnoteValue, a3);
    -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
    v5 = v6;
  }

}

- (BOOL)suggestionsController:(id)a3 canSelectContact:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  char v9;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_msgSend(v8, "contactListViewController:canSelectContact:", self, v5);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)suggestionsController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CNContactListViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CNContactListViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "contactSuggestionViewController:shouldSelectContact:atIndexPath:", v8, v9, v10);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)suggestionsController:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CNContactListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactListViewController:didSelectContact:", self, v6);

  if (-[CNContactListViewController allowsMultiSelection](self, "allowsMultiSelection"))
    -[CNContactListViewController setCellStateSelected:forContact:animated:](self, "setCellStateSelected:forContact:animated:", 1, v6, 0);

}

- (void)suggestionsController:(id)a3 didDeselectContact:(id)a4
{
  id v5;

  v5 = a4;
  if (-[CNContactListViewController allowsMultiSelection](self, "allowsMultiSelection"))
    -[CNContactListViewController setCellStateSelected:forContact:animated:](self, "setCellStateSelected:forContact:animated:", 0, v5, 0);

}

- (id)ignoredContactIdentifiersForSuggestionsController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactListViewController suggestionsIgnoredContactIdentifiers](self, "suggestionsIgnoredContactIdentifiers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)suggestionsController:(id)a3 didChangeToHeight:(double)a4
{
  -[CNContactListViewController setSuggestionsControllerHeight:](self, "setSuggestionsControllerHeight:", a3, a4);
  -[CNContactListViewController refreshTableViewHeader](self, "refreshTableViewHeader");
}

- (void)bannerView:(id)a3 wasSelectedToPresentMeContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CNContactListViewController collectionView](self, "collectionView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        -[CNContactListViewController collectionView](self, "collectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v12, 1);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  v21 = *MEMORY[0x1E0C966E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v5, "copyWithPropertyKeys:", v14);

  -[CNContactListViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contactListViewController:shouldPresentContact:shouldScrollToContact:", self, v15, 0);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  if (sel_isEqual(a3, sel_mergeUnifyContacts_))
  {
    -[CNContactListViewController mergableContacts](self, "mergableContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a3) = v7 != 0;

  }
  else if (sel_isEqual(a3, sel_pasteContacts_))
  {
    a3 = (SEL)*MEMORY[0x1E0D137F8];
    -[CNContactListViewController contactProvidersOnPasteboard](self, "contactProvidersOnPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a3) = (*((uint64_t (**)(SEL, void *))a3 + 2))(a3, v8) ^ 1;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CNContactListViewController;
    LOBYTE(a3) = -[CNContactListViewController canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, v6);
  }

  return (char)a3;
}

- (void)beginSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CNContactListViewController searchController](self, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v10);

  }
  -[CNContactListViewController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isActive"))
  {

    goto LABEL_7;
  }
  v7 = -[CNContactListViewController shouldSearchBarBecomeFirstResponder](self, "shouldSearchBarBecomeFirstResponder");

  if (!v7)
  {
LABEL_7:
    -[CNContactListViewController searchController](self, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);
    goto LABEL_8;
  }
  -[CNContactListViewController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "becomeFirstResponder");

LABEL_8:
}

- (void)cancelSearch:(id)a3
{
  void *v4;
  id v5;

  -[CNContactListViewController searchController](self, "searchController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[CNContactListViewController searchBar](self, "searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", v5);

}

- (void)startSearching
{
  -[CNContactListViewController startSearchingForString:setSearchBarAsFirstResponder:](self, "startSearchingForString:setSearchBarAsFirstResponder:", &stru_1E20507A8, 1);
}

- (void)startSearchingForString:(id)a3 setSearchBarAsFirstResponder:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v13 = a3;
  if (-[CNContactListViewController isViewLoaded](self, "isViewLoaded")
    && (-[CNContactListViewController view](self, "view"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "window"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[CNContactListViewController searchController](self, "searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isActive");

    if (!v9)
    {
      -[CNContactListViewController setPendingSearchQuery:](self, "setPendingSearchQuery:", v13);
      -[CNContactListViewController setShouldSearchBarBecomeFirstResponder:](self, "setShouldSearchBarBecomeFirstResponder:", v4);
      -[CNContactListViewController searchController](self, "searchController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);
      goto LABEL_8;
    }
    -[CNContactListViewController searchController](self, "searchController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v13);

    if (v4)
    {
      -[CNContactListViewController searchBar](self, "searchBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "becomeFirstResponder");
LABEL_8:

    }
  }
  else
  {
    -[CNContactListViewController setPendingSearchQuery:](self, "setPendingSearchQuery:", v13);
    -[CNContactListViewController setShouldSearchBarBecomeFirstResponder:](self, "setShouldSearchBarBecomeFirstResponder:", v4);
    -[CNContactListViewController setPendingSearchControllerActivation:](self, "setPendingSearchControllerActivation:", 1);
  }

}

- (void)deleteContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[CNContactListViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    -[CNContactListViewController contactsForActionsAtIndexPaths:](self, "contactsForActionsAtIndexPaths:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[CNContactListViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    -[CNContactListViewController actionHelper](self, "actionHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteContacts:dataSourceFilter:", v5, v9);

  }
}

- (id)mergableContacts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v6 = 0;
  }
  else
  {
    -[CNContactListViewController contactsForActionsAtIndexPaths:](self, "contactsForActionsAtIndexPaths:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
      v6 = 0;
    else
      v6 = v5;

  }
  return v6;
}

- (void)mergeUnifyContacts:(id)a3
{
  void *v4;
  id v5;

  -[CNContactListViewController mergableContacts](self, "mergableContacts", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNContactListViewController actionHelper](self, "actionHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergeContacts:", v5);

  }
}

- (void)copyContacts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNContactListViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactListViewController contactsForActionsAtIndexPaths:](self, "contactsForActionsAtIndexPaths:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController actionHelper](self, "actionHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "copyContacts:", v5);

}

- (void)dismissKeyboard
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactListViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactListViewController splitViewController](self, "splitViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endEditing:", 1);

  }
}

- (void)selectNextContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactListViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectNextContact:", v4);

}

- (void)selectPreviousContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactListViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectPreviousContact:", v4);

}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;

  v6 = a5;
  if (-[CNContactListViewController shouldAllowDrags](self, "shouldAllowDrags"))
  {
    -[CNContactListViewController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v7;
  void *v8;

  v7 = a5;
  if (-[CNContactListViewController shouldAllowDrags](self, "shouldAllowDrags"))
  {
    -[CNContactListViewController dragItemsForIndexPath:](self, "dragItemsForIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)dragItemsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CNContactListViewController isPathToCreateNewContactRow:](self, "isPathToCreateNewContactRow:", v4)
    || -[CNContactListViewController isPathToDuplicatesBanner:](self, "isPathToDuplicatesBanner:", v4)
    || -[CNContactListViewController isPathToContentUnavailableRow:](self, "isPathToContentUnavailableRow:", v4)
    || -[CNContactListViewController isPathToLimitedAccessTipRow:](self, "isPathToLimitedAccessTipRow:", v4))
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CNContactListViewController _contactAtCollectionViewIndexPath:](self, "_contactAtCollectionViewIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CNContactListViewController contactStore](self, "contactStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNUIDraggingContacts dragItemForContact:withContactStore:](CNUIDraggingContacts, "dragItemForContact:withContactStore:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v5;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactListViewController setupVCardImportController](self, "setupVCardImportController");
  objc_msgSend(v5, "dropSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canLoadObjectsOfClass:", objc_opt_class());

  if (v7)
  {
    objc_msgSend(v5, "dropSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke;
    v14[3] = &unk_1E204BDA8;
    v14[4] = self;
    +[CNUIDraggingContacts provideContactsForDropSession:withKeys:completionBlock:](CNUIDraggingContacts, "provideContactsForDropSession:withKeys:completionBlock:", v8, v9, v14);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v5, "dropSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = *MEMORY[0x1E0CA5B48];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasItemsConformingToTypeIdentifiers:", v11);

  if (v12)
  {
    objc_msgSend(v5, "dropSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke_2;
    v13[3] = &unk_1E204AED0;
    v13[4] = self;
    +[CNUIDraggingContacts provideVCardURLForDropSession:completionBlock:](CNUIDraggingContacts, "provideVCardURLForDropSession:completionBlock:", v8, v13);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return +[CNUIDraggingContacts canAcceptDropForDropSession:](CNUIDraggingContacts, "canAcceptDropForDropSession:", a4);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:dropLocation:", 2, 2);
}

- (void)vCardImportController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[CNContactListViewController splitViewController](self, "splitViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, v5, 0);

}

- (void)vCardImportController:(id)a3 didSaveContacts:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  objc_msgSend(a4, "firstObject", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    -[CNContactListViewController selectContact:animated:scrollPosition:](self, "selectContact:animated:scrollPosition:", v5, 0, 2);
    -[CNContactListViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    v5 = v9;
    if ((v7 & 1) != 0)
    {
      -[CNContactListViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactListViewController:didSelectContact:shouldScrollToContact:", self, v9, 0);

      v5 = v9;
    }
  }

}

- (void)vCardImportControllerDidCompleteQueue:(id)a3
{
  -[CNContactListViewController setVCardImportController:](self, "setVCardImportController:", 0);
}

- (id)contactProvidersOnPasteboard
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v2, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "itemProviders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_filter:", &__block_literal_global_485);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)pasteContacts:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  CNContactListViewController *v24;
  id obj;
  _QWORD block[5];
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v4, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v7 & 1) == 0)
  {
    -[CNContactListViewController setupVCardImportController](self, "setupVCardImportController");
    -[CNContactListViewController contactProvidersOnPasteboard](self, "contactProvidersOnPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v8) & 1) == 0)
    {
      v24 = self;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v23 = v8;
      obj = v8;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v31;
        v12 = (void *)MEMORY[0x1E0C9AA60];
        do
        {
          v13 = 0;
          v14 = v12;
          do
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
            v16 = objc_alloc_init(MEMORY[0x1E0D13B20]);
            v17 = objc_opt_class();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __45__CNContactListViewController_pasteContacts___block_invoke;
            v28[3] = &unk_1E204AF38;
            v29 = v16;
            v18 = v16;
            v19 = (id)objc_msgSend(v15, "loadObjectOfClass:completionHandler:", v17, v28);
            objc_msgSend(v18, "future");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "result:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v21);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            ++v13;
            v14 = v12;
          }
          while (v10 != v13);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v10);
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0C9AA60];
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__CNContactListViewController_pasteContacts___block_invoke_2;
      block[3] = &unk_1E2050400;
      block[4] = v24;
      v27 = v12;
      v22 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v8 = v23;
    }

  }
}

- (void)setupVCardImportController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CNVCardImportController *v9;
  void *v10;
  id v11;

  -[CNContactListViewController vCardImportController](self, "vCardImportController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CNContactListViewController contactStore](self, "contactStore");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[CNContactListViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(v6, "targetGroupForNewContact");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetContainerForNewContactWithTargetGroup:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    v9 = -[CNVCardImportController initWithContactStore:presentationDelegate:targetGroup:targetContainer:]([CNVCardImportController alloc], "initWithContactStore:presentationDelegate:targetGroup:targetContainer:", v11, self, v7, v8);
    -[CNContactListViewController setVCardImportController:](self, "setVCardImportController:", v9);

    -[CNContactListViewController vCardImportController](self, "vCardImportController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

  }
}

- (id)getVisibleIndexPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[CNContactListViewController isViewLoaded](self, "isViewLoaded"))
  {
LABEL_7:
    v4 = 0;
    return v4;
  }
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visibleCells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (objc_msgSend(v4, "count") != v7)
    {
      CNUILogContactList();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v4, "count");
        -[CNContactListViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "visibleCells");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 134218240;
        v14 = v10;
        v15 = 2048;
        v16 = objc_msgSend(v12, "count");
        _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "indexPathsForVisibleRows.count %lu != visibleCells.count = %lu", (uint8_t *)&v13, 0x16u);

      }
      goto LABEL_7;
    }
  }
  return v4;
}

- (BOOL)isShowingLimitedAccessTip
{
  return !-[CNContactListViewController hasNoContacts](self, "hasNoContacts")
      && -[CNContactListViewController shouldShowLimitedAccessTip](self, "shouldShowLimitedAccessTip");
}

- (BOOL)isLimitedAccessTipRowSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip");
  if (v5)
    LOBYTE(v5) = -[CNContactListViewController limitedAccessTipSection](self, "limitedAccessTipSection") == a3;
  return v5;
}

- (int64_t)limitedAccessTipSection
{
  return -[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip") - 1;
}

- (id)pathToLimitedAccessTipRow
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNContactListViewController_pathToLimitedAccessTipRow__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  if (pathToLimitedAccessTipRow_cn_once_token_17 != -1)
    dispatch_once(&pathToLimitedAccessTipRow_cn_once_token_17, block);
  return (id)pathToLimitedAccessTipRow_cn_once_object_17;
}

- (BOOL)isPathToLimitedAccessTipRow:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (-[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip"))
  {
    -[CNContactListViewController pathToLimitedAccessTipRow](self, "pathToLimitedAccessTipRow");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5 == v4;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsPathToLimitedAccessTipRow:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CNContactListViewController_containsPathToLimitedAccessTipRow___block_invoke;
  v4[3] = &unk_1E204AF60;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (id)appName
{
  void *v3;
  void *v4;

  -[CNContactListViewController limitedAccessAppName](self, "limitedAccessAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    -[CNContactListViewController limitedAccessAppBundleId](self, "limitedAccessAppBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLimitedAccessPickerSupport appNameForBundleId:](CNLimitedAccessPickerSupport, "appNameForBundleId:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListViewController setLimitedAccessAppName:](self, "setLimitedAccessAppName:", v3);
  }
  return v3;
}

- (id)limitedAccessTipCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[CNContactListViewController pathToLimitedAccessTipRow](self, "pathToLimitedAccessTipRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)updateDataSourceAndCollectionViewForLimitedAccessTip
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__CNContactListViewController_updateDataSourceAndCollectionViewForLimitedAccessTip__block_invoke;
    v6[3] = &unk_1E204F648;
    v6[4] = self;
    objc_msgSend(v5, "performBatchUpdates:completion:", v6, 0);

  }
}

- (void)limitedAccessTipCellDidTapDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (-[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip", a3))
  {
    -[CNContactListViewController limitedAccessTipCell](self, "limitedAccessTipCell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[CNContactListViewController setShouldShowLimitedAccessTip:](self, "setShouldShowLimitedAccessTip:", 0);
    objc_opt_class();
    -[CNContactListViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "setHasIcon:", 1);
    -[CNContactListViewController updateDataSourceAndCollectionViewForLimitedAccessTip](self, "updateDataSourceAndCollectionViewForLimitedAccessTip");
    -[CNContactListViewController limitedAccessAppBundleId](self, "limitedAccessAppBundleId");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[CNPrivateAccessAggregator recordPickerTipDismissalForBundleIdentifier:](CNPrivateAccessAggregator, "recordPickerTipDismissalForBundleIdentifier:", v9);

  }
}

- (void)setupViewWithLimitedAccessContactSelection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessWithMultiSelect:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
  {
    -[CNContactListViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLimitedAccessPickerSupport contactsFromIdentifiers:](CNLimitedAccessPickerSupport, "contactsFromIdentifiers:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          -[CNContactListViewController selectContact:animated:scrollPosition:shouldScroll:](self, "selectContact:animated:scrollPosition:shouldScroll:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++), 0, 0, 0, (_QWORD)v16);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v11 = (void *)MEMORY[0x1E0C99E60];
    -[CNContactListViewController selectedContacts](self, "selectedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cn_map:", &__block_literal_global_528);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactListViewController contactSelectionOnViewLoad](self, "contactSelectionOnViewLoad");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      -[CNContactListViewController setLimitedAccessContactSelection:](self, "setLimitedAccessContactSelection:", v14);
    -[CNContactListViewController setContactSelectionOnViewLoad:](self, "setContactSelectionOnViewLoad:", v14, (_QWORD)v16);

  }
}

- (id)limitedAccessContactsFromCurrentSelection
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
  NSObject *v14;
  NSObject *v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessWithMultiSelect:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
  {
    -[CNContactListViewController limitedAccessContactSelection](self, "limitedAccessContactSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = (void *)MEMORY[0x1E0C99E20];
    -[CNContactListViewController selectedContacts](self, "selectedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_528);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E20];
    -[CNContactListViewController contactSelectionOnViewLoad](self, "contactSelectionOnViewLoad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "minusSet:", v8);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController contactSelectionOnViewLoad](self, "contactSelectionOnViewLoad");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v13);

    CNUILogContactList();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = objc_msgSend(v11, "count");
      _os_log_debug_impl(&dword_18AC56000, v14, OS_LOG_TYPE_DEBUG, "Limited picker: %lu contacts deselected since table load", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v4, "minusSet:", v11);
    CNUILogContactList();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v12, "count");
      v18 = 134217984;
      v19 = v17;
      _os_log_debug_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEBUG, "Limited picker: %lu contacts selected since table load", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v4, "unionSet:", v12);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)updatelimitedAccessContactSelection
{
  id v3;

  -[CNContactListViewController limitedAccessContactsFromCurrentSelection](self, "limitedAccessContactsFromCurrentSelection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController setLimitedAccessContactSelection:](self, "setLimitedAccessContactSelection:", v3);

}

- (void)didResetLimitedAccessSelectionTo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CNUILogContactList();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v4, "count");
    _os_log_debug_impl(&dword_18AC56000, v5, OS_LOG_TYPE_DEBUG, "Reset Limited to %lu contacts", buf, 0xCu);
  }

  if (-[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType") == 5)
  {
    objc_opt_class();
    -[CNContactListViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "filter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLimitedAccessIdentifiers:", v4);

    objc_msgSend(v8, "reloadAsynchronously");
    v10 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v12, objc_msgSend(v4, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrompt:", v13);

    -[CNContactListViewController setLimitedAccessContactSelection:](self, "setLimitedAccessContactSelection:", v4);
  }
  else
  {
    -[CNContactListViewController deselectAllSelectedIndexPathsAnimated:](self, "deselectAllSelectedIndexPathsAnimated:", 0);
    -[CNContactListViewController setLimitedAccessContactSelection:](self, "setLimitedAccessContactSelection:", v4);
    -[CNContactListViewController setupViewWithLimitedAccessContactSelection](self, "setupViewWithLimitedAccessContactSelection");
    -[CNContactListViewController updateInResponseToLimitedAccessSelectionChanged](self, "updateInResponseToLimitedAccessSelectionChanged");
  }

}

- (void)updateInResponseToLimitedAccessSelectionChanged
{
  void *v3;
  id v4;

  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithMultiSelect:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessWithMultiSelect:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
  {
    -[CNContactListViewController limitedAccessContactsFromCurrentSelection](self, "limitedAccessContactsFromCurrentSelection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "didUpdateLimitedAccessSelection:", v4);
    -[CNContactListViewController updateSelectAllButtonTitle](self, "updateSelectAllButtonTitle");
    -[CNContactListViewController updateNavTitleWithCount:](self, "updateNavTitleWithCount:", objc_msgSend(v4, "count"));

  }
}

- (BOOL)hasAllRowsSelected
{
  CNContactListViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = self;
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = -[CNContactListViewController totalNumberOfRows](v2, "totalNumberOfRows");
  LOBYTE(v2) = v5 == v6
                   - -[CNContactListViewController additionalSectionsAtTopCount](v2, "additionalSectionsAtTopCount");

  return (char)v2;
}

- (unint64_t)totalNumberOfRows
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  if (v4 < 1)
    return 0;
  v5 = 0;
  v6 = 0;
  do
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 += objc_msgSend(v7, "numberOfItemsInSection:", v5);

    ++v5;
    -[CNContactListViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfSections");

  }
  while (v5 < v9);
  return v6;
}

- (void)selectAllIndexPathsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v5 = -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount");
  -[CNContactListViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSections");

  if (v5 < v7)
  {
    do
    {
      -[CNContactListViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "numberOfItemsInSection:", v5);

      if (v9 >= 1)
      {
        v10 = 0;
        do
        {
          -[CNContactListViewController collectionView](self, "collectionView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v10, v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v12, v3, 0);

          ++v10;
          -[CNContactListViewController collectionView](self, "collectionView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "numberOfItemsInSection:", v5);

        }
        while (v10 < v14);
      }
      ++v5;
      -[CNContactListViewController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "numberOfSections");

    }
    while (v5 < v16);
  }
}

- (void)handleSelectAllTapped
{
  if (-[CNContactListViewController hasAllRowsSelected](self, "hasAllRowsSelected"))
    -[CNContactListViewController deselectAllSelectedIndexPathsAnimated:](self, "deselectAllSelectedIndexPathsAnimated:", 1);
  else
    -[CNContactListViewController selectAllIndexPathsAnimated:](self, "selectAllIndexPathsAnimated:", 1);
  -[CNContactListViewController updateInResponseToLimitedAccessSelectionChanged](self, "updateInResponseToLimitedAccessSelectionChanged");
}

- (void)addSelectButtonView
{
  void *v3;
  unint64_t v4;
  id v5;
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
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (+[CNLimitedAccessPickerSupport isPickerLimitedAccessWithLists:](CNLimitedAccessPickerSupport, "isPickerLimitedAccessWithLists:", -[CNContactListViewController limitedAccessPickerType](self, "limitedAccessPickerType")))
  {
    -[CNContactListViewController selectButtonView](self, "selectButtonView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      if (-[CNContactListViewController showingGroup](self, "showingGroup"))
      {
        v4 = -[CNContactListViewController totalNumberOfRows](self, "totalNumberOfRows");
        if (v4 - -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount") >= 6)
        {
          v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
          objc_msgSend(v5, "setClipsToBounds:", 1);
          objc_msgSend(v5, "setAutoresizingMask:", 2);
          objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
          objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "background");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBackgroundColor:", v7);

          objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "background");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setVisualEffect:", v9);

          objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setBaseForegroundColor:", v11);

          objc_msgSend(v6, "setCornerStyle:", 4);
          objc_msgSend(v6, "setButtonSize:", 2);
          objc_msgSend(v6, "setContentInsets:", 6.0, 10.0, 6.0, 10.0);
          CNContactsUIBundle();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECT_ALL"), &stru_1E20507A8, CFSTR("Localized"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setTitle:", v13);

          objc_msgSend(v6, "setTitleTextAttributesTransformer:", &__block_literal_global_506);
          objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_handleSelectAllTapped, 64);
          objc_msgSend(v5, "addSubview:", v14);
          -[CNContactListViewController setSelectButton:](self, "setSelectButton:", v14);
          -[CNContactListViewController selectButton](self, "selectButton");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "centerYAnchor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v5;
          objc_msgSend(v5, "centerYAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "constraintEqualToAnchor:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = v16;
          -[CNContactListViewController selectButton](self, "selectButton");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "centerXAnchor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "centerXAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "constraintEqualToAnchor:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
          -[CNContactListViewController view](self, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addSubview:", v24);

          -[CNContactListViewController setSelectButtonView:](self, "setSelectButtonView:", v24);
        }
      }
    }
  }
}

- (float)selectAllButtonOffsetAccountingForSectionHeaders
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  _BOOL4 v7;

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  v5 = -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount") + 1;

  LODWORD(v6) = 8.0;
  if (v4 > v5)
  {
    v7 = -[CNContactListViewController isShowingLimitedAccessTip](self, "isShowingLimitedAccessTip", v6);
    LODWORD(v6) = -1036779520;
    if (v7)
      *(float *)&v6 = -40.0;
  }
  return *(float *)&v6;
}

- (void)layoutSelectButtonView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  float v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, -[CNContactListViewController additionalSectionsAtTopCount](self, "additionalSectionsAtTopCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactListViewController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CNContactListViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
  v16 = v15;

  -[CNContactListViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  -[CNContactListViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutMargins");
  v22 = v19 - v21;
  -[CNContactListViewController selectButton](self, "selectButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v22 - v24 + -20.0;

  -[CNContactListViewController searchBar](self, "searchBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bounds");
  v28 = v16 + v27;
  -[CNContactListViewController selectAllButtonOffsetAccountingForSectionHeaders](self, "selectAllButtonOffsetAccountingForSectionHeaders");
  v30 = v28 + v29;

  -[CNContactListViewController selectButton](self, "selectButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = v32;

  -[CNContactListViewController selectButton](self, "selectButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35;

  -[CNContactListViewController selectButtonView](self, "selectButtonView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v25, v30, v36, v33);

}

- (void)updateSelectAllButtonTitle
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNContactListViewController selectButtonView](self, "selectButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[CNContactListViewController hasAllRowsSelected](self, "hasAllRowsSelected");
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("LIMITED_CONTACTS_DESELECT_ALL");
    else
      v7 = CFSTR("LIMITED_CONTACTS_SELECT_ALL");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E20507A8, CFSTR("Localized"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[CNContactListViewController selectButton](self, "selectButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:forState:", v11, 0);

    -[CNContactListViewController selectButton](self, "selectButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsLayout");

    -[CNContactListViewController selectButton](self, "selectButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

    -[CNContactListViewController layoutSelectButtonView](self, "layoutSelectButtonView");
  }
}

- (void)updateNavTitleWithCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[CNContactListViewController isShowingCustomTitle](self, "isShowingCustomTitle"))
  {
    objc_opt_class();
    -[CNContactListViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SELECTED_COUNT"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCustomDisplayName:", v12);

    -[CNContactListViewController reloadTitle](self, "reloadTitle");
  }
}

- (BOOL)shouldShowDuplicateBannerView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;

  if (!-[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
    return 0;
  objc_opt_class();
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && objc_msgSend(v5, "contactCount") >= 1 && self->_duplicatesController)
  {
    -[CNContactListViewController duplicatesController](self, "duplicatesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "wantsToDisplayNewDuplicatesBanner:", 3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)newDuplicatesCountToDisplay
{
  if (self->_duplicatesController
    && -[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
  {
    return -[CNDuplicateContactsController newDuplicatesCount](self->_duplicatesController, "newDuplicatesCount");
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformDuplicatesMerge
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;

  if (!-[CNContactListViewController canManageDuplicateContacts](self, "canManageDuplicateContacts"))
    return 0;
  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEditing") & 1) != 0)
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsMultipleSelectionDuringEditing");

    if ((v5 & 1) != 0)
      return 0;
  }
  else
  {

  }
  -[CNContactListViewController duplicatesController](self, "duplicatesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canMergeDuplicates");

  return v8;
}

- (void)didSelectViewAllDuplicates
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 8);

  if (v5)
  {
    if (-[CNContactListViewController isSearching](self, "isSearching"))
      -[CNContactListViewController cancelSearch:](self, "cancelSearch:", self);
    -[CNContactListViewController duplicatesController](self, "duplicatesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentSheetBasedMergeForController:showsIgnored:", self, 1);

    -[CNContactListViewController deselectAllSelectedIndexPathsAnimated:](self, "deselectAllSelectedIndexPathsAnimated:", 0);
  }
}

- (void)refreshDuplicatesBanner
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainThreadScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__CNContactListViewController_refreshDuplicatesBanner__block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "performBlock:", v6);

}

- (void)removeDuplicatesBanner
{
  id v3;

  if (-[CNContactListViewController isShowingDuplicatesBanner](self, "isShowingDuplicatesBanner"))
  {
    -[CNContactListViewController duplicatesBannerCell](self, "duplicatesBannerCell");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", 0);
    -[CNContactListViewController updateDataSourceAndCollectionViewForDuplicatesBanner](self, "updateDataSourceAndCollectionViewForDuplicatesBanner");

  }
}

- (id)duplicatesBannerCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[CNContactListViewController pathToDuplicatesBanner](self, "pathToDuplicatesBanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)updateDuplicatesBannerForProcessingState
{
  void *v3;
  id v4;

  -[CNContactListViewController duplicatesBannerCell](self, "duplicatesBannerCell");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNContactListViewController duplicatesController](self, "duplicatesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decorateBannerViewCell:", v4);

  }
}

- (void)updateDataSourceAndCollectionViewForDuplicatesBanner
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[CNContactListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactListViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__CNContactListViewController_updateDataSourceAndCollectionViewForDuplicatesBanner__block_invoke;
    v7[3] = &unk_1E204F648;
    v7[4] = self;
    objc_msgSend(v5, "performBatchUpdates:completion:", v7, 0);

  }
  else
  {
    -[CNContactListViewController updateAdditionalSectionsAtTop](self, "updateAdditionalSectionsAtTop");
    -[CNContactListViewController collectionView](self, "collectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (id)pathToDuplicatesBanner
{
  if (pathToDuplicatesBanner_cn_once_token_28 != -1)
    dispatch_once(&pathToDuplicatesBanner_cn_once_token_28, &__block_literal_global_524);
  return (id)pathToDuplicatesBanner_cn_once_object_28;
}

- (BOOL)containsPathToDuplicatesBanner:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CNContactListViewController_containsPathToDuplicatesBanner___block_invoke;
  v4[3] = &unk_1E204AF60;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (void)duplicatesDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 8);

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__CNContactListViewController_duplicatesDidChange___block_invoke;
    v7[3] = &unk_1E204F320;
    v7[4] = self;
    -[CNContactListViewController fetchDuplicatesCountWithCompletionBlock:](self, "fetchDuplicatesCountWithCompletionBlock:", v7);
  }
}

- (void)willPerformDuplicatesMergeAll:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 8);

  if (v6)
    -[CNContactListViewController refreshDuplicatesBanner](self, "refreshDuplicatesBanner");
}

- (void)didPerformDuplicatesMerge:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled:", 8);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schedulerProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainThreadScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke;
    v10[3] = &unk_1E204F648;
    v10[4] = self;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

- (BOOL)isPerformingDuplicatesMerge
{
  void *v2;
  char v3;

  if (!self->_duplicatesController)
    return 0;
  -[CNContactListViewController duplicatesController](self, "duplicatesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPerformingMerge");

  return v3;
}

- (int64_t)createNewContactRowSection
{
  return -[CNContactListViewController shouldDisplayCreateNewContactAsRow](self, "shouldDisplayCreateNewContactAsRow")
       - 1;
}

- (int64_t)contentUnavailableRowSection
{
  return -[CNContactListViewController isDisplayingContentUnavailableViewAsCell](self, "isDisplayingContentUnavailableViewAsCell")- 1;
}

- (BOOL)containsPathToCreateNewContactRow:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CNContactListViewController_containsPathToCreateNewContactRow___block_invoke;
  v4[3] = &unk_1E204AF60;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (BOOL)containsPathToContentUnavailableRow:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactListViewController_containsPathToContentUnavailableRow___block_invoke;
  v4[3] = &unk_1E204AF60;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

- (id)pathToCreateNewContactRow
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CNContactListViewController_pathToCreateNewContactRow__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  if (pathToCreateNewContactRow_cn_once_token_29 != -1)
    dispatch_once(&pathToCreateNewContactRow_cn_once_token_29, block);
  return (id)pathToCreateNewContactRow_cn_once_object_29;
}

- (id)pathToContentUnavailableRow
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CNContactListViewController_pathToContentUnavailableRow__block_invoke;
  block[3] = &unk_1E204F648;
  block[4] = self;
  if (pathToContentUnavailableRow_cn_once_token_30 != -1)
    dispatch_once(&pathToContentUnavailableRow_cn_once_token_30, block);
  return (id)pathToContentUnavailableRow_cn_once_object_30;
}

- (void)createNewContactTapped
{
  void *v3;
  char v4;
  id v5;

  -[CNContactListViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNContactListViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactListViewControllerSelectedCreateNewContact:", self);

  }
}

- (void)addContactsToListTappedWithSourceView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactListViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactListViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactListViewControllerSelectedAddContactToList:withSourceView:", self, v7);

  }
}

- (void)duplicatesBannerCellDidTapDismiss:(id)a3
{
  void *v4;

  -[CNContactListViewController duplicatesController](self, "duplicatesController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ignoreNewDuplicatesBanner");

  -[CNContactListViewController removeDuplicatesBanner](self, "removeDuplicatesBanner");
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  self->_allowsMultiSelection = a3;
}

- (CNContactListSearchController)searchController
{
  return self->_searchController;
}

- (id)searchCompletionBlock
{
  return self->_searchCompletionBlock;
}

- (void)setSearchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (void)setSuggestionsController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsController, a3);
}

- (double)suggestionsControllerHeight
{
  return self->_suggestionsControllerHeight;
}

- (void)setSuggestionsControllerHeight:(double)a3
{
  self->_suggestionsControllerHeight = a3;
}

- (void)setMeContactBanner:(id)a3
{
  objc_storeStrong((id *)&self->_meContactBanner, a3);
}

- (double)contentOffsetDueToMeContactBanner
{
  return self->_contentOffsetDueToMeContactBanner;
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRenderer, a3);
}

- (NSString)pendingSearchQuery
{
  return self->_pendingSearchQuery;
}

- (void)setPendingSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSearchQuery, a3);
}

- (BOOL)shouldSearchBarBecomeFirstResponder
{
  return self->_shouldSearchBarBecomeFirstResponder;
}

- (void)setShouldSearchBarBecomeFirstResponder:(BOOL)a3
{
  self->_shouldSearchBarBecomeFirstResponder = a3;
}

- (void)setPendingSearchControllerActivation:(BOOL)a3
{
  self->_pendingSearchControllerActivation = a3;
}

- (CNVCardImportController)vCardImportController
{
  return self->_vCardImportController;
}

- (void)setVCardImportController:(id)a3
{
  objc_storeStrong((id *)&self->_vCardImportController, a3);
}

- (BOOL)headerViewNeedsUpdate
{
  return self->_headerViewNeedsUpdate;
}

- (void)setHeaderViewNeedsUpdate:(BOOL)a3
{
  self->_headerViewNeedsUpdate = a3;
}

- (void)setEmergencyContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContactIdentifiers, a3);
}

- (CNHealthStoreManagerToken)medicalIDLookupRegistrationToken
{
  return self->_medicalIDLookupRegistrationToken;
}

- (CNContactListStyleApplier)defaultContactListStyleApplier
{
  return self->_defaultContactListStyleApplier;
}

- (void)setDefaultContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContactListStyleApplier, a3);
}

- (void)setIndexPathToSelect:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathToSelect, a3);
}

- (void)setActionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionHelper, a3);
}

- (void)setDuplicatesController:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatesController, a3);
}

- (BOOL)isDuplicatesLaunching
{
  return self->_isDuplicatesLaunching;
}

- (void)setIsViewingTopLevelAllContacts:(BOOL)a3
{
  self->_isViewingTopLevelAllContacts = a3;
}

- (void)setIsShowingDuplicatesBanner:(BOOL)a3
{
  self->_isShowingDuplicatesBanner = a3;
}

- (BOOL)isCurrentViewStillOpen
{
  return self->_isCurrentViewStillOpen;
}

- (void)setIsCurrentViewStillOpen:(BOOL)a3
{
  self->_isCurrentViewStillOpen = a3;
}

- (NSSet)contactSelectionOnViewLoad
{
  return self->_contactSelectionOnViewLoad;
}

- (void)setContactSelectionOnViewLoad:(id)a3
{
  objc_storeStrong((id *)&self->_contactSelectionOnViewLoad, a3);
}

- (UIView)selectButtonView
{
  return self->_selectButtonView;
}

- (void)setSelectButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_selectButtonView, a3);
}

- (UIButton)selectButton
{
  return self->_selectButton;
}

- (void)setSelectButton:(id)a3
{
  objc_storeStrong((id *)&self->_selectButton, a3);
}

- (BOOL)shouldShowLimitedAccessTip
{
  return self->_shouldShowLimitedAccessTip;
}

- (void)setShouldShowLimitedAccessTip:(BOOL)a3
{
  self->_shouldShowLimitedAccessTip = a3;
}

- (void)setIsHandlingSearch:(BOOL)a3
{
  self->_isHandlingSearch = a3;
}

- (BOOL)shouldDisplayGroupsGrid
{
  return self->_shouldDisplayGroupsGrid;
}

- (void)setShouldDisplayGroupsGrid:(BOOL)a3
{
  self->_shouldDisplayGroupsGrid = a3;
}

- (void)setShouldDisplayEmergencyContacts:(BOOL)a3
{
  self->_shouldDisplayEmergencyContacts = a3;
}

- (BOOL)shouldAllowSearchForMultiSelect
{
  return self->_shouldAllowSearchForMultiSelect;
}

- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3
{
  self->_shouldAllowSearchForMultiSelect = a3;
}

- (NSArray)suggestionsIgnoredContactIdentifiers
{
  return self->_suggestionsIgnoredContactIdentifiers;
}

- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, a3);
}

- (NSArray)suggestionsInteractionDomains
{
  return self->_suggestionsInteractionDomains;
}

- (void)setSuggestionsInteractionDomains:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, a3);
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContacts, a3);
}

- (double)estimatedListHeaderViewHeight
{
  return self->_estimatedListHeaderViewHeight;
}

- (void)setAllowsEditingActions:(BOOL)a3
{
  self->_allowsEditingActions = a3;
}

- (BOOL)allowsListEditing
{
  return self->_allowsListEditing;
}

- (void)setAllowsListEditing:(BOOL)a3
{
  self->_allowsListEditing = a3;
}

- (void)setShouldDisplayAddNewContactRow:(BOOL)a3
{
  self->_shouldDisplayAddNewContactRow = a3;
}

- (NSSet)limitedAccessContactSelection
{
  return self->_limitedAccessContactSelection;
}

- (void)setLimitedAccessContactSelection:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, a3);
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (NSString)limitedAccessAppName
{
  return self->_limitedAccessAppName;
}

- (void)setLimitedAccessAppName:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppName, a3);
}

- (NSString)limitedAccessAppBundleId
{
  return self->_limitedAccessAppBundleId;
}

- (void)setLimitedAccessAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, a3);
}

- (BOOL)hasPickerPrivacyUI
{
  return self->_hasPickerPrivacyUI;
}

- (void)setHasPickerPrivacyUI:(BOOL)a3
{
  self->_hasPickerPrivacyUI = a3;
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_listHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_selectButton, 0);
  objc_storeStrong((id *)&self->_selectButtonView, 0);
  objc_storeStrong((id *)&self->_contactSelectionOnViewLoad, 0);
  objc_storeStrong((id *)&self->_cellContentUnavailableConfiguration, 0);
  objc_storeStrong((id *)&self->_duplicatesController, 0);
  objc_storeStrong((id *)&self->_actionHelper, 0);
  objc_storeStrong((id *)&self->_indexPathToSelect, 0);
  objc_storeStrong((id *)&self->_defaultContactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupToken, 0);
  objc_storeStrong((id *)&self->_medicalIDLookupRegistrationToken, 0);
  objc_storeStrong((id *)&self->_emergencyContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_vCardImportController, 0);
  objc_storeStrong((id *)&self->_pendingSearchQuery, 0);
  objc_storeStrong((id *)&self->_pendingLayoutBlocks, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_meBannerAvatarController, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_meContactBanner, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong(&self->_searchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_meContactBannerFootnoteValue, 0);
  objc_storeStrong((id *)&self->_meContactBannerFootnoteLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredForNameMeContact, 0);
}

void __58__CNContactListViewController_pathToContentUnavailableRow__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "contentUnavailableRowSection"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pathToContentUnavailableRow_cn_once_object_30;
  pathToContentUnavailableRow_cn_once_object_30 = v1;

}

void __56__CNContactListViewController_pathToCreateNewContactRow__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "createNewContactRowSection"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pathToCreateNewContactRow_cn_once_object_29;
  pathToCreateNewContactRow_cn_once_object_29 = v1;

}

uint64_t __67__CNContactListViewController_containsPathToContentUnavailableRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPathToContentUnavailableRow:", a2);
}

uint64_t __65__CNContactListViewController_containsPathToCreateNewContactRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPathToCreateNewContactRow:", a2);
}

void __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reconfigureItemsAtIndexPaths:", v5);

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke_2;
  v10[3] = &unk_1E204F648;
  v10[4] = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(v8, "afterDelay:performBlock:", v10, 3.0);

}

uint64_t __57__CNContactListViewController_didPerformDuplicatesMerge___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "shouldShowDuplicateBannerView");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "removeDuplicatesBanner");
  return result;
}

void __51__CNContactListViewController_duplicatesDidChange___block_invoke(uint64_t a1, char a2)
{
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPerformingDuplicatesMerge") & 1) == 0)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "isShowingDuplicatesBanner");
    v5 = v4 ^ objc_msgSend(*(id *)(a1 + 32), "shouldShowDuplicateBannerView");
    if ((a2 & 1) != 0 || v5)
    {
      v6 = *(void **)(a1 + 32);
      if (v5)
      {
        objc_msgSend(v6, "refreshDuplicatesBanner");
      }
      else
      {
        objc_msgSend(v6, "duplicatesBannerCell");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "state");
        objc_msgSend(*(id *)(a1 + 32), "updateDuplicatesBannerForProcessingState");
        if (v7 != objc_msgSend(v10, "state"))
        {
          objc_msgSend(*(id *)(a1 + 32), "collectionView");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "collectionViewLayout");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "invalidateLayout");

        }
      }
    }
  }
}

uint64_t __62__CNContactListViewController_containsPathToDuplicatesBanner___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPathToDuplicatesBanner:", a2);
}

void __53__CNContactListViewController_pathToDuplicatesBanner__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pathToDuplicatesBanner_cn_once_object_28;
  pathToDuplicatesBanner_cn_once_object_28 = v0;

}

void __83__CNContactListViewController_updateDataSourceAndCollectionViewForDuplicatesBanner__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  objc_msgSend(*(id *)(a1 + 32), "updateAdditionalSectionsAtTop");
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  objc_msgSend(*(id *)(a1 + 32), "pathToDuplicatesBanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    CNUILogContactList();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
      *(_DWORD *)buf = 134349056;
      v16 = v7;
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: reloading indexPath for banner | additional sections at top: %{public}ld", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsAtIndexPaths:", v9);
  }
  else
  {
    CNUILogContactList();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v3 >= v4)
    {
      if (v11)
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
        *(_DWORD *)buf = 134349056;
        v16 = v13;
        _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: deleting section | additional sections at top: %{public}ld", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteSections:", v9);
    }
    else
    {
      if (v11)
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
        *(_DWORD *)buf = 134349056;
        v16 = v12;
        _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_INFO, "Refreshing duplicates banner: inserting section | additional sections at top: %{public}ld", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSections:", v9);
    }
  }

}

uint64_t __54__CNContactListViewController_refreshDuplicatesBanner__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldShowDuplicateBannerView");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "updateDataSourceAndCollectionViewForDuplicatesBanner");
  else
    return objc_msgSend(v3, "removeDuplicatesBanner");
}

uint64_t __58__CNContactListViewController_initializeDuplicateContacts__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "duplicatesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findDuplicates");

  return objc_msgSend(*(id *)(a1 + 32), "updateDuplicatesCountBanner");
}

id __50__CNContactListViewController_addSelectButtonView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 16.0, *MEMORY[0x1E0DC1440]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1138]);

  return v2;
}

void __83__CNContactListViewController_updateDataSourceAndCollectionViewForLimitedAccessTip__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  objc_msgSend(*(id *)(a1 + 32), "updateAdditionalSectionsAtTop");
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  objc_msgSend(*(id *)(a1 + 32), "pathToLimitedAccessTipRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    CNUILogContactList();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
      *(_DWORD *)buf = 134217984;
      v16 = v11;
      _os_log_debug_impl(&dword_18AC56000, v6, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: reloading indexPath for banner | additional sections at top: %ld", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadItemsAtIndexPaths:", v8);
  }
  else
  {
    CNUILogContactList();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v3 >= v4)
    {
      if (v10)
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
        *(_DWORD *)buf = 134217984;
        v16 = v13;
        _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: deleting section | additional sections at top: %ld", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deleteSections:", v8);
    }
    else
    {
      if (v10)
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "additionalSectionsAtTopCount");
        *(_DWORD *)buf = 134217984;
        v16 = v12;
        _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, "Refreshing duplicates banner: inserting section | additional sections at top: %ld", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v5, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertSections:", v8);
    }
  }

}

uint64_t __65__CNContactListViewController_containsPathToLimitedAccessTipRow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPathToLimitedAccessTipRow:", a2);
}

void __56__CNContactListViewController_pathToLimitedAccessTipRow__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "limitedAccessTipSection"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)pathToLimitedAccessTipRow_cn_once_object_17;
  pathToLimitedAccessTipRow_cn_once_object_17 = v1;

}

uint64_t __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterHandlerForToken:", *(_QWORD *)(a1 + 40));
}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultSchedulerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_3;
  v6[3] = &unk_1E2050400;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "performBlock:", v6);

}

void __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  objc_msgSend(*(id *)(a1 + 32), "getVisibleIndexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_4;
    aBlock[3] = &unk_1E204AF60;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v3 = _Block_copy(aBlock);
    objc_msgSend(v2, "_cn_filter:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setEmergencyContactIdentifiers:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "_cn_filter:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadData");

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setEmergencyContactIdentifiers:", *(_QWORD *)(a1 + 40));
  }

}

uint64_t __61__CNContactListViewController_startHandlingEmergencyContacts__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_contactAtCollectionViewIndexPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isContactWithIdentifierEmergencyContact:", v5);

  return v6;
}

void __45__CNContactListViewController_pasteContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNUIDraggingContacts contactsFromDraggingContacts:withKeys:](CNUIDraggingContacts, "contactsFromDraggingContacts:withKeys:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AA60]);
  }

}

void __45__CNContactListViewController_pasteContacts___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "vCardImportController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueueContacts:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__CNContactListViewController_contactProvidersOnPasteboard__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "canLoadObjectOfClass:", objc_opt_class());

  return v3;
}

void __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "vCardImportController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enqueueContacts:", v4);

  }
}

void __73__CNContactListViewController_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "vCardImportController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueContactsAtURL:", v3);

}

void __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_3;
  v18[3] = &unk_1E204ADC8;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 104);
  v21 = *(_OWORD *)(a1 + 88);
  v22 = v4;
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_4;
  v9[3] = &unk_1E204ADF0;
  v5 = *(id *)(a1 + 40);
  v15 = *(_OWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 136);
  v16 = *(_OWORD *)(a1 + 120);
  v17 = v8;
  v14 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "animateWithDuration:animations:completion:", v18, v9, 0.33);

}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56) + *(double *)(a1 + 72));
}

uint64_t __62__CNContactListViewController_refreshTableViewHeaderWithSize___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "tipKitDismissTip");
  if (!*(_QWORD *)(a1 + 48))
  {
    v2 = 0.0;
    if (!*(_QWORD *)(a1 + 56))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = 0;

      return objc_msgSend(*(id *)(a1 + 40), "setListHeaderView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    }
    goto LABEL_5;
  }
  v2 = *(double *)(a1 + 104);
  if (*(_QWORD *)(a1 + 56))
  {
LABEL_5:
    v3 = *(double *)(a1 + 120);
    goto LABEL_6;
  }
  v3 = 0.0;
LABEL_6:
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56) = v2 + v3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "setEstimatedListHeaderViewHeight:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56));
  return objc_msgSend(*(id *)(a1 + 40), "setListHeaderView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

uint64_t __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createNewContactTapped");
}

uint64_t __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvatarImage:", a2);
}

void __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPathForCell:", WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3F10];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_4;
      v8[3] = &unk_1E2050400;
      v8[4] = v3;
      v9 = v5;
      objc_msgSend(v6, "performWithoutAnimation:", v8);

    }
  }
}

void __69__CNContactListViewController_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", v3);

}

uint64_t __67__CNContactListViewController_contactDataSourceMeContactDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1008);
  *(_QWORD *)(v2 + 1008) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "refreshTableViewHeaderForContactChanges");
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateIsViewingTopLevelAllContacts");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v4);

  }
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_2;
  v21[3] = &unk_1E2050400;
  v21[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v22 = v7;
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_431;
  v20[3] = &unk_1E204F320;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v21, v20, 0.0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 32), "selectContact:animated:scrollPosition:shouldScroll:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), 0, 0, 0, (_QWORD)v16);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateContentUnavailableConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsHeaderViewUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_updateCountStringNow:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataSourceChangedForContactListViewController:", *(_QWORD *)(a1 + 32));

  }
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isPerformingDuplicatesMerge") & 1) != 0)
  {
    CNUILogContactList();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_18AC56000, v2, OS_LOG_TYPE_DEBUG, "Currently performing duplicates merge, deferring reload until complete", v3, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "reloadData");
  }
}

void __58__CNContactListViewController_contactDataSourceDidChange___block_invoke_431(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "visibleListViewController");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contacts");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {

      goto LABEL_7;
    }
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "searchCompletionBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchCompletionBlock");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSearchCompletionBlock:", 0);
      v7[2]();
LABEL_7:

    }
  }
}

uint64_t __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createNewContactTapped");
}

void __71__CNContactListViewController_contentUnavailableConfigurationForState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sender");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addContactsToListTappedWithSourceView:", v3);

}

void __58__CNContactListViewController_didPresentSearchController___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isFirstResponder");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchBar");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "becomeFirstResponder");

    }
  }
}

void __55__CNContactListViewController__searchBarDidEndEditing___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CNContactListViewController__searchBarDidEndEditing___block_invoke_2;
  block[3] = &unk_1E204F648;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __55__CNContactListViewController__searchBarDidEndEditing___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "splitViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextResponderForContactListViewController:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

void __69__CNContactListViewController_contactStoreDidChangeWithNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "refreshTableViewHeaderForContactChanges");
  if (objc_msgSend(*(id *)(a1 + 32), "hasNoContacts"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resetContactViewController");

    }
  }
}

void __77__CNContactListViewController_selectItemAtIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  id v2;

  if (!*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isValidIndexPath:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 56));

    }
  }
}

void __79__CNContactListViewController_scrollToItemAtIndexPath_animated_scrollPosition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "visibleListViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v5, "numberOfSections");
  if (v3 > objc_msgSend(*(id *)(a1 + 40), "section"))
  {
    v4 = objc_msgSend(v5, "numberOfItemsInSection:", objc_msgSend(*(id *)(a1 + 40), "section"));
    if (v4 > objc_msgSend(*(id *)(a1 + 40), "row"))
      objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }

}

void __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke_2;
  v6[3] = &unk_1E204AD08;
  v7 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v6);

  objc_msgSend(*(id *)(a1 + 32), "indexPathForGlobalIndex:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "section") || objc_msgSend(v5, "row"))
    objc_msgSend(*(id *)(a1 + 32), "scrollToItemAtIndexPath:animated:scrollPosition:", v5, 0, 1);

}

uint64_t __73__CNContactListViewController_scrollTopToContactWithIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "searchResultsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

void __69__CNContactListViewController_deselectAllSelectedIndexPathsAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
  v4 = a2;
  objc_msgSend(v3, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectItemAtIndexPath:animated:", v4, *(unsigned __int8 *)(a1 + 40));

}

void __41__CNContactListViewController_applyStyle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reconfigureItemsAtIndexPaths:", v3);

}

void __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "tipKitContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "layoutDirection");

    if (v5 != 1)
      return;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v6, "refreshTableViewHeaderIfVisibleWithSize:", v7, v8);

}

void __82__CNContactListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "meContactBanner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "meContactBanner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4 <= 0.0;

  }
  else
  {
    v5 = 1;
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  objc_msgSend(*(id *)(a1 + 32), "tipKitContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || v5)
  {

  }
  else if (v7 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateMeContactBannerTopKeyline");
  }
}

uint64_t __52__CNContactListViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __46__CNContactListViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "indexPathToSelect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectItemAtIndexPath:animated:scrollPosition:", v3, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setIndexPathToSelect:", 0);
}

id __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = v3;
  }
  else
  {
    *(_BYTE *)(v5 + 24) = 1;
    objc_msgSend(v3, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_cn_filter:", &__block_literal_global_302);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuByReplacingChildren:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __66__CNContactListViewController_listActionHelper_didUpdateWithMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CNContactListActionHelperOrbMenuIdentifier")) ^ 1;

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __104__CNContactListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "actionHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactListViewController:didSelectContact:shouldScrollToContact:", v2, v5, 0);

}

CNContactOrbHeaderViewController *__79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke(uint64_t a1)
{
  return -[CNContactOrbHeaderViewController initWithContacts:]([CNContactOrbHeaderViewController alloc], "initWithContacts:", *(_QWORD *)(a1 + 32));
}

id __79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "actionHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsForContacts:dataSourceFilter:sourceView:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

CNContactOrbHeaderViewController *__79__CNContactListViewController_contextMenuConfigurationForContactsAtIndexPaths___block_invoke_3(uint64_t a1)
{
  return -[CNContactOrbHeaderViewController initWithContacts:]([CNContactOrbHeaderViewController alloc], "initWithContacts:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactForActionsAtIndexPath:forMultiSelectAction:", a2, *(unsigned __int8 *)(a1 + 40));
}

BOOL __62__CNContactListViewController_contactsForActionsAtIndexPaths___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

id __72__CNContactListViewController_trailingSwipeActionsConfigurationProvider__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "contactForActionsAtIndexPath:forMultiSelectAction:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0DC3D08];
    objc_msgSend(WeakRetained, "actionHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingSwipeActionsForContact:dataSourceFilter:", v5, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithActions:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setPerformsFirstActionWithFullSwipe:", 0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id __51__CNContactListViewController_duplicatesController__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[155];
  if (!v3)
  {
    objc_msgSend(v2, "setupDuplicatesController");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1240);
    *(_QWORD *)(v5 + 1240) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1240);
  }
  return v3;
}

- (id)recentOutgoingCalls
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init((Class)getCHManagerClass[0]());
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getkCHCallTypeNormal[0]());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getkCHCallStatusCancelled[0]());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", getkCHCallStatusConnectedOutgoing[0]());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("callType == %@ AND callStatus IN %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "recentCallsWithPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEasyToRecognizeWord:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((Class)get_EARUserProfileBuilderClass[0](), "isEasyToRecognizeWord:forLocale:", v4, v5);

  return v6;
}

- (void)tipKitStopObservation
{
  id v2;

  +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tipKitStopObservation");

}

- (BOOL)validateSiriEnabled
{
  int v2;
  void *v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((softLinkAFAssistantRestricted[0]() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend((Class)getAFPreferencesClass_43381[0](), "sharedPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "assistantIsEnabled");

  }
  CNUILogContactList();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Assitant enabled = %d", (uint8_t *)v6, 8u);
  }

  return v2;
}

- (BOOL)validateSiriLanguage
{
  char v2;
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if ((softLinkAFAssistantRestricted[0]() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend((Class)getAFPreferencesClass_43381[0](), "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v3, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB34D0];
      v15[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredLocalizationsFromArray:forPreferences:", v3, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = objc_msgSend(v9, "isEqualToString:", v13);
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)getRecentCallCountAndSpeakableName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  id v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  -[CNContactListViewController contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)getCHContactProviderClass[0]()), "initWithDataSource:", v3);
  -[CNContactListViewController recentOutgoingCalls](self, "recentOutgoingCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = *MEMORY[0x1E0C966D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v4, "contactsByHandleForCalls:keyDescriptors:error:", v5, v6, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;

  if (v8 || !v7)
  {
    CNUILogContactList();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "No recent calls", buf, 2u);
    }
    v17 = 0;
  }
  else
  {
    v21 = v4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v7, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      v13 = 30;
      v20 = v3;
      while (2)
      {
        v14 = 0;
        v19 = v13 - v11;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          if (v13 == v14)
          {
            v16 = 0;
LABEL_20:
            v3 = v20;
            goto LABEL_21;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstName");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16 && -[CNContactListViewController isEasyToRecognizeWord:](self, "isEasyToRecognizeWord:", v16))
          {

            goto LABEL_20;
          }

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        v16 = 0;
        v13 = v19;
        v3 = v20;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v16 = 0;
    }
LABEL_21:

    +[CNRecentCallCountAndName instanceWithName:callCount:](CNRecentCallCountAndName, "instanceWithName:callCount:", v16, objc_msgSend(v5, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v4 = v21;
  }

  return v17;
}

- (void)tipKitDismissTip
{
  -[CNContactListViewController setTipView:](self, "setTipView:", 0);
}

- (void)setTipView:(id)a3
{
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _TtC10ContactsUI15CNTipHeaderView *v18;
  _TtC10ContactsUI15CNTipHeaderView *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23 = a3;
  -[CNContactListViewController tipKitContentView](self, "tipKitContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (v23 != 0) ^ (v4 == 0);

  if ((v5 & 1) == 0)
  {
    +[CNTipHeaderView verticalInsetTotal](_TtC10ContactsUI15CNTipHeaderView, "verticalInsetTotal");
    if (v23)
    {
      v7 = v6;
      v8 = *MEMORY[0x1E0C9D648];
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      -[CNContactListViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      Width = CGRectGetWidth(v24);

      objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v25.origin.x = v8;
      v25.origin.y = v9;
      v25.size.width = Width;
      v25.size.height = v10;
      v13 = CGRectGetWidth(v25) - v7;
      objc_msgSend(v23, "bounds");
      if (v13 != CGRectGetWidth(v26))
      {
        objc_msgSend(v23, "bounds");
        objc_msgSend(v23, "setBounds:");
      }
      LODWORD(v14) = 1148846080;
      LODWORD(v15) = 1132068864;
      objc_msgSend(v23, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, 0.0, v14, v15);
      v17 = v7 + v16;
      v18 = [_TtC10ContactsUI15CNTipHeaderView alloc];
      v19 = -[CNTipHeaderView initWithFrame:separatorInset:](v18, "initWithFrame:separatorInset:", v8, v9, Width, v17, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      -[CNTipHeaderView setHostingView:](v19, "setHostingView:", v23);
      -[CNTipHeaderView setDisplaysBottomSeparator:](v19, "setDisplaysBottomSeparator:", 0);
      +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCurrentTipView:", v19);

    }
    else
    {
      +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentTipView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeFromSuperview");

      +[CNTipsHelper shared](_TtC10ContactsUI12CNTipsHelper, "shared");
      v19 = (_TtC10ContactsUI15CNTipHeaderView *)objc_claimAutoreleasedReturnValue();
      -[CNTipHeaderView setCurrentTipView:](v19, "setCurrentTipView:", 0);
    }

    -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  }

}

@end
