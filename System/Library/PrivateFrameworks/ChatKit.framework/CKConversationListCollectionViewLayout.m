@implementation CKConversationListCollectionViewLayout

- (void)updatePinnedConversationViewLayoutStyle
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  id v10;

  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", v6, v8);
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPinnedConversationViewLayoutStyle:", v9);

}

- (int64_t)_pinnedConversationViewLayoutStyleForCollectionViewSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (CKIsRunningInMacCatalyst())
    return 5;
  if (width > height)
    return 4;
  if (width < 315.0)
    return 3;
  if (width >= 350.0)
    return width >= 400.0;
  return 2;
}

id __64__CKConversationListCollectionViewLayout_conversationListLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  id WeakRetained;
  uint64_t v17;
  void *v18;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  _BOOL8 v23;
  double v24;
  double v25;
  void *v26;

  v5 = a3;
  objc_msgSend(v5, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveContentSize");
  v8 = v7;

  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapToMinConversationListWidth");
    v11 = v8 < v10;

  }
  else
  {
    v11 = 0;
  }
  if (a2 == 2 && !v11)
  {
    objc_msgSend(v5, "_dataSourceSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numberOfItemsInSection:", 2);

    objc_msgSend(v5, "_dataSourceSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfItemsInSection:", 0) > 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "pinGridLayoutSectionForEnvironment:withNumberOfItems:isShowingFocusFilterBanner:", v5, v13, v15);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v18 = (void *)v17;
    goto LABEL_14;
  }
  switch(a2)
  {
    case 0:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "focusFilterLayoutSectionForEnvironment:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "pinningOnboardingTitleLayoutSectionForEnvironment:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "tipKitLayoutSectionForEnvironment:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
  objc_msgSend(v5, "_dataSourceSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "numberOfItemsInSection:", 2);

  v22 = a2 == 2 && v11;
  v23 = v21 > 0 && v22;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "conversationCellHeight");
  v25 = v24;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "rowLayoutSectionForEnvironment:withRowHeight:usingEstimatedRowHeight:needsPinnedSectionSeparator:forSection:", v5, objc_msgSend(v26, "isAccessibilityPreferredContentSizeCategory"), v23, a2, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v18;
}

- (id)rowLayoutSectionForEnvironment:(id)a3 withRowHeight:(double)a4 usingEstimatedRowHeight:(BOOL)a5 needsPinnedSectionSeparator:(BOOL)a6 forSection:(int64_t)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  void *v54;
  _QWORD v55[3];

  v8 = a6;
  v9 = a5;
  v55[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isCollapsed"))
    v15 = 0;
  else
    v15 = 4;

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACD0]), "initWithAppearanceStyle:layoutEnvironment:", v15, v12);
  if (!CKIsRunningInMacCatalyst())
    goto LABEL_9;
  objc_msgSend(v12, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "snapToMinConversationListWidth");
  v22 = v21;

  if (v19 >= v22)
  {
LABEL_9:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSeparatorStyle:", objc_msgSend(v23, "conversationListSeparatorStyle"));

    CKIsRunningInMacCatalyst();
LABEL_10:
    v24 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke;
    v53[3] = &unk_1E274BDE8;
    v53[4] = self;
    objc_msgSend(v16, "setLeadingSwipeActionsConfigurationProvider:", v53);
    v52[0] = v24;
    v52[1] = 3221225472;
    v52[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_2;
    v52[3] = &unk_1E274BDE8;
    v52[4] = self;
    objc_msgSend(v16, "setTrailingSwipeActionsConfigurationProvider:", v52);
    v51[0] = v24;
    v51[1] = 3221225472;
    v51[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_3;
    v51[3] = &unk_1E274A208;
    v51[4] = self;
    objc_msgSend(v16, "setWillBeginSwipingHandler:", v51);
    v50[0] = v24;
    v50[1] = 3221225472;
    v50[2] = __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_4;
    v50[3] = &unk_1E274A208;
    v50[4] = self;
    objc_msgSend(v16, "setDidEndSwipingHandler:", v50);
    if (v9)
      goto LABEL_8;
    goto LABEL_11;
  }
  objc_msgSend(v16, "setSeparatorStyle:", 0);
  if (!CKIsRunningInMacCatalyst())
    goto LABEL_10;
  if (v9)
  {
LABEL_8:
    objc_msgSend(v16, "setEstimatedRowHeight:", *MEMORY[0x1E0CEBF30]);
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v16, "setRowHeight:", a4);
LABEL_12:
  -[CKConversationListCollectionViewLayout _leadingSeparatorInsetForEnvironment:](self, "_leadingSeparatorInsetForEnvironment:", v12);
  objc_msgSend(v16, "setSeparatorInset:", 0.0, v25, 0.0, 0.0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEACC8]), "initWithConfiguration:layoutEnvironment:", v16, v12);
  if (v8)
  {
    objc_msgSend(v12, "container");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "effectiveContentSize");
    v29 = v28;
    v31 = v30;

    +[CKPinnedSectionSeparatorView heightWithPadding](CKPinnedSectionSeparatorView, "heightWithPadding");
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListCollectionViewLayout _edgeToAvatarWidthForPinnedConversationLayoutStyle:](self, "_edgeToAvatarWidthForPinnedConversationLayoutStyle:", -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", v29, v31));
    v34 = v29 + v33 * -2.0;
    if (v34 <= 0.0)
    {
      v49 = v34;
      _IMWarn();
      v34 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v34, *(_QWORD *)&v49);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v35, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x1E0CEA1B0];
    +[CKPinnedSectionSeparatorView reuseIdentifier](CKPinnedSectionSeparatorView, "reuseIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v36, v38, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v55[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBoundarySupplementaryItems:", v40);

  }
  if (-[CKConversationListCollectionViewLayout _sectionNeedsRecoverableDisclosureHeader:](self, "_sectionNeedsRecoverableDisclosureHeader:", a7))
  {
    objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 50.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1E0CEA1B0];
    +[CKRecoverableSectionDisclosureView reuseIdentifier](CKRecoverableSectionDisclosureView, "reuseIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v43, v45, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBoundarySupplementaryItems:", v47);

  }
  return v26;
}

