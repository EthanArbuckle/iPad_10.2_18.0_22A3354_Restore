@implementation SFStartPageSectionHeader

id __97__SFStartPageSectionHeader_configureUsingSection_visualStyleProvider_resolvingActionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "makeUIAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SFStartPageSectionHeader)initWithFrame:(CGRect)a3
{
  SFStartPageSectionHeader *v3;
  SFStartPageSectionHeaderTitleView *v4;
  SFStartPageSectionHeaderTitleView *titleView;
  UIStackView *v6;
  UIStackView *buttonStackView;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSLayoutConstraint *titleBottomConstraint;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *stackLeadingConstraint;
  void *v18;
  void *v19;
  uint64_t v20;
  NSLayoutConstraint *stackCenterXConstraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  SFStartPageSectionHeader *v35;
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
  objc_super v51;
  _QWORD v52[2];
  _QWORD v53[11];

  v53[9] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)SFStartPageSectionHeader;
  v3 = -[SFStartPageSectionHeader initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SFStartPageSectionHeaderTitleView);
    titleView = v3->_titleView;
    v3->_titleView = v4;

    -[SFStartPageSectionHeaderTitleView setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFStartPageSectionHeader addSubview:](v3, "addSubview:", v3->_titleView);
    v6 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    buttonStackView = v3->_buttonStackView;
    v3->_buttonStackView = v6;

    -[UIStackView setSpacing:](v3->_buttonStackView, "setSpacing:", 1.17549435e-38);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_buttonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFStartPageSectionHeader addSubview:](v3, "addSubview:", v3->_buttonStackView);
    -[SFStartPageSectionHeader updateViewsDependingOnCustomTraits](v3, "updateViewsDependingOnCustomTraits");
    -[SFStartPageSectionHeaderTitleView bottomAnchor](v3->_titleView, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader bottomAnchor](v3, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -10.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1144750080;
    objc_msgSend(v10, "sf_withPriority:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    titleBottomConstraint = v3->_titleBottomConstraint;
    v3->_titleBottomConstraint = (NSLayoutConstraint *)v12;

    -[UIStackView leadingAnchor](v3->_buttonStackView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeaderTitleView trailingAnchor](v3->_titleView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v15, 1.0);
    v16 = objc_claimAutoreleasedReturnValue();
    stackLeadingConstraint = v3->_stackLeadingConstraint;
    v3->_stackLeadingConstraint = (NSLayoutConstraint *)v16;

    -[UIStackView centerXAnchor](v3->_buttonStackView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader centerXAnchor](v3, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    stackCenterXConstraint = v3->_stackCenterXConstraint;
    v3->_stackCenterXConstraint = (NSLayoutConstraint *)v20;

    v41 = (void *)MEMORY[0x1E0CB3718];
    -[SFStartPageSectionHeaderTitleView leadingAnchor](v3->_titleView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader leadingAnchor](v3, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v48;
    -[SFStartPageSectionHeaderTitleView trailingAnchor](v3->_titleView, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader trailingAnchor](v3, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v45;
    -[SFStartPageSectionHeaderTitleView topAnchor](v3->_titleView, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader topAnchor](v3, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v42;
    v53[3] = v3->_titleBottomConstraint;
    v53[4] = v3->_stackLeadingConstraint;
    -[UIStackView trailingAnchor](v3->_buttonStackView, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader trailingAnchor](v3, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v38;
    -[UIStackView centerYAnchor](v3->_buttonStackView, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeaderTitleView centerYAnchor](v3->_titleView, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v23;
    -[UIStackView heightAnchor](v3->_buttonStackView, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToConstant:", 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1131413504;
    objc_msgSend(v25, "sf_withPriority:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v27;
    -[UIStackView widthAnchor](v3->_buttonStackView, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1131413504;
    objc_msgSend(v29, "sf_withPriority:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v53[8] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v32);

    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)-[SFStartPageSectionHeader registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v33, v3, sel_updateViewsDependingOnCustomTraits);

    v35 = v3;
  }

  return v3;
}

- (void)updateViewsDependingOnCustomTraits
{
  void *v3;
  id v4;

  -[SFStartPageSectionHeader traitCollection](self, "traitCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIStackView setOverrideUserInterfaceStyle:](self->_buttonStackView, "setOverrideUserInterfaceStyle:", objc_msgSend(v4, "sf_alternateUserInterfaceStyle"));
  objc_msgSend(v4, "sf_alternateTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView setTintColor:](self->_buttonStackView, "setTintColor:", v3);

  -[UIVisualEffectView setOverrideUserInterfaceStyle:](self->_separatorView, "setOverrideUserInterfaceStyle:", objc_msgSend(v4, "sf_alternateUserInterfaceStyle"));
}

- (void)setBottomGap:(double)a3
{
  double v4;
  double v5;

  v4 = -a3;
  -[NSLayoutConstraint constant](self->_titleBottomConstraint, "constant");
  if (v5 != v4)
  {
    -[NSLayoutConstraint setConstant:](self->_titleBottomConstraint, "setConstant:", v4);
    -[NSLayoutConstraint setConstant:](self->_bannerViewBottomConstraint, "setConstant:", v4);
  }
}

- (void)configureUsingSection:(id)a3 visualStyleProvider:(id)a4 resolvingActionsUsingBlock:(id)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *stackLeadingConstraint;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v29 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v29, "showsTopSeparator");
  if (v10)
    -[SFStartPageSectionHeader _createSeparatorViewIfNeeded](self, "_createSeparatorViewIfNeeded");
  -[UIVisualEffectView setHidden:](self->_separatorView, "setHidden:", v10 ^ 1u, v29);
  -[SFStartPageSectionHeaderTitleView configureUsingSection:visualStyleProvider:](self->_titleView, "configureUsingSection:visualStyleProvider:", v30, v9);

  objc_msgSend(v30, "actions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __97__SFStartPageSectionHeader_configureUsingSection_visualStyleProvider_resolvingActionsUsingBlock___block_invoke;
  v31[3] = &unk_1E21E51A8;
  v12 = v8;
  v32 = v12;
  objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {

    v15 = objc_msgSend(v30, "expandsModally");
    v16 = 0;
    v17 = 2;
  }
  else
  {
    v18 = objc_msgSend(v13, "count");

    v15 = objc_msgSend(v30, "expandsModally");
    v16 = v18 != 0;
    if (v18)
      v17 = 3;
    else
      v17 = 2;
  }
  -[SFStartPageSectionHeader setActions:expandsModally:withSize:](self, "setActions:expandsModally:withSize:", v13, v15, v17);
  -[NSLayoutConstraint setActive:](self->_stackCenterXConstraint, "setActive:", v16);
  -[SFStartPageSectionHeader _disclosureButtonForLayout](self, "_disclosureButtonForLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chevron");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    -[UIStackView leadingAnchor](self->_buttonStackView, "leadingAnchor");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  -[NSLayoutConstraint setActive:](self->_stackLeadingConstraint, "setActive:", 0);
  -[SFStartPageSectionHeaderTitleView trailingAnchor](self->_titleView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v25, 1.0);
  v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackLeadingConstraint = self->_stackLeadingConstraint;
  self->_stackLeadingConstraint = v26;

  -[NSLayoutConstraint setActive:](self->_stackLeadingConstraint, "setActive:", v16 ^ 1);
  objc_msgSend(v30, "banner");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageSectionHeader setBanner:](self, "setBanner:", v28);

}

- (id)_disclosureButtonForLayout
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[UIStackView arrangedSubviews](self->_buttonStackView, "arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setBanner:(id)a3
{
  id v5;
  SFBannerCell *bannerView;
  SFBannerCell *v7;
  SFBannerCell *v8;
  double v9;
  double v10;
  SFBannerCell *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *bannerViewBottomConstraint;
  NSLayoutConstraint *v16;
  SFBannerCell *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SFBannerCell *v25;
  NSLayoutConstraint *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SFBannerCell *v32;
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
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_banner, a3);
    bannerView = self->_bannerView;
    if (v5)
    {
      if (!bannerView)
      {
        v7 = -[SFBannerCell initWithStyle:]([SFBannerCell alloc], "initWithStyle:", 0);
        v8 = self->_bannerView;
        self->_bannerView = v7;

        -[SFBannerCell setTranslatesAutoresizingMaskIntoConstraints:](self->_bannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        LODWORD(v9) = 1148846080;
        -[SFBannerCell setContentHuggingPriority:forAxis:](self->_bannerView, "setContentHuggingPriority:forAxis:", 1, v9);
        LODWORD(v10) = 1148846080;
        -[SFBannerCell setContentCompressionResistancePriority:forAxis:](self->_bannerView, "setContentCompressionResistancePriority:forAxis:", 1, v10);
        -[SFStartPageSectionHeader addSubview:](self, "addSubview:", self->_bannerView);
        -[SFBannerCell contentView](self->_bannerView, "contentView");
        v11 = (SFBannerCell *)objc_claimAutoreleasedReturnValue();
        -[SFBannerCell setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[SFBannerCell bottomAnchor](self->_bannerView, "bottomAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageSectionHeader bottomAnchor](self, "bottomAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -10.0);
        v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        bannerViewBottomConstraint = self->_bannerViewBottomConstraint;
        self->_bannerViewBottomConstraint = v14;

        v35 = (void *)MEMORY[0x1E0CB3718];
        -[SFBannerCell topAnchor](self->_bannerView, "topAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageSectionHeaderTitleView bottomAnchor](self->_titleView, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v41;
        -[SFBannerCell leadingAnchor](self->_bannerView, "leadingAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageSectionHeader leadingAnchor](self, "leadingAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintEqualToAnchor:", v39);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v38;
        -[SFBannerCell trailingAnchor](self->_bannerView, "trailingAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFStartPageSectionHeader trailingAnchor](self, "trailingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "constraintEqualToAnchor:", v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self->_bannerViewBottomConstraint;
        v44[2] = v34;
        v44[3] = v16;
        -[SFBannerCell leadingAnchor](v11, "leadingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBannerCell leadingAnchor](self->_bannerView, "leadingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintEqualToAnchor:", v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v44[4] = v30;
        -[SFBannerCell trailingAnchor](v11, "trailingAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBannerCell trailingAnchor](self->_bannerView, "trailingAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:", v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v44[5] = v27;
        v17 = v11;
        v32 = v11;
        -[SFBannerCell topAnchor](v11, "topAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBannerCell topAnchor](self->_bannerView, "topAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[6] = v20;
        -[SFBannerCell bottomAnchor](v17, "bottomAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBannerCell bottomAnchor](self->_bannerView, "bottomAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44[7] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "activateConstraints:", v24);

        v25 = v32;
LABEL_7:

      }
    }
    else if (bannerView)
    {
      v26 = self->_bannerViewBottomConstraint;
      self->_bannerViewBottomConstraint = 0;

      -[SFBannerCell removeFromSuperview](self->_bannerView, "removeFromSuperview");
      v25 = self->_bannerView;
      self->_bannerView = 0;
      goto LABEL_7;
    }
    -[SFBannerCell configureUsingBanner:](self->_bannerView, "configureUsingBanner:", v5);
  }

}

- (void)setActions:(id)a3 expandsModally:(BOOL)a4 withSize:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *actions;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v24[7];
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_actions, "isEqualToArray:", v7))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[UIStackView arrangedSubviews](self->_buttonStackView, "arrangedSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12++), "removeFromSuperview");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    v13 = (NSArray *)objc_msgSend(v7, "copy");
    actions = self->_actions;
    self->_actions = v13;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      v19 = MEMORY[0x1E0C809B0];
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
          v24[0] = v19;
          v24[1] = 3221225472;
          v24[2] = __63__SFStartPageSectionHeader_setActions_expandsModally_withSize___block_invoke;
          v24[3] = &unk_1E21E5210;
          v25 = a4;
          v24[5] = self;
          v24[6] = a5;
          v24[4] = v21;
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24, v22);
          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v17);
    }

    v7 = v22;
  }

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SectionHeader");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)SFStartPageSectionHeader;
  -[SFStartPageSectionHeader layoutSubviews](&v10, sel_layoutSubviews);
  -[SFStartPageSectionHeader _disclosureButtonForLayout](self, "_disclosureButtonForLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "layoutIfNeeded");
    objc_msgSend(v4, "sizeIncludingLabels");
    v6 = v5;
    v8 = v7;
    -[SFStartPageSectionHeaderTitleView frame](self->_titleView, "frame");
    v9 = v6 + CGRectGetWidth(v11) + v8 * 0.3;
    -[SFStartPageSectionHeader bounds](self, "bounds");
    objc_msgSend(v4, "setLabelHidden:", (v9 >= CGRectGetWidth(v12)) & ~-[NSLayoutConstraint isActive](self->_stackCenterXConstraint, "isActive"));
  }

}

- (SFStartPageSectionHeader)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageSectionHeader;
  return -[SFStartPageSectionHeader initWithCoder:](&v4, sel_initWithCoder_, a3);
}

void __63__SFStartPageSectionHeader_setActions_expandsModally_withSize___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL8 v4;
  SFSectionDisclosureButton *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  SFSectionDisclosureButton *v15;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", *MEMORY[0x1E0D8AE38]);

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "state") == 1;
    v5 = [SFSectionDisclosureButton alloc];
    v15 = -[SFSectionDisclosureButton initWithFrame:expanded:modally:](v5, "initWithFrame:expanded:modally:", v4, *(unsigned __int8 *)(a1 + 56), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SFSectionDisclosureButton addAction:forControlEvents:](v15, "addAction:forControlEvents:", *(_QWORD *)(a1 + 32), 0x2000);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 48);
    if (v8 == 3)
    {
      objc_msgSend(v6, "setImagePadding:", 3.0);
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreferredSymbolConfigurationForImage:", v9);

      v8 = *(_QWORD *)(a1 + 48);
    }
    objc_msgSend(v7, "setButtonSize:", v8);
    objc_msgSend(v7, "setImagePlacement:", 8);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "background");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(v7, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 0.0);

    objc_msgSend(v7, "setTitleTextAttributesTransformer:", &__block_literal_global_30);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v7, *(_QWORD *)(a1 + 32));
    v15 = (SFSectionDisclosureButton *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "accessibilityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSectionDisclosureButton setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v13);

  LODWORD(v14) = 1148846080;
  -[SFSectionDisclosureButton setContentCompressionResistancePriority:forAxis:](v15, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 512), "addArrangedSubview:", v15);

}

id __63__SFStartPageSectionHeader_setActions_expandsModally_withSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (UIAccessibilityButtonShapesEnabled())
  {
    v6 = *MEMORY[0x1E0DC1248];
    v7[0] = &unk_1E22455C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_dictionaryByMergingWithDictionary:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = v2;
  }

  return v4;
}

- (double)bottomGap
{
  double v2;

  -[NSLayoutConstraint constant](self->_titleBottomConstraint, "constant");
  return -v2;
}

- (void)_createSeparatorViewIfNeeded
{
  UIVisualEffectView *v3;
  UIVisualEffectView *separatorView;
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  if (!self->_separatorView)
  {
    v3 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    separatorView = self->_separatorView;
    self->_separatorView = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_separatorView, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectForBlurEffect:style:", v8, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_separatorView, "setEffect:", v9);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFStartPageSectionHeader addSubview:](self, "addSubview:", self->_separatorView);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leadingAnchor](self->_separatorView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader leadingAnchor](self, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    -[UIVisualEffectView trailingAnchor](self->_separatorView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader trailingAnchor](self, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    -[UIVisualEffectView topAnchor](self->_separatorView, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageSectionHeader topAnchor](self, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 3.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v15;
    -[UIVisualEffectView heightAnchor](self->_separatorView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v18);

  }
}

- (NSArray)actions
{
  return self->_actions;
}

- (WBSStartPageBanner)banner
{
  return self->_banner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_stackCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_stackLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_bannerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
