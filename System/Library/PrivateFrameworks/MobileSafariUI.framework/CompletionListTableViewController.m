@implementation CompletionListTableViewController

+ (void)configureCell:(id)a3 backgroundMode:(int64_t)a4 separatorStyle:(int)a5 shouldHaveTopPadding:(BOOL)a6 configurationStateDidChangeCallback:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  double v27;
  _QWORD aBlock[4];
  id v29;
  int v30;

  v11 = a3;
  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke;
  aBlock[3] = &unk_1E9CF9BB0;
  v30 = a5;
  v14 = v12;
  v29 = v14;
  v15 = _Block_copy(aBlock);
  if (a4 == 1 && a6)
    v16 = 8.0;
  else
    v16 = 0.0;
  v22 = v13;
  v23 = 3221225472;
  v24 = __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_2;
  v25 = &unk_1E9CF9BD8;
  v27 = v16;
  v17 = v14;
  v26 = v17;
  v18 = _Block_copy(&v22);
  v19 = v18;
  v20 = &__block_literal_global_54;
  if (a4 == 1)
    v20 = v18;
  if (a4)
    v21 = v20;
  else
    v21 = v15;
  objc_msgSend(v11, "setConfigurationUpdateHandler:", v21, v22, v23, v24, v25);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (universalSearchResultHorizontalContentInset_onceToken != -1)
      dispatch_once(&universalSearchResultHorizontalContentInset_onceToken, &__block_literal_global_97_0);
    objc_msgSend(v11, "setCustomEdgeInsets:", v16, *(double *)&universalSearchResultHorizontalContentInset_contentInset, 0.0, *(double *)&universalSearchResultHorizontalContentInset_contentInset);
  }

}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGRect v19;

  v18 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 20.0);
  if ((objc_msgSend(v5, "isHighlighted") & 1) != 0 || objc_msgSend(v5, "isSelected"))
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(v18, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "sf_usesVibrantAppearance"))
      v10 = 5;
    else
      v10 = 6;
    objc_msgSend(v8, "effectForBlurEffect:style:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisualEffect:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);
  }

  objc_msgSend(v18, "setBackgroundConfiguration:", v6);
  v12 = *(_DWORD *)(a1 + 40);
  if (v12 == 1)
  {
    objc_msgSend(v18, "setSeparatorStyle:", 0);
    objc_msgSend(v18, "bounds");
    CGRectGetWidth(v19);
    UIEdgeInsetsMakeWithEdges();
    goto LABEL_12;
  }
  if (v12 == 2)
  {
    objc_msgSend(v18, "setSeparatorStyle:", 1);
    +[CompletionListTableViewCell imageWidthSpace](CompletionListTableViewCell, "imageWidthSpace");
    v14 = v13;
    v15 = 0.0;
    v16 = 16.0;
    v17 = 0.0;
LABEL_12:
    objc_msgSend(v18, "setSeparatorInset:", v15, v14, v17, v16);
  }
  objc_msgSend(v18, "setSelectedBackgroundView:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  v19 = a2;
  v5 = a3;
  objc_msgSend(v19, "backgroundConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v7, "setClipsToBounds:", 0);
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", 1.0);

  }
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatedConfigurationForState:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "sf_usesVibrantAppearance");

  if ((_DWORD)v10)
  {
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.8);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  if ((objc_msgSend(v5, "isHighlighted") & 1) == 0 && (objc_msgSend(v5, "isSelected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("CompletionListPlainPlatterBackgroundColor"));
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  objc_msgSend(v7, "setBackgroundColor:", v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("CompletionListPlainPlatterBorderColor"));
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v15, "CGColor");
  objc_msgSend(v7, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderColor:", v16);

  objc_msgSend(v7, "_setContinuousCornerRadius:", 20.0);
  objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCustomView:", v7);
  objc_msgSend(v18, "setBackgroundInsets:", *(double *)(a1 + 40), 0.0, 0.0, 0.0);
  objc_msgSend(v19, "setBackgroundConfiguration:", v18);
  objc_msgSend(v19, "setSeparatorStyle:", 0);
  objc_msgSend(v19, "bounds");
  CGRectGetWidth(v20);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v19, "setSeparatorInset:");
  objc_msgSend(v19, "setSelectedBackgroundView:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __138__CompletionListTableViewController_configureCell_backgroundMode_separatorStyle_shouldHaveTopPadding_configurationStateDidChangeCallback___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  HaloSelectedBackgroundView *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setContinuousCornerRadius:", 20.0);

  objc_msgSend(v6, "setBackgroundColor:", 0);
  objc_msgSend(v6, "selectedBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = objc_alloc_init(HaloSelectedBackgroundView);
    objc_msgSend(v6, "setSelectedBackgroundView:", v5);

  }
}

- (CompletionListTableViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompletionListTableViewController;
  return -[CompletionListTableViewController initWithStyle:](&v3, sel_initWithStyle_, 0);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _UIVisualEffectBackdropView *v7;
  _UIVisualEffectBackdropView *headerBackdropCaptureView;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CompletionListTableViewController;
  -[SFPopoverSizingTableViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[CompletionListTableViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);
  -[CompletionListTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_traitCollectionWithVibrancy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setLocalOverrideTraitCollection:", v5);

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("CompletionListTableView"));
  objc_msgSend(v4, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);
  objc_msgSend(v4, "setKeyboardDismissMode:", 2);
  objc_msgSend(v4, "setSectionFooterHeight:", 0.0);
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", 0);
  objc_msgSend(v4, "_setSectionContentInset:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v4, "_setSectionCornerRadius:", 0.0);
  objc_msgSend(v4, "_setHeaderAndFooterViewsFloat:", 0);
  objc_msgSend(v4, "setSectionHeaderTopPadding:", 0.0);
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("CatalogViewControllerTableHeader"));
  v6 = objc_alloc(MEMORY[0x1E0DC4498]);
  objc_msgSend(v4, "bounds");
  v7 = (_UIVisualEffectBackdropView *)objc_msgSend(v6, "initWithFrame:");
  headerBackdropCaptureView = self->_headerBackdropCaptureView;
  self->_headerBackdropCaptureView = v7;

  -[_UIVisualEffectBackdropView captureGroup](self->_headerBackdropCaptureView, "captureGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupName:", CFSTR("completion-list-header"));

  -[_UIVisualEffectBackdropView setRenderMode:](self->_headerBackdropCaptureView, "setRenderMode:", 1);
  objc_msgSend(v4, "setBackgroundView:", self->_headerBackdropCaptureView);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4E60], 0);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CompletionListTableViewController;
  -[CompletionListTableViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  objc_msgSend(MEMORY[0x1E0DC3AD8], "visiblePeripheralFrame");
  -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CompletionListTableViewController;
  -[SFPopoverSizingTableViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  if (self->_shouldResetScrollOffsetOnNextLayout)
  {
    self->_shouldResetScrollOffsetOnNextLayout = 0;
    -[CompletionListTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CompletionListTableViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
    {
      v4 = *MEMORY[0x1E0C9D538];
      v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    else
    {
      objc_msgSend(v3, "adjustedContentInset");
      v5 = -v6;
      v4 = 0.0;
    }
    objc_msgSend(v3, "setContentOffset:", v4, v5);

  }
}

- (UITableViewHeaderFooterView)defaultHeaderFooterView
{
  void *v2;
  void *v3;

  -[CompletionListTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("CatalogViewControllerTableHeader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITableViewHeaderFooterView *)v3;
}

- (void)updateContentInsets
{
  objc_msgSend(MEMORY[0x1E0DC3AD8], "visiblePeripheralFrame");
  -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)setNeedsScrollOffsetReset
{
  self->_shouldResetScrollOffsetOnNextLayout = 1;
}

- (void)setWebSearchTipView:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[CompletionListTableViewController _showingWebSearchTip](self, "_showingWebSearchTip"))
    objc_storeStrong((id *)&self->_webSearchTipView, a3);

}

- (void)setShowsWebSearchTipIfExists:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
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
  _QWORD v24[5];
  CGRect v25;

  v24[4] = *MEMORY[0x1E0C80C00];
  if (self->_showsWebSearchTipIfExists != a3)
  {
    self->_showsWebSearchTipIfExists = a3;
    if (self->_webSearchTipView)
    {
      -[CompletionListTableViewController tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_showsWebSearchTipIfExists)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        objc_msgSend(v4, "setTableHeaderView:", v5);
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_webSearchTipView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v5, "addSubview:", self->_webSearchTipView);
        objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
        v23 = v4;
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "directionalLayoutMargins");
        v8 = v7;

        v17 = (void *)MEMORY[0x1E0CB3718];
        -[UIView leftAnchor](self->_webSearchTipView, "leftAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "leftAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v20;
        -[UIView rightAnchor](self->_webSearchTipView, "rightAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "rightAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -16.0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v9;
        -[UIView topAnchor](self->_webSearchTipView, "topAnchor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "topAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v12;
        -[UIView bottomAnchor](self->_webSearchTipView, "bottomAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bottomAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[3] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activateConstraints:", v16);

        v4 = v23;
        objc_msgSend(v23, "bounds");
        -[CompletionListTableViewController _updateWebSearchTipProposedHeightForTableViewWidth:](self, "_updateWebSearchTipProposedHeightForTableViewWidth:", CGRectGetWidth(v25));
        objc_msgSend(v5, "setBounds:", 0.0, 0.0, 0.0, v8 + self->_webSearchTipProposedHeight);

      }
      else
      {
        -[UIView removeFromSuperview](self->_webSearchTipView, "removeFromSuperview");
        objc_msgSend(v4, "setTableHeaderView:", 0);
      }

    }
  }
}

- (BOOL)_showingWebSearchTip
{
  return self->_showsWebSearchTipIfExists && self->_webSearchTipView != 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  void *v6;
  double v7;
  objc_super v8;
  CGRect v9;

  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CompletionListTableViewController;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CompletionListTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v9);

  if (v7 != width)
    -[CompletionListTableViewController _updateWebSearchTipProposedHeightForTableViewWidth:](self, "_updateWebSearchTipProposedHeightForTableViewWidth:", width);
}

- (void)_updateWebSearchTipProposedHeightForTableViewWidth:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;

  v5 = -[CompletionListTableViewController _showingWebSearchTip](self, "_showingWebSearchTip");
  v8 = 0.0;
  if (v5)
  {
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_webSearchTipView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 + -32.0, *(double *)(MEMORY[0x1E0DC4FF8] + 8), v6, v7);
  }
  self->_webSearchTipProposedHeight = v8;
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CompletionListTableViewController;
  -[CompletionListTableViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[CompletionListTableViewController _updateTableViewContentInset](self, "_updateTableViewContentInset");
}

+ (id)tableViewCellForSizeEstimation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, 0);
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", CFSTR("A"));

  objc_msgSend(v2, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", CFSTR("A"));

  return v2;
}

