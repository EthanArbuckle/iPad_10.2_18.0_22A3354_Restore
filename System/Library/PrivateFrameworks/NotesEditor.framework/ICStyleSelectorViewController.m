@implementation ICStyleSelectorViewController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)makeShortcutMenu
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke;
  v16[3] = &unk_1EA7DF420;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v2, "elementWithProvider:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC36F8];
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_10;
  v14[3] = &unk_1EA7DF420;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "elementWithProvider:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC39D0];
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_inlineMenuWithChildren:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = v4;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithTitle:children:", &stru_1EA7E9860, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v12;
}

- (id)nibBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
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
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[5];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewDidLoad](&v43, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
  -[ICStyleSelectorViewController setStyleSelectionHighlight:](self, "setStyleSelectionHighlight:", v3);

  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_applyRoundedCorners");

  -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[ICStyleSelectorViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  -[ICStyleSelectorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMargins");
  v13 = v12;
  -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInset:", 0.0, v10, 0.0, v13);

  -[ICStyleSelectorViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 0);

  -[ICStyleSelectorViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_didSelectDone_, 64);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v17);

  -[ICStyleSelectorViewController setCloseButton:](self, "setCloseButton:", v17);
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 8.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v22;
  v42 = v17;
  objc_msgSend(v17, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v27);

  objc_msgSend(MEMORY[0x1E0D64DC0], "titleStyle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v28;
  objc_msgSend(MEMORY[0x1E0D64DC0], "headingStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v29;
  objc_msgSend(MEMORY[0x1E0D64DC0], "subheadingStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v30;
  objc_msgSend(MEMORY[0x1E0D64DC0], "bodyStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v31;
  objc_msgSend(MEMORY[0x1E0D64DC0], "fixedWidthStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setStyles:](self, "setStyles:", v33);

  if (-[ICStyleSelectorViewController ic_isRTL](self, "ic_isRTL"))
  {
    -[ICStyleSelectorViewController styles](self, "styles");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reverseObjectEnumerator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController setStyles:](self, "setStyles:", v36);

    -[ICStyleSelectorViewController headerLabel](self, "headerLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTextAlignment:", 4);

  }
  -[ICStyleSelectorViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "intrinsicContentSize");
  -[ICStyleSelectorViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel_applyAccessibilityInfo, *MEMORY[0x1E0DC46F0], 0);

  -[ICStyleSelectorViewController setConfiguredForPopover:](self, "setConfiguredForPopover:", 0);
  -[ICStyleSelectorViewController applyAccessibilityInfo](self, "applyAccessibilityInfo");
  -[ICStyleSelectorViewController configureForOrientation](self, "configureForOrientation");
  -[ICStyleSelectorViewController registerForTraitChanges](self, "registerForTraitChanges");

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3E88], "ic_traitsAffectingSizeAndColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_1EA7DE418;
  objc_copyWeak(&v6, &location);
  v4 = (id)-[ICStyleSelectorViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke_2;
  v3[3] = &unk_1EA7DD2D8;
  v3[4] = WeakRetained;
  objc_msgSend(v1, "ic_performAsCurrent:", v3);

}

uint64_t __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "populateStyleScrollView");
  objc_msgSend(*(id *)(a1 + 32), "updateNamedStyleSelectedState");
  return objc_msgSend(*(id *)(a1 + 32), "updateStyleSelectionHighlightAnimated:", 0);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[ICStyleSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController updateViewConstraints](&v9, sel_updateViewConstraints);
  -[ICStyleSelectorViewController updateHeaderVisibility](self, "updateHeaderVisibility");
  -[ICStyleSelectorViewController configureForOrientation](self, "configureForOrientation");
  -[ICStyleSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  -[ICStyleSelectorViewController listsContainerBottomConstraint](self, "listsContainerBottomConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    -[ICStyleSelectorViewController configureViewWithEmphasis](self, "configureViewWithEmphasis");
  }
  else
  {
    -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewWillLayoutSubviews](&v22, sel_viewWillLayoutSubviews);
  if (-[ICStyleSelectorViewController isPopover](self, "isPopover"))
  {
    -[ICStyleSelectorViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 20.0;
    v6 = 20.0;
    v7 = 20.0;
  }
  else
  {
    -[ICStyleSelectorViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "verticalSizeClass") == 2)
      v9 = 36.0;
    else
      v9 = 8.0;

    -[ICStyleSelectorViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 15.0;
    v7 = 15.0;
    v6 = v9;
  }
  objc_msgSend(v3, "setLayoutMargins:", 0.0, v5, v6, v7);

  -[ICStyleSelectorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMargins");
  v12 = v11;
  -[ICStyleSelectorViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  v15 = v14;
  -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentInset:", 0.0, v12, 0.0, v15);

  -[ICStyleSelectorViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutMargins");
  v19 = v18;
  -[ICStyleSelectorViewController listsContainerBottomConstraint](self, "listsContainerBottomConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", v19);

  -[ICStyleSelectorViewController updateHeaderVisibility](self, "updateHeaderVisibility");
  -[ICStyleSelectorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidateIntrinsicContentSize");

  -[ICStyleSelectorViewController setUpNonStyleButtons](self, "setUpNonStyleButtons");
}

- (void)viewDidLayoutSubviews
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
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  v8 = v7;

  if (v5 <= v8)
  {
    -[ICStyleSelectorViewController scrollCurrentStyleToVisible:](self, "scrollCurrentStyleToVisible:", 0);
    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v20 = 1;
  }
  else
  {
    -[ICStyleSelectorViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentSize");
    v14 = (v11 - v13) * 0.5;
    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = -floor(v14 - v16);
    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentOffset:", v17, 0.0);

    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v20 = 0;
  }
  objc_msgSend(v19, "setScrollEnabled:", v20);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICStyleSelectorViewController;
  -[ICNAViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  if (-[ICStyleSelectorViewController isPopover](self, "isPopover"))
    -[ICStyleSelectorViewController configureForPopover](self, "configureForPopover");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

  -[ICStyleSelectorViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ICStyleSelectorViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_1EA7DD2D8;
  v6[4] = self;
  objc_msgSend(v5, "ic_performAsCurrent:", v6);

}

uint64_t __48__ICStyleSelectorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "populateStyleScrollView");
  objc_msgSend(*(id *)(a1 + 32), "updateNamedStyleSelectedState");
  return objc_msgSend(*(id *)(a1 + 32), "applyAccessibilityInfo");
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x1E0DC4578];
  -[ICStyleSelectorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  v4 = *MEMORY[0x1E0DC4578];
  -[ICStyleSelectorViewController elementForAXFocusOnDismissal](self, "elementForAXFocusOnDismissal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  if (ICInternalSettingsIsEmphasisEnabled())
  {
    -[ICStyleSelectorViewController setUpNonStyleButtons](self, "setUpNonStyleButtons");
    v11.receiver = self;
    v11.super_class = (Class)ICStyleSelectorViewController;
    -[ICStyleSelectorViewController presentViewController:animated:completion:](&v11, sel_presentViewController_animated_completion_, v9, v5, v8);

  }
  else
  {
    -[ICStyleSelectorViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "styleSelector:presentViewController:animated:completion:", self, v9, v5, v8);

  }
}

- (void)configureForPopover
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "styleSelectorShouldUseCompactTopInset:", self);

  if (v4)
    v5 = 60.0;
  else
    v5 = 79.0;
  -[ICStyleSelectorViewController scrollViewTopConstraint](self, "scrollViewTopConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  if (!-[ICStyleSelectorViewController configuredForPopover](self, "configuredForPopover"))
  {
    -[ICStyleSelectorViewController biusContainerTopConstraint](self, "biusContainerTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", 12.0);

    -[ICStyleSelectorViewController listsContainerTopConstraint](self, "listsContainerTopConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", 12.0);

    -[ICStyleSelectorViewController listsContainerBottomConstraint](self, "listsContainerBottomConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", 16.0);

    -[ICStyleSelectorViewController setConfiguredForPopover:](self, "setConfiguredForPopover:", 1);
  }
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)ICStyleSelectorViewController;
  -[ICNAViewController dealloc](&v3, sel_dealloc);
}

- (double)styleButtonPadding
{
  double v3;
  void *v4;

  v3 = 12.0;
  if (!-[ICStyleSelectorViewController isPopover](self, "isPopover"))
  {
    -[ICStyleSelectorViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "verticalSizeClass") == 1)
      v3 = 21.0;
    else
      v3 = 12.0;

  }
  return v3;
}

- (void)didSelectDone:(id)a3
{
  id v4;

  -[ICStyleSelectorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSelectorDidCancel:", self);

}

- (void)toggleBlockQuote:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[ICStyleSelectorViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSelectorToggleBlockQuote:", self);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "styleSelectorSelectionHasBlockQuote:", self);
  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v5);

}

- (void)toggleBIUS:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);
  -[ICStyleSelectorViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tag");

  objc_msgSend(v6, "styleSelector:toggleBIUS:", self, v5);
}

- (void)indentLeft:(id)a3
{
  void *v4;

  -[ICStyleSelectorViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSelectorDidIndentLeft:", self);

  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
}

- (void)indentRight:(id)a3
{
  void *v4;

  -[ICStyleSelectorViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleSelectorDidIndentRight:", self);

  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
}

- (void)didSelectDashedList:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 101);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setCurrentStyles:bius:animated:](self, "setCurrentStyles:bius:animated:", v4, -[ICStyleSelectorViewController currentBIUS](self, "currentBIUS"), 0);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleSelector:didSelectStyle:", self, 101);

  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
}

- (void)didSelectNumberedList:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 102);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setCurrentStyles:bius:animated:](self, "setCurrentStyles:bius:animated:", v4, -[ICStyleSelectorViewController currentBIUS](self, "currentBIUS"), 0);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleSelector:didSelectStyle:", self, 102);

  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
}

- (void)didSelectBulletedList:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 100);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setCurrentStyles:bius:animated:](self, "setCurrentStyles:bius:animated:", v4, -[ICStyleSelectorViewController currentBIUS](self, "currentBIUS"), 0);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleSelector:didSelectStyle:", self, 100);

  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
}

