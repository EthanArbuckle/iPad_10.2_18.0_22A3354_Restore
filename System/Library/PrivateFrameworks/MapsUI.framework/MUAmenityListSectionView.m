@implementation MUAmenityListSectionView

- (MUAmenityListSectionView)initWithAmenityListConfiguration:(id)a3
{
  id v5;
  MUAmenityListSectionView *v6;
  MUAmenityListSectionView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUAmenityListSectionView;
  v6 = -[MUPlaceVerticalCardContainerView initWithShowsSeparators:](&v9, sel_initWithShowsSeparators_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[MUAmenityListSectionView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("AmenityList"));
    -[MUAmenityListSectionView _setupSubviews](v7, "_setupSubviews");
  }

  return v7;
}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  MUAmenityItemView *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  MUAmenityItemView *v19;
  MUAmenityItemView *v20;
  void *v21;
  void *v22;
  UIView *applePayAmenityRowView;
  MUAmenityItemView *v24;
  void *v25;
  int v26;
  MUAmenityItemImageView *v27;
  MUAmenityItemImageView *v28;
  UIView *applePayImageView;
  MUAmenityItemImageView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UIButton *moreButton;
  id v37;
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
  MUAmenityListSectionView *val;
  _QWORD v55[4];
  id v56;
  id location;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  val = self;
  -[MUAmenityListSectionConfiguration viewModels](self->_configuration, "viewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  v6 = 0;
  if (v5)
  {
    v7 = *(_QWORD *)v59;
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v12);
        v14 = -[MUAmenityItemView initWithFrame:]([MUAmenityItemView alloc], "initWithFrame:", v8, v9, v10, v11);
        -[MUAmenityItemView setViewModel:](v14, "setViewModel:", v13);
        objc_msgSend(v3, "addObject:", v14);
        v15 = objc_msgSend(v3, "count");
        if (v15 > -[MUAmenityListSectionConfiguration numberInlineAmenities](val->_configuration, "numberInlineAmenities"))
        {
          -[MUAmenityItemView setHidden:](v14, "setHidden:", 1);
          v6 = 1;
        }

        ++v12;
      }
      while (v5 != v12);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v5);
  }

  -[MUAmenityListSectionConfiguration applePayConfiguration](val->_configuration, "applePayConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applePayRowAmenity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    v19 = [MUAmenityItemView alloc];
    v20 = -[MUAmenityItemView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MUAmenityListSectionConfiguration applePayConfiguration](val->_configuration, "applePayConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "applePayRowAmenity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAmenityItemView setViewModel:](v20, "setViewModel:", v22);

    applePayAmenityRowView = val->_applePayAmenityRowView;
    val->_applePayAmenityRowView = &v20->super.super;
    v24 = v20;

    -[UIView setAccessibilityIdentifier:](val->_applePayAmenityRowView, "setAccessibilityIdentifier:", CFSTR("ApplePayAmenityRow"));
    objc_msgSend(v3, "addObject:", v24);

  }
  -[MUAmenityListSectionConfiguration applePayConfiguration](val->_configuration, "applePayConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "showApplePayIcons");

  if (v26)
  {
    v27 = [MUAmenityItemImageView alloc];
    v28 = -[MUAmenityItemImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    applePayImageView = val->_applePayImageView;
    val->_applePayImageView = &v28->super.super;
    v30 = v28;

    -[UIView setAccessibilityIdentifier:](val->_applePayImageView, "setAccessibilityIdentifier:", CFSTR("ApplePayImage"));
    objc_msgSend(v3, "addObject:", v30);

  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "_mapsui_textButtonConfiguration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    _MULocalizedStringFromThisBundle(CFSTR("More [Amenities]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTitle:", v31);

    objc_initWeak(&location, val);
    v32 = (void *)MEMORY[0x1E0DC3518];
    v33 = (void *)MEMORY[0x1E0DC3428];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __42__MUAmenityListSectionView__setupSubviews__block_invoke;
    v55[3] = &unk_1E2E02840;
    objc_copyWeak(&v56, &location);
    objc_msgSend(v33, "actionWithHandler:", v55);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "buttonWithConfiguration:primaryAction:", v53, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    moreButton = val->_moreButton;
    val->_moreButton = (UIButton *)v35;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](val->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setPreferredBehavioralStyle:](val->_moreButton, "setPreferredBehavioralStyle:", 1);
    v37 = objc_alloc(MEMORY[0x1E0CC19F0]);
    v38 = (void *)objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v38, "setAccessibilityIdentifier:", CFSTR("AmenityListMoreButtonButtonContainer"));
    -[UIButton setAccessibilityIdentifier:](val->_moreButton, "setAccessibilityIdentifier:", CFSTR("AmenityListMoreButton"));
    objc_msgSend(v38, "addSubview:", val->_moreButton);
    v47 = (void *)MEMORY[0x1E0CB3718];
    -[UIButton leadingAnchor](val->_moreButton, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v51;
    -[UIButton topAnchor](val->_moreButton, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 3.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v48;
    -[UIButton bottomAnchor](val->_moreButton, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v42;
    -[UIButton trailingAnchor](val->_moreButton, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v46);

    objc_msgSend(v3, "addObject:", v38);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);

  }
  -[MUPlaceVerticalCardContainerView setRowViews:](val, "setRowViews:", v3);

}

void __42__MUAmenityListSectionView__setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_performExpansion");
    WeakRetained = v2;
  }

}

- (void)_performExpansion
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[MUAmenityListSectionView isExpanded](self, "isExpanded"))
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0DC3F10];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__MUAmenityListSectionView__performExpansion__block_invoke;
    v4[3] = &unk_1E2E01DA8;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "animateWithDuration:animations:", v4, 0.200000003);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __45__MUAmenityListSectionView__performExpansion__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(WeakRetained, "arrangedSubviews", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setHidden:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    objc_msgSend(v2[59], "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayImageView, 0);
  objc_storeStrong((id *)&self->_applePayAmenityRowView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
