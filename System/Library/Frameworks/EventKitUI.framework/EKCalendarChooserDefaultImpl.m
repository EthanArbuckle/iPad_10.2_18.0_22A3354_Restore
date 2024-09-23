@implementation EKCalendarChooserDefaultImpl

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 forEvent:(id)a6 eventStore:(id)a7 limitedToSource:(id)a8 showIdentityChooser:(BOOL)a9 showDelegateSetupCell:(BOOL)a10 showAccountStatus:(BOOL)a11
{
  id v19;
  id v20;
  EKCalendarChooserDefaultImpl *v21;
  uint64_t v22;
  NSMutableSet *selectedCalendars;
  uint64_t v24;
  NSSet *collapsedSectionIdentifiers;
  void *v26;
  id v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v30 = a6;
  v19 = a7;
  v20 = a8;
  if (a5 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 171, CFSTR("Invalid entity type passed"));

  }
  v34.receiver = self;
  v34.super_class = (Class)EKCalendarChooserDefaultImpl;
  v21 = -[EKCalendarChooserDefaultImpl initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, 0, 0);
  if (v21)
  {
    EKUILogInitIfNeeded();
    v21->_style = a3;
    v21->_displayStyle = a4;
    *(_BYTE *)&v21->_flags = *(_BYTE *)&v21->_flags & 0xEF | (16 * (a4 == 1));
    v21->_entityType = a5;
    v21->_chooserMode = 0;
    objc_storeStrong((id *)&v21->_event, a6);
    objc_storeStrong((id *)&v21->_eventStore, a7);
    objc_storeStrong((id *)&v21->_limitedToSource, a8);
    *(_BYTE *)&v21->_flags &= ~0x20u;
    v21->_canShowIdentityChooser = a9;
    v21->_canShowDelegateSetupCell = a10;
    v21->_showAccountStatus = a11;
    v22 = objc_opt_new();
    selectedCalendars = v21->_selectedCalendars;
    v21->_selectedCalendars = (NSMutableSet *)v22;

    *(_BYTE *)&v21->_flags |= 1u;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    collapsedSectionIdentifiers = v21->_collapsedSectionIdentifiers;
    v21->_collapsedSectionIdentifiers = (NSSet *)v24;

    objc_initWeak(&location, v21);
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __175__EKCalendarChooserDefaultImpl_initWithSelectionStyle_displayStyle_entityType_forEvent_eventStore_limitedToSource_showIdentityChooser_showDelegateSetupCell_showAccountStatus___block_invoke;
    v31[3] = &unk_1E6018610;
    objc_copyWeak(&v32, &location);
    v27 = (id)-[EKCalendarChooserDefaultImpl registerForTraitChanges:withHandler:](v21, "registerForTraitChanges:withHandler:", v26, v31);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }

  return v21;
}

void __175__EKCalendarChooserDefaultImpl_initWithSelectionStyle_displayStyle_entityType_forEvent_eventStore_limitedToSource_showIdentityChooser_showDelegateSetupCell_showAccountStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_msgSend(v5, "_presentationSemanticContext");
  objc_msgSend(v15, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_presentationSemanticContext");

  if (v7 != v9)
    objc_msgSend(WeakRetained, "resetBackgroundColor");
  v10 = objc_msgSend(v5, "userInterfaceStyle");
  objc_msgSend(v15, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == objc_msgSend(v11, "userInterfaceStyle"))
  {
    objc_msgSend(v5, "preferredContentSizeCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredContentSizeCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v14)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
LABEL_8:

}

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 entityType:(unint64_t)a5 eventStore:(id)a6
{
  uint64_t v7;

  BYTE2(v7) = 0;
  LOWORD(v7) = 0;
  return -[EKCalendarChooserDefaultImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, a5, 0, a6, 0, v7);
}

- (EKCalendarChooserDefaultImpl)initWithSelectionStyle:(int64_t)a3 displayStyle:(int64_t)a4 eventStore:(id)a5
{
  uint64_t v6;

  BYTE2(v6) = 0;
  LOWORD(v6) = 0;
  return -[EKCalendarChooserDefaultImpl initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:](self, "initWithSelectionStyle:displayStyle:entityType:forEvent:eventStore:limitedToSource:showIdentityChooser:showDelegateSetupCell:showAccountStatus:", a3, a4, 0, 0, a5, 0, v6);
}

- (void)setExplanatoryTextMode:(int)a3
{
  id v4;

  if (self->_explanatoryTextMode != a3)
  {
    self->_explanatoryTextMode = a3;
    -[EKCalendarChooserDefaultImpl _collectionViewLayout](self, "_collectionViewLayout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", v4);

  }
}

- (BOOL)_sectionHasHeader:(int64_t)a3
{
  BOOL v5;
  int v6;

  v5 = -[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:");
  if (-[EKCalendarChooserDefaultImpl _isDeclinedEventsSwitchSection:](self, "_isDeclinedEventsSwitchSection:", a3)
    || -[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:", a3)
    || -[EKCalendarChooserDefaultImpl _isDelegateCalendarsButtonSection:](self, "_isDelegateCalendarsButtonSection:", a3))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !-[EKCalendarChooserDefaultImpl _isFocusBannerSection:](self, "_isFocusBannerSection:", a3);
  }
  return v5 | v6;
}

- (BOOL)_sectionHasFooter:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  if (!self->_showAccountStatus)
    return 0;
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource snapshotForSection:](self->_dataSource, "snapshotForSection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "footer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_collectionViewHasHeader
{
  int v3;

  v3 = -[EKCalendarChooserDefaultImpl explanatoryTextMode](self, "explanatoryTextMode");
  if (v3 != 1)
    LOBYTE(v3) = -[EKCalendarChooserDefaultImpl explanatoryTextMode](self, "explanatoryTextMode") == 2;
  return v3;
}

- (id)_collectionViewLayout
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15[2];
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->_displayStyle == 1000)
    v3 = 3;
  else
    v3 = 2;
  v4 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
  if (-[EKCalendarChooserDefaultImpl _collectionViewHasHeader](self, "_collectionViewHasHeader"))
  {
    v5 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v8, CFSTR("COLLECTION_VIEW_HEADER_ELEMENT_KIND"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBoundarySupplementaryItems:", v10);

  }
  objc_initWeak(&location, self);
  v11 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke;
  v14[3] = &unk_1E6019B58;
  objc_copyWeak(v15, &location);
  v15[1] = (id)v3;
  v12 = (void *)objc_msgSend(v11, "initWithSectionProvider:configuration:", v14, v4);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v12;
}

id __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16[2];

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "_sectionHasHeader:", a2))
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v8, "setHeaderMode:", v9);
  objc_msgSend(v8, "setFooterMode:", objc_msgSend(WeakRetained, "_sectionHasFooter:", a2));
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke_2;
  v15 = &unk_1E6019B30;
  objc_copyWeak(v16, v6);
  v16[1] = a2;
  objc_msgSend(v8, "setItemSeparatorHandler:", &v12);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v5, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v16);

  return v10;
}

id __53__EKCalendarChooserDefaultImpl__collectionViewLayout__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_sectionHasHeader:", *(_QWORD *)(a1 + 40)) && !objc_msgSend(v5, "row"))
  {
    objc_msgSend(v6, "setTopSeparatorVisibility:", 2);
    objc_msgSend(v6, "setBottomSeparatorVisibility:", 2);
  }

  return v6;
}

- (id)_sectionIdentifierForGroup:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(a3, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("CollectionViewSectionIdentifierOtherCalendarsGroup");
  v6 = v4;

  return v6;
}

- (void)_reconfigureHeaders
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "sectionIdentifiers", 0);
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
        objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v4);
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v3, 1);

}

- (void)_reconfigureCollectionViewAtIndexPath:(id)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  dataSource = self->_dataSource;
  v5 = a3;
  -[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v8);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, 1);
  }

}

- (void)_reconfigureIdentifierInCollectionView:(id)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  dataSource = self->_dataSource;
  v5 = a3;
  -[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v7);

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, 1);
}

- (void)_reloadCollectionViewSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[UICollectionViewDiffableDataSource snapshot](self->_dataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_dataSource, "sectionIdentifierForIndex:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSectionsWithIdentifiers:", v8);

    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v5, 1);
  }

}

- (void)_reloadCollectionViewSectionWithIdentifier:(id)a3
{
  UICollectionViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  dataSource = self->_dataSource;
  v5 = a3;
  -[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSectionsWithIdentifiers:", v7);

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v6, 1);
}

- (void)_collectionViewBuildAndApplyNewSnapshotAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSArray *obj;
  uint64_t v43;
  _BOOL4 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  void *v54;
  void *v55;
  _BYTE v56[128];
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  _BYTE v66[128];
  const __CFString *v67;
  const __CFString *v68;
  _QWORD v69[3];

  v44 = a3;
  v69[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if (-[EKCalendarChooserDefaultImpl _shouldShowFocusBanner](self, "_shouldShowFocusBanner"))
  {
    v69[0] = CFSTR("CollectionViewSectionIdentifierFocusBanner");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

    v68 = CFSTR("CollectionViewRowIdentifierFocusBanner");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, CFSTR("CollectionViewSectionIdentifierFocusBanner"));

  }
  if (-[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser"))
  {
    v67 = CFSTR("CollectionViewSectionIdentifierIdentitySwitcher");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v7);

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v8 = self->_allGroups;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v8);
        -[EKCalendarChooserDefaultImpl _sectionIdentifierForGroup:](self, "_sectionIdentifierForGroup:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendSectionsWithIdentifiers:", v14);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    }
    while (v10);
  }

  if (-[EKCalendarChooserDefaultImpl _shouldShowDeclinedEventsSection](self, "_shouldShowDeclinedEventsSection"))
  {
    v64 = CFSTR("CollectionViewSectionIdentifierDeclinedEvents");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v15);

  }
  if (-[EKCalendarChooserDefaultImpl showsDeclinedEventsSetting](self, "showsDeclinedEventsSetting"))
  {
    v63 = CFSTR("CollectionViewRowIdentifierDeclinedEvents");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v16, CFSTR("CollectionViewSectionIdentifierDeclinedEvents"));

  }
  if (-[EKCalendarChooserDefaultImpl showsCompletedRemindersSetting](self, "showsCompletedRemindersSetting"))
  {
    v62 = CFSTR("CollectionViewRowIdentifierCompletedReminders");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v17, CFSTR("CollectionViewSectionIdentifierDeclinedEvents"));

  }
  if (-[EKCalendarChooserDefaultImpl _shouldShowDelegateCalendarsButtonSection](self, "_shouldShowDelegateCalendarsButtonSection"))
  {
    v61 = CFSTR("CollectionViewSectionIdentifierDelegateCalendarsButton");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v18);

    v60 = CFSTR("CollectionViewRowIdentifierDelegateCalendarsButton");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, CFSTR("CollectionViewSectionIdentifierDelegateCalendarsButton"));

  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v4, v44);
  if (-[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser"))
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DC3390]);
    v59 = CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendItems:", v21);

    -[EKCalendarChooserDefaultImpl collapsedSectionIdentifiers](self, "collapsedSectionIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = objc_msgSend(v22, "containsObject:", CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader"));

    if ((v21 & 1) == 0)
    {
      v58 = CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "expandItems:", v23);

    }
    v57 = CFSTR("CollectionViewRowIdentifierIdentitySwitcherMe");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendItems:intoParentItem:", v24, CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader"));

    -[NSArray CalMap:](self->_delegateSources, "CalMap:", &__block_literal_global_18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendItems:intoParentItem:", v25, CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader"));
    -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_dataSource, "applySnapshot:toSection:animatingDifferences:", v20, CFSTR("CollectionViewSectionIdentifierIdentitySwitcher"), v44);

  }
  v41 = v4;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_allGroups;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v26)
  {
    v27 = v26;
    v43 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v46 != v43)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        -[EKCalendarChooserDefaultImpl _sectionIdentifierForGroup:](self, "_sectionIdentifierForGroup:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "calendarInfos");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "CalMap:", &__block_literal_global_57);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        -[EKCalendarChooserDefaultImpl _calendarHeaderRowIdentifierFromSectionIdentifier:](self, "_calendarHeaderRowIdentifierFromSectionIdentifier:", v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v34;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "appendItems:", v35);

        -[EKCalendarChooserDefaultImpl collapsedSectionIdentifiers](self, "collapsedSectionIdentifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "containsObject:", v34);

        if ((v37 & 1) == 0)
        {
          v54 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "expandItems:", v38);

        }
        if (-[EKCalendarChooserDefaultImpl _shouldDisplayAccountErrorActionCellForGroup:](self, "_shouldDisplayAccountErrorActionCellForGroup:", v29))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("account_error_%@"), v30, v41);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "appendItems:intoParentItem:", v40, v34);

        }
        objc_msgSend(v33, "appendItems:intoParentItem:", v32, v34);
        -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:](self->_dataSource, "applySnapshot:toSection:animatingDifferences:", v33, v30, v44);

      }
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v27);
  }

}

id __80__EKCalendarChooserDefaultImpl__collectionViewBuildAndApplyNewSnapshotAnimated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "sourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("identity_chooser_%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__EKCalendarChooserDefaultImpl__collectionViewBuildAndApplyNewSnapshotAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("calendar_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_configureHeaderCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  int v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  EKCalendarChooserDefaultImpl *v40;
  id v41;

  v7 = a3;
  v8 = objc_msgSend(a4, "section");
  -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:", v8))
  {
    objc_msgSend((id)objc_opt_class(), "delegatesString");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[EKCalendarChooserDefaultImpl _isDeclinedEventsSwitchSection:](self, "_isDeclinedEventsSwitchSection:", v8)
         || -[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:", v8)
         || -[EKCalendarChooserDefaultImpl _isDelegateCalendarsButtonSection:](self, "_isDelegateCalendarsButtonSection:", v8)|| !self->_limitedToSource)
  {
    objc_msgSend(v9, "title");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CUIKDisplayedTitleForSource();
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  if (self->_displayStyle == 1000)
    objc_msgSend(v7, "defaultContentConfiguration");
  else
    objc_msgSend(MEMORY[0x1E0DC39A8], "prominentInsetGroupedHeaderConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);
  objc_msgSend(v7, "setContentConfiguration:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarChooserDefaultImpl allowsPullToRefresh](self, "allowsPullToRefresh"))
  {
    objc_msgSend(v9, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isSyncing"))
    {
      objc_msgSend(v9, "source");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastSyncEndDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        goto LABEL_17;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 8);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setColor:", v17);

      objc_msgSend(v14, "startAnimating");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v14, 1);
      objc_msgSend(v13, "addObject:", v18);

    }
  }
LABEL_17:
  if (objc_msgSend(v9, "accountError"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v19);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v20, 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTintColor:", v22);

    objc_msgSend(v13, "addObject:", v21);
  }
  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "perSectionShowAllHideAllButtonSpecifier");

  if (v24 && v9 && objc_msgSend(v9, "showSelectAllButton") && self->_style == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(v25, "setButtonSize:", 1);
    v26 = objc_msgSend(v9, "selected");
    v27 = (void *)objc_opt_class();
    if ((v26 & 1) != 0)
      objc_msgSend(v27, "hideAllString");
    else
      objc_msgSend(v27, "showAllString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v28);
    v29 = (void *)MEMORY[0x1E0DC3518];
    v30 = (void *)MEMORY[0x1E0DC3428];
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __68__EKCalendarChooserDefaultImpl__configureHeaderCell_indexPath_item___block_invoke;
    v39 = &unk_1E6018F28;
    v40 = self;
    v41 = v9;
    objc_msgSend(v30, "actionWithHandler:", &v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "buttonWithConfiguration:primaryAction:", v25, v31, v36, v37, v38, v39, v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v32, 1);
    objc_msgSend(v13, "addObject:", v33);

  }
  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
  {
    v34 = objc_alloc_init(MEMORY[0x1E0DC3588]);
    objc_msgSend(v13, "addObject:", v34);

  }
  v35 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v7, "setAccessories:", v35);

}

uint64_t __68__EKCalendarChooserDefaultImpl__configureHeaderCell_indexPath_item___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "groupShowAllTapped:", *(_QWORD *)(a1 + 40));
}