- (void)setStyles:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_styles != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_styles, a3);
    -[ICStyleSelectorViewController populateStyleScrollView](self, "populateStyleScrollView");
    v5 = v6;
  }

}

- (void)setCurrentStyles:(id)a3 bius:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a3;
  -[ICStyleSelectorViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[ICStyleSelectorViewController setCurrentBIUS:](self, "setCurrentBIUS:", a4);
  -[ICStyleSelectorViewController setCurrentStyles:](self, "setCurrentStyles:", v8);

  -[ICStyleSelectorViewController updateStyleSelectionHighlightAnimated:](self, "updateStyleSelectionHighlightAnimated:", v5);
  -[ICStyleSelectorViewController updateNamedStyleSelectedState](self, "updateNamedStyleSelectedState");
  -[ICStyleSelectorViewController updateListStyleSelectedState](self, "updateListStyleSelectedState");
  -[ICStyleSelectorViewController updateButtonEnabledState](self, "updateButtonEnabledState");
  -[ICStyleSelectorViewController scrollCurrentStyleToVisible:](self, "scrollCurrentStyleToVisible:", v5);
}

- (void)setCurrentBIUS:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  self->_currentBIUS = a3;
  v5 = a3 & 1;
  -[ICStyleSelectorViewController boldButton](self, "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", v5);

  -[ICStyleSelectorViewController italicButton](self, "italicButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", (a3 >> 1) & 1);

  -[ICStyleSelectorViewController underlineButton](self, "underlineButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelected:", (a3 >> 2) & 1);

  -[ICStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelected:", (a3 >> 3) & 1);

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", (a3 >> 4) & 1);

  }
  -[ICStyleSelectorViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "styleSelectorSelectionHasBlockQuote:", self);

  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelected:", v12);

}

- (UIButton)boldButton
{
  void *v2;
  void *v3;

  -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (UIButton)italicButton
{
  void *v2;
  void *v3;

  -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (UIButton)underlineButton
{
  void *v2;
  void *v3;

  -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (UIButton)strikethroughButton
{
  void *v2;
  void *v3;

  -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewWithTag:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  CGRect v10;

  v4 = a3;
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = CGRectGetMaxY(v10) + 4.0 + 8.0;

  v7 = objc_msgSend(v4, "verticalSizeClass");
  v8 = 104.0;
  if (v7 == 2)
    v8 = 188.0;
  return v6 + v8;
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
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
  void (**v37)(id, void *);
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[10];

  v54[8] = *MEMORY[0x1E0C80C00];
  v37 = a2;
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "titleStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_2;
  v52[3] = &unk_1EA7DF3F8;
  v6 = (id *)(a1 + 32);
  objc_copyWeak(&v53, (id *)(a1 + 32));
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v52);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "headingStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_3;
  v50[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v51, (id *)(a1 + 32));
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v50);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "subheadingStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_4;
  v48[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v49, (id *)(a1 + 32));
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v12, 0, 0, v48);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "bodyStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_5;
  v46[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v47, (id *)(a1 + 32));
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v46);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "fixedWidthStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_6;
  v44[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v45, (id *)(a1 + 32));
  objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v18, 0, 0, v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "dashStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_7;
  v42[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v43, v6);
  objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v42);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "numberedStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_8;
  v40[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v41, v6);
  objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, 0, 0, v40);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0D64DC0], "bulletStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_9;
  v38[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v39, v6);
  objc_msgSend(v28, "actionWithTitle:image:identifier:handler:", v30, 0, 0, v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = v36;
  v54[1] = v35;
  v54[2] = v34;
  v54[3] = v33;
  v54[4] = v19;
  v54[5] = v23;
  v54[6] = v27;
  v54[7] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2](v37, v32);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 0);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 1);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 2);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 3);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 4);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 101);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 102);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelector:didSelectStyle:", WeakRetained, 100);

}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_10(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Block Quote"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_11;
  v9[3] = &unk_1EA7DF3F8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v8);

  objc_destroyWeak(&v10);
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_11(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "styleSelectorToggleBlockQuote:", WeakRetained);

}

- (BOOL)currentBIUSContainsStyle:(unint64_t)a3
{
  return (a3 & ~-[ICStyleSelectorViewController currentBIUS](self, "currentBIUS")) == 0;
}

- (BOOL)currentNamedStylesContainsStyle:(unsigned int)a3
{
  void *v4;
  _QWORD v6[5];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ICStyleSelectorViewController_currentNamedStylesContainsStyle___block_invoke;
  v6[3] = &unk_1EA7DF448;
  v7 = a3;
  v6[4] = &v8;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v6);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