- (double)conversationCellHeight
{
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_class *v14;
  void *v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessibilityPreferredContentSizeCategory");

  if ((v5 & 1) != 0)
    return 0.0;
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKConversationListCollectionViewLayout.m"), 520, CFSTR("%@ needs a cell layout."), v15);

  }
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  objc_msgSend(v8, "cellHeightForDisplayScale:");
  v12 = v11;

  return v12;
}

- (CKConversationListCollectionViewController)conversationListController
{
  return (CKConversationListCollectionViewController *)objc_loadWeakRetained((id *)&self->_conversationListController);
}

- (BOOL)_sectionNeedsRecoverableDisclosureHeader:(int64_t)a3
{
  char v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  if (CKIsRunningInMacCatalyst())
    return 0;
  if (a3 == 6)
  {
    -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isRecentlyDeletedModal");

    if ((v13 & 1) == 0)
    {
      -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "filterMode") == 7)
        goto LABEL_8;
      goto LABEL_12;
    }
    return 1;
  }
  if (a3 == 5)
  {
    -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isOscarModal");

    if ((v8 & 1) == 0)
    {
      -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "filterMode") == 9)
      {
LABEL_8:
        -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v11, "isCollapsed");

LABEL_13:
        return v5;
      }
LABEL_12:
      v5 = 0;
      goto LABEL_13;
    }
    return 1;
  }
  return 0;
}

- (double)_leadingSeparatorInsetForEnvironment:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conversationListCellUsesLargeTextLayout");

  if (v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationListCellLargeTextLeftMargin");
  }
  else
  {
    -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "filterMode");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v10 == 9)
      objc_msgSend(v11, "conversationListCellLeftMargin");
    else
      objc_msgSend(v11, "conversationCellLeadingSeparatorInsetForEnvironment:", v4);
  }
  v12 = v8;

  return v12;
}

- (id)tipKitLayoutSectionForEnvironment:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", a3, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA1D0];
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verticalGroupWithLayoutSize:subitems:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "conversationListBottomTipSectionPadding");
  v22 = v21;

  objc_msgSend(v13, "setContentInsets:", v15, v17, v22, v19);
  return v13;
}