- (void)_configureDelegateButtonCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v26;
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
  void *v40;
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKCalendarChooserDefaultImpl _preventDefaultCellSelectionBehavior:](self, "_preventDefaultCellSelectionBehavior:", v6);
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentInsets");
    objc_msgSend(v10, "setContentInsets:");
    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Delegate Calendars…"), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v10;
    objc_msgSend(v10, "setTitle:", v12);

    objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", &__block_literal_global_81);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentHorizontalAlignment:", 4);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v13);

    v28 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v34;
    objc_msgSend(v6, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v29;
    objc_msgSend(v6, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v24;
    objc_msgSend(v6, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v17;
    objc_msgSend(v6, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v22);

  }
}

void __76__EKCalendarChooserDefaultImpl__configureDelegateButtonCell_indexPath_item___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=CALENDAR&path=DELEGATE_CALENDARS"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:error:", v1, 0, 0);

}

- (void)_configureDeclinedEventsCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSNumber *pendingShowDeclinedEvents;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKCalendarChooserDefaultImpl _preventDefaultCellSelectionBehavior:](self, "_preventDefaultCellSelectionBehavior:", v6);
  objc_msgSend(v6, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Show Declined Events"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

  objc_msgSend(v7, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v6, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "customView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_declinedEventsChanged, 64);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v15, 1);
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v16);

  }
  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  if (pendingShowDeclinedEvents)
  {
    v18 = -[NSNumber BOOLValue](pendingShowDeclinedEvents, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "showDeclinedEvents");

  }
  objc_msgSend(v15, "setOn:", v18);

}

- (void)_configureCompletedRemindersCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSNumber *pendingShowCompletedReminders;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[EKCalendarChooserDefaultImpl _preventDefaultCellSelectionBehavior:](self, "_preventDefaultCellSelectionBehavior:", v6);
  objc_msgSend(v6, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Show Completed Reminders"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v9);

  objc_msgSend(v7, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v6, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "customView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_completedRemindersChanged, 64);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v15, 1);
    v20[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v16);

  }
  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  if (pendingShowCompletedReminders)
  {
    v18 = -[NSNumber BOOLValue](pendingShowCompletedReminders, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAA0F0], "shared");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "showCompletedReminders");

  }
  objc_msgSend(v15, "setOn:", v18);

}

- (void)_configureCalendarCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
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
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int64_t style;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id location;
  id v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v49 = a5;
  -[EKCalendarChooserDefaultImpl _preventDefaultCellSelectionBehavior:](self, "_preventDefaultCellSelectionBehavior:", v8);
  v52 = v9;
  -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v9, "section"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextToSecondaryTextVerticalPadding:", 1.0);
  v11 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", objc_msgSend(v9, "row"), v53);
  objc_msgSend(v53, "calendarInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "title");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isSubscribed") && (objc_msgSend(v53, "isSubscribed") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_subscribedLocalizedString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v13, "isShared") & 1) != 0 || objc_msgSend(v13, "isPublished"))
  {
    objc_msgSend(v13, "stringForSharedCalendar");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v13, "isIntegration") || (objc_msgSend(v13, "isEnabled") & 1) != 0)
      goto LABEL_11;
    objc_msgSend((id)objc_opt_class(), "_disabledIntegrationLocalizedString");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v51)
  {
    objc_msgSend(v10, "setSecondaryText:");
    goto LABEL_12;
  }
LABEL_11:
  v51 = 0;
LABEL_12:
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(v13, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "type") == 1
      && (objc_msgSend(v15, "name"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x1E0D0CDF8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "font");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "symbolImage:forFont:", v16, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v13, "calendar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "type");

      if (v22 != 4)
      {

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0D0CDF8], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "font");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "birthdayImageForFont:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    CalendarAppTintColor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "flattenedImageWithColor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "appendAttributedString:", v27);

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v25, "appendAttributedString:", v28);

      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v50);
      objc_msgSend(v25, "appendAttributedString:", v29);

      objc_msgSend(v10, "setAttributedText:", v25);
      goto LABEL_22;
    }
  }
LABEL_21:
  objc_msgSend(v10, "setText:", v50);
  v24 = 0;
LABEL_22:
  if ((objc_msgSend(v13, "isEnabled") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "colorWithAlphaComponent:", 0.5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setColor:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "colorWithAlphaComponent:", 0.5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secondaryTextProperties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setColor:", v34);

  }
  if (self->_style)
  {
    v36 = objc_msgSend(v13, "selected");
    if (objc_msgSend(MEMORY[0x1E0CA9FC0], "isReminderAppLocked") || (v36 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v37 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circlebadge.fill"));
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;
  objc_msgSend(v10, "setImage:", v37);

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_msgSend(v13, "color");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageProperties");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTintColor:", v39);

    if ((objc_msgSend(v13, "isEnabled") & 1) == 0)
    {
      objc_msgSend(v13, "color");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "colorWithAlphaComponent:", 0.5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageProperties");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setTintColor:", v42);

    }
  }
  objc_msgSend(v8, "setContentConfiguration:", v10);
  style = self->_style;
  if (style)
  {
    if (style == 1)
    {
      if (-[EKCalendarChooserDefaultImpl _calendarAvailableForEditing:](self, "_calendarAvailableForEditing:", v13)
        && -[EKCalendarChooserDefaultImpl showDetailAccessories](self, "showDetailAccessories"))
      {
        v45 = objc_alloc_init(MEMORY[0x1E0DC3560]);
        objc_initWeak(&location, self);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __70__EKCalendarChooserDefaultImpl__configureCalendarCell_indexPath_item___block_invoke;
        v54[3] = &unk_1E6019C00;
        objc_copyWeak(&v56, &location);
        v55 = v52;
        objc_msgSend(v45, "setActionHandler:", v54);
        v59[0] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccessories:", v46);

        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);

      }
      else
      {
        objc_msgSend(v8, "setAccessories:", MEMORY[0x1E0C9AA60]);
      }
    }
  }
  else
  {
    v47 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    objc_msgSend(v47, "setHidden:", objc_msgSend(v52, "isEqual:", self->_checkedRow) ^ 1);
    v58 = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessories:", v48);

  }
  -[EKCalendarChooserDefaultImpl _updateAppEntityAnnotationIfNeededForCalendarCell:calendarInfo:](self, "_updateAppEntityAnnotationIfNeededForCalendarCell:calendarInfo:", v8, v13);

}

void __70__EKCalendarChooserDefaultImpl__configureCalendarCell_indexPath_item___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessoryButtonTappedAtIndexPath:", *(_QWORD *)(a1 + 32));

}

- (void)_configureDelegateNameCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "row");
  if (v9 == -[EKCalendarChooserDefaultImpl _rowIndexForMeDelegate](self, "_rowIndexForMeDelegate"))
  {
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_limitedToSource == 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_delegateSources, "objectAtIndex:", -[EKCalendarChooserDefaultImpl _rowIndexToDelegateSourceIndex:](self, "_rowIndexToDelegateSourceIndex:", objc_msgSend(v8, "row")));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDisplayedTitleForSource();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isEqual:", self->_limitedToSource);

  }
  objc_msgSend(v7, "defaultContentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v11);
  objc_msgSend(v7, "setContentConfiguration:", v14);
  if (v12)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    v17[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessories:", v16);

  }
  else
  {
    objc_msgSend(v7, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)_configureFocusCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(v6, "setDelegate:", self);
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOn:", objc_msgSend(v7, "focusFilterMode") == 1);

}

- (void)_configureAccountErrorCell:(id)a3 indexPath:(id)a4 item:(id)a5
{
  id v7;
  id v8;
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
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[EKCalendarChooserDefaultImpl _preventDefaultCellSelectionBehavior:](self, "_preventDefaultCellSelectionBehavior:", v7);
  objc_msgSend(v7, "defaultContentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Verify Account Information"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v11);

  -[UICollectionView tintColor](self->_collectionView, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v12);

  objc_msgSend(v9, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlignment:", 1);

  objc_msgSend(v7, "setContentConfiguration:", v9);
  if (self->_displayStyle == 1000)
  {
    objc_msgSend(v7, "defaultBackgroundConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_118);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v16);

    objc_msgSend(v7, "setBackgroundConfiguration:", v15);
  }
  -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v8, "section"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "showAccountErrorActionButtonSpinner"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v18, "startAnimating");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v18, 1);
    v21[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessories:", v20);

  }
  else
  {
    objc_msgSend(v7, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }

}

uint64_t __74__EKCalendarChooserDefaultImpl__configureAccountErrorCell_indexPath_item___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (void)_configureFooterCell:(id)a3 indexPath:(id)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0DC39A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "footerConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "section");

  -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "footer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v8, "setContentConfiguration:", v12);
}

- (void)_configureCollectionViewHeaderCell:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(v5, "defaultContentConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  LODWORD(self) = -[EKCalendarChooserDefaultImpl explanatoryTextMode](self, "explanatoryTextMode");
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)self == 1)
    v10 = CFSTR("New events created outside of a specific calendar will default to this calendar.");
  else
    v10 = CFSTR("New events created outside of a specific calendar for this delegate will default to this calendar.");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v5, "setContentConfiguration:", v12);
}

- (void)_preventDefaultCellSelectionBehavior:(id)a3
{
  objc_msgSend(a3, "setConfigurationUpdateHandler:", &__block_literal_global_125);
}

void __69__EKCalendarChooserDefaultImpl__preventDefaultCellSelectionBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "setAutomaticallyUpdatesContentConfiguration:", 0);
  objc_msgSend(v5, "setAutomaticallyUpdatesBackgroundConfiguration:", 0);
  objc_msgSend(v4, "setSelected:", 0);
  objc_msgSend(v5, "backgroundConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundConfiguration:", v7);

  objc_msgSend(v5, "contentConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatedConfigurationForState:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setContentConfiguration:", v8);
}

- (void)_updateAppEntityAnnotationIfNeededForCalendarCell:(id)a3 calendarInfo:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (CalendarLinkLibraryCore())
  {
    objc_msgSend(v5, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "Cal_annotateWithCalendar:", v6);

    objc_msgSend(v7, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", objc_msgSend(v5, "selected"), 0, 0, 0, 0, 0);
  }

}

- (void)setCollapsedSectionIdentifiers:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *collapsedSectionIdentifiers;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = (NSSet *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
  self->_collapsedSectionIdentifiers = v5;

  -[EKCalendarChooserDefaultImpl _cleanupCollapsedSectionIdentifiers](self, "_cleanupCollapsedSectionIdentifiers");
}

- (void)_cleanupCollapsedSectionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *collapsedSectionIdentifiers;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser"))
    objc_msgSend(v3, "addObject:", CFSTR("CollectionViewRowIdentifierIdentitySwitcherHeader"));
  -[EKCalendarChooserDefaultImpl _calendarHeaderRowIdentifierFromSectionIdentifier:](self, "_calendarHeaderRowIdentifierFromSectionIdentifier:", CFSTR("CollectionViewSectionIdentifierOtherCalendarsGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[EKEventStore sources](self->_eventStore, "sources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "sourceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarChooserDefaultImpl _calendarHeaderRowIdentifierFromSectionIdentifier:](self, "_calendarHeaderRowIdentifierFromSectionIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v12 = (void *)-[NSSet mutableCopy](self->_collapsedSectionIdentifiers, "mutableCopy");
  objc_msgSend(v12, "intersectSet:", v3);
  if ((objc_msgSend(v12, "isEqualToSet:", self->_collapsedSectionIdentifiers) & 1) == 0)
  {
    v13 = (NSSet *)objc_msgSend(v12, "copy");
    collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
    self->_collapsedSectionIdentifiers = v13;

    -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "calendarChooserCollapsedSectionIdentifiersDidChange:", v18);

    }
  }

}

- (id)_calendarHeaderRowIdentifierFromSectionIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("calendar_header_%@"), a3);
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  UICollectionView *v5;
  UICollectionView *collectionView;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  UICollectionView *v34;
  id v35;
  id v36;
  UICollectionViewDiffableDataSource *v37;
  UICollectionViewDiffableDataSource *dataSource;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t lastAuthorizationStatus;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id *v48;
  id *v49;
  id *v50;
  id *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  EKCalendarChooserDefaultImpl *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  id location[2];

  -[EKCalendarChooserDefaultImpl _collectionViewLayout](self, "_collectionViewLayout");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  objc_initWeak(location, self);
  v7 = (void *)MEMORY[0x1E0DC35C8];
  v8 = objc_opt_class();
  v9 = MEMORY[0x1E0C809B0];
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke;
  v99[3] = &unk_1E6019C68;
  objc_copyWeak(&v100, location);
  objc_msgSend(v7, "registrationWithCellClass:configurationHandler:", v8, v99);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC35C8];
  v11 = objc_opt_class();
  v97[0] = v9;
  v97[1] = 3221225472;
  v97[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_2;
  v97[3] = &unk_1E6019C90;
  objc_copyWeak(&v98, location);
  objc_msgSend(v10, "registrationWithCellClass:configurationHandler:", v11, v97);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC35C8];
  v13 = objc_opt_class();
  v95[0] = v9;
  v95[1] = 3221225472;
  v95[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_3;
  v95[3] = &unk_1E6019C90;
  objc_copyWeak(&v96, location);
  objc_msgSend(v12, "registrationWithCellClass:configurationHandler:", v13, v95);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC35C8];
  v15 = objc_opt_class();
  v93[0] = v9;
  v93[1] = 3221225472;
  v93[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_4;
  v93[3] = &unk_1E6019C68;
  objc_copyWeak(&v94, location);
  objc_msgSend(v14, "registrationWithCellClass:configurationHandler:", v15, v93);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC35C8];
  v17 = objc_opt_class();
  v91[0] = v9;
  v91[1] = 3221225472;
  v91[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_5;
  v91[3] = &unk_1E6019C68;
  objc_copyWeak(&v92, location);
  objc_msgSend(v16, "registrationWithCellClass:configurationHandler:", v17, v91);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0DC35C8];
  v19 = objc_opt_class();
  v89[0] = v9;
  v89[1] = 3221225472;
  v89[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_6;
  v89[3] = &unk_1E6019C68;
  objc_copyWeak(&v90, location);
  objc_msgSend(v18, "registrationWithCellClass:configurationHandler:", v19, v89);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v3;
  v20 = (void *)MEMORY[0x1E0DC35C8];
  v21 = objc_opt_class();
  v87[0] = v9;
  v87[1] = 3221225472;
  v87[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_7;
  v87[3] = &unk_1E6019CB8;
  objc_copyWeak(&v88, location);
  objc_msgSend(v20, "registrationWithCellClass:configurationHandler:", v21, v87);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC35C8];
  v24 = objc_opt_class();
  v85[0] = v9;
  v85[1] = 3221225472;
  v85[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_8;
  v85[3] = &unk_1E6019C68;
  objc_copyWeak(&v86, location);
  objc_msgSend(v23, "registrationWithCellClass:configurationHandler:", v24, v85);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = &v86;
  v26 = (void *)MEMORY[0x1E0DC3640];
  v27 = objc_opt_class();
  v28 = *MEMORY[0x1E0DC48A0];
  v83[0] = v9;
  v83[1] = 3221225472;
  v83[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_9;
  v83[3] = &unk_1E6019CE0;
  v50 = &v84;
  objc_copyWeak(&v84, location);
  objc_msgSend(v26, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v27, v28, v83);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0DC3640];
  v31 = objc_opt_class();
  v81[0] = v9;
  v81[1] = 3221225472;
  v81[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_10;
  v81[3] = &unk_1E6019CE0;
  objc_copyWeak(&v82, location);
  objc_msgSend(v30, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v31, CFSTR("COLLECTION_VIEW_HEADER_ELEMENT_KIND"), v81);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = &v82;
  v33 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v34 = self->_collectionView;
  v70[0] = v9;
  v70[1] = 3221225472;
  v70[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_11;
  v70[3] = &unk_1E6019D08;
  v48 = &v80;
  objc_copyWeak(&v80, location);
  v62 = v61;
  v71 = v62;
  v60 = v59;
  v72 = v60;
  v46 = v22;
  v73 = v46;
  v74 = self;
  v56 = v55;
  v75 = v56;
  v54 = v53;
  v76 = v54;
  v35 = v52;
  v77 = v35;
  v36 = v25;
  v78 = v36;
  v58 = v57;
  v79 = v58;
  v37 = (UICollectionViewDiffableDataSource *)objc_msgSend(v33, "initWithCollectionView:cellProvider:", v34, v70);
  dataSource = self->_dataSource;
  self->_dataSource = v37;

  v67[0] = v9;
  v67[1] = 3221225472;
  v67[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_12;
  v67[3] = &unk_1E6019D30;
  v39 = v29;
  v68 = v39;
  v40 = v32;
  v69 = v40;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_dataSource, "setSupplementaryViewProvider:", v67);
  v65[0] = v9;
  v65[1] = 3221225472;
  v65[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_13;
  v65[3] = &unk_1E6019D58;
  objc_copyWeak(&v66, location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_dataSource, "sectionSnapshotHandlers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWillCollapseItemHandler:", v65);

  v63[0] = v9;
  v63[1] = 3221225472;
  v63[2] = __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_14;
  v63[3] = &unk_1E6019D58;
  objc_copyWeak(&v64, location);
  -[UICollectionViewDiffableDataSource sectionSnapshotHandlers](self->_dataSource, "sectionSnapshotHandlers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWillExpandItemHandler:", v63);

  -[EKCalendarChooserDefaultImpl _updateDelegateSources](self, "_updateDelegateSources");
  -[EKCalendarChooserDefaultImpl _updateShowDelegateCalendarsCell](self, "_updateShowDelegateCalendarsCell");
  -[EKCalendarChooserDefaultImpl _reloadCalendars](self, "_reloadCalendars");
  -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  -[UICollectionView setAllowsFocus:](self->_collectionView, "setAllowsFocus:", self->_displayStyle != 1000);
  if (self->_shouldOverrideAuthorizationStatus)
  {
    lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    lastAuthorizationStatus = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", self->_entityType, v46, v47, &v80, &v82, &v84, &v86);
    self->_lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus > 2)
  {
    -[EKCalendarChooserDefaultImpl setView:](self, "setView:", self->_collectionView);
  }
  else
  {
    -[EKCalendarChooserDefaultImpl accessDeniedView](self, "accessDeniedView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl setView:](self, "setView:", v44);

    if (self->_lastAuthorizationStatus == 1)
    {
      -[EKCalendarChooserDefaultImpl accessDeniedView](self, "accessDeniedView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setMessage:", CFSTR(" "));

    }
  }
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);

  objc_destroyWeak(v48);
  objc_destroyWeak(v49);

  objc_destroyWeak(v50);
  objc_destroyWeak(v51);

  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);

  objc_destroyWeak(&v92);
  objc_destroyWeak(&v94);

  objc_destroyWeak(&v96);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v100);
  objc_destroyWeak(location);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureHeaderCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureDelegateNameCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureCalendarCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureDeclinedEventsCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureCompletedRemindersCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureDelegateButtonCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureFocusCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_configureAccountErrorCell:indexPath:item:", v9, v8, v7);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureFooterCell:indexPath:", v7, v6);

}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_configureCollectionViewHeaderCell:indexPath:", v7, v6);

}