uint64_t __65__ICStyleSelectorViewController_currentNamedStylesContainsStyle___block_invoke(uint64_t result, int a2, _BYTE *a3)
{
  if (*(_DWORD *)(result + 40) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (int64_t)menuElementStateWithSelected:(BOOL)a3
{
  return a3;
}

- (id)biusStyleActionWithStyleBIUS:(unint64_t)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16[2];
  id location;

  objc_initWeak(&location, self);
  NSStringForSymbolImageNameFromICStyleBIUS();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICStyleSelectorViewController currentBIUSContainsStyle:](self, "currentBIUSContainsStyle:", a3);
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:textStyle:scale:", v5, *MEMORY[0x1E0DC4A88], -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "darkTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_imageCenteredWithBackgroundColor:size:cornerRadius:", v10, 34.0, 34.0, 8.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)MEMORY[0x1E0DC3428];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__ICStyleSelectorViewController_biusStyleActionWithStyleBIUS___block_invoke;
  v15[3] = &unk_1EA7DF470;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  objc_msgSend(v11, "ic_actionWithImage:handler:", v7, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D64DC0], "icaxStyleDescriptionForBIUSStyle:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  return v12;
}

void __62__ICStyleSelectorViewController_biusStyleActionWithStyleBIUS___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleSelector:toggleBIUS:", WeakRetained, *(_QWORD *)(a1 + 40));

}

- (id)namedStyleActionWithNamedStyle:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  int v13;
  id location;

  v3 = *(_QWORD *)&a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D64DC0], "styleForNamedStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v5, "attributedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__ICStyleSelectorViewController_namedStyleActionWithNamedStyle___block_invoke;
  v11[3] = &unk_1EA7DF498;
  objc_copyWeak(&v12, &location);
  v13 = v3;
  objc_msgSend(v6, "ic_actionWithAttributedTitle:handler:", v7, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setState:", -[ICStyleSelectorViewController menuElementStateWithSelected:](self, "menuElementStateWithSelected:", -[ICStyleSelectorViewController currentNamedStylesContainsStyle:](self, "currentNamedStylesContainsStyle:", v3)));
  objc_msgSend(MEMORY[0x1E0D64DC0], "icaxStyleDescriptionForNamedStyle:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

void __64__ICStyleSelectorViewController_namedStyleActionWithNamedStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectNamedStyle:", *(unsigned int *)(a1 + 40));

}

- (id)emphasisMenu
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D64A00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *MEMORY[0x1E0D64A00] + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = 0;
    do
    {
      -[ICStyleSelectorViewController emphasisColorActionWithType:bordered:selectionTogglesEmphasis:](self, "emphasisColorActionWithType:bordered:selectionTogglesEmphasis:", ++v5, 1, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ic_addNonNilObject:", v6);

    }
    while (v3 != v5);
  }
  -[ICStyleSelectorViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "currentEmphasisType");

  if (v8)
  {
    -[ICStyleSelectorViewController emphasisColorImageWithType:bordered:](self, "emphasisColorImageWithType:bordered:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithTitle:image:identifier:options:children:", v12, v9, 0, 0, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC39D0];
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_inlineMenuWithChildren:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)blockQuoteMenu
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB3498], "ic_blockQuoteMenuItemAttributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __47__ICStyleSelectorViewController_blockQuoteMenu__block_invoke;
  v16 = &unk_1EA7DF3F8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "ic_actionWithAttributedTitle:handler:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICStyleSelectorViewController delegate](self, "delegate", v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", objc_msgSend(v6, "styleSelectorSelectionHasBlockQuote:", self));

  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v8);

  v9 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_inlineMenuWithChildren:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v11;
}

void __47__ICStyleSelectorViewController_blockQuoteMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleBlockQuote:", WeakRetained);

}

- (void)toggleEmphasis:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;

  -[ICStyleSelectorViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleEmphasis");

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentBIUSForStyleSelector");

  -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelected:", (v6 >> 4) & 1);

}

- (id)makeInlineMenu
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0DC36F8];
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke;
  v16[3] = &unk_1EA7DF420;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v2, "elementWithUncachedProvider:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC39D0];
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_inlineMenuWithElementSize:children:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC36F8];
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke_2;
  v14[3] = &unk_1EA7DF420;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "elementWithUncachedProvider:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC39D0];
  v19[0] = v7;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithChildren:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  return v12;
}

void __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, void *);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleSelectorWillShowInlineMenu:", WeakRetained);

  objc_msgSend(WeakRetained, "biusStyleActionWithStyleBIUS:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "biusStyleActionWithStyleBIUS:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "biusStyleActionWithStyleBIUS:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "biusStyleActionWithStyleBIUS:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = v8;
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  v3[2](v3, v11);

}

void __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, void *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "emphasisMenu");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 102);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 101);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "namedStyleActionWithNamedStyle:", 100);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  v18 = (void *)v6;
  v19 = (void *)v4;
  v13 = (void *)v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v4, v5, v17, v7, v8, v9, v10, v11, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (ICInternalSettingsIsBlockQuoteEnabled())
  {
    objc_msgSend(WeakRetained, "blockQuoteMenu");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  v16 = (void *)objc_msgSend(v14, "copy");
  v3[2](v3, v16);

}

- (NSArray)biusButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  -[ICStyleSelectorViewController italicButton](self, "italicButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  -[ICStyleSelectorViewController underlineButton](self, "underlineButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  -[ICStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)listButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController bulletedListButton](self, "bulletedListButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController dashedListButton](self, "dashedListButton", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  -[ICStyleSelectorViewController numberedListButton](self, "numberedListButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)indentationButtons
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)nonStyleButtons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ICStyleSelectorViewController biusButtons](self, "biusButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    v6 = *MEMORY[0x1E0D64A00];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *MEMORY[0x1E0D64A00]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = 0;
      do
      {
        -[ICStyleSelectorViewController emphasisColorActionWithType:bordered:selectionTogglesEmphasis:](self, "emphasisColorActionWithType:bordered:selectionTogglesEmphasis:", ++v8, 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ic_addNonNilObject:", v9);

      }
      while (v6 != v8);
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMenu:", v10);

    -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowsMenuAsPrimaryAction:", 1);

    -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  -[ICStyleSelectorViewController listButtons](self, "listButtons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  -[ICStyleSelectorViewController indentationButtons](self, "indentationButtons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v15);

  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  return (NSArray *)v4;
}

- (void)applyFixedEmphasisColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = ICEmphasisColorTypeForTag();
  -[ICStyleSelectorViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleEmphasisWithType:", v4);

}

- (id)emphasisColorActionWithType:(int64_t)a3 bordered:(BOOL)a4 selectionTogglesEmphasis:(BOOL)a5
{
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19[2];
  BOOL v20;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  NSStringForEmphasisColorType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController emphasisColorImageWithType:bordered:](self, "emphasisColorImageWithType:bordered:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3428];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __95__ICStyleSelectorViewController_emphasisColorActionWithType_bordered_selectionTogglesEmphasis___block_invoke;
  v18 = &unk_1EA7DF4C0;
  v20 = a5;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a3;
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v9, v10, 0, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController delegate](self, "delegate", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setState:", objc_msgSend(v13, "currentEmphasisType") == a3);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  return v12;
}

void __95__ICStyleSelectorViewController_emphasisColorActionWithType_bordered_selectionTogglesEmphasis___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  if (*(_BYTE *)(a1 + 48)
    && (v3 = objc_loadWeakRetained((id *)(a1 + 32)),
        objc_msgSend(v3, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "currentEmphasisType"),
        v6 = *(_QWORD *)(a1 + 40),
        v4,
        v3,
        v5 == v6))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toggleEmphasis");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toggleEmphasisWithType:", *(_QWORD *)(a1 + 40));
  }

  v9 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v9, "setUpNonStyleButtons");

}

