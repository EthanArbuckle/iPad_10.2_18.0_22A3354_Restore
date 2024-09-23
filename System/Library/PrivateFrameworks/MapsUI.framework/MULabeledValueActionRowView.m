@implementation MULabeledValueActionRowView

- (MULabeledValueActionRowView)initWithFrame:(CGRect)a3
{
  MULabeledValueActionRowView *v3;
  MULabeledValueActionRowView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MULabeledValueActionRowView;
  v3 = -[MUPlaceSectionRowView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MULabeledValueActionRowView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("LabeledValueActionRow"));
    -[MULabeledValueActionRowView _setupSubviews](v4, "_setupSubviews");
  }
  return v4;
}

- (id)initForDeveloperPlaceCard
{
  id result;

  result = -[MULabeledValueActionRowView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (result)
    *((_BYTE *)result + 528) = 1;
  return result;
}

- (void)_setupSubviews
{
  UILayoutGuide *v3;
  UILayoutGuide *titleValueLayoutGuide;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MULabelViewProtocol *titleLabel;
  void *v10;
  MULabelViewProtocol *v11;
  MULabelViewProtocol *valueLabel;
  void *v13;
  void *v14;
  MULabelViewProtocol *v15;
  MULabelViewProtocol *tertiaryLabel;
  void *v17;
  void *v18;
  void *v19;
  MUCirclePlatterView *v20;
  MUCirclePlatterView *actionPlatterView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UITapGestureRecognizer *v26;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v28;

  v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  titleValueLayoutGuide = self->_titleValueLayoutGuide;
  self->_titleValueLayoutGuide = v3;

  -[MULabeledValueActionRowView addLayoutGuide:](self, "addLayoutGuide:", self->_titleValueLayoutGuide);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionHeaderFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);

  +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  titleLabel = self->_titleLabel;
  self->_titleLabel = (MULabelViewProtocol *)v5;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(CFSTR("LabeledValueActionRow"), "stringByAppendingString:", CFSTR("Title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", v10);

  if (MUIdiomInTraitEnvironment(self) == 5)
    objc_msgSend(MEMORY[0x1E0DC3E50], "_mapsui_defaultTextView");
  else
    +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v11 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  valueLabel = self->_valueLabel;
  self->_valueLabel = v11;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabeledValueActionRowView _valueLabelFont](self, "_valueLabelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_valueLabel, "setFont:", v13);

  -[MULabelViewProtocol setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", 0);
  objc_msgSend(CFSTR("LabeledValueActionRow"), "stringByAppendingString:", CFSTR("Value"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_valueLabel, "setAccessibilityIdentifier:", v14);

  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v15 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v15;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_tertiaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_tertiaryLabel, "setFont:", v17);

  -[MULabelViewProtocol setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", 4);
  +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setTextColor:](self->_tertiaryLabel, "setTextColor:", v18);

  objc_msgSend(CFSTR("LabeledValueActionRow"), "stringByAppendingString:", CFSTR("TertiaryLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", v19);

  +[MUCirclePlatterView defaultPlatterView](MUCirclePlatterView, "defaultPlatterView");
  v20 = (MUCirclePlatterView *)objc_claimAutoreleasedReturnValue();
  actionPlatterView = self->_actionPlatterView;
  self->_actionPlatterView = v20;

  -[MUCirclePlatterView setTranslatesAutoresizingMaskIntoConstraints:](self->_actionPlatterView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyphColor:](self->_actionPlatterView, "setGlyphColor:", v22);

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionHeaderFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyphFont:](self->_actionPlatterView, "setGlyphFont:", v24);

  objc_msgSend(CFSTR("LabeledValueActionRow"), "stringByAppendingString:", CFSTR("Action"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setAccessibilityIdentifier:](self->_actionPlatterView, "setAccessibilityIdentifier:", v25);

  v26 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v26;

  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__actionButtonTapped);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__actionButtonTapped);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateValueText);
}