id __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (!objc_msgSend(v8, "row")
    && objc_msgSend(WeakRetained, "_sectionHasHeader:", objc_msgSend(v8, "section")))
  {
    v11 = *(_QWORD *)(a1 + 32);
LABEL_16:
    objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v11, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(WeakRetained, "_isIdentityChooserSection:", objc_msgSend(v8, "section")))
  {
    v11 = *(_QWORD *)(a1 + 40);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isFocusBannerSection:", objc_msgSend(v8, "section")))
  {
    v11 = *(_QWORD *)(a1 + 48);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDeclinedEventsSwitchSection:", objc_msgSend(v8, "section"))
    && !objc_msgSend(v8, "row")
    && objc_msgSend(*(id *)(a1 + 56), "showsDeclinedEventsSetting"))
  {
    v11 = *(_QWORD *)(a1 + 64);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDeclinedEventsSwitchSection:", objc_msgSend(v8, "section")))
  {
    v11 = *(_QWORD *)(a1 + 72);
    goto LABEL_16;
  }
  if (objc_msgSend(WeakRetained, "_isDelegateCalendarsButtonSection:", objc_msgSend(v8, "section")))
  {
    v11 = *(_QWORD *)(a1 + 80);
    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "_groupForSection:", objc_msgSend(v8, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(WeakRetained, "_accountErrorActionRowIndexForGroup:", v14);
  v16 = objc_msgSend(v8, "row");
  v17 = 96;
  if (v15 == v16)
    v17 = 88;
  objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + v17), v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v12;
}

id __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;

  v7 = *MEMORY[0x1E0DC48A0];
  v8 = a4;
  v9 = a2;
  v10 = objc_msgSend(a3, "isEqualToString:", v7);
  v11 = 40;
  if (v10)
    v11 = 32;
  objc_msgSend(v9, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + v11), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_13(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "collapsedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setCollapsedSectionIdentifiers:", v5);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_ekCalendarChooser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "calendarChooserCollapsedSectionIdentifiersDidChange:", v8);

  }
}

void __40__EKCalendarChooserDefaultImpl_loadView__block_invoke_14(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "collapsedSectionIdentifiers");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend((id)v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", v3);
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(WeakRetained, "setCollapsedSectionIdentifiers:", v6);

  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_ekCalendarChooser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarChooserCollapsedSectionIdentifiersDidChange:", v9);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserDefaultImpl;
  -[EKCalendarChooserDefaultImpl viewIsAppearing:](&v5, sel_viewIsAppearing_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__EKCalendarChooserDefaultImpl_viewIsAppearing___block_invoke;
  v4[3] = &unk_1E6019D80;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CAA090], "requestFamilyShareesWithCompletion:", v4);
}

uint64_t __48__EKCalendarChooserDefaultImpl_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = objc_msgSend(a2, "count") != 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateOrCreateAddCalendarBarButtonItem");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserDefaultImpl;
  -[EKCalendarChooserDefaultImpl viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (self->_eventStore)
  {
    -[EKCalendarChooserDefaultImpl _updateCurrentKnownCalendarIds](self, "_updateCurrentKnownCalendarIds");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__eventStoreChanged_, *MEMORY[0x1E0CA9F88], self->_eventStore);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__ignoredErrorsChanged, *MEMORY[0x1E0D0C920], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__showDeclinedEventsChanged_, CFSTR("com.apple.mobilecal.showdeclinedchanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__showCompletedRemindersChanged_, CFSTR("com.apple.mobilecal.showCompletedRemindersChanged"), 0);

    objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__eventStoreChangedExternally, CFSTR("com.apple.suggestions.settingsChanged"));
  }
  -[EKCalendarChooserDefaultImpl _layoutNavToolbarControls](self, "_layoutNavToolbarControls");
  -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
  -[EKCalendarChooserDefaultImpl _updateViewControllerTitle](self, "_updateViewControllerTitle");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)EKCalendarChooserDefaultImpl;
  -[EKCalendarChooserDefaultImpl viewDidAppear:](&v31, sel_viewDidAppear_, a3);
  v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v33 = v7;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[EKCalendarChooserDefaultImpl _allCalendars](self, "_allCalendars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "calendarIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[EKCalendarChooserDefaultImpl selectedCalendars](self, "selectedCalendars", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "calendarIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v18);
  }

  v22 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v8;
    v34 = 2114;
    v35 = v15;
    _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_INFO, "[UserStateLog] State -> allVisibleCalendars = %{public}@, selectedCalendars = %{public}@", buf, 0x16u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D0C920], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("com.apple.mobilecal.showdeclinedchanged"), 0);

  objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, CFSTR("com.apple.suggestions.settingsChanged"));
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserDefaultImpl;
  -[EKCalendarChooserDefaultImpl viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  UICollectionView *collectionView;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  collectionView = self->_collectionView;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](collectionView, "setBackgroundColor:", v5);

}

- (BOOL)hasAccountThatCanCreateCalendars
{
  EKSource *limitedToSource;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  limitedToSource = self->_limitedToSource;
  if (limitedToSource && !-[EKSource isWritable](limitedToSource, "isWritable"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[EKEventStore sources](self->_eventStore, "sources", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "supportsCalendarCreation") && objc_msgSend(v8, "sourceType") != 4)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v5;
}

+ (id)showAllString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show All"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hideAllString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Hide All"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)delegatesString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("View Calendar:"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showAllButtonPressed
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("show");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (*(_BYTE *)&self->_flags & 2) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CalAnalyticsSendEvent();

  -[EKCalendarChooserDefaultImpl _selectAllCalendarsAndNotify:](self, "_selectAllCalendarsAndNotify:", 1);
}

- (void)_selectAllCalendarsAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v3 = a3;
  -[EKCalendarChooserDefaultImpl _selectAllCalendarsAndStores:](self, "_selectAllCalendarsAndStores:", (*(_BYTE *)&self->_flags & 2) == 0);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarChooserSelectionDidChange:", v8);

    }
  }
  -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 0);
}

- (void)setAllSelected:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v5;
  v6 = (void *)objc_opt_class();
  if (v3)
    objc_msgSend(v6, "hideAllString");
  else
    objc_msgSend(v6, "showAllString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl showAllButton](self, "showAllButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v9 = CFSTR("hide-all-button");
  else
    v9 = CFSTR("show-all-button");
  -[EKCalendarChooserDefaultImpl showAllButton](self, "showAllButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

}

- (BOOL)allSelected
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)openAddRegularCalendarWithTitle:(id)a3
{
  id v4;
  EKCalendarEditor *v5;
  EKAbstractCalendarEditor *presentedEditor;
  EKCalendarEditor *v7;

  if (!self->_presentedEditor)
  {
    v4 = a3;
    v5 = -[EKCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:]([EKCalendarEditor alloc], "initWithCalendar:eventStore:entityType:limitedToSource:", 0, self->_eventStore, self->_entityType, self->_limitedToSource);
    -[EKCalendarEditor setPrefillCalendarTitle:](v5, "setPrefillCalendarTitle:", v4);

    -[EKAbstractCalendarEditor setDelegate:](v5, "setDelegate:", self);
    presentedEditor = self->_presentedEditor;
    self->_presentedEditor = &v5->super;
    v7 = v5;

    -[EKCalendarChooserDefaultImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", self->_addCalendarButton);
  }
}

- (void)showCalendar:(id)a3 enableDoneInitially:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  EKSubscribedCalendarEditor *v7;
  EKEventStore *eventStore;
  EKSource *limitedToSource;
  id v10;
  unint64_t entityType;
  EKSubscribedCalendarEditor *v12;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isSubscribed"))
  {
    v7 = [EKSubscribedCalendarEditor alloc];
    eventStore = self->_eventStore;
    limitedToSource = self->_limitedToSource;
    v10 = v6;
    entityType = 0;
  }
  else
  {
    v7 = [EKCalendarEditor alloc];
    eventStore = self->_eventStore;
    entityType = self->_entityType;
    limitedToSource = self->_limitedToSource;
    v10 = v6;
  }
  v12 = -[EKAbstractCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:enableDoneInitially:](v7, "initWithCalendar:eventStore:entityType:limitedToSource:enableDoneInitially:", v10, eventStore, entityType, limitedToSource, v4);

  -[EKCalendarChooserDefaultImpl _presentEditor:animated:completion:](self, "_presentEditor:animated:completion:", v12, 1, 0);
}

- (void)addCalendarButtonPressed:(id)a3
{
  EKCalendarEditor *v4;
  EKAbstractCalendarEditor *presentedEditor;
  id v6;

  v6 = a3;
  v4 = -[EKCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:]([EKCalendarEditor alloc], "initWithCalendar:eventStore:entityType:limitedToSource:", 0, self->_eventStore, self->_entityType, self->_limitedToSource);
  -[EKAbstractCalendarEditor setDelegate:](v4, "setDelegate:", self);
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v4->super;

  -[EKCalendarChooserDefaultImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", v6);
}

- (void)addFamilyCalendarButtonPressed:(id)a3
{
  EKEventStore *eventStore;
  EKAbstractCalendarEditor *v5;
  EKAbstractCalendarEditor *presentedEditor;
  id v7;

  eventStore = self->_eventStore;
  v7 = a3;
  v5 = +[EKCalendarEditor newFamilyCalendarEditorWithEventStore:](EKCalendarEditor, "newFamilyCalendarEditorWithEventStore:", eventStore);
  -[EKAbstractCalendarEditor setDelegate:](v5, "setDelegate:", self);
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = v5;

  -[EKCalendarChooserDefaultImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", v7);
}

- (void)showAddSubscribedCalendarWithURL:(id)a3
{
  -[EKCalendarChooserDefaultImpl addSubscribedCalendarButtonPressed:prefillURL:](self, "addSubscribedCalendarButtonPressed:prefillURL:", self->_addCalendarButton, a3);
}

- (void)addSubscribedCalendarButtonPressed:(id)a3 prefillURL:(id)a4
{
  id v6;
  EKSubscribedCalendarEditor *v7;
  EKAbstractCalendarEditor *presentedEditor;
  id v9;

  v6 = a4;
  v9 = a3;
  v7 = -[EKSubscribedCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:]([EKSubscribedCalendarEditor alloc], "initWithCalendar:eventStore:entityType:limitedToSource:", 0, self->_eventStore, 0, self->_limitedToSource);
  -[EKSubscribedCalendarEditor setPrefillURL:](v7, "setPrefillURL:", v6);

  -[EKAbstractCalendarEditor setDelegate:](v7, "setDelegate:", self);
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v7->super;

  -[EKCalendarChooserDefaultImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", v9);
}

- (void)addHolidayCalendarButtonPressed:(id)a3
{
  EKAddHolidayCalendarEditor *v4;
  EKAbstractCalendarEditor *presentedEditor;
  id v6;

  v6 = a3;
  CalAnalyticsSendEvent();
  v4 = -[EKAddHolidayCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:]([EKAddHolidayCalendarEditor alloc], "initWithCalendar:eventStore:entityType:limitedToSource:", 0, self->_eventStore, 0, self->_limitedToSource);
  -[EKAbstractCalendarEditor setDelegate:](v4, "setDelegate:", self);
  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = &v4->super;

  -[EKCalendarChooserDefaultImpl _commonAddCalendarButtonPressed:](self, "_commonAddCalendarButtonPressed:", v6);
}

- (void)_commonAddCalendarButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 IsRegular;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_presentedEditor);
  v5 = v4;
  if (self->_displayStyle == 1000)
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 7);
    objc_msgSend(v5, "_setClipUnderlapWhileTransitioning:", 1);
    objc_msgSend(v5, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBarButtonItem:", v12);
LABEL_6:

    goto LABEL_7;
  }
  -[EKCalendarChooserDefaultImpl view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v6))
    goto LABEL_6;
  -[EKCalendarChooserDefaultImpl view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegular = EKUICurrentHeightSizeClassIsRegular(v7);

  if (IsRegular)
  {
    objc_msgSend(v5, "setModalPresentationStyle:", 6);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v6);

    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v5, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_updateViewControllerTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 IsCompactInViewHierarchy;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;

  if (-[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser"))
  {
    if (self->_limitedToSource)
    {
      -[EKCalendarChooserDefaultImpl _contactForSource:](self, "_contactForSource:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@’s Calendar"), &stru_1E601DFA8, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 1000);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, v6);
      else
        CUIKDisplayedTitleForSource();
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1E601DFA8, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[EKCalendarChooserDefaultImpl view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v3);
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (IsCompactInViewHierarchy)
      v10 = CFSTR("Calendars");
    else
      v10 = CFSTR("Show Calendars");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[EKCalendarChooserDefaultImpl setTitle:](self, "setTitle:", v12);
  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v12);

}

- (id)_contactForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "ownerAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _preferredAddressFromOwnerAddresses:](self, "_preferredAddressFromOwnerAddresses:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKDisplayedTitleForSource();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ContactsUtils defaultContactKeysToFetch](ContactsUtils, "defaultContactKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v6, v7, 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_preferredAddressFromOwnerAddresses:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = *(_QWORD *)v13;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      if (objc_msgSend(v8, "hasMailto", (_QWORD)v12))
      {
        objc_msgSend(v8, "stringRemovingMailto");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v9 = (void *)v10;
        goto LABEL_15;
      }
      if (objc_msgSend(v8, "hasTel"))
      {
        objc_msgSend(v8, "stringRemovingTel");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    v9 = 0;
    if (v5)
      continue;
    break;
  }
LABEL_15:

  return v9;
}