- (id)emphasisColorImageWithType:(int64_t)a3 bordered:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v4 = a4;
  ICColorForEmphasisColorType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 2.0;
    v8 = 15.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    v8 = 13.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "ic_makeCircularImageWithColor:diameter:borderColor:borderWidth:", v5, v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configureViewWithEmphasis
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 3) > 1)
    v6 = 0;
  else
    v6 = !-[ICStyleSelectorViewController isPopover](self, "isPopover");

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 5, 0, v9, 6, 1.0, 8.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setEmphasisContainerLeadingConstraint:](self, "setEmphasisContainerLeadingConstraint:", v10);

  v11 = (void *)MEMORY[0x1E0CB3718];
  -[ICStyleSelectorViewController emphasisContainerLeadingConstraint](self, "emphasisContainerLeadingConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v13);

  if (v6
    && (-[ICStyleSelectorViewController emphasisContainerTrailingConstraint](self, "emphasisContainerTrailingConstraint"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    v15 = (void *)MEMORY[0x1E0CB3718];
    -[ICStyleSelectorViewController emphasisContainerTrailingConstraint](self, "emphasisContainerTrailingConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deactivateConstraints:", v17);

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController boldButton](self, "boldButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 7, 0, v20, 7, 0.9, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController setEmphasisButtonWidthConstraint:](self, "setEmphasisButtonWidthConstraint:", v21);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 7, 0, v24, 7, 0.75, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStyleSelectorViewController setEmphasisColorPickerButtonWidthConstraint:](self, "setEmphasisColorPickerButtonWidthConstraint:", v25);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[ICStyleSelectorViewController emphasisButtonWidthConstraint](self, "emphasisButtonWidthConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v27;
    -[ICStyleSelectorViewController emphasisColorPickerButtonWidthConstraint](self, "emphasisColorPickerButtonWidthConstraint");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v29);

  }
  else
  {
    -[ICStyleSelectorViewController emphasisButtonWidthConstraint](self, "emphasisButtonWidthConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController emphasisButtonWidthConstraint](self, "emphasisButtonWidthConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "deactivateConstraints:", v33);

    }
    -[ICStyleSelectorViewController emphasisColorPickerButtonWidthConstraint](self, "emphasisColorPickerButtonWidthConstraint");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController emphasisColorPickerButtonWidthConstraint](self, "emphasisColorPickerButtonWidthConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "deactivateConstraints:", v37);

    }
    -[ICStyleSelectorViewController emphasisContainerTrailingConstraint](self, "emphasisContainerTrailingConstraint");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
    {
      v39 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 6, 0, v41, 6, 1.0, 0.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController setEmphasisContainerTrailingConstraint:](self, "setEmphasisContainerTrailingConstraint:", v42);

    }
    v43 = (void *)MEMORY[0x1E0CB3718];
    -[ICStyleSelectorViewController emphasisContainerTrailingConstraint](self, "emphasisContainerTrailingConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activateConstraints:", v28);
  }

}

- (BOOL)isPopover
{
  void *v2;
  char v3;

  -[ICStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1;
  else
    v3 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");

  return v3;
}

- (void)scrollCurrentStyleToVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentSize");
    v18 = v17;
    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentSize");
    v28.size.height = v20;
    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    v28.size.width = v18;
    v27 = CGRectIntersection(v26, v28);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;

    -[ICStyleSelectorViewController styleScrollView](self, "styleScrollView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scrollRectToVisible:animated:", v3, x, y, width, height);

  }
}

- (id)fontForICTTNamedStyle:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;

  -[ICStyleSelectorViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)fontForICTTNamedStyle__validCategories;
  if (!fontForICTTNamedStyle__validCategories)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DC4908], *MEMORY[0x1E0DC4930], *MEMORY[0x1E0DC4920], *MEMORY[0x1E0DC4918], *MEMORY[0x1E0DC4900], *MEMORY[0x1E0DC48F8], *MEMORY[0x1E0DC48F0], 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)fontForICTTNamedStyle__validCategories;
    fontForICTTNamedStyle__validCategories = v7;

    v6 = (void *)fontForICTTNamedStyle__validCategories;
  }
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0)
  {
    v9 = (id)*MEMORY[0x1E0DC48F0];

    v5 = v9;
  }
  switch(a3)
  {
    case 0u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTitleTextWithContentSizeCategory:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_pointSizeForBodyTextWithContentSizeCategory:", v5);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", round(v11 * *MEMORY[0x1E0D64E28]), *MEMORY[0x1E0DC1438]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_fontWithSingleLineA");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    case 2u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForSubheadingTextWithContentSizeCategory:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4u:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    default:
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyTextWithContentSizeCategory:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v13 = (void *)v10;
LABEL_12:

      return v13;
  }
}

