@implementation MUButtonCellRowView

- (MUButtonCellRowView)initWithFrame:(CGRect)a3
{
  MUButtonCellRowView *v3;
  MUButtonCellRowView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUButtonCellRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUButtonCellRowView _setupSubviews](v3, "_setupSubviews");
    -[MUButtonCellRowView _setupConstraints](v4, "_setupConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)_setupSubviews
{
  UILayoutGuide *v3;
  UILayoutGuide *titleValueLayoutGuide;
  UILabel *v5;
  UILabel *titleLabel;
  uint64_t v7;
  void *v8;
  void *v9;
  MUCirclePlatterView *v10;
  MUCirclePlatterView *actionPlatterView;
  void *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *menuButton;
  UITapGestureRecognizer *v17;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  -[MUButtonCellRowView addLayoutGuide:](self, "addLayoutGuide:", self->_titleValueLayoutGuide);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v8);

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v9);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("ButtonCellTitle"));
  -[MUButtonCellRowView addSubview:](self, "addSubview:", self->_titleLabel);
  +[MUCirclePlatterView defaultPlatterView](MUCirclePlatterView, "defaultPlatterView");
  v10 = (MUCirclePlatterView *)objc_claimAutoreleasedReturnValue();
  actionPlatterView = self->_actionPlatterView;
  self->_actionPlatterView = v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setBackgroundColor:](self->_actionPlatterView, "setBackgroundColor:", v12);

  -[MUCirclePlatterView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionPlatterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyphFont:](self->_actionPlatterView, "setGlyphFont:", v13);

  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyphColor:](self->_actionPlatterView, "setGlyphColor:", v14);

  -[MUCirclePlatterView setAccessibilityIdentifier:](self->_actionPlatterView, "setAccessibilityIdentifier:", CFSTR("ButtonCellAction"));
  -[MUButtonCellRowView addSubview:](self, "addSubview:", self->_actionPlatterView);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue();
  menuButton = self->_menuButton;
  self->_menuButton = v15;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_menuButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_menuButton, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setHidden:](self->_menuButton, "setHidden:", 1);
  -[MUButtonCellRowView addSubview:](self, "addSubview:", self->_menuButton);
  -[MKViewWithHairline setLeftHairlineInset:](self, "setLeftHairlineInset:", 56.0);
  v17 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v17;

  -[MUButtonCellRowView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__buttonCellTapped);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__buttonCellTapped);
  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)-[MUButtonCellRowView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v20, sel__updateForPlatterAvailability);

}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *platterWidthConstraint;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *titleGuideToTopConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *titleGuideToBottomConstraint;
  NSLayoutConstraint *v14;
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
  NSLayoutConstraint *v26;
  NSLayoutConstraint *titleGuideToPlatterLeadingConstraint;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *titleGuideToSelfLeadingConstraint;
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
  void *v47;
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
  _QWORD v61[17];

  v61[15] = *MEMORY[0x1E0C80C00];
  -[MUCirclePlatterView widthAnchor](self->_actionPlatterView, "widthAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView _platterLength](self, "_platterLength");
  objc_msgSend(v3, "constraintEqualToConstant:");
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  platterWidthConstraint = self->_platterWidthConstraint;
  self->_platterWidthConstraint = v4;

  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView topAnchor](self, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 16.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleGuideToTopConstraint = self->_titleGuideToTopConstraint;
  self->_titleGuideToTopConstraint = v8;

  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -16.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleGuideToBottomConstraint = self->_titleGuideToBottomConstraint;
  self->_titleGuideToBottomConstraint = v12;

  v47 = (void *)MEMORY[0x1E0CB3718];
  v61[0] = self->_platterWidthConstraint;
  -[MUCirclePlatterView heightAnchor](self->_actionPlatterView, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView widthAnchor](self->_actionPlatterView, "widthAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v58;
  -[MUCirclePlatterView leadingAnchor](self->_actionPlatterView, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView leadingAnchor](self, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 16.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v55;
  -[MUCirclePlatterView centerYAnchor](self->_actionPlatterView, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_titleValueLayoutGuide, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_titleGuideToTopConstraint;
  v61[3] = v52;
  v61[4] = v14;
  v61[5] = self->_titleGuideToBottomConstraint;
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView trailingAnchor](self, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -16.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v61[6] = v49;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v61[7] = v45;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61[8] = v42;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v61[9] = v39;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61[10] = v36;
  -[UIButton leadingAnchor](self->_menuButton, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView leadingAnchor](self, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61[11] = v33;
  -[UIButton topAnchor](self->_menuButton, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61[12] = v16;
  -[UIButton trailingAnchor](self->_menuButton, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61[13] = v19;
  -[UIButton bottomAnchor](self->_menuButton, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView bottomAnchor](self, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[14] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v23);

  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView trailingAnchor](self->_actionPlatterView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 10.0);
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleGuideToPlatterLeadingConstraint = self->_titleGuideToPlatterLeadingConstraint;
  self->_titleGuideToPlatterLeadingConstraint = v26;

  -[NSLayoutConstraint setActive:](self->_titleGuideToPlatterLeadingConstraint, "setActive:", 1);
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUButtonCellRowView leadingAnchor](self, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 16.0);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleGuideToSelfLeadingConstraint = self->_titleGuideToSelfLeadingConstraint;
  self->_titleGuideToSelfLeadingConstraint = v30;

  -[NSLayoutConstraint setActive:](self->_titleGuideToSelfLeadingConstraint, "setActive:", 0);
}

- (double)_platterLength
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
}

- (void)setViewModel:(id)a3
{
  MUDynamicButtonCellModel *v5;
  MUDynamicButtonCellModel *v6;

  v5 = (MUDynamicButtonCellModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[MUDynamicButtonCellModel setChangeDelegate:](self->_viewModel, "setChangeDelegate:", self);
    -[MUButtonCellRowView _setupAccessibilityIdentifier](self, "_setupAccessibilityIdentifier");
    -[MUButtonCellRowView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton **p_menuButton;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  double v19;

  -[MUButtonCellRowView setHidden:](self, "setHidden:", -[MUDynamicButtonCellModel isEnabled](self->_viewModel, "isEnabled") ^ 1);
  -[MUDynamicButtonCellModel titleString](self->_viewModel, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel set_mapsui_text:](self->_titleLabel, "set_mapsui_text:", v3);

  -[MUDynamicButtonCellModel symbolName](self->_viewModel, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyph:](self->_actionPlatterView, "setGlyph:", v4);

  -[MUDynamicButtonCellModel symbolName](self->_viewModel, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;
  v7 = v5 == 0;

  -[MUCirclePlatterView setHidden:](self->_actionPlatterView, "setHidden:", v7);
  -[NSLayoutConstraint setActive:](self->_titleGuideToPlatterLeadingConstraint, "setActive:", v6);
  -[NSLayoutConstraint setActive:](self->_titleGuideToSelfLeadingConstraint, "setActive:", v7);
  v8 = -[MUDynamicButtonCellModel actionStyle](self->_viewModel, "actionStyle");
  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v8)
  {
    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v9);

    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v10;
    -[MUCirclePlatterView setGlyphColor:](self->_actionPlatterView, "setGlyphColor:", v10);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[MUDynamicButtonCellModel menu](self->_viewModel, "menu"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    -[MUDynamicButtonCellModel menu](self->_viewModel, "menu");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    p_menuButton = &self->_menuButton;
    -[UIButton setMenu:](self->_menuButton, "setMenu:", v14);

    v16 = 0;
  }
  else
  {
    p_menuButton = &self->_menuButton;
    v16 = 1;
  }
  -[UIButton setHidden:](*p_menuButton, "setHidden:", v16);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v17 = -[MUDynamicButtonCellModel cellStyle](self->_viewModel, "cellStyle")) == 0)
  {
    v18 = &kMUPlacePlatterPadding;
    goto LABEL_15;
  }
  if (v17 == 1)
  {
    v18 = &kMUPlacePlatterCompactVerticalPadding;
LABEL_15:
    v19 = *(double *)v18;
    -[NSLayoutConstraint setConstant:](self->_titleGuideToTopConstraint, "setConstant:", *(double *)v18);
    -[NSLayoutConstraint setConstant:](self->_titleGuideToBottomConstraint, "setConstant:", -v19);
  }
  -[MUButtonCellRowView _setupAccessibilityIdentifier](self, "_setupAccessibilityIdentifier");
}

- (void)_setupAccessibilityIdentifier
{
  void *v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MUDynamicButtonCellModel accessibilityIdentifierForAction](self->_viewModel, "accessibilityIdentifierForAction");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("ButtonCellType"), "stringByAppendingString:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUButtonCellRowView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v3);

  }
  else
  {
    -[MUButtonCellRowView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("ButtonCellTypeUnknown"));
  }
}

- (void)_buttonCellTapped
{
  void *v3;
  void (**v4)(id, MUButtonCellRowView *);

  -[MUDynamicButtonCellModel actionBlock](self->_viewModel, "actionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUDynamicButtonCellModel actionBlock](self->_viewModel, "actionBlock");
    v4 = (void (**)(id, MUButtonCellRowView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)_contentSizeDidChange
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  -[MUButtonCellRowView _platterLength](self, "_platterLength");
  -[NSLayoutConstraint setConstant:](self->_platterWidthConstraint, "setConstant:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  -[MUPlaceSectionRowView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  -[MUPlaceSectionRowView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MUButtonCellRowView;
  -[MUPlaceSectionRowView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[MUPlaceSectionRowView setSelected:](self, "setSelected:", 0);
}

- (MUDynamicButtonCellModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_titleGuideToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToSelfLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideToPlatterLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionPlatterView, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end