- (BOOL)_shouldShowAddHolidayCalendarMenuItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventStore sources](self->_eventStore, "sources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDelegate") & 1) == 0 && objc_msgSend(v9, "sourceType"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "haveiCloudCalendarAccountInSources:", v3);

  return v11;
}

- (void)_layoutNavToolbarControls
{
  char flags;
  UIRefreshControl *v4;
  UIRefreshControl *refreshControl;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id WeakRetained;
  int v31;
  id v32;
  id v33;

  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0 && !self->_refreshControl)
  {
    v4 = (UIRefreshControl *)objc_alloc_init(MEMORY[0x1E0DC3BA8]);
    -[UIRefreshControl addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__pulledToRefresh_, 4096);
    -[UICollectionView setRefreshControl:](self->_collectionView, "setRefreshControl:", v4);
    refreshControl = self->_refreshControl;
    self->_refreshControl = v4;

    flags = (char)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("cancel-button"));
    objc_msgSend(v33, "addObject:", v6);

    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("done-button"));
    objc_msgSend(v33, "addObject:", v7);

  }
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

    objc_msgSend(v33, "removeLastObject");
  }
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    objc_msgSend(v33, "removeLastObject");
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend(v33, "removeLastObject");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v12, "addObject:", v14);

  }
  if (!-[EKCalendarChooserDefaultImpl disableCalendarEditing](self, "disableCalendarEditing")
    && -[EKCalendarChooserDefaultImpl hasAccountThatCanCreateCalendars](self, "hasAccountThatCanCreateCalendars"))
  {
    -[EKCalendarChooserDefaultImpl _updateOrCreateAddCalendarBarButtonItem](self, "_updateOrCreateAddCalendarBarButtonItem");
    objc_msgSend(v12, "addObject:", self->_addCalendarButton);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v12, "addObject:", v15);

  }
  -[EKCalendarChooserDefaultImpl _applySelection](self, "_applySelection");
  if (self->_style == 1)
  {
    if (!objc_msgSend(v12, "count"))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      objc_msgSend(v12, "addObject:", v16);

    }
    v17 = (char)self->_flags;
    v18 = (void *)objc_opt_class();
    if ((v17 & 2) != 0)
      objc_msgSend(v18, "hideAllString");
    else
      objc_msgSend(v18, "showAllString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v19, 0, self, sel_showAllButtonPressed);
    -[EKCalendarChooserDefaultImpl setShowAllButton:](self, "setShowAllButton:", v20);

    -[EKCalendarChooserDefaultImpl showAllButton](self, "showAllButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v21);

    if ((*(_BYTE *)&self->_flags & 2) != 0)
      v22 = CFSTR("hide-all-button");
    else
      v22 = CFSTR("show-all-button");
    -[EKCalendarChooserDefaultImpl showAllButton](self, "showAllButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityIdentifier:", v22);

    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "showAllString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "hideAllString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithObjects:", v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl showAllButton](self, "showAllButton");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPossibleTitles:", v27);

  }
  if (objc_msgSend(v12, "count"))
  {
    -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setToolbarHidden:", 0);

    -[EKCalendarChooserDefaultImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v12, 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v31 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEF09E78);

    if (v31)
    {
      v32 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v32, "calendarChooserUpdatedToolbarItems");

    }
  }
  -[UICollectionView sizeThatFits:](self->_collectionView, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 600.0);
  -[EKCalendarChooserDefaultImpl setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)_updateOrCreateAddCalendarBarButtonItem
{
  _BOOL4 v3;
  uint64_t v4;
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
  BOOL v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIBarButtonItem *addCalendarButton;
  id v34;
  void *v35;
  void *v36;
  UIBarButtonItem *v37;
  UIBarButtonItem *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id *p_addCalendarButton;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  _QWORD v56[2];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[EKCalendarChooserDefaultImpl _shouldShowAddHolidayCalendarMenuItem](self, "_shouldShowAddHolidayCalendarMenuItem");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      v5 = (void *)MEMORY[0x1E0DC3428];
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add Holiday Calendar - menu action"), CFSTR("Add Holiday Calendar"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar.badge.plus"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v4;
      v53[1] = 3221225472;
      v53[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke;
      v53[3] = &unk_1E6019DA8;
      objc_copyWeak(&v54, &location);
      objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, v8, 0, v53);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("add-holiday-calendar-menubutton"));
      objc_msgSend(v46, "addObject:", v9);

      objc_destroyWeak(&v54);
    }
    v10 = (void *)MEMORY[0x1E0DC3428];
    EventKitUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Add Subscription Calendar"), &stru_1E601DFA8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("badge.plus.radiowaves.forward"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v4;
    v51[1] = 3221225472;
    v51[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_2;
    v51[3] = &unk_1E6019DA8;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v51);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "setAccessibilityIdentifier:", CFSTR("add-subscription-calendar-menubutton"));
    objc_msgSend(v46, "addObject:", v45);
    -[EKEventStore primaryAppleAccountSource](self->_eventStore, "primaryAppleAccountSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15 && self->_hasIcloudFamilyMembers)
    {
      v16 = (void *)MEMORY[0x1E0DC3428];
      EventKitUIBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Add Family Calendar Menu Button"), CFSTR("Add Family Calendar"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.icloud"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_3;
      v49[3] = &unk_1E6019DA8;
      objc_copyWeak(&v50, &location);
      objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v18, v19, 0, v49);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "addObject:", v20);
      objc_destroyWeak(&v50);
    }
    v21 = (void *)MEMORY[0x1E0DC3428];
    EventKitUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Add Calendar Menu Button"), CFSTR("Add Calendar"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("calendar.badge.plus"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_4;
    v47[3] = &unk_1E6019DA8;
    objc_copyWeak(&v48, &location);
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v24, 0, v47);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("add-calendar-menubutton"));
    v26 = (void *)MEMORY[0x1E0DC39D0];
    v57[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E601DFA8, 0, 0, 1, v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0DC39D0];
    v56[0] = v29;
    v56[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "menuWithChildren:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    addCalendarButton = self->_addCalendarButton;
    if (addCalendarButton)
    {
      -[UIBarButtonItem setMenu:](addCalendarButton, "setMenu:", v32);
    }
    else
    {
      v39 = objc_alloc(MEMORY[0x1E0DC34F0]);
      EventKitUIBundle();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Add Calendar"), &stru_1E601DFA8, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v39, "initWithTitle:menu:", v41, v32);
      p_addCalendarButton = (id *)&self->_addCalendarButton;
      v44 = *p_addCalendarButton;
      *p_addCalendarButton = (id)v42;

      objc_msgSend(*p_addCalendarButton, "setAccessibilityIdentifier:", CFSTR("add-calendar-button"));
    }

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v52);

    objc_destroyWeak(&location);
  }
  else if (!self->_addCalendarButton)
  {
    v34 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Add Calendar"), &stru_1E601DFA8, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (UIBarButtonItem *)objc_msgSend(v34, "initWithTitle:style:target:action:", v36, 0, self, sel_addCalendarButtonPressed_);
    v38 = self->_addCalendarButton;
    self->_addCalendarButton = v37;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_addCalendarButton, "setAccessibilityIdentifier:", CFSTR("add-calendar-button"));
  }
}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "addHolidayCalendarButtonPressed:", WeakRetained[127]);
    WeakRetained = v2;
  }

}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "addSubscribedCalendarButtonPressed:prefillURL:", WeakRetained[127], 0);
    WeakRetained = v2;
  }

}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "addFamilyCalendarButtonPressed:", WeakRetained[127]);
    WeakRetained = v2;
  }

}

void __71__EKCalendarChooserDefaultImpl__updateOrCreateAddCalendarBarButtonItem__block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "addCalendarButtonPressed:", WeakRetained[127]);
    WeakRetained = v2;
  }

}

- (id)_viewModeTitle
{
  void *v2;
  _BOOL4 IsCompactInViewHierarchy;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[EKCalendarChooserDefaultImpl view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2);
  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsCompactInViewHierarchy)
    v6 = CFSTR("Calendars");
  else
    v6 = CFSTR("Show Calendars");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UICollectionView sizeThatFits:](self->_collectionView, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1100.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setChooserMode:(int64_t)a3
{
  void *v6;

  if (a3 == 1 && self->_style)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 1428, CFSTR("Import mode must use single selection style."));

  }
  self->_chooserMode = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  _BOOL4 IsRegularInViewHierarchy;

  -[EKCalendarChooserDefaultImpl view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v2);

  if (IsRegularInViewHierarchy)
    return 30;
  else
    return 2;
}

- (BOOL)showsDoneButton
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)showsCancelButton
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)setShowsCancelButton:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)disableCalendarsUnselectedByFocus
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (void)setDisableCalendarsUnselectedByFocus:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char flags;
  char v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = a3;
  if (!a3)
  {
LABEL_5:
    flags = (char)self->_flags;
    if (((((flags & 0x40) == 0) ^ v3) & 1) == 0)
    {
      if (v3)
        v10 = 64;
      else
        v10 = 0;
      *(_BYTE *)&self->_flags = flags & 0xBF | v10;
    }
    return;
  }
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_11;
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
    goto LABEL_5;
LABEL_12:
  v11 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Attempted to disable calendars unselected by focus, but the delegate does not implement the required methods", v12, 2u);
  }
}

- (void)focusModeConfigurationChanged
{
  -[EKCalendarChooserDefaultImpl _reloadCalendarsForcingCollectionViewReload:](self, "_reloadCalendarsForcingCollectionViewReload:", 1);
}

- (void)_showDeclinedEventsChanged:(id)a3
{
  NSNumber *pendingShowDeclinedEvents;

  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  self->_pendingShowDeclinedEvents = 0;

  -[EKCalendarChooserDefaultImpl _reconfigureIdentifierInCollectionView:](self, "_reconfigureIdentifierInCollectionView:", CFSTR("CollectionViewRowIdentifierDeclinedEvents"));
}

- (void)_showCompletedRemindersChanged:(id)a3
{
  NSNumber *pendingShowCompletedReminders;

  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  self->_pendingShowCompletedReminders = 0;

  -[EKCalendarChooserDefaultImpl _reconfigureIdentifierInCollectionView:](self, "_reconfigureIdentifierInCollectionView:", CFSTR("CollectionViewRowIdentifierCompletedReminders"));
}

- (BOOL)allowsPullToRefresh
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)setAllowsPullToRefresh:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  void *v7;

  v3 = a3;
  if (!self->_eventStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 1498, CFSTR("The event store must be set before enabling pull-to-refresh"));

  }
  if (v3)
    v5 = 32;
  else
    v5 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v5;
}

- (void)cancel:(id)a3
{
  EKCalendarChooserDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "calendarChooserDidCancel:", v9);

    }
  }
}

- (void)done:(id)a3
{
  EKCalendarChooserDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "calendarChooserDidFinish:", v9);

    }
  }
}

- (void)refresh:(id)a3
{
  EKCalendarChooserDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  EKAccountRefresher *v10;
  EKAccountRefresher *currentAccountRefresher;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "refreshCalendarsButtonPressed");
      v10 = (EKAccountRefresher *)objc_claimAutoreleasedReturnValue();
      currentAccountRefresher = self->_currentAccountRefresher;
      self->_currentAccountRefresher = v10;

      -[EKAccountRefresher setDelegate:](self->_currentAccountRefresher, "setDelegate:", self);
      if ((-[EKAccountRefresher refreshing](self->_currentAccountRefresher, "refreshing") & 1) == 0)
        -[EKCalendarChooserDefaultImpl _finishRefreshing](self, "_finishRefreshing");
    }
  }
}

- (void)_finishRefreshing
{
  UIRefreshControl *refreshControl;
  EKAccountRefresher *currentAccountRefresher;

  refreshControl = self->_refreshControl;
  if (refreshControl)
    -[UIRefreshControl endRefreshing](refreshControl, "endRefreshing");
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;

}

- (void)accountRefreshFinished:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  -[EKCalendarChooserDefaultImpl _finishRefreshing](self, "_finishRefreshing");
  v5 = objc_msgSend(v4, "allAccountsOffline");

  if (v5)
    +[EKUIAccountErrorDisplayer presentAlertForOfflineErrorUsingViewController:](EKUIAccountErrorDisplayer, "presentAlertForOfflineErrorUsingViewController:", self);
}

- (BOOL)_calendarAvailableForEditing:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[EKCalendarChooserDefaultImpl disableCalendarEditing](self, "disableCalendarEditing"))
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "isEditable");

  return v5;
}

- (id)_calendarInfoForCalendar:(id)a3
{
  id v4;
  void *v5;
  NSArray *allGroups;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__7;
    v16 = __Block_byref_object_dispose__7;
    v17 = 0;
    allGroups = self->_allGroups;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke;
    v9[3] = &unk_1E6019DF8;
    v10 = v4;
    v11 = &v12;
    -[NSArray enumerateObjectsUsingBlock:](allGroups, "enumerateObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  objc_msgSend(a2, "calendarInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke_2;
  v9[3] = &unk_1E6019DD0;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __57__EKCalendarChooserDefaultImpl__calendarInfoForCalendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)))
  {

LABEL_4:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v10, "otherCalendars");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v9)
    goto LABEL_4;
LABEL_5:

}