- (void)updateHeaderVisibility
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double MinX;
  double MinY;
  double Width;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = -[ICStyleSelectorViewController isPopover](self, "isPopover");
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setHidden:", 1);

    -[ICStyleSelectorViewController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    -[ICStyleSelectorViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeAreaInsets");
    v9 = v8;

    -[ICStyleSelectorViewController navigationBar](self, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = v16;
    v28.size.height = v18;
    MinX = CGRectGetMinX(v28);
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v16;
    v29.size.height = v18;
    MinY = CGRectGetMinY(v29);
    v30.origin.x = v12;
    v30.origin.y = v14;
    v30.size.width = v16;
    v30.size.height = v18;
    Width = CGRectGetWidth(v30);
    -[ICStyleSelectorViewController navigationBar](self, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", MinX, MinY, Width, v9 + 50.0);

    v27 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v27, "setTitlePositionAdjustment:", 0.0, v9);
    -[ICStyleSelectorViewController navigationBar](self, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setStandardAppearance:", v27);

    -[ICStyleSelectorViewController configureForPopover](self, "configureForPopover");
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 0);

    -[ICStyleSelectorViewController navigationBar](self, "navigationBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHidden:", 1);

    -[ICStyleSelectorViewController headerView](self, "headerView");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v25 = CGRectGetMaxY(v31) + 4.0;
    -[ICStyleSelectorViewController scrollViewTopConstraint](self, "scrollViewTopConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", v25);

  }
}

- (void)configureForOrientation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  float v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v5, "interfaceOrientation") - 3) > 1)
    v6 = 0;
  else
    v6 = -[ICStyleSelectorViewController isPopover](self, "isPopover") ^ 1;

  if ((_DWORD)v6 != -[ICStyleSelectorViewController configuredForLandscape](self, "configuredForLandscape"))
  {
    -[ICStyleSelectorViewController listsContainerLeadingConstraintLandscape](self, "listsContainerLeadingConstraintLandscape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[ICStyleSelectorViewController biusContainerTopConstraintLandscape](self, "biusContainerTopConstraintLandscape");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.biusContainerTopConstraintLandscape) == nil)", "-[ICStyleSelectorViewController configureForOrientation]", 1, 0, CFSTR("Expected nil value for '%s'"), "self.biusContainerTopConstraintLandscape");
      -[ICStyleSelectorViewController boldButtonWidthConstraintLandscape](self, "boldButtonWidthConstraintLandscape");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.boldButtonWidthConstraintLandscape) == nil)", "-[ICStyleSelectorViewController configureForOrientation]", 1, 0, CFSTR("Expected nil value for '%s'"), "self.boldButtonWidthConstraintLandscape");
      if ((ICInternalSettingsIsEmphasisEnabled() & 1) != 0)
        -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
      else
        -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController listsContainer](self, "listsContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 5, 0, v10, 6, 1.0, 8.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController setListsContainerLeadingConstraintLandscape:](self, "setListsContainerLeadingConstraintLandscape:", v13);

      v14 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController listsContainer](self, "listsContainer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v16, 3, 1.0, 0.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController setBiusContainerTopConstraintLandscape:](self, "setBiusContainerTopConstraintLandscape:", v17);

      v18 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController boldButton](self, "boldButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController dashedListButton](self, "dashedListButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 7, 0, v20, 7, 1.0, 0.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStyleSelectorViewController setBoldButtonWidthConstraintLandscape:](self, "setBoldButtonWidthConstraintLandscape:", v21);

    }
    -[ICStyleSelectorViewController scrollViewHeightConstraint](self, "scrollViewHeightConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setConstant:", 48.0);

    if ((_DWORD)v6)
      v23 = 751.0;
    else
      v23 = 749.0;
    -[ICStyleSelectorViewController listsContainerLeadingConstraintLandscape](self, "listsContainerLeadingConstraintLandscape");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = v23;
    objc_msgSend(v24, "setPriority:", v25);

    -[ICStyleSelectorViewController biusContainerTopConstraintLandscape](self, "biusContainerTopConstraintLandscape");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v27 = v23;
    objc_msgSend(v26, "setPriority:", v27);

    -[ICStyleSelectorViewController boldButtonWidthConstraintLandscape](self, "boldButtonWidthConstraintLandscape");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v29 = v23;
    objc_msgSend(v28, "setPriority:", v29);

    if (!v7)
    {
      v30 = (void *)MEMORY[0x1E0CB3718];
      -[ICStyleSelectorViewController listsContainerLeadingConstraintLandscape](self, "listsContainerLeadingConstraintLandscape");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v31;
      -[ICStyleSelectorViewController biusContainerTopConstraintLandscape](self, "biusContainerTopConstraintLandscape");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v32;
      -[ICStyleSelectorViewController boldButtonWidthConstraintLandscape](self, "boldButtonWidthConstraintLandscape");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activateConstraints:", v34);

    }
    -[ICStyleSelectorViewController populateStyleScrollView](self, "populateStyleScrollView");
    -[ICStyleSelectorViewController updateNamedStyleSelectedState](self, "updateNamedStyleSelectedState");
    -[ICStyleSelectorViewController updateStyleSelectionHighlightAnimated:](self, "updateStyleSelectionHighlightAnimated:", 0);
    -[ICStyleSelectorViewController setConfiguredForLandscape:](self, "setConfiguredForLandscape:", v6);
  }
}

- (void)updateStyleSelectionHighlightAnimated:(BOOL)a3
{
  _BOOL4 v3;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  _QWORD v36[10];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "firstIndex");

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ICStyleSelectorViewController styleButtons](self, "styleButtons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v16);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "tag") == v15)
        {
          v21 = 1;
          goto LABEL_11;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v18)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_11:

  -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  v24 = 0.0;
  if (v21 && v23 == 1)
  {
    -[ICStyleSelectorViewController styleButtonForStyle:](self, "styleButtonForStyle:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v7 = v26;
    v9 = v27;
    v11 = v28;
    v13 = v29;

    v24 = 1.0;
  }
  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v3)
  {
    objc_msgSend(v30, "alpha");
    v33 = v32;

    if (v24 != 0.0 && v33 == 0.0)
    {
      -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFrame:", v7, v9, v11, v13);

    }
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __71__ICStyleSelectorViewController_updateStyleSelectionHighlightAnimated___block_invoke;
    v36[3] = &unk_1EA7DF4E8;
    v36[4] = self;
    *(double *)&v36[5] = v7;
    *(double *)&v36[6] = v9;
    *(double *)&v36[7] = v11;
    *(double *)&v36[8] = v13;
    *(double *)&v36[9] = v24;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v36, 0, 2.0, 0.0, 1.0, 500.0, 37.0, 0.0);
  }
  else
  {
    objc_msgSend(v30, "setFrame:", v7, v9, v11, v13);

    -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAlpha:", v24);

  }
}

void __71__ICStyleSelectorViewController_updateStyleSelectionHighlightAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "styleSelectionHighlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  v7 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "styleSelectionHighlight");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)updateNamedStyleSelectedState
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "firstIndex");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[ICStyleSelectorViewController styleButtons](self, "styleButtons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "tag") == v6);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[ICStyleSelectorViewController styleButtons](self, "styleButtons", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "setSelected:", 0);
        }
        v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }
  }

}

- (void)updateListStyleSelectedState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICStyleSelectorViewController listsContainer](self, "listsContainer", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_opt_class();
        ICDynamicCast();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 1)
          {
            v11 = objc_msgSend(v9, "tag");
            -[ICStyleSelectorViewController currentStyles](self, "currentStyles");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setSelected:", v11 == objc_msgSend(v12, "firstIndex"));

          }
          else
          {
            objc_msgSend(v9, "setSelected:", 0);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)populateStyleScrollView
{
  void *v3;
  _QWORD v4[5];

  -[ICStyleSelectorViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ICStyleSelectorViewController_populateStyleScrollView__block_invoke;
  v4[3] = &unk_1EA7DD2D8;
  v4[4] = self;
  objc_msgSend(v3, "ic_performAsCurrent:", v4);

}

void __56__ICStyleSelectorViewController_populateStyleScrollView__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat MaxX;
  void *v23;
  double v24;
  CGFloat v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v67 = *MEMORY[0x1E0C80C00];
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "styleButtons");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v60 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "removeFromSuperview");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "styleSelectorShouldDisableTextStyles:", *(_QWORD *)(a1 + 32));

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "styles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v49)
  {
    v47 = v7 ^ 1;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v46 = *(_QWORD *)v56;
    v45 = *MEMORY[0x1E0DC1138];
    v44 = *MEMORY[0x1E0DC1140];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v56 != v46)
          objc_enumerationMutation(obj);
        v54 = v12;
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v12);
        v63 = v45;
        objc_msgSend(*(id *)(a1 + 32), "fontForICTTNamedStyle:", objc_msgSend(v13, "ttStyle"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v13, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v52);

        objc_msgSend(v17, "size");
        v19 = v18;
        objc_msgSend(*(id *)(a1 + 32), "styleButtonPadding");
        v21 = v19 + v20 * 2.0;
        v68.origin.x = x;
        v68.origin.y = y;
        v68.size.width = width;
        v68.size.height = height;
        MaxX = CGRectGetMaxX(v68);
        objc_msgSend(*(id *)(a1 + 32), "scrollViewHeightConstraint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constant");
        v25 = v24;

        v69.origin.y = 0.0;
        v69.origin.x = MaxX;
        v69.size.width = v21;
        v69.size.height = v25;
        v70 = CGRectIntegral(v69);
        x = v70.origin.x;
        y = v70.origin.y;
        width = v70.size.width;
        height = v70.size.height;
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
        objc_msgSend(v26, "setTag:", objc_msgSend(v13, "ttStyle"));
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v17, "length");
        v30 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v30, "addAttribute:value:range:", v44, v51, 0, v29);
        objc_msgSend(v26, "setAttributedTitle:forState:", v30, 0);
        v31 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v31, "addAttribute:value:range:", v44, v50, 0, v29);
        objc_msgSend(v26, "setAttributedTitle:forState:", v31, 1);
        v32 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v32, "addAttribute:value:range:", v44, v27, 0, v29);
        objc_msgSend(v26, "setAttributedTitle:forState:", v32, 4);
        v33 = (void *)objc_msgSend(v17, "mutableCopy");
        objc_msgSend(v33, "addAttribute:value:range:", v44, v28, 0, v29);
        objc_msgSend(v26, "setAttributedTitle:forState:", v33, 2);
        objc_msgSend(v26, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_namedStyleButtonAction_, 64);
        objc_msgSend(v26, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
        objc_msgSend(v26, "titleLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTextAlignment:", 1);

        objc_msgSend(v26, "setEnabled:", v47);
        objc_msgSend(v48, "addObject:", v26);
        objc_msgSend(*(id *)(a1 + 32), "styleScrollView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addSubview:", v26);

        v12 = v54 + 1;
      }
      while (v49 != v54 + 1);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v49);
  }

  objc_msgSend(v48, "lastObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  v37 = CGRectGetMaxX(v71);
  objc_msgSend(*(id *)(a1 + 32), "styleScrollView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;
  objc_msgSend(*(id *)(a1 + 32), "styleScrollView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setContentSize:", v37, v40);

  v42 = (void *)objc_msgSend(v48, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setStyleButtons:", v42);

}

- (void)namedStyleButtonAction:(id)a3
{
  -[ICStyleSelectorViewController selectNamedStyle:](self, "selectNamedStyle:", objc_msgSend(a3, "tag"));
}

- (void)selectNamedStyle:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController setCurrentStyles:bius:animated:](self, "setCurrentStyles:bius:animated:", v5, -[ICStyleSelectorViewController currentBIUS](self, "currentBIUS"), 1);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleSelector:didSelectStyle:", self, v3);

}

