@implementation EKUIFocusBannerView

- (EKUIFocusBannerView)initWithFrame:(CGRect)a3
{
  EKUIFocusBannerView *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *focusFilterStateDescriptionLabel;
  uint64_t v8;
  UIButton *focusFilterToggleButton;
  void *v10;
  uint64_t v11;
  UIView *v12;
  UIView *topKeylineView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *topKeylineHeightConstraint;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)EKUIFocusBannerView;
  v3 = -[EKUIFocusBannerView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3998]), "initWithDelegate:", v3);
    -[EKUIFocusBannerView addInteraction:](v3, "addInteraction:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView setTintColor:](v3, "setTintColor:", v5);

    -[EKUIFocusBannerView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    focusFilterStateDescriptionLabel = v3->_focusFilterStateDescriptionLabel;
    v3->_focusFilterStateDescriptionLabel = v6;

    -[UILabel setTextAlignment:](v3->_focusFilterStateDescriptionLabel, "setTextAlignment:", 4);
    -[EKUIFocusBannerView addSubview:](v3, "addSubview:", v3->_focusFilterStateDescriptionLabel);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    focusFilterToggleButton = v3->_focusFilterToggleButton;
    v3->_focusFilterToggleButton = (UIButton *)v8;

    -[EKUIFocusBannerView _focusFilterButtonConfiguration](v3, "_focusFilterButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setConfiguration:](v3->_focusFilterToggleButton, "setConfiguration:", v10);

    objc_initWeak(&location, v3);
    v11 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __37__EKUIFocusBannerView_initWithFrame___block_invoke;
    v34[3] = &unk_1E601AB48;
    objc_copyWeak(&v35, &location);
    -[UIButton setConfigurationUpdateHandler:](v3->_focusFilterToggleButton, "setConfigurationUpdateHandler:", v34);
    -[UIButton addTarget:action:forControlEvents:](v3->_focusFilterToggleButton, "addTarget:action:forControlEvents:", v3, sel__tapped, 0x2000);
    -[EKUIFocusBannerView addSubview:](v3, "addSubview:", v3->_focusFilterToggleButton);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topKeylineView = v3->_topKeylineView;
    v3->_topKeylineView = v12;

    -[UIView setHidden:](v3->_topKeylineView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_topKeylineView, "setBackgroundColor:", v14);

    -[EKUIFocusBannerView addSubview:](v3, "addSubview:", v3->_topKeylineView);
    -[EKUIFocusBannerView _updateView](v3, "_updateView");
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_focusFilterStateDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_focusFilterToggleButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_topKeylineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_focusFilterStateDescriptionLabel, "setContentHuggingPriority:forAxis:", 0, v15);
    LODWORD(v16) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_focusFilterStateDescriptionLabel, "setContentHuggingPriority:forAxis:", 1, v16);
    LODWORD(v17) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_focusFilterStateDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_focusFilterStateDescriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    LODWORD(v19) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v19);
    LODWORD(v20) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v3->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v3->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 0, v21);
    LODWORD(v22) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v3->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 1, v22);
    -[UIView heightAnchor](v3->_topKeylineView, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 1.0);
    v24 = objc_claimAutoreleasedReturnValue();
    topKeylineHeightConstraint = v3->_topKeylineHeightConstraint;
    v3->_topKeylineHeightConstraint = (NSLayoutConstraint *)v24;

    v26 = (void *)MEMORY[0x1E0CB3718];
    v39[0] = v3->_topKeylineHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v27);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __37__EKUIFocusBannerView_initWithFrame___block_invoke_2;
    v32[3] = &unk_1E6018610;
    objc_copyWeak(&v33, &location);
    v30 = (id)-[EKUIFocusBannerView registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v29, v32);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__EKUIFocusBannerView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_focusFilterButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConfiguration:", v5);

  }
}

void __37__EKUIFocusBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)updateConstraints
{
  NSArray *v3;
  NSArray *activeConstraints;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIFocusBannerView;
  -[EKUIFocusBannerView updateConstraints](&v5, sel_updateConstraints);
  if (-[EKUIFocusBannerView _effectiveLayout](self, "_effectiveLayout") == 2)
    -[EKUIFocusBannerView _verticalLayoutConstraints](self, "_verticalLayoutConstraints");
  else
    -[EKUIFocusBannerView _horizontalLayoutConstraints](self, "_horizontalLayoutConstraints");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  activeConstraints = self->_activeConstraints;
  if (activeConstraints != v3)
  {
    if (activeConstraints)
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
    objc_storeStrong((id *)&self->_activeConstraints, v3);
  }
  -[EKUIFocusBannerView _updateKeylineHeightConstraints](self, "_updateKeylineHeightConstraints");

}