- (id)_saveSelection
{
  if (self->_style)
    -[EKCalendarChooserDefaultImpl selectedCalendars](self, "selectedCalendars");
  else
    -[EKCalendarChooserDefaultImpl selectedCalendar](self, "selectedCalendar");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_restoreSelection:(id)a3 calendarsForSelectedSource:(id)a4 allCalendars:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  EKEventStore *eventStore;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_style)
  {
    v23 = v8;
    -[EKCalendarChooserDefaultImpl _calendarSetToCalendarIdSet:](self, "_calendarSetToCalendarIdSet:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v9;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v17, "calendarIdentifier", v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v10, "containsObject:", v18);

          if (v19)
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    -[EKCalendarChooserDefaultImpl setSelectedCalendarsAndNotify:](self, "setSelectedCalendarsAndNotify:", v11);
    v9 = v22;
    v8 = v23;
  }
  else if (objc_msgSend(a4, "containsObject:", v8))
  {
    -[EKCalendarChooserDefaultImpl setSelectedCalendar:](self, "setSelectedCalendar:", v8);
  }
  else if (v8)
  {
    eventStore = self->_eventStore;
    if (self->_entityType)
      -[EKEventStore defaultCalendarForNewReminders](eventStore, "defaultCalendarForNewReminders");
    else
      -[EKEventStore defaultCalendarForNewEvents](eventStore, "defaultCalendarForNewEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl setSelectedCalendar:](self, "setSelectedCalendar:", v21);

  }
}

- (_UIAccessDeniedView)accessDeniedView
{
  id v3;
  _UIAccessDeniedView *v4;
  _UIAccessDeniedView *accessDeniedView;
  unint64_t entityType;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (!self->_accessDeniedView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3FE0]);
    v4 = (_UIAccessDeniedView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    accessDeniedView = self->_accessDeniedView;
    self->_accessDeniedView = v4;

    -[_UIAccessDeniedView setAutoresizingMask:](self->_accessDeniedView, "setAutoresizingMask:", 18);
    entityType = self->_entityType;
    EventKitUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (entityType == 1)
      v9 = CFSTR("This app does not have access to your reminders.");
    else
      v9 = CFSTR("This app does not have access to your calendars.");
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAccessDeniedView setTitle:](self->_accessDeniedView, "setTitle:", v10);

  }
  return self->_accessDeniedView;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4 displayStyle:(int64_t)a5
{
  self->_shouldOverrideAuthorizationStatus = a3;
  self->_displayStyle = a5;
  -[EKCalendarChooserDefaultImpl _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:", a4);
}

- (void)_updateDelegateSources
{
  NSUInteger v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *delegateSources;
  EKSource *limitedToSource;
  EKSource *v9;

  v3 = -[NSArray count](self->_delegateSources, "count");
  v4 = (void *)MEMORY[0x1E0D0CD30];
  -[EKCalendarChooserDefaultImpl eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedEnabledDelegateSourcesFromStore:", v5);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  delegateSources = self->_delegateSources;
  self->_delegateSources = v6;

  if (v3 != -[NSArray count](self->_delegateSources, "count"))
    -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
  limitedToSource = self->_limitedToSource;
  if (limitedToSource
    && -[EKSource isDelegate](limitedToSource, "isDelegate")
    && !-[NSArray containsObject:](self->_delegateSources, "containsObject:", self->_limitedToSource))
  {
    v9 = self->_limitedToSource;
    self->_limitedToSource = 0;

    -[EKCalendarChooserDefaultImpl _delegateSelectionDidChange:](self, "_delegateSelectionDidChange:", 1);
  }
}

- (void)_updateShowDelegateCalendarsCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EKCalendarChooserDefaultImpl eventStore](self, "eventStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_333);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showDelegateCalendarsCell = objc_msgSend(v5, "count") != 0;

}

uint64_t __64__EKCalendarChooserDefaultImpl__updateShowDelegateCalendarsCell__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsDelegation"))
    v4 = objc_msgSend(v2, "isDelegate") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (void)_eventStoreChangedExternally
{
  -[EKCalendarChooserDefaultImpl _eventStoreChanged:](self, "_eventStoreChanged:", 0);
}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  _BOOL4 showDelegateCalendarsCell;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD block[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA9F90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
  {
LABEL_20:
    v30 = v5;
    -[EKCalendarChooserDefaultImpl _currentKnownCalendarIds](self, "_currentKnownCalendarIds");
    v14 = objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl _allCalendars](self, "_allCalendars");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl _loadCalendars](self, "_loadCalendars");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl _calendarSetToCalendarIdSet:](self, "_calendarSetToCalendarIdSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v14;
    objc_msgSend(v16, "minusSet:", v14);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v22, "calendarIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v16, "containsObject:", v23);

          if (v24)
            -[NSMutableSet addObject:](self->_selectedCalendars, "addObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v19);
    }

    -[EKCalendarChooserDefaultImpl _saveSelection](self, "_saveSelection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    showDelegateCalendarsCell = self->_showDelegateCalendarsCell;
    -[EKCalendarChooserDefaultImpl _updateDelegateSources](self, "_updateDelegateSources");
    -[EKCalendarChooserDefaultImpl _updateShowDelegateCalendarsCell](self, "_updateShowDelegateCalendarsCell");
    if (showDelegateCalendarsCell != self->_showDelegateCalendarsCell)
      -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
    v5 = v30;
    -[EKCalendarChooserDefaultImpl _setCalendars:changedObjectsHint:forceCollectionViewReload:](self, "_setCalendars:changedObjectsHint:forceCollectionViewReload:", v28, v30, 0);
    -[EKCalendarChooserDefaultImpl _restoreSelection:calendarsForSelectedSource:allCalendars:](self, "_restoreSelection:calendarsForSelectedSource:allCalendars:", v25, v28, v17);
    -[EKCalendarChooserDefaultImpl _updateCurrentKnownCalendarIds](self, "_updateCurrentKnownCalendarIds");
    if (-[EKCalendarChooserDefaultImpl isViewLoaded](self, "isViewLoaded"))
    {
      if (!self->_shouldOverrideAuthorizationStatus)
      {
        v27 = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", self->_entityType);
        if (v27 != self->_lastAuthorizationStatus)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__EKCalendarChooserDefaultImpl__eventStoreChanged___block_invoke;
          block[3] = &unk_1E6018FC8;
          block[4] = self;
          block[5] = v27;
          dispatch_sync(MEMORY[0x1E0C80D38], block);
        }
      }
    }
    -[EKCalendarChooserDefaultImpl _reconfigureHeaders](self, "_reconfigureHeaders");

    v6 = v29;
    goto LABEL_36;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (!v7)
  {
LABEL_36:

    goto LABEL_37;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v37;
  while (2)
  {
    for (j = 0; j != v8; ++j)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
      if (objc_msgSend(v13, "entityType") == 6)
      {
        v9 = 1;
        v10 = 1;
      }
      else
      {
        if (objc_msgSend(v13, "entityType") == 1)
        {
          v9 = 1;
          v10 = 1;
        }
        if ((v10 & 1) == 0)
          continue;
      }
      if ((v9 & 1) != 0)
      {

LABEL_19:
        objc_msgSend(MEMORY[0x1E0D0CD00], "invalidate");
        -[EKCalendarChooserDefaultImpl _layoutNavToolbarControls](self, "_layoutNavToolbarControls");
        goto LABEL_20;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
      continue;
    break;
  }

  if ((v10 & 1) != 0)
  {
    if ((v9 & 1) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_37:

}

uint64_t __51__EKCalendarChooserDefaultImpl__eventStoreChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessDeniedViewWithNewStatus:", *(_QWORD *)(a1 + 40));
}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  _UIAccessDeniedView *accessDeniedView;
  _UIAccessDeniedView *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_lastAuthorizationStatus != a3)
  {
    accessDeniedView = self->_accessDeniedView;
    if (a3 < 3)
    {
      if (!accessDeniedView)
      {
        -[EKCalendarChooserDefaultImpl firstResponder](self, "firstResponder");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "resignFirstResponder");

        -[EKCalendarChooserDefaultImpl accessDeniedView](self, "accessDeniedView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarChooserDefaultImpl setView:](self, "setView:", v8);

        if (a3 == 1)
        {
          -[EKCalendarChooserDefaultImpl accessDeniedView](self, "accessDeniedView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setMessage:", CFSTR(" "));

        }
        -[UICollectionView removeFromSuperview](self->_collectionView, "removeFromSuperview");
      }
    }
    else if (accessDeniedView)
    {
      -[EKCalendarChooserDefaultImpl setView:](self, "setView:", self->_collectionView);
      -[_UIAccessDeniedView removeFromSuperview](self->_accessDeniedView, "removeFromSuperview");
      v6 = self->_accessDeniedView;
      self->_accessDeniedView = 0;

    }
    self->_lastAuthorizationStatus = a3;
  }
}

- (void)_ignoredErrorsChanged
{
  -[EKCalendarChooserDefaultImpl _eventStoreChanged:](self, "_eventStoreChanged:", 0);
}

- (id)_calendarSetToCalendarIdSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "calendarIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "calendarIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_currentKnownCalendarIds
{
  return (id)-[NSSet mutableCopy](self->_currentKnownCalendarIds, "mutableCopy");
}

- (void)_updateCurrentKnownCalendarIds
{
  NSSet *v3;
  NSSet *currentKnownCalendarIds;
  id v5;

  -[EKCalendarChooserDefaultImpl _allCalendars](self, "_allCalendars");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _calendarSetToCalendarIdSet:](self, "_calendarSetToCalendarIdSet:", v5);
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  currentKnownCalendarIds = self->_currentKnownCalendarIds;
  self->_currentKnownCalendarIds = v3;

}

- (id)_filterCalendars:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t entityType;
  char v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        entityType = self->_entityType;
        v13 = objc_msgSend(v11, "allowedEntityTypes", (_QWORD)v17);
        if (entityType)
        {
          if ((v13 & 2) == 0)
            goto LABEL_9;
LABEL_8:
          objc_msgSend(v5, "addObject:", v11);
          goto LABEL_9;
        }
        if ((v13 & 1) != 0)
          goto LABEL_8;
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v14;
    }
    while (v14);
  }

  -[EKCalendarChooserDefaultImpl _calendarsForSelectedSource](self, "_calendarsForSelectedSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", v15);

  return v5;
}

- (void)_ensureWritableCalendarExists
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t entityType;
  EKEventStore *eventStore;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKEventStore readWriteCalendarsForEntityType:](self->_eventStore, "readWriteCalendarsForEntityType:", self->_entityType, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
      entityType = self->_entityType;
      if (!entityType)
      {
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "allowEvents") & 1) != 0)
          break;
        entityType = self->_entityType;
      }
      if (entityType == 1 && (objc_msgSend(v8, "allowReminders") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    eventStore = self->_eventStore;
    if (self->_entityType)
      -[EKEventStore defaultCalendarForNewReminders](eventStore, "defaultCalendarForNewReminders");
    else
      -[EKEventStore defaultCalendarForNewEvents](eventStore, "defaultCalendarForNewEvents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

}

- (id)_calendarsForSelectedSource
{
  EKSource *limitedToSource;
  void *v4;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  limitedToSource = self->_limitedToSource;
  v4 = (void *)MEMORY[0x1E0D0CD28];
  v5 = ((unint64_t)*(_BYTE *)&self->_flags >> 4) & 1;
  v6 = -[EKCalendarChooserDefaultImpl onlyShowUnmanagedAccounts](self, "onlyShowUnmanagedAccounts");
  -[EKCalendarChooserDefaultImpl event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvent:entityType:inEventStore:", limitedToSource, v5, v6, v7, self->_entityType, self->_eventStore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_allCalendars
{
  char flags;
  EKEventStore *eventStore;
  unint64_t entityType;
  void *v6;
  void *v7;

  flags = (char)self->_flags;
  eventStore = self->_eventStore;
  entityType = self->_entityType;
  if ((flags & 0x10) != 0)
    -[EKEventStore readWriteCalendarsForEntityType:](eventStore, "readWriteCalendarsForEntityType:", entityType);
  else
    -[EKEventStore calendarsForEntityType:](eventStore, "calendarsForEntityType:", entityType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_loadCalendars
{
  -[EKCalendarChooserDefaultImpl _ensureWritableCalendarExists](self, "_ensureWritableCalendarExists");
  return -[EKCalendarChooserDefaultImpl _calendarsForSelectedSource](self, "_calendarsForSelectedSource");
}

- (BOOL)_applySelection
{
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableSet *selectedCalendars;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  int v21;
  NSArray *obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_allGroups;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v3 = 0;
  if (v25)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v4);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v26 = v5;
        v27 = v4;
        objc_msgSend(v5, "calendarInfos");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v29 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v11, "calendar");
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12)
              {
                selectedCalendars = self->_selectedCalendars;
                objc_msgSend(v11, "calendar");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = -[NSMutableSet containsObject:](selectedCalendars, "containsObject:", v14);

                if ((v3 & 1) != 0)
                  v3 = 1;
                else
                  v3 = v15 ^ objc_msgSend(v11, "selected");
                objc_msgSend(v11, "setSelected:", v15);
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v8);
        }

        v16 = objc_msgSend(v26, "numSelectedCalendars");
        v17 = objc_msgSend(v26, "numSelectableCalendars");
        v18 = v17;
        if ((v3 & 1) != 0)
          v3 = 1;
        else
          v3 = (v16 == v17) ^ objc_msgSend(v26, "selected");
        objc_msgSend(v26, "setSelected:", v16 == v18);
        v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  v19 = -[EKCalendarChooserDefaultImpl _numSelectedGroups](self, "_numSelectedGroups");
  v20 = -[NSArray count](self->_groups, "count");
  if ((v3 & 1) != 0)
    LOBYTE(v21) = 1;
  else
    v21 = (v20 == v19) ^ ((*(_BYTE *)&self->_flags & 2) >> 1);
  -[EKCalendarChooserDefaultImpl setAllSelected:](self, "setAllSelected:", v20 == v19);
  return v21;
}

- (BOOL)_isCalendarEnabled:(id)a3
{
  return objc_msgSend(a3, "isEnabled");
}

- (id)_statusTextForGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(objc_msgSend(a3, "accountError"))
  {
    case 1:
    case 6:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Unable to update calendars.");
      goto LABEL_6;
    case 2:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Unable to update account due to missing information.");
      goto LABEL_6;
    case 3:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Unable to connect to the internet.");
      goto LABEL_6;
    case 4:
    case 5:
    case 8:
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("Unable to connect to account.");
LABEL_6:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_reloadCalendars
{
  -[EKCalendarChooserDefaultImpl _reloadCalendarsForcingCollectionViewReload:](self, "_reloadCalendarsForcingCollectionViewReload:", 0);
}

- (void)_reloadCalendarsForcingCollectionViewReload:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[EKCalendarChooserDefaultImpl _loadCalendars](self, "_loadCalendars");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _setCalendars:changedObjectsHint:forceCollectionViewReload:](self, "_setCalendars:changedObjectsHint:forceCollectionViewReload:", v5, 0, v3);

}

- (void)_updatePossiblyChangedIndexPaths:(id)a3 possiblyChangedSectionIndices:(id)a4 forGroups:(id)a5 withFirstSection:(int64_t)a6 changedObjectIDSet:(id)a7 footersChanged:(BOOL)a8 reloadEverything:(BOOL)a9
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  id obj;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v31 = a8;
  v47 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v29 = a4;
  v12 = a5;
  v13 = a7;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v12;
  v33 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(obj);
        v34 = v14;
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v14);
        objc_msgSend(v15, "source", v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v13, "containsObject:", v17);

        if (a9 || (v31 & v18) != 0)
          objc_msgSend(v29, "addIndex:", a6);
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        objc_msgSend(v15, "calendarInfos");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v38;
          v23 = 1;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v38 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "calendar");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v13, "containsObject:", v26);

              if (a9 || v27)
              {
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v23 + i, a6);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "addObject:", v28);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            v23 += i;
          }
          while (v21);
        }

        ++a6;
        v14 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v33);
  }

}