- (id)styleButtonForStyle:(unsigned int)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
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
  -[ICStyleSelectorViewController styleButtons](self, "styleButtons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    v7 = a3;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "tag") == v7)
        {
          v5 = v9;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)updateButtonEnabledState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "styleSelectorCanIndentLeft:", self);

  -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  -[ICStyleSelectorViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "styleSelectorCanIndentRight:", self);

  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (void)setUpNonStyleButtons
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
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  ICStyleSelectorViewController *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id location;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[4];
  _BYTE v52[128];
  _QWORD v53[5];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[ICStyleSelectorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForStyleSelector:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    v48 = 0uLL;
    v49 = 0uLL;
    v46 = 0uLL;
    v47 = 0uLL;
    -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v6;
    -[ICStyleSelectorViewController emphasisContainer](self, "emphasisContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v7;
    -[ICStyleSelectorViewController listsContainer](self, "listsContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v8;
    -[ICStyleSelectorViewController indentationContainer](self, "indentationContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v9;
    -[ICStyleSelectorViewController blockQuoteContainer](self, "blockQuoteContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v47 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "ic_applyRoundedCorners", v32);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v12);
    }
  }
  else
  {
    v44 = 0uLL;
    v45 = 0uLL;
    v42 = 0uLL;
    v43 = 0uLL;
    -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v15;
    -[ICStyleSelectorViewController listsContainer](self, "listsContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v16;
    -[ICStyleSelectorViewController indentationContainer](self, "indentationContainer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v17;
    -[ICStyleSelectorViewController blockQuoteContainer](self, "blockQuoteContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "ic_applyRoundedCorners", v32);
        }
        v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v19);
    }
  }

  objc_initWeak(&location, self);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[ICStyleSelectorViewController nonStyleButtons](self, "nonStyleButtons");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v38;
    v25 = MEMORY[0x1E0C809B0];
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
        v33[0] = v25;
        v33[1] = 3221225472;
        v33[2] = __53__ICStyleSelectorViewController_setUpNonStyleButtons__block_invoke;
        v33[3] = &unk_1EA7DF510;
        v34 = v32;
        objc_copyWeak(&v36, &location);
        v35 = self;
        objc_msgSend(v27, "setConfigurationUpdateHandler:", v33);
        objc_destroyWeak(&v36);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    }
    while (v23);
  }

  -[ICStyleSelectorViewController styleSelectionHighlight](self, "styleSelectionHighlight");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v32);

  -[ICStyleSelectorViewController indentationContainer](self, "indentationContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSemanticContentAttribute:", 3);

  -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSemanticContentAttribute:", 3);

  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSemanticContentAttribute:", 3);

  objc_destroyWeak(&location);
}