- (int64_t)minimumNumberOfRows
{
  return 1;
}

- (int64_t)maximumNumberOfRows
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (void)keyboardDidChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGRectValue");
    -[CompletionListTableViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
    v5 = v6;
  }

}

- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double MaxY;
  double v20;
  void *v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = 0.0;
  if (!CGRectIsEmpty(a3))
  {
    -[CompletionListTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", 0, x, y, width, height);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[CompletionListTableViewController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    MaxY = CGRectGetMaxY(v23);
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    v20 = MaxY - CGRectGetMinY(v24);
    v8 = 0.0;
    if (v20 >= 0.0)
    {
      -[CompletionListTableViewController tableView](self, "tableView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v22 = CGRectGetMaxY(v25);
      v26.origin.x = v11;
      v26.origin.y = v13;
      v26.size.width = v15;
      v26.size.height = v17;
      v8 = v22 - CGRectGetMinY(v26);

    }
  }
  if (v8 != self->_keyboardBottomInset)
  {
    self->_keyboardBottomInset = v8;
    -[CompletionListTableViewController _updateTableViewContentInset](self, "_updateTableViewContentInset");
  }
}

- (void)_updateTableViewContentInset
{
  double v3;
  double keyboardBottomInset;
  double v5;
  double v6;
  double v7;
  id v8;

  -[CompletionListTableViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CompletionListTableViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
  {
    v3 = *MEMORY[0x1E0D4F1A0];
    keyboardBottomInset = self->_keyboardBottomInset;
    v5 = fmax(*MEMORY[0x1E0D4F1A0], keyboardBottomInset);
  }
  else
  {
    objc_msgSend(v8, "safeAreaInsets");
    v3 = 0.0;
    keyboardBottomInset = fmax(self->_keyboardBottomInset - v6, 0.0);
    v5 = keyboardBottomInset;
  }
  objc_msgSend((id)objc_opt_class(), "bottomContentPadding");
  objc_msgSend(v8, "setContentInset:", 0.0, 0.0, keyboardBottomInset + v7, 0.0);
  objc_msgSend(v8, "setVerticalScrollIndicatorInsets:", v3, 0.0, v5, 0.0);

}

- (UIView)webSearchTipView
{
  return self->_webSearchTipView;
}

- (BOOL)showsWebSearchTipIfExists
{
  return self->_showsWebSearchTipIfExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSearchTipView, 0);
  objc_storeStrong((id *)&self->_headerBackdropCaptureView, 0);
}

@end