- (void)_setCalendars:(id)a3 changedObjectsHint:(id)a4 forceCollectionViewReload:(BOOL)a5
{
  id v7;
  id WeakRetained;
  char v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  EKEventStore *eventStore;
  unint64_t entityType;
  int64_t chooserMode;
  void *v18;
  BOOL v19;
  int64_t *v20;
  void *v21;
  void *v22;
  EKEventStore *v23;
  EKCalendarChooserDefaultImpl *v24;
  uint64_t v25;
  NSArray *groups;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *allGroups;
  char flags;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  id v78;
  id v79;
  void *v80;
  NSArray *v81;
  NSArray *obj;
  uint64_t v83;
  void *v84;
  void *v85;
  EKCalendarChooserDefaultImpl *v86;
  _QWORD v87[5];
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  int64_t v101;
  char v102;
  char v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v77 = a5;
  v107 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v7 = a4;
  v81 = self->_groups;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unselectedCalendarsForFocusMode");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v80 = 0;
  }
  v78 = v7;
  v103 = 0;
  v11 = 0;
  if (-[EKCalendarChooserDefaultImpl disableCalendarsUnselectedByFocus](self, "disableCalendarsUnselectedByFocus"))
  {
    -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "focusFilterMode") == 1;

  }
  if (self->_showAccountStatus)
  {
    if (self->_limitedToSource)
      v13 = 0;
    else
      v13 = !v11;
  }
  else
  {
    v13 = 0;
  }
  v102 = 0;
  v101 = 0;
  v14 = (void *)MEMORY[0x1E0D0CD28];
  eventStore = self->_eventStore;
  v86 = self;
  entityType = self->_entityType;
  chooserMode = v86->_chooserMode;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 && v80 != 0;
  v20 = &v101;
  if (!v19)
    v20 = 0;
  LOBYTE(v73) = v11;
  v21 = v14;
  v22 = v79;
  v23 = eventStore;
  v24 = v86;
  objc_msgSend(v21, "generateGroupsForCalendars:eventStore:entityType:forMode:usingBackgroundColor:includingAccountsWithoutCalendars:filterByFocus:usingUnselectedCalendars:foundRefreshableCalendar:anyGroupsHiddenByFocus:numberOfCalendarsHiddenByFocus:", v79, v23, entityType, chooserMode, v18, v13, v73, v80, &v102, &v103, v20);
  v25 = objc_claimAutoreleasedReturnValue();
  groups = v86->_groups;
  v86->_groups = (NSArray *)v25;

  v27 = -[NSArray count](v86->_groups, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v86->_groups)
    objc_msgSend(v28, "addObjectsFromArray:");
  v30 = objc_msgSend(v29, "copy");
  allGroups = v86->_allGroups;
  v86->_allGroups = (NSArray *)v30;

  if (v19)
    v86->_numCalendarsHiddenByFocus = v101;
  flags = (char)v86->_flags;
  if ((flags & 0x20) != 0 && !v102)
  {
    flags &= ~0x20u;
    *(_BYTE *)&v86->_flags = flags;
  }
  if (v86->_showAccountStatus)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](v81, "count"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v33 = v81;
    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v98 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          objc_msgSend(v38, "source");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sourceIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v38, v40);

        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
      }
      while (v35);
    }

    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v24 = v86;
    obj = v86->_groups;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
    if (v41)
    {
      v42 = v41;
      v75 = v29;
      v43 = 0;
      v83 = *(_QWORD *)v94;
      while (1)
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v94 != v83)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          objc_msgSend(v45, "source");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setAccountError:", objc_msgSend(MEMORY[0x1E0D0CD30], "errorForSource:", v46));
          -[EKCalendarChooserDefaultImpl _statusTextForGroup:](v24, "_statusTextForGroup:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "source");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "sourceIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "objectForKeyedSubscript:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "footer");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (!CalEqualStrings())
            v43 = 1;
          objc_msgSend(v45, "setFooter:", v47);
          if (v46)
          {
            v52 = objc_msgSend(v45, "accountError");
            v53 = +[EKUIAccountErrorDisplayer errorIsActionable:](EKUIAccountErrorDisplayer, "errorIsActionable:", v52);
            objc_msgSend(v45, "setShowAccountErrorActionButton:", v53);
            if (v53)
            {
              v54 = 1;
            }
            else
            {
              if (!v52)
                goto LABEL_47;
              v55 = 8;
              if (v52 == 3)
                v55 = 4;
              if (v52 == 1)
                v54 = 2;
              else
                v54 = v55;
            }
            -[EKCalendarChooserDefaultImpl _sendAnalyticsEvent:forGroup:](v86, "_sendAnalyticsEvent:forGroup:", v54, v45);
          }
LABEL_47:

          v24 = v86;
        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        if (!v42)
        {
          v56 = v43 & 1;
          v29 = v75;
          goto LABEL_52;
        }
      }
    }
    v56 = 0;
LABEL_52:

    flags = (char)v24->_flags;
    v22 = v79;
  }
  else
  {
    v56 = 0;
  }
  v57 = v78;
  *(_BYTE *)&v24->_flags = flags & 0xFE | (v24->_entityType == 0);
  -[EKCalendarChooserDefaultImpl _applySelection](v24, "_applySelection");
  if (-[EKCalendarChooserDefaultImpl isViewLoaded](v24, "isViewLoaded"))
  {
    if ((objc_msgSend((id)objc_opt_class(), "groups:differStructurallyFromGroups:", v24->_groups, v81) & 1) != 0 || v77)
    {
      -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](v24, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
    }
    else
    {
      v76 = v29;
      if (v78)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v78);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = 0;
      }
      v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      LOBYTE(v74) = v78 == 0;
      -[EKCalendarChooserDefaultImpl _updatePossiblyChangedIndexPaths:possiblyChangedSectionIndices:forGroups:withFirstSection:changedObjectIDSet:footersChanged:reloadEverything:](v24, "_updatePossiblyChangedIndexPaths:possiblyChangedSectionIndices:forGroups:withFirstSection:changedObjectIDSet:footersChanged:reloadEverything:", v59, v60, v24->_groups, -[EKCalendarChooserDefaultImpl _groupsOffset](v24, "_groupsOffset"), v58, v56, v74);
      -[UICollectionViewDiffableDataSource snapshot](v24->_dataSource, "snapshot");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "count"))
      {
        v85 = v58;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v63 = v59;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v90;
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v90 != v66)
                objc_enumerationMutation(v63);
              -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](v86->_dataSource, "itemIdentifierForIndexPath:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * k));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (v68)
                objc_msgSend(v62, "addObject:", v68);

            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v89, v104, 16);
          }
          while (v65);
        }

        v69 = (void *)objc_msgSend(v62, "copy");
        objc_msgSend(v61, "reconfigureItemsWithIdentifiers:", v69);

        v58 = v85;
        v24 = v86;
      }
      if (objc_msgSend(v60, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __91__EKCalendarChooserDefaultImpl__setCalendars_changedObjectsHint_forceCollectionViewReload___block_invoke;
        v87[3] = &unk_1E6019E60;
        v87[4] = v24;
        v88 = v70;
        v71 = v70;
        objc_msgSend(v60, "enumerateIndexesUsingBlock:", v87);
        v72 = (void *)objc_msgSend(v71, "copy");
        objc_msgSend(v61, "reloadSectionsWithIdentifiers:", v72);

      }
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](v24->_dataSource, "applySnapshot:animatingDifferences:", v61, 0);

      v22 = v79;
      v57 = v78;
      v29 = v76;
    }
  }

}

void __91__EKCalendarChooserDefaultImpl__setCalendars_changedObjectsHint_forceCollectionViewReload___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "sectionIdentifierForIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

+ (BOOL)groups:(id)a3 differStructurallyFromGroups:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 == objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(v5, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v29 = v6;
      v30 = v5;
      v31 = v8;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "source");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v13 == v14 || objc_msgSend(v13, "isEqual:", v14))
          && (v15 = objc_msgSend(v11, "showAccountErrorActionButton"),
              v15 == objc_msgSend(v12, "showAccountErrorActionButton")))
        {
          v32 = v13;
          v33 = v11;
          objc_msgSend(v11, "calendarInfos");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "calendarInfos");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "count");
          if (v19 == objc_msgSend(v18, "count"))
          {
            v20 = objc_msgSend(v17, "count");
            if (v20)
            {
              v21 = v20;
              v22 = 0;
              while (1)
              {
                objc_msgSend(v17, "objectAtIndexedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "calendar");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v18, "objectAtIndexedSubscript:", v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "calendar");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24 != v26 && !objc_msgSend(v24, "isEqual:", v26))
                  break;

                if (v21 == ++v22)
                {
                  v16 = 0;
                  goto LABEL_18;
                }
              }

              v16 = 1;
LABEL_18:
              v6 = v29;
              v5 = v30;
            }
            else
            {
              v16 = 0;
            }
            v9 = v31;
          }
          else
          {
            v16 = 1;
          }

          v13 = v32;
          v11 = v33;
        }
        else
        {
          v16 = 1;
        }

        v27 = v16 != 0;
        if (v16)
          break;
        ++v10;
      }
      while (v10 != v9);
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (void)setCheckedRow:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath **p_checkedRow;
  NSIndexPath *checkedRow;
  NSIndexPath *v8;
  NSIndexPath *v9;

  v5 = (NSIndexPath *)a3;
  if (!self->_style)
  {
    p_checkedRow = &self->_checkedRow;
    checkedRow = self->_checkedRow;
    if (checkedRow != v5)
    {
      v9 = v5;
      if (checkedRow)
      {
        *p_checkedRow = 0;
        v8 = checkedRow;

        -[EKCalendarChooserDefaultImpl _reconfigureCollectionViewAtIndexPath:](self, "_reconfigureCollectionViewAtIndexPath:", v8);
      }
      objc_storeStrong((id *)&self->_checkedRow, a3);
      -[EKCalendarChooserDefaultImpl _reconfigureCollectionViewAtIndexPath:](self, "_reconfigureCollectionViewAtIndexPath:", *p_checkedRow);
      v5 = v9;
    }
  }

}

- (void)setSelectedCalendar:(id)a3
{
  id v4;

  if (!self->_style)
  {
    -[EKCalendarChooserDefaultImpl _indexPathForCalendar:](self, "_indexPathForCalendar:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl setCheckedRow:](self, "setCheckedRow:", v4);

  }
}

- (EKCalendar)selectedCalendar
{
  void *v2;
  NSIndexPath *checkedRow;
  void *v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  if (self->_style || (checkedRow = self->_checkedRow) == 0)
  {
    v2 = 0;
  }
  else
  {
    -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", -[NSIndexPath section](checkedRow, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", -[NSIndexPath row](self->_checkedRow, "row"), v5);
    if (v5
      && (v7 = v6,
          objc_msgSend(v5, "calendarInfos"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7 < v9))
    {
      objc_msgSend(v5, "calendarInfos");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "calendar");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return (EKCalendar *)v2;
}

- (void)setSelectedCalendars:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0D0C278];
  v5 = a3;
  -[EKCalendarChooserDefaultImpl _setSelectedCalendars:notify:](self, "_setSelectedCalendars:notify:", v5, objc_msgSend(v4, "isProgramSDKAtLeast:", 0x7E60901FFFFFFFFLL) ^ 1);

}

- (void)setSelectedCalendarsAndNotify:(id)a3
{
  -[EKCalendarChooserDefaultImpl _setSelectedCalendars:notify:](self, "_setSelectedCalendars:notify:", a3, 1);
}

- (void)_setSelectedCalendars:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  id v12;

  v4 = a4;
  v6 = a3;
  v12 = v6;
  if (self->_style == 1)
  {
    -[EKCalendarChooserDefaultImpl _filterCalendars:](self, "_filterCalendars:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSMutableSet isEqualToSet:](self->_selectedCalendars, "isEqualToSet:", v7) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedCalendars, v7);
      if (-[EKCalendarChooserDefaultImpl isViewLoaded](self, "isViewLoaded")
        && -[EKCalendarChooserDefaultImpl _applySelection](self, "_applySelection"))
      {
        -[EKCalendarChooserDefaultImpl _collectionViewBuildAndApplyNewSnapshotAnimated:](self, "_collectionViewBuildAndApplyNewSnapshotAnimated:", 1);
      }
      if (v4)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          v10 = objc_loadWeakRetained((id *)&self->_delegate);
          -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "calendarChooserSelectionDidChange:", v11);

        }
      }
    }
  }
  else
  {
    if (!objc_msgSend(v6, "count"))
    {
      -[EKCalendarChooserDefaultImpl setSelectedCalendar:](self, "setSelectedCalendar:", 0);
      goto LABEL_12;
    }
    objc_msgSend(v12, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl setSelectedCalendar:](self, "setSelectedCalendar:", v7);
  }

LABEL_12:
}

- (NSSet)selectedCalendars
{
  void *v3;
  int64_t style;
  NSMutableSet *selectedCalendars;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  style = self->_style;
  if (style)
  {
    if (style == 1)
    {
      selectedCalendars = self->_selectedCalendars;
      if (selectedCalendars)
      {
        -[NSMutableSet allObjects](selectedCalendars, "allObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v6);
LABEL_7:

      }
    }
  }
  else
  {
    -[EKCalendarChooserDefaultImpl selectedCalendar](self, "selectedCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[EKCalendarChooserDefaultImpl selectedCalendar](self, "selectedCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);
      goto LABEL_7;
    }
  }
  return (NSSet *)v3;
}

- (id)_indexPathForCalendar:(id)a3
{
  id v4;
  void *v5;
  NSArray *groups;
  id v7;
  _QWORD v9[4];
  id v10;
  EKCalendarChooserDefaultImpl *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  -[EKCalendarChooserDefaultImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5)
  {
    groups = self->_groups;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke;
    v9[3] = &unk_1E6019EB0;
    v11 = self;
    v12 = &v13;
    v10 = v4;
    -[NSArray enumerateObjectsUsingBlock:](groups, "enumerateObjectsUsingBlock:", v9);

  }
  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a2;
  objc_msgSend(v7, "calendarInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke_2;
  v13[3] = &unk_1E6019E88;
  v9 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v14 = v9;
  v15 = v11;
  v16 = v7;
  v17 = v10;
  v18 = a3;
  v19 = a4;
  v12 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

}

void __54__EKCalendarChooserDefaultImpl__indexPathForCalendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || (objc_msgSend(v13, "otherCalendars"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32)),
        v8,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(*(id *)(a1 + 40), "_calendarIndex:toRowIndexInGroup:", a3, *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 64) + objc_msgSend(*(id *)(a1 + 40), "_groupsOffset"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
    **(_BYTE **)(a1 + 72) = 1;
  }

}