void __53__ICStyleSelectorViewController_setUpNonStyleButtons__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isSelected") & 1) != 0)
  {
    objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if ((objc_msgSend(v15, "isHighlighted") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  objc_msgSend(v3, "setBackground:", v4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "imageForButton:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v7);

  objc_msgSend(v15, "setConfiguration:", v3);
  objc_msgSend(*(id *)(a1 + 40), "blockQuoteButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v15)
  {
    objc_msgSend(v15, "setEnabled:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", objc_msgSend(v9, "styleSelectorShouldDisableTextStyles:", *(_QWORD *)(a1 + 40)) ^ 1);

  }
  if ((objc_msgSend(v15, "isSelected") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v10);

  objc_msgSend(*(id *)(a1 + 40), "emphasisColorPickerButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v15)
  {
    ic_currentEmphasisColorTypeDefault();
    NSStringForEmphasisColorType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = v12;
    else
      v13 = 0;
    objc_msgSend(*(id *)(a1 + 40), "emphasisColorPickerButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityValue:", v13);

  }
}

- (id)imageNameForButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  const __CFString *v16;

  v4 = a3;
  -[ICStyleSelectorViewController boldButton](self, "boldButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v16 = CFSTR("bold");
  }
  else
  {
    -[ICStyleSelectorViewController italicButton](self, "italicButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v16 = CFSTR("italic");
    }
    else
    {
      -[ICStyleSelectorViewController underlineButton](self, "underlineButton");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        v16 = CFSTR("underline");
      }
      else
      {
        -[ICStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
        {
          v16 = CFSTR("strikethrough");
        }
        else
        {
          -[ICStyleSelectorViewController dashedListButton](self, "dashedListButton");
          v9 = (id)objc_claimAutoreleasedReturnValue();

          if (v9 == v4)
          {
            v16 = CFSTR("list.dash");
          }
          else
          {
            -[ICStyleSelectorViewController numberedListButton](self, "numberedListButton");
            v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10 == v4)
            {
              v16 = CFSTR("list.number");
            }
            else
            {
              -[ICStyleSelectorViewController bulletedListButton](self, "bulletedListButton");
              v11 = (id)objc_claimAutoreleasedReturnValue();

              if (v11 == v4)
              {
                v16 = CFSTR("list.bullet");
              }
              else
              {
                -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
                v12 = (id)objc_claimAutoreleasedReturnValue();

                if (v12 == v4)
                {
                  v16 = CFSTR("decrease.indent");
                }
                else
                {
                  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
                  v13 = (id)objc_claimAutoreleasedReturnValue();

                  if (v13 == v4)
                  {
                    v16 = CFSTR("increase.indent");
                  }
                  else
                  {
                    -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
                    v14 = (id)objc_claimAutoreleasedReturnValue();

                    if (v14 == v4)
                    {
                      v16 = CFSTR("line.vertical.and.rectangle.fill");
                    }
                    else if (ICInternalSettingsIsEmphasisEnabled()
                           && (-[ICStyleSelectorViewController emphasisButton](self, "emphasisButton"),
                               v15 = (id)objc_claimAutoreleasedReturnValue(),
                               v15,
                               v15 == v4))
                    {
                      v16 = CFSTR("highlighter");
                    }
                    else
                    {
                      if (ICInternalSettingsIsEmphasisEnabled())
                      {
                        -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");

                      }
                      v16 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v16;
}

- (id)imageForButton:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void **v20;
  void *v21;
  void *v22;
  void **v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  _QWORD v30[2];
  void *v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ICStyleSelectorViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "currentEmphasisType");

    if (!v14)
      ic_currentEmphasisColorTypeDefault();
    v15 = (void *)MEMORY[0x1E0DC3870];
    ICColorForEmphasisColorType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ic_makeCircularImageWithColor:diameter:", v6, 12.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICStyleSelectorViewController imageNameForButton:](self, "imageNameForButton:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)*MEMORY[0x1E0DC4B60];
      v8 = (id)*MEMORY[0x1E0DC48F0];
      -[ICStyleSelectorViewController biusContainer](self, "biusContainer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v4);

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:textStyle:scale:maxContentSizeCategory:", v6, v7, 3, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_26;
      }
      -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v4, "isSelected");
      if (v16 != v4)
      {
        if ((v17 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v18;
          v19 = (void *)MEMORY[0x1E0C99D20];
          v20 = &v31;
        }
        else
        {
          if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = v18;
            objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v30[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
            objc_msgSend(MEMORY[0x1E0DC3870], "ic_hierarchicalSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", v6, v25, v7, 3, v8);
            v27 = objc_claimAutoreleasedReturnValue();
LABEL_24:
            v12 = (void *)v27;

            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v18;
          v19 = (void *)MEMORY[0x1E0C99D20];
          v20 = &v29;
        }
        objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if ((v17 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v21;
        v22 = (void *)MEMORY[0x1E0C99D20];
        v23 = (void **)v34;
      }
      else
      {
        if ((objc_msgSend(v4, "isEnabled") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v21;
          objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
          objc_msgSend(MEMORY[0x1E0DC3870], "ic_hierarchicalNonSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", v6, v25, *MEMORY[0x1E0DC4A88], 3, *MEMORY[0x1E0DC4900]);
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v21;
        v22 = (void *)MEMORY[0x1E0C99D20];
        v23 = &v32;
      }
      objc_msgSend(v22, "arrayWithObjects:count:", v23, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v12 = 0;
  }
LABEL_26:

  return v12;
}

- (void)applyAccessibilityInfo
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
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[ICStyleSelectorViewController popoverPresentationController](self, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPassthroughViews:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Hide format menu"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("bold"), &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController boldButton](self, "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("italic"), &stru_1EA7E9860, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController italicButton](self, "italicButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v11);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("underline"), &stru_1EA7E9860, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController underlineButton](self, "underlineButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v14);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("strikethrough"), &stru_1EA7E9860, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityLabel:", v17);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("dashed list"), &stru_1EA7E9860, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController dashedListButton](self, "dashedListButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v20);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("numbered list"), &stru_1EA7E9860, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController numberedListButton](self, "numberedListButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityLabel:", v23);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("bulleted list"), &stru_1EA7E9860, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController bulletedListButton](self, "bulletedListButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityLabel:", v26);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("outdent"), &stru_1EA7E9860, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityLabel:", v29);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("indent"), &stru_1EA7E9860, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAccessibilityLabel:", v32);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("block quote"), &stru_1EA7E9860, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAccessibilityLabel:", v35);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Highlight"), &stru_1EA7E9860, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityLabel:", v38);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Highlight color"), &stru_1EA7E9860, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAccessibilityLabel:", v41);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[ICStyleSelectorViewController styleButtons](self, "styleButtons", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v76;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v76 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v47++), "_accessibilitySetIsSpeakThisElement:", 1);
      }
      while (v45 != v47);
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v45);
  }

  -[ICStyleSelectorViewController boldButton](self, "boldButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController italicButton](self, "italicButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController underlineButton](self, "underlineButton");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController strikethroughButton](self, "strikethroughButton");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController dashedListButton](self, "dashedListButton");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController numberedListButton](self, "numberedListButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController bulletedListButton](self, "bulletedListButton");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController indentLeftButton](self, "indentLeftButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController indentRightButton](self, "indentRightButton");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController blockQuoteButton](self, "blockQuoteButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController emphasisButton](self, "emphasisButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController emphasisColorPickerButton](self, "emphasisColorPickerButton");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "_accessibilitySetIsSpeakThisElement:", 1);

  -[ICStyleSelectorViewController headerView](self, "headerView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setShowsLargeContentViewer:", 1);

  -[ICStyleSelectorViewController headerView](self, "headerView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_alloc_init(MEMORY[0x1E0DC3998]);
  objc_msgSend(v61, "addInteraction:", v62);

  -[ICStyleSelectorViewController headerLabel](self, "headerLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "text");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController headerView](self, "headerView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setLargeContentTitle:", v64);

  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setShowsLargeContentViewer:", 1);

  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_alloc_init(MEMORY[0x1E0DC3998]);
  objc_msgSend(v67, "addInteraction:", v68);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_1EA7E9860, 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setLargeContentTitle:", v70);

  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "currentImage");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStyleSelectorViewController closeButton](self, "closeButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setLargeContentImage:", v73);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICStyleSelectorViewController;
  -[ICStyleSelectorViewController _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ICStyleSelectorViewController applyAccessibilityInfo](self, "applyAccessibilityInfo");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICStyleSelectorDelegate)delegate
{
  return (ICStyleSelectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)currentBIUS
{
  return self->_currentBIUS;
}

- (NSIndexSet)currentStyles
{
  return self->_currentStyles;
}

- (void)setCurrentStyles:(id)a3
{
  objc_storeStrong((id *)&self->_currentStyles, a3);
}

- (id)elementForAXFocusOnDismissal
{
  return objc_loadWeakRetained(&self->_elementForAXFocusOnDismissal);
}

- (void)setElementForAXFocusOnDismissal:(id)a3
{
  objc_storeWeak(&self->_elementForAXFocusOnDismissal, a3);
}

- (UIScrollView)styleScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_styleScrollView);
}

- (void)setStyleScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_styleScrollView, a3);
}

- (NSArray)styleButtons
{
  return self->_styleButtons;
}

- (void)setStyleButtons:(id)a3
{
  objc_storeStrong((id *)&self->_styleButtons, a3);
}

- (UIView)biusContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_biusContainer);
}

- (void)setBiusContainer:(id)a3
{
  objc_storeWeak((id *)&self->_biusContainer, a3);
}

- (UIView)emphasisContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_emphasisContainer);
}

- (void)setEmphasisContainer:(id)a3
{
  objc_storeWeak((id *)&self->_emphasisContainer, a3);
}

- (UIView)listsContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_listsContainer);
}

- (void)setListsContainer:(id)a3
{
  objc_storeWeak((id *)&self->_listsContainer, a3);
}

- (UIView)indentationContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_indentationContainer);
}

- (void)setIndentationContainer:(id)a3
{
  objc_storeWeak((id *)&self->_indentationContainer, a3);
}

- (UIView)blockQuoteContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_blockQuoteContainer);
}

- (void)setBlockQuoteContainer:(id)a3
{
  objc_storeWeak((id *)&self->_blockQuoteContainer, a3);
}

- (UIView)headerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (UILabel)headerLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_headerLabel);
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_headerLabel, a3);
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_navigationBar);
}