- (id)_horizontalLayoutConstraints
{
  NSArray *horizontalLayoutConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
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
  _QWORD v39[12];

  v39[10] = *MEMORY[0x1E0C80C00];
  horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  if (!horizontalLayoutConstraints)
  {
    -[UILabel leadingAnchor](self->_focusFilterStateDescriptionLabel, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    -[UILabel trailingAnchor](self->_focusFilterStateDescriptionLabel, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:constant:", v33, -36.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v32;
    -[UILabel centerYAnchor](self->_focusFilterStateDescriptionLabel, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView centerYAnchor](self, "centerYAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v29;
    -[UILabel heightAnchor](self->_focusFilterStateDescriptionLabel, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView heightAnchor](self, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v26;
    -[UIButton trailingAnchor](self->_focusFilterToggleButton, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v22;
    -[UIButton topAnchor](self->_focusFilterToggleButton, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView topAnchor](self, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 11.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v19;
    -[EKUIFocusBannerView bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](self->_focusFilterToggleButton, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 11.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v16;
    -[UIView leadingAnchor](self->_topKeylineView, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView leadingAnchor](self, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39[7] = v6;
    -[EKUIFocusBannerView trailingAnchor](self, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_topKeylineView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39[8] = v9;
    -[UIView topAnchor](self->_topKeylineView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[9] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 10);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_horizontalLayoutConstraints;
    self->_horizontalLayoutConstraints = v13;

    horizontalLayoutConstraints = self->_horizontalLayoutConstraints;
  }
  return horizontalLayoutConstraints;
}

- (id)_verticalLayoutConstraints
{
  NSArray *verticalLayoutConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
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
  _QWORD v37[11];

  v37[9] = *MEMORY[0x1E0C80C00];
  verticalLayoutConstraints = self->_verticalLayoutConstraints;
  if (!verticalLayoutConstraints)
  {
    -[UILabel leadingAnchor](self->_focusFilterStateDescriptionLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v33;
    -[UILabel trailingAnchor](self->_focusFilterStateDescriptionLabel, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    -[UILabel topAnchor](self->_focusFilterStateDescriptionLabel, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView topAnchor](self, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 11.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v26;
    -[UIButton leadingAnchor](self->_focusFilterToggleButton, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView layoutMarginsGuide](self, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v22;
    -[UIButton topAnchor](self->_focusFilterToggleButton, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_focusFilterStateDescriptionLabel, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 8.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v19;
    -[EKUIFocusBannerView bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton bottomAnchor](self->_focusFilterToggleButton, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 11.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v16;
    -[UIView leadingAnchor](self->_topKeylineView, "leadingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView leadingAnchor](self, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v6;
    -[EKUIFocusBannerView trailingAnchor](self, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_topKeylineView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[7] = v9;
    -[UIView topAnchor](self->_topKeylineView, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIFocusBannerView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[8] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 9);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_verticalLayoutConstraints;
    self->_verticalLayoutConstraints = v13;

    verticalLayoutConstraints = self->_verticalLayoutConstraints;
  }
  return verticalLayoutConstraints;
}

- (unint64_t)_effectiveLayout
{
  unint64_t result;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;

  result = -[EKUIFocusBannerView layout](self, "layout");
  if (!result)
  {
    -[EKUIFocusBannerView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    if (IsAccessibilityCategory)
      return 2;
    else
      return 1;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIButton *focusFilterToggleButton;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  width = a3.width;
  v5 = -[EKUIFocusBannerView _effectiveLayout](self, "_effectiveLayout", a3.width, a3.height);
  -[EKUIFocusBannerView directionalLayoutMargins](self, "directionalLayoutMargins");
  v8 = v6;
  v9 = v7;
  if (width - v6 - v7 >= 0.0)
    v10 = width - v6 - v7;
  else
    v10 = 0.0;
  focusFilterToggleButton = self->_focusFilterToggleButton;
  if (v5 == 1)
  {
    v12 = *(double *)(MEMORY[0x1E0DC5000] + 8);
    -[UIButton sizeThatFits:](focusFilterToggleButton, "sizeThatFits:", v10, v12);
    v14 = v13;
    v16 = v15;
    -[UILabel sizeThatFits:](self->_focusFilterStateDescriptionLabel, "sizeThatFits:", v10 - (v13 + 36.0), v12);
    v19 = v14 + v8 + v18 + 36.0;
    if (v16 >= v17)
      v17 = v16;
    v20 = v17 + 11.0;
  }
  else
  {
    v21 = *(double *)(MEMORY[0x1E0DC5000] + 8);
    -[UIButton sizeThatFits:](focusFilterToggleButton, "sizeThatFits:", *MEMORY[0x1E0DC5000], v21);
    v23 = v22;
    v25 = v24;
    -[UILabel sizeThatFits:](self->_focusFilterStateDescriptionLabel, "sizeThatFits:", v10, v21);
    if (v23 >= v26)
      v26 = v23;
    v19 = v8 + v26;
    v20 = v25 + v27 + 11.0 + 8.0;
  }
  v28 = v9 + v19;
  v29 = v20 + 11.0;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)_tapped
{
  void *v3;
  char v4;
  id v5;

  -[EKUIFocusBannerView setOn:](self, "setOn:", -[EKUIFocusBannerView on](self, "on") ^ 1);
  -[EKUIFocusBannerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKUIFocusBannerView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusBannerViewToggled:", self);

  }
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[EKUIFocusBannerView _updateView](self, "_updateView");
  }
}

- (void)setShowDividers:(BOOL)a3
{
  if (self->_showDividers != a3)
  {
    self->_showDividers = a3;
    -[UIView setHidden:](self->_topKeylineView, "setHidden:", !a3);
  }
}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[EKUIFocusBannerView _updateView](self, "_updateView");
  }
}

- (void)setDisallowAccessibilityTextSizes:(BOOL)a3
{
  if (self->_disallowAccessibilityTextSizes != a3)
  {
    self->_disallowAccessibilityTextSizes = a3;
    -[EKUIFocusBannerView _updateView](self, "_updateView");
  }
}

- (void)_updateView
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v3 = -[EKUIFocusBannerView on](self, "on");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v4;
  if (v3)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Filtered by Focus"), &stru_1E601DFA8, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Focus Filter Off"), &stru_1E601DFA8, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC12B0];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("moon.circle.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textAttachmentWithImage:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v27);
  v9 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v9;
  v10 = -[EKUIFocusBannerView disallowAccessibilityTextSizes](self, "disallowAccessibilityTextSizes");
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 0x8000, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC1140];
  v29[0] = *MEMORY[0x1E0DC1138];
  v29[1] = v13;
  v30[0] = v12;
  v30[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (CalInterfaceIsLeftToRight())
    v16 = CFSTR("%1$@ %2$@");
  else
    v16 = CFSTR("%2$@ %1$@");
  v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
  objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v17, v9, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "addAttributes:range:", v14, 0, objc_msgSend(v19, "length"));
  -[EKUIFocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAttributedText:", v19);

  v21 = -[EKUIFocusBannerView layout](self, "layout") == 1;
  -[EKUIFocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel");
  v22 = (void *)v5;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", v21);

  -[EKUIFocusBannerView focusFilterToggleButton](self, "focusFilterToggleButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNeedsUpdateConfiguration");

  -[EKUIFocusBannerView focusFilterToggleButton](self, "focusFilterToggleButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "updateConfiguration");

}

- (id)_focusFilterButtonConfiguration
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  void *v17;
  int v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = -[EKUIFocusBannerView on](self, "on");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Turn Off");
  else
    v6 = CFSTR("Turn On");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[EKUIFocusBannerView disallowAccessibilityTextSizes](self, "disallowAccessibilityTextSizes");
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 32770, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0DC1140];
  v27[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  -[EKUIFocusBannerView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (IsAccessibilityCategory && -[EKUIFocusBannerView _effectiveLayout](self, "_effectiveLayout") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }
  objc_msgSend(v17, "setAttributedTitle:", v13);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __54__EKUIFocusBannerView__focusFilterButtonConfiguration__block_invoke;
  v24 = &unk_1E601C2E8;
  v25 = v10;
  v19 = v10;
  objc_msgSend(v17, "setTitleTextAttributesTransformer:", &v21);
  objc_msgSend(v17, "setTitleAlignment:", 1, v21, v22, v23, v24);
  objc_msgSend(v17, "setTitleLineBreakMode:", 2);
  if (v18)
  {
    objc_msgSend(v17, "setButtonSize:", 0);
    objc_msgSend(v17, "setCornerStyle:", 4);
  }
  else
  {
    objc_msgSend(v17, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  }

  return v17;
}

id __54__EKUIFocusBannerView__focusFilterButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DC1138]);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_updateKeylineHeightConstraints
{
  void *v3;
  double v4;
  double v5;

  -[EKUIFocusBannerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[NSLayoutConstraint setConstant:](self->_topKeylineHeightConstraint, "setConstant:", 1.0 / v5);
}

- (BOOL)showsLargeContentViewer
{
  return self->_disallowAccessibilityTextSizes;
}

- (id)largeContentTitle
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EKUIFocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIFocusBannerView focusFilterToggleButton](self, "focusFilterToggleButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)largeContentImage
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("moon.circle.fill"));
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  if (a4 == self)
    objc_msgSend(a4, "_tapped", a3, a5.x, a5.y);
}

- (BOOL)on
{
  return self->_on;
}

- (BOOL)showDividers
{
  return self->_showDividers;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (BOOL)disallowAccessibilityTextSizes
{
  return self->_disallowAccessibilityTextSizes;
}

- (EKUIFocusBannerViewDelegate)delegate
{
  return (EKUIFocusBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, a3);
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, a3);
}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
  objc_storeStrong((id *)&self->_topKeylineView, a3);
}

- (NSLayoutConstraint)topKeylineHeightConstraint
{
  return self->_topKeylineHeightConstraint;
}

- (void)setTopKeylineHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topKeylineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topKeylineView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
}

@end