- (id)centeredCalendar
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;

  -[UICollectionView indexPathsForVisibleItems](self->_collectionView, "indexPathsForVisibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_349);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    if (v5 >= 0)
      v7 = v5;
    else
      v7 = v5 + 1;
    v8 = (uint64_t)(double)(v7 >> 1);
    objc_msgSend(v4, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v9, "section"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v6 - 1;
    v12 = v10 == 0;
    if (v10)
      v13 = 1;
    else
      v13 = v11 <= v8;
    if (v13)
    {
      v14 = (void *)v10;
    }
    else
    {
      v16 = v8 + 1;
      do
      {
        v17 = v9;
        objc_msgSend(v4, "objectAtIndex:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v9, "section"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v14 == 0;
        if (v14)
          break;
        v13 = v16++ < v11;
      }
      while (v13);
    }
    if (v12
      || ((v18 = objc_msgSend(v9, "row"),
           -[EKCalendarChooserDefaultImpl _accountErrorActionRowIndexForGroup:](self, "_accountErrorActionRowIndexForGroup:", v14) != v18)? (v19 = v18): (v19 = v18 + 1), v20 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", v19, v14), objc_msgSend(v14, "calendarInfos"), v21 = (void *)objc_claimAutoreleasedReturnValue(), v22 = objc_msgSend(v21, "count"), v21, v20 >= v22))
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v14, "calendarInfos");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndex:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __48__EKCalendarChooserDefaultImpl_centeredCalendar__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)centerOnCalendar:(id)a3
{
  id v4;

  if (a3)
  {
    -[EKCalendarChooserDefaultImpl _indexPathForCalendar:](self, "_indexPathForCalendar:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 2, 0);

  }
}

- (id)displayedEditor
{
  return self->_presentedEditor;
}

- (void)redisplayEditor:(id)a3 completion:(id)a4
{
  -[EKCalendarChooserDefaultImpl _presentEditor:animated:completion:](self, "_presentEditor:animated:completion:", a3, 0, a4);
}

- (void)_presentEditor:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v9 = (void (**)(_QWORD))a5;
  objc_msgSend(v13, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _indexPathForCalendar:](self, "_indexPathForCalendar:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 0, 0);
    v12 = 12;
  }
  else
  {
    v12 = 15;
  }
  if (v13)
  {
    objc_storeStrong((id *)&self->_presentedEditor, a3);
    -[EKCalendarChooserDefaultImpl _presentEditor:withIndexPath:barButtonItem:permittedArrowDirections:animated:completion:](self, "_presentEditor:withIndexPath:barButtonItem:permittedArrowDirections:animated:completion:", v13, v11, self->_addCalendarButton, v12, v6, v9);
  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (void)_presentEditor:(id)a3 withIndexPath:(id)a4 barButtonItem:(id)a5 permittedArrowDirections:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  EKUIManagedNavigationController *v20;
  EKUIManagedNavigationController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 IsRegular;
  void *v30;
  void *v31;
  id v32;

  v9 = a7;
  v32 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  objc_msgSend(v32, "setDelegate:", self);
  objc_msgSend(v32, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = -[EKUIManagedNavigationController initWithRootViewController:]([EKUIManagedNavigationController alloc], "initWithRootViewController:", v32);
  v21 = v20;

  -[EKUIManagedNavigationController _setClipUnderlapWhileTransitioning:](v21, "_setClipUnderlapWhileTransitioning:", 1);
  if (self->_displayStyle != 1000)
  {
    -[EKCalendarChooserDefaultImpl view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v27))
    {
      -[EKCalendarChooserDefaultImpl view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      IsRegular = EKUICurrentHeightSizeClassIsRegular(v28);

      if (IsRegular)
        -[EKUIManagedNavigationController setModalPresentationStyle:](v21, "setModalPresentationStyle:", 6);
    }
    else
    {

    }
LABEL_16:
    objc_storeStrong((id *)&self->_presentedEditor, a3);
    -[EKUIManagedNavigationController presentationController](v21, "presentationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", self);

    -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "presentViewController:animated:completion:", v21, v9, v17);

    goto LABEL_17;
  }
  -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentedViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    -[EKUIManagedNavigationController setModalPresentationStyle:](v21, "setModalPresentationStyle:", 7);
    -[EKUIManagedNavigationController popoverPresentationController](v21, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v15)
    {
      -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSourceView:", v26);

      objc_msgSend(v25, "setPermittedArrowDirections:", a6);
      if (!v26)
        goto LABEL_17;
    }
    else
    {
      if (v16)
        objc_msgSend(v24, "setBarButtonItem:", v16);
      objc_msgSend(v25, "setPermittedArrowDirections:", a6);

    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)presentationControllerDidDismiss:(id)a3
{
  EKAbstractCalendarEditor *presentedEditor;

  presentedEditor = self->_presentedEditor;
  self->_presentedEditor = 0;

}

- (int64_t)_accountErrorActionRowIndexForGroup:(id)a3
{
  if (-[EKCalendarChooserDefaultImpl _shouldDisplayAccountErrorActionCellForGroup:](self, "_shouldDisplayAccountErrorActionCellForGroup:", a3))
  {
    return 1;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_rowIndexForMeDelegate
{
  return 1;
}

- (int64_t)_rowIndexToDelegateSourceIndex:(int64_t)a3
{
  return a3 - 2;
}

- (int64_t)_rowIndex:(int64_t)a3 toCalendarIndexInGroup:(id)a4
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[EKCalendarChooserDefaultImpl _shouldDisplayAccountErrorActionCellForGroup:](self, "_shouldDisplayAccountErrorActionCellForGroup:", a4);
  v6 = -2;
  if (!v5)
    v6 = -1;
  return v6 + a3;
}

- (int64_t)_calendarIndex:(int64_t)a3 toRowIndexInGroup:(id)a4
{
  _BOOL4 v5;
  uint64_t v6;

  v5 = -[EKCalendarChooserDefaultImpl _shouldDisplayAccountErrorActionCellForGroup:](self, "_shouldDisplayAccountErrorActionCellForGroup:", a4);
  v6 = 1;
  if (v5)
    v6 = 2;
  return v6 + a3;
}

- (BOOL)_shouldDisplayAccountErrorActionCellForGroup:(id)a3
{
  if (self->_showAccountStatus)
    return objc_msgSend(a3, "showAccountErrorActionButton");
  else
    return 0;
}

- (BOOL)_shouldShowDeclinedEventsSection
{
  return -[EKCalendarChooserDefaultImpl showsDeclinedEventsSetting](self, "showsDeclinedEventsSetting")
      || -[EKCalendarChooserDefaultImpl showsCompletedRemindersSetting](self, "showsCompletedRemindersSetting");
}

- (BOOL)_isDeclinedEventsSwitchSection:(int64_t)a3
{
  _BOOL4 v5;
  int64_t v6;

  v5 = -[EKCalendarChooserDefaultImpl _shouldShowDeclinedEventsSection](self, "_shouldShowDeclinedEventsSection");
  if (v5)
  {
    v6 = -[EKCalendarChooserDefaultImpl _groupsOffset](self, "_groupsOffset");
    LOBYTE(v5) = -[NSArray count](self->_groups, "count") + v6 == a3;
  }
  return v5;
}

- (BOOL)_isDelegateCalendarsButtonSection:(int64_t)a3
{
  _BOOL4 v5;
  int64_t v6;
  NSUInteger v7;

  v5 = -[EKCalendarChooserDefaultImpl _shouldShowDelegateCalendarsButtonSection](self, "_shouldShowDelegateCalendarsButtonSection");
  if (v5)
  {
    v6 = -[EKCalendarChooserDefaultImpl _groupsOffset](self, "_groupsOffset");
    v7 = -[NSArray count](self->_groups, "count") + v6;
    LOBYTE(v5) = v7
               + -[EKCalendarChooserDefaultImpl _shouldShowDeclinedEventsSection](self, "_shouldShowDeclinedEventsSection") == a3;
  }
  return v5;
}

- (BOOL)_shouldShowDelegateCalendarsButtonSection
{
  return self->_canShowDelegateSetupCell && self->_showDelegateCalendarsCell;
}

- (BOOL)_shouldShowFocusBanner
{
  void *v3;
  BOOL v4;

  if (!-[EKCalendarChooserDefaultImpl disableCalendarsUnselectedByFocus](self, "disableCalendarsUnselectedByFocus"))
    return 0;
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusFilterMode") != 0;

  return v4;
}

- (int64_t)_focusBannerSection
{
  return 0;
}

- (BOOL)_isFocusBannerSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[EKCalendarChooserDefaultImpl _shouldShowFocusBanner](self, "_shouldShowFocusBanner");
  if (v5)
    LOBYTE(v5) = -[EKCalendarChooserDefaultImpl _focusBannerSection](self, "_focusBannerSection") == a3;
  return v5;
}

- (BOOL)_shouldShowIdentityChooser
{
  return self->_canShowIdentityChooser && -[NSArray count](self->_delegateSources, "count") != 0;
}

- (int64_t)_identityChooserSection
{
  return -[EKCalendarChooserDefaultImpl _shouldShowFocusBanner](self, "_shouldShowFocusBanner");
}

- (BOOL)_isIdentityChooserSection:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser");
  if (v5)
    LOBYTE(v5) = -[EKCalendarChooserDefaultImpl _identityChooserSection](self, "_identityChooserSection") == a3;
  return v5;
}

- (id)sourceForSelectedIdentity
{
  return self->_limitedToSource;
}

- (int64_t)_groupsOffset
{
  _BOOL4 v3;
  _BOOL4 v4;
  int64_t v5;

  v3 = -[EKCalendarChooserDefaultImpl _shouldShowIdentityChooser](self, "_shouldShowIdentityChooser");
  v4 = -[EKCalendarChooserDefaultImpl _shouldShowFocusBanner](self, "_shouldShowFocusBanner");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3;
}

- (id)_groupForSection:(int64_t)a3
{
  int64_t v4;
  void *v5;

  v4 = a3 - -[EKCalendarChooserDefaultImpl _groupsOffset](self, "_groupsOffset");
  if (v4 < 0 || v4 >= -[NSArray count](self->_groups, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_groups, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)declinedEventsChanged
{
  NSNumber *pendingShowDeclinedEvents;
  int v4;
  void *v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;
  NSObject *v9;
  _QWORD v10[5];
  char v11;

  pendingShowDeclinedEvents = self->_pendingShowDeclinedEvents;
  if (pendingShowDeclinedEvents)
  {
    v4 = -[NSNumber BOOLValue](pendingShowDeclinedEvents, "BOOLValue");
  }
  else
  {
    -[EKCalendarChooserDefaultImpl eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "showDeclinedEvents");

  }
  v6 = v4 ^ 1u;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v8 = self->_pendingShowDeclinedEvents;
  self->_pendingShowDeclinedEvents = v7;

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__EKCalendarChooserDefaultImpl_declinedEventsChanged__block_invoke;
  v10[3] = &unk_1E6019F18;
  v10[4] = self;
  v11 = v6;
  dispatch_async(v9, v10);

}

void __53__EKCalendarChooserDefaultImpl_declinedEventsChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowDeclinedEvents:", *(unsigned __int8 *)(a1 + 40));

}

- (void)completedRemindersChanged
{
  NSNumber *pendingShowCompletedReminders;
  int v4;
  void *v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;
  NSObject *v9;
  _QWORD v10[5];
  char v11;

  pendingShowCompletedReminders = self->_pendingShowCompletedReminders;
  if (pendingShowCompletedReminders)
  {
    v4 = -[NSNumber BOOLValue](pendingShowCompletedReminders, "BOOLValue");
  }
  else
  {
    -[EKCalendarChooserDefaultImpl eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "showCompletedReminders");

  }
  v6 = v4 ^ 1u;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v8 = self->_pendingShowCompletedReminders;
  self->_pendingShowCompletedReminders = v7;

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EKCalendarChooserDefaultImpl_completedRemindersChanged__block_invoke;
  v10[3] = &unk_1E6019F18;
  v10[4] = self;
  v11 = v6;
  dispatch_async(v9, v10);

}

void __57__EKCalendarChooserDefaultImpl_completedRemindersChanged__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowCompletedReminders:", *(unsigned __int8 *)(a1 + 40));

}

+ (id)_subscribedLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Name of subscribed group"), CFSTR("Subscribed"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_disabledIntegrationLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Subtitle of locked Scheduled Reminder"), CFSTR("Some calendars may not be available when Face ID is required"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)identityChanged:(id)a3
{
  objc_storeStrong((id *)&self->_limitedToSource, a3);
  -[EKCalendarChooserDefaultImpl _delegateSelectionDidChange:](self, "_delegateSelectionDidChange:", 0);
}

- (void)groupShowAllTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[EKCalendarChooserDefaultImpl _selectGroup:selected:](self, "_selectGroup:selected:", v9, objc_msgSend(v9, "selected") ^ 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "calendarChooserSelectionDidChange:", v7);

  }
  -[EKCalendarChooserDefaultImpl _sectionIdentifierForGroup:](self, "_sectionIdentifierForGroup:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _reloadCollectionViewSectionWithIdentifier:](self, "_reloadCollectionViewSectionWithIdentifier:", v8);

}

- (void)_delegateSelectionDidChange:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v3 = a3;
  -[EKCalendarChooserDefaultImpl _reloadCalendars](self, "_reloadCalendars");
  -[EKCalendarChooserDefaultImpl _updateViewControllerTitle](self, "_updateViewControllerTitle");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendarChooserSelectedIdentityDidChange:", v8);

    }
  }
  -[EKCalendarChooserDefaultImpl refresh:](self, "refresh:", 0);
}

- (int)_numSelectedGroups
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_groups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "selected", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_selectGroup:(id)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSMutableSet *v17;
  void *v18;
  void *v19;
  NSMutableSet *v20;
  void *v21;
  NSUInteger v22;
  EKCalendarChooserDefaultImpl *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSMutableSet *selectedCalendars;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_style != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 2549, CFSTR("Invalid style"));

  }
  v40 = v7;
  if (!v4)
  {
    objc_msgSend(v7, "selectNone");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v7, "calendarInfos");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v46 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v30, "calendar");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            selectedCalendars = self->_selectedCalendars;
            objc_msgSend(v30, "calendar");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet removeObject:](selectedCalendars, "removeObject:", v33);

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v30, "otherCalendars");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v42 != v37)
                    objc_enumerationMutation(v34);
                  -[NSMutableSet removeObject:](self->_selectedCalendars, "removeObject:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
              }
              while (v36);
            }

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v27);
    }

    v23 = self;
    v24 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v7, "selectAll");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v7, "calendarInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v10; ++k)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
        objc_msgSend(v13, "calendar");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(v13, "isEnabled");

          if (v16)
          {
            v17 = self->_selectedCalendars;
            objc_msgSend(v13, "calendar");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableSet addObject:](v17, "addObject:", v18);

            objc_msgSend(v13, "otherCalendars");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = self->_selectedCalendars;
              objc_msgSend(v13, "otherCalendars");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableSet addObjectsFromArray:](v20, "addObjectsFromArray:", v21);

            }
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v10);
  }

  v22 = -[NSArray count](self->_groups, "count");
  if (v22 == -[EKCalendarChooserDefaultImpl _numSelectedGroups](self, "_numSelectedGroups"))
  {
    v23 = self;
    v24 = 1;
LABEL_34:
    -[EKCalendarChooserDefaultImpl setAllSelected:](v23, "setAllSelected:", v24);
  }

}

- (void)_selectCalendar:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  NSMutableSet *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  NSMutableSet *selectedCalendars;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_style != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 2583, CFSTR("Invalid style"));

  }
  v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v12 = CFSTR("selected");
    else
      v12 = CFSTR("deselected");
    objc_msgSend(v7, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calendarIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v43 = v11;
    v44 = 2112;
    v45 = v12;
    v46 = 2112;
    v47 = v14;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_INFO, "[UserStateLog] Action -> %@ calendar %@. calendarIdentifier = %@", buf, 0x20u);

  }
  if (!v4)
  {
    objc_msgSend(v7, "setSelected:", 0);
    objc_msgSend(v7, "group");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSelected:", 0);

    objc_msgSend(v7, "calendar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_26;
    selectedCalendars = self->_selectedCalendars;
    objc_msgSend(v7, "calendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](selectedCalendars, "removeObject:", v30);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v7, "otherCalendars", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(v31);
          -[NSMutableSet removeObject:](self->_selectedCalendars, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v33);
    }

LABEL_25:
    -[EKCalendarChooserDefaultImpl setAllSelected:](self, "setAllSelected:", v4);
    goto LABEL_26;
  }
  objc_msgSend(v7, "setSelected:", 1);
  objc_msgSend(v7, "calendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = self->_selectedCalendars;
    objc_msgSend(v7, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v16, "addObject:", v17);

  }
  objc_msgSend(v7, "otherCalendars");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = self->_selectedCalendars;
    objc_msgSend(v7, "otherCalendars");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v20);

  }
  objc_msgSend(v7, "group");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "numSelectableCalendars");
  objc_msgSend(v7, "group");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "numSelectedCalendars");

  if (v22 == v24)
  {
    objc_msgSend(v7, "group");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSelected:", 1);

    v26 = -[NSArray count](self->_groups, "count");
    if (v26 == -[EKCalendarChooserDefaultImpl _numSelectedGroups](self, "_numSelectedGroups"))
      goto LABEL_25;
  }
LABEL_26:

}

- (void)_selectAllCalendarsAndStores:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (self->_style != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarChooserDefaultImpl.m"), 2622, CFSTR("Invalid style"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_groups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        -[EKCalendarChooserDefaultImpl _selectGroup:selected:](self, "_selectGroup:selected:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), v3, (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_userDidSelectCalendar:(id)a3 selected:(BOOL)a4 withIndexPath:(id)a5
{
  _BOOL8 v5;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  -[EKCalendarChooserDefaultImpl _selectCalendar:selected:](self, "_selectCalendar:selected:", a3, v5);
  -[EKCalendarChooserDefaultImpl _reconfigureCollectionViewAtIndexPath:](self, "_reconfigureCollectionViewAtIndexPath:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calendarChooserSelectionDidChange:", v10);

  }
}