- (id)pinningOnboardingTitleLayoutSectionForEnvironment:(id)a3
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", a3, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 138.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 138.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA1D0];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verticalGroupWithLayoutSize:subitems:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pinGridLayoutSectionForEnvironment:(id)a3 withNumberOfItems:(int64_t)a4 isShowingFocusFilterBanner:(BOOL)a5
{
  _BOOL8 v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;

  if (a4 < 1)
  {
    -[CKConversationListCollectionViewLayout _emptyLayoutSection](self, "_emptyLayoutSection", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = a5;
    objc_msgSend(a3, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveContentSize");
    v10 = v9;
    v12 = v11;

    -[CKConversationListCollectionViewLayout pinGridLayoutGroupForCollectionViewSize:numberOfItems:](self, "pinGridLayoutGroupForCollectionViewSize:numberOfItems:", a4, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "totalTopSpacingFromSearchBarToPinnedItems:", v6);
    v17 = v16;
    +[CKPinnedConversationView avatarViewPadding](CKPinnedConversationView, "avatarViewPadding");
    v19 = v17 - v18;
    objc_msgSend(v13, "edgeSpacing");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "top");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "spacing");
    v23 = v19 - v22;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "conversationListTotalLastPinNameToFirstCellSpacing");
    v26 = v25;
    +[CKPinnedConversationView titleLabelVerticalPadding](CKPinnedConversationView, "titleLabelVerticalPadding");
    v28 = v26 - v27;
    objc_msgSend(v13, "edgeSpacing");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottom");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "spacing");
    v32 = v28 - v31;

    objc_msgSend(v14, "setContentInsets:", v23, 0.0, v32, 0.0);
  }
  return v14;
}

- (id)focusFilterLayoutSectionForEnvironment:(id)a3
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
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", a3, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 44.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "estimatedDimension:", 44.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA1D0];
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verticalGroupWithLayoutSize:subitems:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setConversationListController:(id)a3
{
  objc_storeWeak((id *)&self->_conversationListController, a3);
}

- (CKConversationListCollectionViewLayout)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKConversationListCollectionViewLayout;
  return -[CKConversationListCollectionViewLayout init](&v3, sel_init);
}

- (id)conversationListLayout
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x1E0CEA428]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CKConversationListCollectionViewLayout_conversationListLayout__block_invoke;
  v5[3] = &unk_1E274BDC0;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithSectionProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_emptyLayoutSection
{
  void *v2;
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEA1D0];
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "horizontalGroupWithLayoutSize:subitems:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pinGridLayoutGroupForCollectionViewSize:(CGSize)a3 numberOfItems:(int64_t)a4
{
  double width;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];

  width = a3.width;
  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = -[CKConversationListCollectionViewLayout _pinnedConversationViewLayoutStyleForCollectionViewSize:](self, "_pinnedConversationViewLayoutStyleForCollectionViewSize:", a3.width, a3.height);
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "pinnedConversationViewLayoutStyle");

  if (v9 != v7)
  {
    -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPinnedConversationViewLayoutStyle:shouldInvalidateLayout:", v7, 0);

  }
  v11 = -[CKConversationListCollectionViewLayout numberOfPinnedConversationColumnsForLayoutStyle:](self, "numberOfPinnedConversationColumnsForLayoutStyle:", v7);
  -[CKConversationListCollectionViewLayout _edgeToAvatarWidthForPinnedConversationLayoutStyle:](self, "_edgeToAvatarWidthForPinnedConversationLayoutStyle:", v7);
  v13 = v12;
  v14 = (width + v12 * -2.0 + (double)(v11 - 1) * -0.0) / (double)v11;
  if (CKMainScreenScale_once_9 != -1)
    dispatch_once(&CKMainScreenScale_once_9, &__block_literal_global_19);
  v15 = *(double *)&CKMainScreenScale_sMainScreenScale_9;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_9 == 0.0)
    v15 = 1.0;
  v16 = floor(v14 * v15) / v15;
  +[CKPinnedConversationView avatarViewSizeFittingSize:layoutStyle:](CKPinnedConversationView, "avatarViewSizeFittingSize:layoutStyle:", v7, v16, v16);
  v18 = v17;
  -[CKConversationListCollectionViewLayout _minimumEdgeToCellSpacingForLayoutStyle:](self, "_minimumEdgeToCellSpacingForLayoutStyle:", v7);
  v19 = (width - (double)v11 * v18 + v13 * -2.0) / (double)(v11 - 1);
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v23 = v22;

  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale();
  v27 = v26;

  if (v23 >= v27)
    v28 = v27;
  else
    v28 = v23;
  v29 = v18 + v28 * 2.0;
  if (v29 <= 0.0)
  {
    v56 = v29;
    _IMWarn();
    v29 = 0.0;
  }
  v30 = v19 + v28 * -2.0;
  v31 = 0.0;
  if (a4 < 1)
    goto LABEL_14;
  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController", *(_QWORD *)&v56);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  UICeilToViewScale();
  v31 = v34;

  if (v31 <= 0.0)
  {
LABEL_14:
    v57 = v31;
    _IMWarn();
    v31 = 0.0;
  }
  v35 = v13 - v28;
  -[CKConversationListCollectionViewLayout pinnedConversationCellHeightForLayoutStyle:cellWidth:](self, "pinnedConversationCellHeightForLayoutStyle:cellWidth:", v7, v29, *(_QWORD *)&v57);
  v37 = v36;
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v29);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v37);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v60, v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v58);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v31);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F0], "sizeWithWidthDimension:heightDimension:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0CEA1D0];
  v61[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "horizontalGroupWithLayoutSize:subitems:", v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", v30);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setInterItemSpacing:", v45);

  objc_msgSend(MEMORY[0x1E0CEA1F8], "flexibleSpacing:", v35);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1F8], "flexibleSpacing:", v35);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewLayout _totalVerticalRowSpacingForLayoutStyle:](self, "_totalVerticalRowSpacingForLayoutStyle:", v7);
  v49 = v48;
  +[CKPinnedConversationView avatarViewPadding](CKPinnedConversationView, "avatarViewPadding");
  v51 = v49 - v50;
  +[CKPinnedConversationView titleLabelVerticalPadding](CKPinnedConversationView, "titleLabelVerticalPadding");
  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", (v51 - v52) * 0.5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", v46, v53, v47, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setEdgeSpacing:", v54);

  return v44;
}