- (void)_actionButtonTapped
{
  void *v3;
  void (**v4)(id, MULabeledValueActionRowView *);

  -[MULabeledValueActionViewModelProviding actionBlock](self->_viewModel, "actionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MULabeledValueActionViewModelProviding actionBlock](self->_viewModel, "actionBlock");
    v4 = (void (**)(id, MULabeledValueActionRowView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)setViewModel:(id)a3
{
  MULabeledValueActionViewModelProviding *v5;
  MULabeledValueActionViewModelProviding *v6;

  v5 = (MULabeledValueActionViewModelProviding *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MULabeledValueActionRowView _updateAppearance](self, "_updateAppearance");
    v5 = v6;
  }

}

- (void)_updateAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSLayoutConstraint *actionPlatterWidthConstraint;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MUCirclePlatterView *actionPlatterView;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  objc_class *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  _QWORD v102[6];
  _QWORD v103[4];
  _QWORD v104[11];

  v104[9] = *MEMORY[0x1E0C80C00];
  -[MULabeledValueActionViewModelProviding titleString](self->_viewModel, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return;
  -[MULabeledValueActionViewModelProviding valueString](self->_viewModel, "valueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return;
  -[MULabelViewProtocol removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  -[MULabelViewProtocol removeFromSuperview](self->_valueLabel, "removeFromSuperview");
  -[MUCirclePlatterView removeFromSuperview](self->_actionPlatterView, "removeFromSuperview");
  actionPlatterWidthConstraint = self->_actionPlatterWidthConstraint;
  self->_actionPlatterWidthConstraint = 0;

  -[MULabeledValueActionViewModelProviding titleString](self->_viewModel, "titleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[MULabeledValueActionViewModelProviding titleString](self->_viewModel, "titleString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setText:](self->_titleLabel, "setText:", v10);

    -[MULabeledValueActionRowView addSubview:](self, "addSubview:", self->_titleLabel);
  }
  -[MULabeledValueActionViewModelProviding valueString](self->_viewModel, "valueString", 512);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[MULabeledValueActionRowView _valueLabelFont](self, "_valueLabelFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setFont:](self->_valueLabel, "setFont:", v13);

    -[MULabeledValueActionRowView _updateValueText](self, "_updateValueText");
    -[MULabeledValueActionRowView addSubview:](self, "addSubview:", self->_valueLabel);
  }
  -[MULabeledValueActionViewModelProviding symbolName](self->_viewModel, "symbolName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v15 = -[MULabeledValueActionViewModelProviding actionVariant](self->_viewModel, "actionVariant");

    if (!v15)
    {
      actionPlatterView = self->_actionPlatterView;
      -[MULabeledValueActionViewModelProviding symbolName](self->_viewModel, "symbolName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUCirclePlatterView setGlyph:](actionPlatterView, "setGlyph:", v17);

      -[MULabeledValueActionRowView addSubview:](self, "addSubview:", self->_actionPlatterView);
    }
  }
  else
  {

  }
  -[MULabeledValueActionViewModelProviding alternativeTitleString](self->_viewModel, "alternativeTitleString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    -[MULabeledValueActionViewModelProviding alternativeTitleString](self->_viewModel, "alternativeTitleString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setText:](self->_tertiaryLabel, "setText:", v20);

    -[MULabeledValueActionRowView addSubview:](self, "addSubview:", self->_tertiaryLabel);
  }
  -[MULabeledValueActionRowView viewModel](self, "viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "actionVariant");

  if (v22 == 1)
  {
    +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_valueLabel, "setTextColor:", v25);

    v24 = self;
  }
  else
  {
    if (v22)
    {
      v26 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setTextColor:](self->_valueLabel, "setTextColor:", v23);

    v24 = self->_actionPlatterView;
  }
  v26 = v24;
LABEL_19:
  v100 = v26;
  objc_msgSend(v26, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v27 = 8.0;
  if (+[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle") != 1)
  {
    if (self->_isDeveloperPlaceCard)
      v27 = 8.0;
    else
      v27 = 12.0;
  }
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MULabelViewProtocol leadingAnchor](self->_titleLabel, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v91);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v88;
  -[MULabelViewProtocol topAnchor](self->_titleLabel, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v83;
  -[MULabelViewProtocol trailingAnchor](self->_titleLabel, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v80;
  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol topAnchor](self->_valueLabel, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v77;
  -[MULabelViewProtocol leadingAnchor](self->_valueLabel, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v74;
  -[MULabelViewProtocol trailingAnchor](self->_valueLabel, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v104[5] = v71;
  -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionRowView leadingAnchor](self, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v104[6] = v28;
  -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionRowView topAnchor](self, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v104[7] = v31;
  -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionRowView bottomAnchor](self, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, -v27);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v104[8] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "addObjectsFromArray:", v35);

  -[MULabeledValueActionViewModelProviding alternativeTitleString](self->_viewModel, "alternativeTitleString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  -[MULabelViewProtocol bottomAnchor](self->_valueLabel, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[MULabelViewProtocol topAnchor](self->_tertiaryLabel, "topAnchor");
    v92 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v92);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v39;
    -[MULabelViewProtocol leadingAnchor](self->_tertiaryLabel, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_titleValueLayoutGuide, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v95);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v89;
    -[MULabelViewProtocol trailingAnchor](self->_tertiaryLabel, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v42;
    -[MULabelViewProtocol bottomAnchor](self->_tertiaryLabel, "bottomAnchor");
    v43 = v38;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v103[3] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObjectsFromArray:", v47);

    v48 = (void *)v92;
    v38 = v43;

  }
  else
  {
    -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v48);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObject:", v39);
  }

  -[MUCirclePlatterView superview](self->_actionPlatterView, "superview");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[MUCirclePlatterView widthAnchor](self->_actionPlatterView, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionRowView _platterLength](self, "_platterLength");
    objc_msgSend(v50, "constraintEqualToConstant:");
    v51 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v52 = *(Class *)((char *)&self->super.super.super.super.super.isa + v68);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v68) = v51;

    -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCirclePlatterView leadingAnchor](self->_actionPlatterView, "leadingAnchor");
    v87 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v87, -16.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v53;
    -[MUCirclePlatterView topAnchor](self->_actionPlatterView, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_titleValueLayoutGuide, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v96);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v90;
    -[MUCirclePlatterView bottomAnchor](self->_actionPlatterView, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_titleValueLayoutGuide, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:", v97);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v68);
    v102[2] = v54;
    v102[3] = v55;
    -[MUCirclePlatterView heightAnchor](self->_actionPlatterView, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCirclePlatterView widthAnchor](self->_actionPlatterView, "widthAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v102[4] = v58;
    -[MUCirclePlatterView trailingAnchor](self->_actionPlatterView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionRowView trailingAnchor](self, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, -16.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v102[5] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 6);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v101;
    objc_msgSend(v101, "addObjectsFromArray:", v62);

    v64 = (void *)v87;
    v65 = v93;

  }
  else
  {
    -[UILayoutGuide trailingAnchor](self->_titleValueLayoutGuide, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabeledValueActionRowView trailingAnchor](self, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64, -16.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v101;
    objc_msgSend(v101, "addObject:", v53);
  }

  v66 = (void *)MEMORY[0x1E0CB3718];
  v67 = (void *)objc_msgSend(v63, "copy");
  objc_msgSend(v66, "activateConstraints:", v67);

}

- (double)_platterLength
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionHeaderFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 30.0);
  v5 = v4;

  return v5;
}

- (id)_valueLabelFont
{
  void *v2;
  void *v3;

  if (-[MULabeledValueActionViewModelProviding emphasizeValueString](self->_viewModel, "emphasizeValueString"))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1420]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bodyFont");
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_titleLabel, "setFont:", v4);

  -[MULabeledValueActionRowView _valueLabelFont](self, "_valueLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_valueLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_tertiaryLabel, "setFont:", v6);

  -[MULabeledValueActionRowView _platterLength](self, "_platterLength");
  -[NSLayoutConstraint setConstant:](self->_actionPlatterWidthConstraint, "setConstant:");
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionHeaderFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCirclePlatterView setGlyphFont:](self->_actionPlatterView, "setGlyphFont:", v7);

}

- (void)_updateValueText
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[MULabeledValueActionViewModelProviding valueString](self->_viewModel, "valueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = -[MULabeledValueActionViewModelProviding actionVariant](self->_viewModel, "actionVariant") == 1
      && UIAccessibilityButtonShapesEnabled();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bodyFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1138]);

    if (v5)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E2E55650, *MEMORY[0x1E0DC1248]);
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[MULabeledValueActionViewModelProviding valueString](self->_viewModel, "valueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v11);
    -[MULabelViewProtocol setAttributedText:](self->_valueLabel, "setAttributedText:", v10);

  }
  else
  {
    -[MULabelViewProtocol setAttributedText:](self->_valueLabel, "setAttributedText:", 0);
  }
}

- (void)copy:(id)a3
{
  void *v3;
  id v4;

  -[MULabeledValueActionViewModelProviding valueString](self->_viewModel, "valueString", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setString:", v4);

  }
}

- (MULabeledValueActionViewModelProviding)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionPlatterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionPlatterView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleValueLayoutGuide, 0);
}

@end