- (void)_accessoryButtonTappedAtIndexPath:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  EKSubscribedCalendarEditor *v12;
  void *v13;
  EKEventStore *eventStore;
  EKSource *limitedToSource;
  void *v16;
  void *v17;
  unint64_t entityType;
  EKCalendarEditor *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v21, "section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", objc_msgSend(v21, "row"), v4);
  objc_msgSend(v4, "calendarInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 < v7)
  {
    objc_msgSend(v4, "calendarInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSubscribed");

    if (v11)
    {
      v12 = [EKSubscribedCalendarEditor alloc];
      objc_msgSend(v9, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      eventStore = self->_eventStore;
      limitedToSource = self->_limitedToSource;
      v16 = v12;
      v17 = v13;
      entityType = 0;
    }
    else
    {
      v19 = [EKCalendarEditor alloc];
      objc_msgSend(v9, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      eventStore = self->_eventStore;
      entityType = self->_entityType;
      limitedToSource = self->_limitedToSource;
      v16 = v19;
      v17 = v13;
    }
    v20 = (void *)objc_msgSend(v16, "initWithCalendar:eventStore:entityType:limitedToSource:", v17, eventStore, entityType, limitedToSource);

    -[EKCalendarChooserDefaultImpl _presentEditor:withIndexPath:barButtonItem:permittedArrowDirections:animated:completion:](self, "_presentEditor:withIndexPath:barButtonItem:permittedArrowDirections:animated:completion:", v20, v21, 0, 12, 1, 0);
  }

}

- (void)presentAccountErrorAlertForGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  EKCalendarChooserDefaultImpl *v11;

  v4 = a3;
  objc_msgSend(v4, "setShowAccountErrorActionButtonSpinner:", 1);
  -[EKCalendarChooserDefaultImpl _sectionIdentifierForGroup:](self, "_sectionIdentifierForGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarChooserDefaultImpl _reloadCollectionViewSectionWithIdentifier:](self, "_reloadCollectionViewSectionWithIdentifier:", v5);

  -[EKCalendarChooserDefaultImpl _sendAnalyticsEvent:forGroup:](self, "_sendAnalyticsEvent:forGroup:", 16, v4);
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "accountError");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__EKCalendarChooserDefaultImpl_presentAccountErrorAlertForGroup___block_invoke;
  v9[3] = &unk_1E6018EC0;
  v10 = v4;
  v11 = self;
  v8 = v4;
  +[EKUIAccountErrorDisplayer presentAlertForAccount:error:usingViewController:completion:](EKUIAccountErrorDisplayer, "presentAlertForAccount:error:usingViewController:completion:", v6, v7, self, v9);

}

void __65__EKCalendarChooserDefaultImpl_presentAccountErrorAlertForGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setShowAccountErrorActionButtonSpinner:", 0);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_sectionIdentifierForGroup:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_reloadCollectionViewSectionWithIdentifier:", v3);

}

- (void)_sendAnalyticsEvent:(unint64_t)a3 forGroup:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *accountErrorAnalyticsState;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sourceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      accountErrorAnalyticsState = self->_accountErrorAnalyticsState;
      if (!accountErrorAnalyticsState)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = self->_accountErrorAnalyticsState;
        self->_accountErrorAnalyticsState = v10;

        accountErrorAnalyticsState = self->_accountErrorAnalyticsState;
      }
      -[NSMutableDictionary objectForKeyedSubscript:](accountErrorAnalyticsState, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      if ((v13 & a3) == 0)
      {
        switch(a3)
        {
          case 1uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedActionableError](EKUIAccountErrorsAnalyticsTracker, "trackCalendarListDisplayedActionableError");
            break;
          case 2uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedUnknownError](EKUIAccountErrorsAnalyticsTracker, "trackCalendarListDisplayedUnknownError");
            break;
          case 3uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
            goto LABEL_12;
          case 4uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedOfflineError](EKUIAccountErrorsAnalyticsTracker, "trackCalendarListDisplayedOfflineError");
            break;
          case 8uLL:
            +[EKUIAccountErrorsAnalyticsTracker trackCalendarListDisplayedOtherError](EKUIAccountErrorsAnalyticsTracker, "trackCalendarListDisplayedOtherError");
            break;
          default:
            if (a3 == 16)
            {
              +[EKUIAccountErrorsAnalyticsTracker trackCalendarListInteractedWithError](EKUIAccountErrorsAnalyticsTracker, "trackCalendarListInteractedWithError");
            }
            else
            {
LABEL_12:
              v15 = kEKUILogHandle;
              if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
              {
                v17 = 134217984;
                v18 = v13;
                _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_ERROR, "Invalid value passed to _sendAnalyticsEvent:forGroup: %lu", (uint8_t *)&v17, 0xCu);
              }
            }
            break;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 | a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accountErrorAnalyticsState, "setObject:forKeyedSubscript:", v16, v8);

      }
    }
    else
    {
      v14 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = (uint64_t)v7;
        _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_ERROR, "Source has no identifier: %@", (uint8_t *)&v17, 0xCu);
      }
    }

  }
}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v4;
  void *v6;
  EKAbstractCalendarEditor *presentedEditor;
  id v8;

  if (self->_presentedEditor == a3)
  {
    v4 = *(_QWORD *)&a4;
    objc_msgSend(a3, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarChooserDefaultImpl _calendarEditorDidCompleteWithAction:createdCalendar:](self, "_calendarEditorDidCompleteWithAction:createdCalendar:", v4, v6);

    presentedEditor = self->_presentedEditor;
    self->_presentedEditor = 0;

    -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_calendarEditorDidCompleteWithAction:(int)a3 createdCalendar:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (a3 != 1)
  {
    if (a3 != 3)
      goto LABEL_7;
    if (-[EKCalendarChooserDefaultImpl selectionStyle](self, "selectionStyle") == 1)
    {
      v6 = (void *)MEMORY[0x1E0C99E20];
      -[EKCalendarChooserDefaultImpl selectedCalendars](self, "selectedCalendars");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v9);
      -[EKCalendarChooserDefaultImpl setSelectedCalendarsAndNotify:](self, "setSelectedCalendarsAndNotify:", v8);

    }
  }
  -[EKCalendarChooserDefaultImpl _eventStoreChanged:](self, "_eventStoreChanged:", 0);
  if (self->_chooserMode == 1)
    -[EKCalendarChooserDefaultImpl setSelectedCalendar:](self, "setSelectedCalendar:", v9);
LABEL_7:

}

- (void)focusBannerCollectionViewCellToggled:(id)a3
{
  uint64_t v4;
  id v5;

  if (objc_msgSend(a3, "on"))
    v4 = 1;
  else
    v4 = 2;
  -[EKCalendarChooserDefaultImpl delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFocusFilterMode:", v4);

}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbarItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);

}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)navigationController
{
  void *v2;
  void *v3;

  -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  EKUIViewControllerNavigationDelegate **p_navigationDelegate;
  id WeakRetained;
  void *v5;

  p_navigationDelegate = &self->_navigationDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    -[EKCalendarChooserDefaultImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  _BOOL4 v6;

  v5 = a4;
  if (-[EKCalendarChooserDefaultImpl _isFocusBannerSection:](self, "_isFocusBannerSection:", objc_msgSend(v5, "section"))|| -[EKCalendarChooserDefaultImpl _isDeclinedEventsSwitchSection:](self, "_isDeclinedEventsSwitchSection:", objc_msgSend(v5, "section")))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !-[EKCalendarChooserDefaultImpl _isDelegateCalendarsButtonSection:](self, "_isDelegateCalendarsButtonSection:", objc_msgSend(v5, "section"));
  }

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  EKSource *limitedToSource;
  void *v11;
  int64_t v12;
  EKSource *v13;
  int64_t v14;
  void *v15;
  void *v16;
  int64_t style;
  id WeakRetained;
  char v19;
  id v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v22, 1);
  v6 = -[EKCalendarChooserDefaultImpl _sectionHasHeader:](self, "_sectionHasHeader:", objc_msgSend(v22, "section"));
  v7 = v22;
  if (!v6 || (v8 = objc_msgSend(v22, "row"), v7 = v22, v8))
  {
    if (-[EKCalendarChooserDefaultImpl _isIdentityChooserSection:](self, "_isIdentityChooserSection:", objc_msgSend(v7, "section")))
    {
      v9 = objc_msgSend(v22, "row");
      if (v9 == -[EKCalendarChooserDefaultImpl _rowIndexForMeDelegate](self, "_rowIndexForMeDelegate"))
      {
        limitedToSource = self->_limitedToSource;
        self->_limitedToSource = 0;
      }
      else
      {
        -[NSArray objectAtIndex:](self->_delegateSources, "objectAtIndex:", -[EKCalendarChooserDefaultImpl _rowIndexToDelegateSourceIndex:](self, "_rowIndexToDelegateSourceIndex:", objc_msgSend(v22, "row")));
        v13 = (EKSource *)objc_claimAutoreleasedReturnValue();
        limitedToSource = self->_limitedToSource;
        self->_limitedToSource = v13;
      }

      -[EKCalendarChooserDefaultImpl _delegateSelectionDidChange:](self, "_delegateSelectionDidChange:", 1);
      -[EKCalendarChooserDefaultImpl _reloadCollectionViewSection:](self, "_reloadCollectionViewSection:", objc_msgSend(v22, "section"));
    }
    else
    {
      -[EKCalendarChooserDefaultImpl _groupForSection:](self, "_groupForSection:", objc_msgSend(v22, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[EKCalendarChooserDefaultImpl _accountErrorActionRowIndexForGroup:](self, "_accountErrorActionRowIndexForGroup:", v11);
        if (v12 == objc_msgSend(v22, "row"))
        {
          -[EKCalendarChooserDefaultImpl presentAccountErrorAlertForGroup:](self, "presentAccountErrorAlertForGroup:", v11);
        }
        else
        {
          v14 = -[EKCalendarChooserDefaultImpl _rowIndex:toCalendarIndexInGroup:](self, "_rowIndex:toCalendarIndexInGroup:", objc_msgSend(v22, "row"), v11);
          objc_msgSend(v11, "calendarInfos");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          style = self->_style;
          if (style)
          {
            if (style == 1
              && v16
              && -[EKCalendarChooserDefaultImpl _isCalendarEnabled:](self, "_isCalendarEnabled:", v16))
            {
              -[EKCalendarChooserDefaultImpl _userDidSelectCalendar:selected:withIndexPath:](self, "_userDidSelectCalendar:selected:withIndexPath:", v16, objc_msgSend(v16, "selected") ^ 1, v22);
            }
          }
          else if (!v16 || -[EKCalendarChooserDefaultImpl _isCalendarEnabled:](self, "_isCalendarEnabled:", v16))
          {
            -[EKCalendarChooserDefaultImpl setCheckedRow:](self, "setCheckedRow:", v22);
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v19 = objc_opt_respondsToSelector();

            if ((v19 & 1) != 0)
            {
              v20 = objc_loadWeakRetained((id *)&self->_delegate);
              -[EKCalendarChooserDefaultImpl _ekCalendarChooser](self, "_ekCalendarChooser");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "calendarChooserSelectionDidChange:", v21);

            }
          }

        }
      }

    }
    v7 = v22;
  }

}

- (int64_t)selectionStyle
{
  return self->_style;
}

- (void)setSelectionStyle:(int64_t)a3
{
  self->_style = a3;
}

- (EKCalendarChooserDelegate)delegate
{
  return (EKCalendarChooserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableSet)selectedCalendarSet
{
  return self->_selectedCalendars;
}

- (void)setSelectedCalendarSet:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCalendars, a3);
}

- (BOOL)showDetailAccessories
{
  return self->_showDetailAccessories;
}

- (void)setShowDetailAccessories:(BOOL)a3
{
  self->_showDetailAccessories = a3;
}

- (int64_t)chooserMode
{
  return self->_chooserMode;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (BOOL)showAccountStatus
{
  return self->_showAccountStatus;
}

- (void)setShowAccountStatus:(BOOL)a3
{
  self->_showAccountStatus = a3;
}

- (BOOL)disableCalendarEditing
{
  return self->disableCalendarEditing;
}

- (void)setDisableCalendarEditing:(BOOL)a3
{
  self->disableCalendarEditing = a3;
}

- (int)explanatoryTextMode
{
  return self->_explanatoryTextMode;
}

- (BOOL)onlyShowUnmanagedAccounts
{
  return self->onlyShowUnmanagedAccounts;
}

- (void)setOnlyShowUnmanagedAccounts:(BOOL)a3
{
  self->onlyShowUnmanagedAccounts = a3;
}

- (BOOL)showsDeclinedEventsSetting
{
  return self->showsDeclinedEventsSetting;
}

- (void)setShowsDeclinedEventsSetting:(BOOL)a3
{
  self->showsDeclinedEventsSetting = a3;
}

- (BOOL)showsCompletedRemindersSetting
{
  return self->showsCompletedRemindersSetting;
}

- (void)setShowsCompletedRemindersSetting:(BOOL)a3
{
  self->showsCompletedRemindersSetting = a3;
}

- (NSSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (unint64_t)entityType
{
  return self->_entityType;
}

- (void)setEntityType:(unint64_t)a3
{
  self->_entityType = a3;
}

- (int64_t)lastAuthorizationStatus
{
  return self->_lastAuthorizationStatus;
}

- (void)setLastAuthorizationStatus:(int64_t)a3
{
  self->_lastAuthorizationStatus = a3;
}

- (BOOL)shouldOverrideAuthorizationStatus
{
  return self->_shouldOverrideAuthorizationStatus;
}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3
{
  self->_shouldOverrideAuthorizationStatus = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UIBarButtonItem)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_showAllButton, a3);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSArray)allGroups
{
  return self->_allGroups;
}

- (void)setAllGroups:(id)a3
{
  objc_storeStrong((id *)&self->_allGroups, a3);
}

- (int64_t)numCalendarsHiddenByFocus
{
  return self->_numCalendarsHiddenByFocus;
}

- (void)setNumCalendarsHiddenByFocus:(int64_t)a3
{
  self->_numCalendarsHiddenByFocus = a3;
}

- (NSIndexPath)checkedRow
{
  return self->_checkedRow;
}

- ($7C92223F3A9F3C85702FE9D2C49D13A2)flags
{
  return ($7C92223F3A9F3C85702FE9D2C49D13A2)self->_flags;
}

- (void)setFlags:(id)a3
{
  self->_flags = ($0B936CC4D07F8D2842192E93A83ADC61)a3;
}

- (void)setAccessDeniedView:(id)a3
{
  objc_storeStrong((id *)&self->_accessDeniedView, a3);
}

- (EKAbstractCalendarEditor)presentedEditor
{
  return self->_presentedEditor;
}

- (void)setPresentedEditor:(id)a3
{
  objc_storeStrong((id *)&self->_presentedEditor, a3);
}

- (BOOL)canShowIdentityChooser
{
  return self->_canShowIdentityChooser;
}

- (void)setCanShowIdentityChooser:(BOOL)a3
{
  self->_canShowIdentityChooser = a3;
}

- (BOOL)canShowDelegateSetupCell
{
  return self->_canShowDelegateSetupCell;
}

- (void)setCanShowDelegateSetupCell:(BOOL)a3
{
  self->_canShowDelegateSetupCell = a3;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_presentedEditor, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_checkedRow, 0);
  objc_storeStrong((id *)&self->_allGroups, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_pendingShowCompletedReminders, 0);
  objc_storeStrong((id *)&self->_pendingShowDeclinedEvents, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_addCalendarButton, 0);
  objc_storeStrong((id *)&self->_currentKnownCalendarIds, 0);
  objc_storeStrong((id *)&self->_delegateSources, 0);
  objc_storeStrong((id *)&self->_accountErrorAnalyticsState, 0);
  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);
}

@end