- (double)widthForPinnedConversationCellInCollectionViewOfSize:(CGSize)a3 numberOfItems:(int64_t)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;

  height = a3.height;
  width = a3.width;
  if (CKIsRunningInMacCatalyst()
    && (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "snapToMinConversationListWidth"),
        v10 = v9,
        v8,
        width < v10))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversationListCellRightMargin");
    v13 = v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conversationListContactImageTrailingSpace");
    v16 = v13 + v15;

    return width + v16 * -2.0;
  }
  else
  {
    -[CKConversationListCollectionViewLayout pinGridLayoutGroupForCollectionViewSize:numberOfItems:](self, "pinGridLayoutGroupForCollectionViewSize:numberOfItems:", a4, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subitems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "layoutSize");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widthDimension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dimension");
    v24 = v23;

    return v24;
  }
}

- (int64_t)numberOfPinnedConversationColumnsForLayoutStyle:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  int64_t v5;

  if ((unint64_t)a3 > 6)
    return 0;
  if (a3 == 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "maximumNumberOfPinnedConversations");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conversationListLayoutPinnedSectionNumberOfColumns");
  }
  v5 = v4;

  return v5;
}

- (double)_minimumEdgeToCellSpacingForLayoutStyle:(int64_t)a3
{
  double result;

  result = 3.0;
  if (a3 == 5)
    return 10.0;
  return result;
}

- (double)_totalVerticalRowSpacingForLayoutStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 6)
    return dbl_18E7C8D90[a3];
  return result;
}

id __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "conversationListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingSwipeActionsConfigurationForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "conversationListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingSwipeActionsConfigurationForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationListController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIsShowingSwipeDeleteConfirmation:", 1);

}

void __150__CKConversationListCollectionViewLayout_rowLayoutSectionForEnvironment_withRowHeight_usingEstimatedRowHeight_needsPinnedSectionSeparator_forSection___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationListController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIsShowingSwipeDeleteConfirmation:", 0);

}

- (double)pinnedConversationCellHeightForLayoutStyle:(int64_t)a3 cellWidth:(double)a4
{
  void *v7;
  CKPinnedConversationCollectionViewCell *v8;
  CKPinnedConversationCollectionViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prototypePinnedConversationCollectionViewCell");
  v8 = (CKPinnedConversationCollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [CKPinnedConversationCollectionViewCell alloc];
    v8 = -[CKPinnedConversationCollectionViewCell initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKPinnedConversationCollectionViewCell pinnedConversationView](v8, "pinnedConversationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureAsPrototypeCell");

    -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrototypePinnedConversationCollectionViewCell:", v8);

  }
  -[CKPinnedConversationCollectionViewCell pinnedConversationView](v8, "pinnedConversationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutStyle:", a3);

  -[CKPinnedConversationCollectionViewCell sizeThatFits:](v8, "sizeThatFits:", a4, 1.79769313e308);
  v14 = v13;

  return v14;
}

- (int64_t)_numberOfItemsInSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CKConversationListCollectionViewLayout conversationListController](self, "conversationListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a3);

  return v6;
}

- (double)_edgeToAvatarWidthForPinnedConversationLayoutStyle:(int64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if ((unint64_t)a3 > 6)
    return 0.0;
  if (((1 << a3) & 0x3C) != 0)
    return 20.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conversationListCellUsesLargeTextLayout");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "conversationListCellLargeTextLeftMargin");
  else
    objc_msgSend(v6, "conversationListCellLeftMargin");
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_conversationListController);
}

@end
