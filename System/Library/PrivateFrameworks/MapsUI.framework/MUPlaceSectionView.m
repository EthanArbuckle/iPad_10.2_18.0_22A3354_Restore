@implementation MUPlaceSectionView

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4
{
  return -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:sectionHeaderViewModel:sectionFooterViewModel:](self, "initWithStyle:alwaysHideSeparators:sectionHeaderViewModel:sectionFooterViewModel:", a3, a4, 0, 0);
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5
{
  return -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:sectionHeaderViewModel:sectionFooterViewModel:](self, "initWithStyle:alwaysHideSeparators:sectionHeaderViewModel:sectionFooterViewModel:", a3, 0, a4, a5);
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4 sectionHeaderViewModel:(id)a5 sectionFooterViewModel:(id)a6
{
  id v11;
  id v12;
  MUPlaceSectionView *v13;
  MUPlaceSectionView *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceSectionView;
  v13 = -[MUPlaceSectionView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v14 = v13;
  if (v13)
  {
    v13->_alwaysHideSeparators = a4;
    objc_storeStrong((id *)&v13->_headerViewModel, a5);
    objc_storeStrong((id *)&v14->_footerViewModel, a6);
    v14->_style = a3;
    -[MUPlaceSectionView _setupSubviews](v14, "_setupSubviews");
    -[MUPlaceSectionView _setupConstraints](v14, "_setupConstraints");
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[MUPlaceSectionView registerForTraitChanges:withTarget:action:](v14, "registerForTraitChanges:withTarget:action:", v16, v14, sel__updateForContentSizeChange);

  }
  return v14;
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4
{
  return -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:](self, "initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:", a3, a4, 0);
}

- (void)_setupSubviews
{
  MUPlaceSectionHeaderView *v3;
  MUPlaceSectionHeaderView *headerView;
  UILayoutGuide *v5;
  UILayoutGuide *contentLayoutGuide;
  MULinkView *v7;
  MULinkView *v8;
  MULinkView *footerView;
  void *v10;
  void *v11;
  MULinkView *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  if (self->_headerViewModel)
  {
    v3 = -[MUPlaceSectionHeaderView initWithViewModel:]([MUPlaceSectionHeaderView alloc], "initWithViewModel:", self->_headerViewModel);
    headerView = self->_headerView;
    self->_headerView = v3;

    -[MUPlaceSectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceSectionView addSubview:](self, "addSubview:", self->_headerView);
  }
  v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v5;

  -[MUPlaceSectionView addLayoutGuide:](self, "addLayoutGuide:", self->_contentLayoutGuide);
  if (self->_footerViewModel)
  {
    v7 = [MULinkView alloc];
    v8 = -[MULinkView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    footerView = self->_footerView;
    self->_footerView = v8;

    -[MULinkView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (self->_style == 1)
      -[MULinkView setDirectionalLayoutMargins:](self->_footerView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    -[MUPlaceSectionFooterViewModel attributedText](self->_footerViewModel, "attributedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULinkView setAttributedText:](self->_footerView, "setAttributedText:", v10);

    -[MUPlaceSectionFooterViewModel actionBlock](self->_footerViewModel, "actionBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_initWeak(&location, self);
      v12 = self->_footerView;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __36__MUPlaceSectionView__setupSubviews__block_invoke;
      v16 = &unk_1E2E027C8;
      objc_copyWeak(&v17, &location);
      -[MULinkView setSelectionBlock:](v12, "setSelectionBlock:", &v13);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    -[MUPlaceSectionView addSubview:](self, "addSubview:", self->_footerView, v13, v14, v15, v16);
  }
}

void __36__MUPlaceSectionView__setupSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void (**v2)(void);
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[58], "actionBlock");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    WeakRetained = v3;
  }

}

- (void)_setupConstraints
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  MULinkView *footerView;
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
  MUHairlineView *v35;
  MUHairlineView *hairlineView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  _QWORD v50[4];
  void *v51;
  _QWORD v52[2];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = !self->_alwaysHideSeparators
     && +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle") == 1;
  v48 = v3;
  if (self->_headerViewModel)
  {
    -[MUPlaceSectionHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView leadingAnchor](self, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:constant:", v44, 19.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v42;
    -[MUPlaceSectionHeaderView topAnchor](self->_headerView, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView topAnchor](self, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v37;
    -[MUPlaceSectionHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView trailingAnchor](self, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -16.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v6;
    -[MUPlaceSectionHeaderView bottomAnchor](self->_headerView, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -10.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  else
  {
    -[MUPlaceSectionView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  if (self->_style == 1)
    v14 = 16.0;
  else
    v14 = 0.0;
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v17;
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObjectsFromArray:", v21);

  if (v49)
    v22 = -16.0;
  else
    v22 = 0.0;
  footerView = self->_footerView;
  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (footerView)
  {
    -[MULinkView topAnchor](self->_footerView, "topAnchor");
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v47, -8.0);
    v45 = objc_claimAutoreleasedReturnValue();
    v50[0] = v45;
    -[MULinkView leadingAnchor](self->_footerView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView leadingAnchor](self, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v43, 16.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v41;
    -[MULinkView trailingAnchor](self->_footerView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView trailingAnchor](self, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v26, -16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v27;
    -[MULinkView bottomAnchor](self->_footerView, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceSectionView bottomAnchor](self, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v48;
    objc_msgSend(v48, "addObjectsFromArray:", v31);

    v33 = (void *)v47;
    v34 = (void *)v45;

  }
  else
  {
    -[MUPlaceSectionView bottomAnchor](self, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v33, v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v48;
    objc_msgSend(v48, "addObjectsFromArray:", v25);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  if (v49)
  {
    -[UIView _mapsui_addHairlineAtBottomWithLeadingMargin:trailingMargin:](self, "_mapsui_addHairlineAtBottomWithLeadingMargin:trailingMargin:", 16.0, 0.0);
    v35 = (MUHairlineView *)objc_claimAutoreleasedReturnValue();
    hairlineView = self->_hairlineView;
    self->_hairlineView = v35;

  }
}

- (void)attachViewToContentView:(id)a3
{
  id v4;
  objc_class *v5;
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceSectionView addSubview:](self, "addSubview:", v4);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v6);

  v17 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v4, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(v4, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(v4, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)_updateForContentSizeChange
{
  id v3;

  -[MUPlaceSectionFooterViewModel attributedText](self->_footerViewModel, "attributedText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MULinkView setAttributedText:](self->_footerView, "setAttributedText:", v3);

}

- (void)hideBottomSeperator
{
  -[MUHairlineView setHidden:](self->_hairlineView, "setHidden:", 1);
}

- (void)setHeaderAXIdentifierWithBaseString:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringByAppendingString:", CFSTR("Header"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderView setAccessibilityIdentifier:](self->_headerView, "setAccessibilityIdentifier:", v4);

}

- (void)beginAnimatingActivityIndicator
{
  -[MUPlaceSectionHeaderView beginAnimatingActivityIndicator](self->_headerView, "beginAnimatingActivityIndicator");
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[MUPlaceSectionHeaderView endAnimatingActivityIndicatorWithError:](self->_headerView, "endAnimatingActivityIndicatorWithError:", a3);
}

- (MUPlaceSectionHeaderViewModel)headerViewModel
{
  return self->_headerViewModel;
}

- (MUPlaceSectionFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_headerViewModel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4
{
  return (id)objc_msgSend(a1, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", a3, a4, 0, 0);
}

+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5 alwaysInsetContentView:(BOOL)a6
{
  id v9;
  id v10;
  MUPlatterView *v11;
  int64_t v12;
  MUPlaceSectionView *v13;
  MUPlaceSectionView *v14;
  MUPlatterView *v15;

  v9 = a5;
  v10 = a4;
  v11 = (MUPlatterView *)a3;
  v12 = +[MUInfoCardStyle containerStyle](MUInfoCardStyle, "containerStyle");
  v13 = [MUPlaceSectionView alloc];
  if (v12 != 1 || a6)
  {
    v14 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:](v13, "initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:", 1, v10, v9);

    v15 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", v11);
    -[MUPlaceSectionView attachViewToContentView:](v14, "attachViewToContentView:", v15);
    v11 = v15;
  }
  else
  {
    v14 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:](v13, "initWithStyle:sectionHeaderViewModel:sectionFooterViewModel:", 0, v10, v9);

    -[MUPlaceSectionView attachViewToContentView:](v14, "attachViewToContentView:", v11);
  }

  return v14;
}

- (void)configureWithSectionController:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Controller"), &stru_1E2E05448);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("MU"), &stru_1E2E05448);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MUPlaceSectionView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);
  if (self->_headerViewModel)
    -[MUPlaceSectionView setHeaderAXIdentifierWithBaseString:](self, "setHeaderAXIdentifierWithBaseString:", v7);

}

@end