- (void)setNavigationBar:(id)a3
{
  objc_storeWeak((id *)&self->_navigationBar, a3);
}

- (void)setBoldButton:(id)a3
{
  objc_storeWeak((id *)&self->_boldButton, a3);
}

- (void)setItalicButton:(id)a3
{
  objc_storeWeak((id *)&self->_italicButton, a3);
}

- (void)setUnderlineButton:(id)a3
{
  objc_storeWeak((id *)&self->_underlineButton, a3);
}

- (void)setStrikethroughButton:(id)a3
{
  objc_storeWeak((id *)&self->_strikethroughButton, a3);
}

- (UIButton)dashedListButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_dashedListButton);
}

- (void)setDashedListButton:(id)a3
{
  objc_storeWeak((id *)&self->_dashedListButton, a3);
}

- (UIButton)numberedListButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_numberedListButton);
}

- (void)setNumberedListButton:(id)a3
{
  objc_storeWeak((id *)&self->_numberedListButton, a3);
}

- (UIButton)bulletedListButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_bulletedListButton);
}

- (void)setBulletedListButton:(id)a3
{
  objc_storeWeak((id *)&self->_bulletedListButton, a3);
}

- (UIButton)indentLeftButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_indentLeftButton);
}

- (void)setIndentLeftButton:(id)a3
{
  objc_storeWeak((id *)&self->_indentLeftButton, a3);
}

- (UIButton)indentRightButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_indentRightButton);
}

- (void)setIndentRightButton:(id)a3
{
  objc_storeWeak((id *)&self->_indentRightButton, a3);
}

- (UIButton)blockQuoteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_blockQuoteButton);
}

- (void)setBlockQuoteButton:(id)a3
{
  objc_storeWeak((id *)&self->_blockQuoteButton, a3);
}

- (UIButton)emphasisButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_emphasisButton);
}

- (void)setEmphasisButton:(id)a3
{
  objc_storeWeak((id *)&self->_emphasisButton, a3);
}

- (UIButton)emphasisColorPickerButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_emphasisColorPickerButton);
}

- (void)setEmphasisColorPickerButton:(id)a3
{
  objc_storeWeak((id *)&self->_emphasisColorPickerButton, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (NSLayoutConstraint)listsContainerBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_listsContainerBottomConstraint);
}

- (void)setListsContainerBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_listsContainerBottomConstraint, a3);
}

- (NSLayoutConstraint)listsContainerTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_listsContainerTopConstraint);
}

- (void)setListsContainerTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_listsContainerTopConstraint, a3);
}

- (NSLayoutConstraint)biusContainerTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_biusContainerTopConstraint);
}

- (void)setBiusContainerTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_biusContainerTopConstraint, a3);
}

- (NSLayoutConstraint)scrollViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_scrollViewTopConstraint);
}

- (void)setScrollViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewTopConstraint, a3);
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_scrollViewHeightConstraint);
}

- (void)setScrollViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewHeightConstraint, a3);
}

- (NSLayoutConstraint)listsContainerLeadingConstraintLandscape
{
  return self->_listsContainerLeadingConstraintLandscape;
}

- (void)setListsContainerLeadingConstraintLandscape:(id)a3
{
  objc_storeStrong((id *)&self->_listsContainerLeadingConstraintLandscape, a3);
}

- (NSLayoutConstraint)biusContainerTopConstraintLandscape
{
  return self->_biusContainerTopConstraintLandscape;
}

- (void)setBiusContainerTopConstraintLandscape:(id)a3
{
  objc_storeStrong((id *)&self->_biusContainerTopConstraintLandscape, a3);
}

- (NSLayoutConstraint)boldButtonWidthConstraintLandscape
{
  return self->_boldButtonWidthConstraintLandscape;
}

- (void)setBoldButtonWidthConstraintLandscape:(id)a3
{
  objc_storeStrong((id *)&self->_boldButtonWidthConstraintLandscape, a3);
}

- (NSLayoutConstraint)emphasisContainerLeadingConstraint
{
  return self->_emphasisContainerLeadingConstraint;
}

- (void)setEmphasisContainerLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emphasisContainerLeadingConstraint, a3);
}

- (NSLayoutConstraint)emphasisContainerTrailingConstraint
{
  return self->_emphasisContainerTrailingConstraint;
}

- (void)setEmphasisContainerTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emphasisContainerTrailingConstraint, a3);
}

- (NSLayoutConstraint)emphasisButtonWidthConstraint
{
  return self->_emphasisButtonWidthConstraint;
}

- (void)setEmphasisButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emphasisButtonWidthConstraint, a3);
}

- (NSLayoutConstraint)emphasisColorPickerButtonWidthConstraint
{
  return self->_emphasisColorPickerButtonWidthConstraint;
}

- (void)setEmphasisColorPickerButtonWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_emphasisColorPickerButtonWidthConstraint, a3);
}

- (UIView)styleSelectionHighlight
{
  return self->_styleSelectionHighlight;
}

- (void)setStyleSelectionHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_styleSelectionHighlight, a3);
}

- (NSArray)styles
{
  return self->_styles;
}

- (BOOL)configuredForLandscape
{
  return self->_configuredForLandscape;
}

- (void)setConfiguredForLandscape:(BOOL)a3
{
  self->_configuredForLandscape = a3;
}

- (BOOL)configuredForPopover
{
  return self->_configuredForPopover;
}

- (void)setConfiguredForPopover:(BOOL)a3
{
  self->_configuredForPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_styleSelectionHighlight, 0);
  objc_storeStrong((id *)&self->_emphasisColorPickerButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_boldButtonWidthConstraintLandscape, 0);
  objc_storeStrong((id *)&self->_biusContainerTopConstraintLandscape, 0);
  objc_storeStrong((id *)&self->_listsContainerLeadingConstraintLandscape, 0);
  objc_destroyWeak((id *)&self->_scrollViewHeightConstraint);
  objc_destroyWeak((id *)&self->_scrollViewTopConstraint);
  objc_destroyWeak((id *)&self->_biusContainerTopConstraint);
  objc_destroyWeak((id *)&self->_listsContainerTopConstraint);
  objc_destroyWeak((id *)&self->_listsContainerBottomConstraint);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_emphasisColorPickerButton);
  objc_destroyWeak((id *)&self->_emphasisButton);
  objc_destroyWeak((id *)&self->_blockQuoteButton);
  objc_destroyWeak((id *)&self->_indentRightButton);
  objc_destroyWeak((id *)&self->_indentLeftButton);
  objc_destroyWeak((id *)&self->_bulletedListButton);
  objc_destroyWeak((id *)&self->_numberedListButton);
  objc_destroyWeak((id *)&self->_dashedListButton);
  objc_destroyWeak((id *)&self->_strikethroughButton);
  objc_destroyWeak((id *)&self->_underlineButton);
  objc_destroyWeak((id *)&self->_italicButton);
  objc_destroyWeak((id *)&self->_boldButton);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_headerLabel);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_blockQuoteContainer);
  objc_destroyWeak((id *)&self->_indentationContainer);
  objc_destroyWeak((id *)&self->_listsContainer);
  objc_destroyWeak((id *)&self->_emphasisContainer);
  objc_destroyWeak((id *)&self->_biusContainer);
  objc_storeStrong((id *)&self->_styleButtons, 0);
  objc_destroyWeak((id *)&self->_styleScrollView);
  objc_destroyWeak(&self->_elementForAXFocusOnDismissal);
  objc_storeStrong((id *)&self->_currentStyles, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
