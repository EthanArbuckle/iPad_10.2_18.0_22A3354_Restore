@implementation _SFSettingsAlertContentController

- (_SFSettingsAlertContentController)initWithNibName:(id)a3 bundle:(id)a4
{
  _SFSettingsAlertContentController *v4;
  uint64_t v5;
  NSMutableArray *items;
  uint64_t v7;
  NSMutableIndexSet *groupStartIndices;
  void *v9;
  id v10;
  _SFSettingsAlertContentController *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_SFSettingsAlertContentController;
  v4 = -[_SFSettingsAlertContentController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    items = v4->_items;
    v4->_items = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = objc_claimAutoreleasedReturnValue();
    groupStartIndices = v4->_groupStartIndices;
    v4->_groupStartIndices = (NSMutableIndexSet *)v7;

    v14[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)-[_SFSettingsAlertContentController registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v9, v4, sel_setNeedsUpdatePreferredContentSize);

    v11 = v4;
  }

  return v4;
}

- (void)removeAllItems
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *items;
  UIView *lastViewForAlignment;
  NSMutableIndexSet *v12;
  NSMutableIndexSet *groupStartIndices;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_items;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "viewAsUIView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:forKeyPath:context:", self, CFSTR("highlighted"), kvoContext_1);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v9;

  lastViewForAlignment = self->_lastViewForAlignment;
  self->_lastViewForAlignment = 0;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
  groupStartIndices = self->_groupStartIndices;
  self->_groupStartIndices = v12;

  -[UIStackView subviews](self->_stackView, "subviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "removeFromSuperview");
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kvoContext_1 == a6 && objc_msgSend(v10, "isEqualToString:", CFSTR("highlighted")))
  {
    -[_SFSettingsAlertContentController _updateSeparators](self, "_updateSeparators");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFSettingsAlertContentController;
    -[_SFSettingsAlertContentController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)loadView
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  objc_class *v5;
  UIStackView *v6;
  UIStackView *stackView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *stackViewTopBottomConstraints;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *stackViewWidthConstraint;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  void *v30;
  NSMutableArray *items;
  void *v32;
  void *v33;
  void *v34;
  UIScrollView *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[UIScrollView setAccessibilityIdentifier:](self->_scrollView, "setAccessibilityIdentifier:", CFSTR("FontStack"));
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 3);
  UIEdgeInsetsMakeWithEdges();
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
  -[_SFSettingsAlertContentController setView:](self, "setView:", self->_scrollView);
  v5 = (objc_class *)MEMORY[0x1E0DC3CA8];
  v35 = self->_scrollView;
  v6 = (UIStackView *)objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
  stackView = self->_stackView;
  self->_stackView = v6;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIScrollView addSubview:](v35, "addSubview:", self->_stackView);
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v11;
  v38[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  stackViewTopBottomConstraints = self->_stackViewTopBottomConstraints;
  self->_stackViewTopBottomConstraints = v14;

  -[UIStackView widthAnchor](self->_stackView, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView safeAreaLayoutGuide](self->_scrollView, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewWidthConstraint = self->_stackViewWidthConstraint;
  self->_stackViewWidthConstraint = v19;

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  v34 = v8;
  objc_msgSend(v8, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v25;
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v28;
  v37[2] = v11;
  v29 = self->_stackViewWidthConstraint;
  v37[3] = v33;
  v37[4] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v30);

  items = self->_items;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __45___SFSettingsAlertContentController_loadView__block_invoke;
  v36[3] = &unk_1E4AC4CD0;
  v36[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v36);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__panRecognized_);
  objc_msgSend(v32, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(v32, "setDelegate:", self);
  -[UIScrollView addGestureRecognizer:](v35, "addGestureRecognizer:", v32);

}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _SFSettingsAlertItem *focusedItem;
  void *v33;
  double v34;
  double v35;
  _SFSettingsAlertItem *v36;
  _SFSettingsAlertItem *v37;
  double v38;
  void *v39;
  _SFSettingsAlertContentController *v40;
  void *v41;
  id v42;
  CGRect v43;
  CGRect v44;

  -[_SFSettingsAlertContentController popoverPresentationController](self, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (v7 == *(double *)(MEMORY[0x1E0DC49E8] + 8)
    && v5 == *MEMORY[0x1E0DC49E8]
    && v11 == *(double *)(MEMORY[0x1E0DC49E8] + 24)
    && v9 == *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    UIEdgeInsetsMakeWithEdges();
    v5 = v15;
    v7 = v16;
    v9 = v17;
    v11 = v18;
  }
  -[_SFSettingsAlertContentController popoverPresentationController](self, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "containerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v43.origin.x = v7 + v21;
  v43.origin.y = v5 + v22;
  v43.size.width = v23 - (v11 + v7);
  v43.size.height = v24 - (v9 + v5);
  v25 = fmin(CGRectGetWidth(v43), 414.0);

  -[UIStackView widthAnchor](self->_stackView, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintLessThanOrEqualToConstant:", v25);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_stackViewWidthConstraint, "setActive:", 0);
  -[UIStackView layoutIfNeeded](self->_stackView, "layoutIfNeeded");
  v27 = *MEMORY[0x1E0DC4FF8];
  v28 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  -[UIStackView systemLayoutSizeFittingSize:](self->_stackView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], v28);
  v31 = v30;
  focusedItem = self->_focusedItem;
  if (focusedItem)
  {
    -[_SFSettingsAlertItem viewAsUIView](focusedItem, "viewAsUIView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "systemLayoutSizeFittingSize:", v27, v28);
    v35 = v34;

    v36 = self->_focusedItem;
    -[NSMutableArray lastObject](self->_items, "lastObject");
    v37 = (_SFSettingsAlertItem *)objc_claimAutoreleasedReturnValue();

    if (v36 != v37)
    {
      _SFOnePixel();
      v35 = v35 - v38;
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v31, v35);
    }
  }
  else
  {
    v35 = v29;
  }
  objc_msgSend(v42, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_stackViewWidthConstraint, "setActive:", 1);
  -[_SFSettingsAlertContentController alertController](self, "alertController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_rootContentController");
  v40 = (_SFSettingsAlertContentController *)objc_claimAutoreleasedReturnValue();

  if (v40 != self)
  {
    objc_msgSend(v39, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v31 = fmax(v31, CGRectGetWidth(v44));

  }
  -[_SFSettingsAlertContentController setPreferredContentSize:](self, "setPreferredContentSize:", v31, v35);
  objc_msgSend(v39, "setPreferredContentSize:", v31, v35);

}

- (void)_scrollToBottomIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;

  self->_updateScrollPositionAfterLayout = 0;
  if (self->_usesReverseOrder)
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v4 = v3;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    v5 = v4 - CGRectGetHeight(v7);
    -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, 0.0, v5 + v6);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _SFSettingsAlertContentController *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSettingsAlertContentController;
  -[_SFSettingsAlertContentController viewWillAppear:](&v9, sel_viewWillAppear_);
  -[_SFSettingsAlertContentController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertContentController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (_SFSettingsAlertContentController *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", v8 == self, v3);

  -[_SFSettingsAlertContentController _updateSeparators](self, "_updateSeparators");
  -[_SFSettingsAlertContentController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  if (self->_usesReverseOrder)
    self->_updateScrollPositionAfterLayout = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSettingsAlertContentController;
  -[_SFSettingsAlertContentController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIScrollView flashScrollIndicators](self->_scrollView, "flashScrollIndicators");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFSettingsAlertContentController;
  -[_SFSettingsAlertContentController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (self->_updatePreferredContentSizeAfterLayout)
  {
    self->_updatePreferredContentSizeAfterLayout = 0;
    -[_SFSettingsAlertContentController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
  if (self->_updateScrollPositionAfterLayout)
    -[_SFSettingsAlertContentController _scrollToBottomIfNeeded](self, "_scrollToBottomIfNeeded");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setNeedsUpdatePreferredContentSize
{
  id v2;

  self->_updatePreferredContentSizeAfterLayout = 1;
  -[_SFSettingsAlertContentController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (NSArray)items
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_items, "copy");
}

- (void)setFocusedItem:(id)a3
{
  _SFSettingsAlertItem *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _SFSettingsAlertContentController *v12;

  v5 = (_SFSettingsAlertItem *)a3;
  if (self->_focusedItem != v5)
  {
    objc_storeStrong((id *)&self->_focusedItem, a3);
    -[UIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", v5 == 0);
    -[_SFSettingsAlertItem viewAsUIView](self->_focusedItem, "viewAsUIView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutIfNeeded");

    -[_SFSettingsAlertContentController _updateFocusedItemConstraints](self, "_updateFocusedItemConstraints");
    -[_SFSettingsAlertContentController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52___SFSettingsAlertContentController_setFocusedItem___block_invoke;
    v10[3] = &unk_1E4ABFB20;
    v11 = v7;
    v12 = self;
    v9 = v7;
    objc_msgSend(v8, "_animateUsingDefaultTimingWithOptions:animations:completion:", 2, v10, 0);

  }
}

- (void)_updateFocusedItemConstraints
{
  NSArray *focusedItemConstraints;
  _SFSettingsAlertItem *focusedItem;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v17[3];
  CGRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  if (self->_focusedItemConstraints)
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    focusedItemConstraints = self->_focusedItemConstraints;
    self->_focusedItemConstraints = 0;

  }
  focusedItem = self->_focusedItem;
  if (focusedItem)
  {
    -[_SFSettingsAlertItem viewAsUIView](focusedItem, "viewAsUIView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSettingsAlertContentController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_usesReverseOrder)
    {
      _SFOnePixel();
      v11 = -v10;
    }
    else
    {
      v11 = 0.0;
    }
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    -[UIStackView heightAnchor](self->_stackView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bounds](self->_stackView, "bounds");
    objc_msgSend(v13, "constraintEqualToConstant:", CGRectGetHeight(v18));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_focusedItemConstraints;
    self->_focusedItemConstraints = v15;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_focusedItemConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_stackViewTopBottomConstraints);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_stackViewTopBottomConstraints);
  }
}

- (void)addItem:(id)a3
{
  NSMutableArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  -[NSMutableArray addObject:](items, "addObject:", v5);
  -[_SFSettingsAlertContentController _addGroupSeparatorIfNeededBeforeItemAtIndex:](self, "_addGroupSeparatorIfNeededBeforeItemAtIndex:", -[NSMutableArray count](self->_items, "count") - 1);
  -[_SFSettingsAlertContentController _addViewForItem:](self, "_addViewForItem:", v5);

}

- (void)addDivider
{
  -[NSMutableIndexSet addIndex:](self->_groupStartIndices, "addIndex:", -[NSMutableArray count](self->_items, "count"));
}

- (void)_addGroupSeparatorIfNeededBeforeItemAtIndex:(unint64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  UIStackView *stackView;
  id v10;

  v5 = -[_SFSettingsAlertContentController isViewLoaded](self, "isViewLoaded");
  if (a3 && v5 && -[NSMutableIndexSet containsIndex:](self->_groupStartIndices, "containsIndex:", a3))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 8.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addConstraint:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("settingsAlertDividerBackground"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v8);

    stackView = self->_stackView;
    if (self->_usesReverseOrder)
      -[UIStackView insertArrangedSubview:atIndex:](stackView, "insertArrangedSubview:atIndex:", v10, 0);
    else
      -[UIStackView addArrangedSubview:](stackView, "addArrangedSubview:", v10);

  }
}

- (void)_addViewForItem:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  UIStackView *stackView;
  id v8;

  v8 = a3;
  if (-[_SFSettingsAlertContentController isViewLoaded](self, "isViewLoaded"))
  {
    -[_SFSettingsAlertContentController _createViewForItem:](self, "_createViewForItem:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setItem:", v8);
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(v8, "setView:", v4);
    objc_msgSend(v8, "viewConfigurationBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v8, "viewConfigurationBlock");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v4);

    }
    stackView = self->_stackView;
    if (self->_usesReverseOrder)
      -[UIStackView insertArrangedSubview:atIndex:](stackView, "insertArrangedSubview:atIndex:", v4, 0);
    else
      -[UIStackView addArrangedSubview:](stackView, "addArrangedSubview:", v4);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 0, kvoContext_1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFSettingsAlertContentController _alignButtonImageView:](self, "_alignButtonImageView:", v4);
    objc_msgSend(v8, "updateOptionsGroupDetailLabel");

  }
}

- (void)_alignButtonImageView:(id)a3
{
  void *v4;
  UIView **p_lastViewForAlignment;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id obj;

  objc_msgSend(a3, "trailingView");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    p_lastViewForAlignment = &self->_lastViewForAlignment;
    if (*p_lastViewForAlignment)
    {
      objc_msgSend(obj, "centerXAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](*p_lastViewForAlignment, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v9) = 1146388480;
      objc_msgSend(v8, "setPriority:", v9);
      objc_msgSend(v8, "setActive:", 1);

    }
    objc_storeStrong((id *)p_lastViewForAlignment, obj);
  }

}

- (id)_createViewForItem:(id)a3
{
  _SFSettingsAlertCustomViewContainer *v3;
  id v5;
  unint64_t v6;
  _SFSettingsAlertButton *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFSettingsAlertCustomViewContainer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  if (v6 <= 5)
  {
    if (((1 << v6) & 0x1B) != 0)
    {
      v7 = objc_alloc_init(_SFSettingsAlertButton);
      v3 = (_SFSettingsAlertCustomViewContainer *)v7;
      if (self->_usesReverseOrder)
        -[_SFSettingsAlertControl setDefaultBackgroundMode:](v7, "setDefaultBackgroundMode:", 2);
      objc_msgSend(v5, "attributedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v5, "attributedTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSettingsAlertCustomViewContainer setAttributedText:](v3, "setAttributedText:", v9);
      }
      else
      {
        objc_msgSend(v5, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSettingsAlertCustomViewContainer setText:](v3, "setText:", v9);
      }

      objc_msgSend(v5, "attributedSubtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v5, "attributedSubtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSettingsAlertCustomViewContainer setAttributedDetailText:](v3, "setAttributedDetailText:", v13);
      }
      else
      {
        objc_msgSend(v5, "subtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFSettingsAlertCustomViewContainer setDetailText:](v3, "setDetailText:", v13);
      }

      objc_msgSend(v5, "tintColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setTintColor:](v3, "setTintColor:", v14);

      objc_msgSend(v5, "textStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setTextStyle:](v3, "setTextStyle:", v15);

      objc_msgSend(v5, "icon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setImage:](v3, "setImage:", v16);

      -[_SFSettingsAlertCustomViewContainer setEnabled:](v3, "setEnabled:", objc_msgSend(v5, "isEnabled"));
      -[_SFSettingsAlertCustomViewContainer setSelected:](v3, "setSelected:", objc_msgSend(v5, "isSelected"));
      objc_msgSend(v5, "componentsArrangement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setComponentsArrangement:](v3, "setComponentsArrangement:", v17);

      -[_SFSettingsAlertCustomViewContainer setLimitToSingleLine:](v3, "setLimitToSingleLine:", objc_msgSend(v5, "type") == 1);
      -[_SFSettingsAlertCustomViewContainer setShowsIndicatorDot:](v3, "setShowsIndicatorDot:", objc_msgSend(v5, "showsIndicatorDot"));
      objc_msgSend(v5, "badgeView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setAccessoryView:](v3, "setAccessoryView:", v18);

      objc_msgSend(v5, "statusImageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSettingsAlertCustomViewContainer setStatusImageView:](v3, "setStatusImageView:", v19);

      -[_SFSettingsAlertCustomViewContainer addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__tappedItemView_, 0x2000);
    }
    else
    {
      if (v6 == 2)
      {
        objc_msgSend(v5, "controller");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[_SFSettingsAlertStepper initUsingResetButton:usingTopSeparator:]([_SFSettingsAlertStepper alloc], "initUsingResetButton:usingTopSeparator:", objc_opt_respondsToSelector() & 1, self->_usesReverseOrder);
        v3 = v11;
        if (self->_usesReverseOrder)
          -[_SFSettingsAlertCustomViewContainer setDefaultBackgroundMode:](v11, "setDefaultBackgroundMode:", 2);
        objc_msgSend(v10, "prepareStepper:", v3);
        -[_SFSettingsAlertCustomViewContainer addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__stepperValueChanged_, 4096);
      }
      else
      {
        objc_msgSend(v5, "controller");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "customPaletteView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = -[_SFSettingsAlertCustomViewContainer initWithContentView:]([_SFSettingsAlertCustomViewContainer alloc], "initWithContentView:", v10);
      }

    }
  }

  return v3;
}

- (void)_stepperValueChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "value");
  switch(v6)
  {
    case 2:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "resetValue:", v10);
      break;
    case 1:
      objc_msgSend(v5, "decrementValue:", v10);
      break;
    case 0:
      objc_msgSend(v5, "incrementValue:", v10);
      break;
  }
  objc_msgSend(v4, "handler");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertContentController alertController](self, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    ((void (**)(_QWORD, void *, void *))v7)[2](v7, v8, v4);
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sf_didPerformFormatMenuAction:provenance:", objc_msgSend(v4, "actionType"), objc_msgSend(v8, "provenance"));

  }
}

- (void)_tappedItemView:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[_SFSettingsAlertContentController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, id))v4)[2](v4, v5, v7);
  objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sf_didPerformFormatMenuAction:provenance:", objc_msgSend(v7, "actionType"), objc_msgSend(v5, "provenance"));

  -[_SFSettingsAlertContentController _updateSeparators](self, "_updateSeparators");
}

- (void)_updateSeparators
{
  NSMutableArray *items;
  _QWORD v3[5];
  id v4;

  items = self->_items;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___SFSettingsAlertContentController__updateSeparators__block_invoke_2;
  v3[3] = &unk_1E4AC4D38;
  v3[4] = self;
  v4 = &__block_literal_global_373;
  -[NSMutableArray enumerateObjectsUsingBlock:](items, "enumerateObjectsUsingBlock:", v3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  CGRect v5;

  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset", a3);
  if (self->_focusedItem)
    return 1;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  CGRectGetHeight(v5);
  -[UIScrollView contentSize](self->_scrollView, "contentSize");
  _SFOnePixel();
  return _SFGreaterThanOrEqualWithEpsilon();
}

- (void)_panRecognized:(id)a3
{
  UIControl *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  UIControl *v13;
  uint64_t v14;
  UISelectionFeedbackGenerator *feedbackGenerator;
  UISelectionFeedbackGenerator *v16;
  UISelectionFeedbackGenerator *v17;
  UIControl *v18;
  UIControl *controlHighlightedForPan;
  id v20;

  v20 = a3;
  v4 = self->_controlHighlightedForPan;
  -[_SFSettingsAlertContentController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_SFSettingsAlertContentController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hitTest:withEvent:", 0, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  if (-[UIControl isEnabled](v13, "isEnabled"))
  {
    v14 = objc_msgSend(v20, "state");
    if ((unint64_t)(v14 - 1) < 2)
    {
      if (v13 != v4 && !-[UIControl isHighlighted](v13, "isHighlighted"))
      {
        feedbackGenerator = self->_feedbackGenerator;
        if (!feedbackGenerator)
        {
          v16 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E0DC3C60]);
          v17 = self->_feedbackGenerator;
          self->_feedbackGenerator = v16;

          feedbackGenerator = self->_feedbackGenerator;
        }
        -[UISelectionFeedbackGenerator selectionChanged](feedbackGenerator, "selectionChanged");
        -[UIControl setHighlighted:](v4, "setHighlighted:", 0);
        -[UIControl setHighlighted:](v13, "setHighlighted:", 1);
      }
      v18 = v13;
      goto LABEL_18;
    }
    if (v14 == 3)
      -[UIControl sendActionsForControlEvents:](v13, "sendActionsForControlEvents:", 0x2000);
    -[UIControl setHighlighted:](v13, "setHighlighted:", 0);
  }
  else
  {
    -[UIControl setHighlighted:](v4, "setHighlighted:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
  }
  v18 = 0;
LABEL_18:
  controlHighlightedForPan = self->_controlHighlightedForPan;
  self->_controlHighlightedForPan = v18;

LABEL_19:
}

- (void)alertItemViewContentSizeDidChange:(id)a3
{
  void *v4;
  void *v5;

  -[_SFSettingsAlertContentController viewIfLoaded](self, "viewIfLoaded", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[_SFSettingsAlertContentController setNeedsUpdatePreferredContentSize](self, "setNeedsUpdatePreferredContentSize");
}

- (_SFSettingsAlertController)alertController
{
  return (_SFSettingsAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (BOOL)usesReverseOrder
{
  return self->_usesReverseOrder;
}

- (void)setUsesReverseOrder:(BOOL)a3
{
  self->_usesReverseOrder = a3;
}

- (_SFSettingsAlertItem)focusedItem
{
  return self->_focusedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedItem, 0);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_controlHighlightedForPan, 0);
  objc_storeStrong((id *)&self->_lastViewForAlignment, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewTopBottomConstraints, 0);
  objc_storeStrong((id *)&self->_focusedItemConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_groupStartIndices, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
