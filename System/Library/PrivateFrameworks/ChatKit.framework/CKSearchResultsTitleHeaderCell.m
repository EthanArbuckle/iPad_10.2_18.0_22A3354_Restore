@implementation CKSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return CFSTR("SearchHeaderSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("SearchResultsTitle");
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (BOOL)isPinnedEffectVisible
{
  return self->_pinnedEffectVisible;
}

- (void)setPinnedEffectVisible:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  self->_pinnedEffectVisible = a3;
  v5 = !a3;
  -[UIVisualEffectView setHidden:](self->_backgroundVisualEffectView, "setHidden:", !a3);
  if (CKIsRunningInMacCatalyst() || v3)
  {
    -[CKSearchResultsTitleHeaderCell setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchResultsTitleHeaderCell setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  if (CKIsRunningInMacCatalyst())
    v7 = 1;
  else
    v7 = v5;
  -[UIView setHidden:](self->_separatorView, "setHidden:", v7);
}

- (CKSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  CKSearchResultsTitleHeaderCell *v3;
  CKSearchResultsTitleHeaderCell *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *separatorView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  CKStandardButton *v22;
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
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CKSearchResultsTitleHeaderCell;
  v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_pinnedEffectVisible = 0;
    if (CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "theme");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "spotlightSearchSegmentedControlBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSearchResultsTitleHeaderCell setBackgroundColor:](v4, "setBackgroundColor:", v7);

    }
    else
    {
      -[CKSearchResultsTitleHeaderCell setBackgroundColor:](v4, "setBackgroundColor:", 0);
    }
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    -[UIView setHidden:](v4->_separatorView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v10);

    -[CKSearchResultsTitleHeaderCell addSubview:](v4, "addSubview:", v4->_separatorView);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1100);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v11);
    objc_msgSend(v12, "setHidden:", 1);
    -[CKSearchResultsTitleHeaderCell addSubview:](v4, "addSubview:", v12);
    objc_storeStrong((id *)&v4->_backgroundVisualEffectView, v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isAccessibilityPreferredContentSizeCategory");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "searchResultsTitleHeaderAXTopPadding");
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v4, "setTitleTopPadding:");

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "searchResultsTitleHeaderAXBottomPadding");
    }
    else
    {
      objc_msgSend(v15, "searchResultsTitleHeaderTopPadding");
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v4, "setTitleTopPadding:");

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "searchResultsTitleHeaderBottomPadding");
    }
    -[CKSearchResultsTitleHeaderCell setTitleBottomPadding:](v4, "setTitleBottomPadding:");

    v18 = objc_alloc(MEMORY[0x1E0CEA700]);
    v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v19, "setAdjustsFontForContentSizeCategory:", 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "searchHeaderFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v21);

    -[CKSearchResultsTitleHeaderCell setSectionTitle:](v4, "setSectionTitle:", v19);
    -[CKSearchResultsTitleHeaderCell addSubview:](v4, "addSubview:", v19);
    v22 = objc_alloc_init(CKStandardButton);
    -[CKStandardButton addTarget:action:forControlEvents:](v22, "addTarget:action:forControlEvents:", v4, sel__showAllButtonTapped_, 64);
    -[CKStandardButton titleLabel](v22, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "searchHeaderButtonFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v25);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "theme");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "detailsSeeAllButtonBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStandardButton setBackgroundColor:](v22, "setBackgroundColor:", v28);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "theme");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "detailsSeeAllButtonTextColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStandardButton setTintColor:](v22, "setTintColor:", v31);

    -[CKStandardButton titleLabel](v22, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAdjustsFontForContentSizeCategory:", 1);

    -[CKSearchResultsTitleHeaderCell setShowAllButton:](v4, "setShowAllButton:", v22);
    -[CKSearchResultsTitleHeaderCell addSubview:](v4, "addSubview:", v22);
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchResultsTitleHeaderCell setTopHairline:](v4, "setTopHairline:", v33);
    -[CKSearchResultsTitleHeaderCell layer](v4, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSublayer:", v33);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v25;
  int v26;
  uint64_t v27;
  double v28;
  double Width;
  double MinX;
  CGFloat v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v56.receiver = self;
  v56.super_class = (Class)CKSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell layoutSubviews](&v56, sel_layoutSubviews);
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_SHOW_MORE"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:forState:", v5, 0);

  }
  v6 = -[CKSearchResultsTitleHeaderCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKSearchResultsTitleHeaderCell bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CKSearchResultsTitleHeaderCell marginInsets](self, "marginInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CKSearchResultsTitleHeaderCell safeAreaInsets](self, "safeAreaInsets");
  v51 = v23;
  -[CKSearchResultsTitleHeaderCell safeAreaInsets](self, "safeAreaInsets");
  v50 = v24;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isAccessibilityPreferredContentSizeCategory");

  v54 = v16;
  v55 = v20;
  v52 = v22;
  v53 = v18;
  if (CKPixelWidth_once_5 != -1)
    dispatch_once(&CKPixelWidth_once_5, &__block_literal_global_91);
  v27 = v6 ^ 1u;
  v28 = *(double *)&CKPixelWidth_sPixel_5;
  v57.origin.x = v8;
  v57.origin.y = v10;
  v57.size.width = v12;
  v57.size.height = v14;
  Width = CGRectGetWidth(v57);
  v58.origin.x = v8;
  v58.origin.y = v10;
  v58.size.width = v12;
  v58.size.height = v14;
  MinX = CGRectGetMinX(v58);
  v59.origin.x = v8;
  v59.origin.y = v10;
  v59.size.width = v12;
  v59.size.height = v14;
  v31 = CGRectGetMaxY(v59) - v28;
  -[CKSearchResultsTitleHeaderCell separatorView](self, "separatorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", MinX, v31, Width, v28);

  v33 = CKIsRunningInMacCatalyst();
  -[CKSearchResultsTitleHeaderCell topHairline](self, "topHairline");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33)
  {
    objc_msgSend(v34, "setHidden:", 1);
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "theme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "spotlightSearchCellHairlineColor");
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

    v39 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[CKSearchResultsTitleHeaderCell leadingSeparatorInsets](self, "leadingSeparatorInsets");
    v41 = v40;
    -[CKSearchResultsTitleHeaderCell leadingSeparatorInsets](self, "leadingSeparatorInsets");
    v43 = v12 - v42;
    if (CKPixelWidth_once_5 != -1)
      dispatch_once(&CKPixelWidth_once_5, &__block_literal_global_91);
    v44 = *(double *)&CKPixelWidth_sPixel_5;
    -[CKSearchResultsTitleHeaderCell topHairline](self, "topHairline");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v41, v39, v43, v44);
  }
  v45 = v52 + v50;

  -[CKSearchResultsTitleHeaderCell backgroundVisualEffectView](self, "backgroundVisualEffectView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFrame:", v8, v10, v12, v14);

  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "sizeToFit");

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sizeToFit");

  v49 = v53 + v51;
  if (v26)
    -[CKSearchResultsTitleHeaderCell layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:", v27, v8, v10, v12, v14, v54, v49, v55, v45);
  else
    -[CKSearchResultsTitleHeaderCell layoutSubviewsWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsWithBounds:layoutMargins:isLTR:", v27, v8, v10, v12, v14, v54, v49, v55, v45);
}

- (void)layoutSubviewsAXFontSizeWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  double left;
  CGFloat height;
  CGFloat width;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGFloat v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  CGFloat rect;
  CGFloat x;
  CGFloat y;
  CGFloat v38;
  double right;
  id v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  right = a4.right;
  left = a4.left;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v41 = left;
  if (!a5)
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v19 = CGRectGetWidth(v42);
    v43.origin.x = v12;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    left = v19 - CGRectGetWidth(v43) - right;
  }
  -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding", *(_QWORD *)&width);
  v21 = v20;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  v38 = v18;
  objc_msgSend(v22, "setFrame:", left, v21, v16, v18);

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  if (!a5)
  {
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = rect;
    v44.size.height = height;
    v33 = CGRectGetWidth(v44);
    v45.origin.x = v26;
    v45.origin.y = v28;
    v45.size.width = v30;
    v45.size.height = v32;
    v41 = v33 - CGRectGetWidth(v45) - right;
  }
  v46.origin.x = left;
  v46.origin.y = v21;
  v46.size.width = v23;
  v46.size.height = v38;
  MaxY = CGRectGetMaxY(v46);
  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v41, MaxY, v30, v32);

}

- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  _BOOL4 v5;
  double left;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double MinY;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double right;
  CGFloat rect;
  void *recta;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v5 = a5;
  right = a4.right;
  left = a4.left;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v57 = v15;
  v58 = v16;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "sizeThatFits:", v23, v24);
  v26 = v25;

  v27 = CKIsRunningInMacCatalyst();
  rect = width;
  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  if (v27)
  {
    v32 = CGRectGetMinY(*(CGRect *)&v28) + (v19 - v26) * -0.5;
    -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding");
    v34 = v32 + v33;
  }
  else
  {
    v34 = CGRectGetMidY(*(CGRect *)&v28) + v19 * -0.5;
  }
  v35 = left;
  if (v5)
  {
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = rect;
    v63.size.height = height;
    v36 = CGRectGetWidth(v63);
    v64.origin.x = v14;
    v64.origin.y = v34;
    v64.size.width = v57;
    v64.size.height = v58;
    v35 = v36 - CGRectGetWidth(v64) - right;
  }
  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v35, v34, v57, v58);

  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v54 = v40;
  v55 = v39;
  v56 = v41;

  v65.origin.x = x;
  v59 = y;
  v65.origin.y = y;
  v65.size.width = rect;
  v42 = height;
  v65.size.height = height;
  v43 = left;
  v44 = CGRectGetWidth(v65) - left;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "searchResultsTitleHeaderInterItemSpacing");
  v47 = v44 - v46;
  v66.origin.x = v35;
  v66.origin.y = v34;
  v66.size.width = v57;
  v66.size.height = v58;
  v48 = v47 - CGRectGetWidth(v66) - right;

  if (!v5)
  {
    v67.origin.x = x;
    v67.origin.y = v59;
    v67.size.width = rect;
    v67.size.height = v42;
    v49 = CGRectGetWidth(v67);
    v68.origin.y = v54;
    v68.origin.x = v55;
    v68.size.width = v48;
    v68.size.height = v56;
    v43 = v49 - CGRectGetWidth(v68) - right;
  }
  if (CKIsRunningInMacCatalyst())
  {
    v69.origin.x = x;
    v69.origin.y = v59;
    v69.size.width = rect;
    v69.size.height = v42;
    MinY = CGRectGetMinY(v69);
    -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding");
    v52 = MinY + v51;
    v53 = v56;
  }
  else
  {
    v70.origin.x = x;
    v70.origin.y = v59;
    v70.size.width = rect;
    v70.size.height = v42;
    v53 = v56;
    v52 = CGRectGetMidY(v70) + v56 * -0.5;
  }
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "setFrame:", v43, v52, v48, v53);

}

- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  double v34;
  CGFloat v35;
  void *v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double MidY;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double right;
  double left;
  CGFloat rect;
  void *recta;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v5 = a5;
  right = a4.right;
  left = a4.left;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  rect = height;
  if (v5)
  {
    v62.origin.x = x;
    v62.origin.y = y;
    v62.size.width = width;
    v62.size.height = height;
    v20 = x;
    v21 = CGRectGetWidth(v62);
    v63.origin.x = v13;
    v63.origin.y = v15;
    v63.size.width = v17;
    v63.size.height = v19;
    v22 = v21 - CGRectGetWidth(v63) - right;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchSeeAllButtonTrailingMargin");
    v25 = v22 - v24;
    x = v20;
    height = rect;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "searchSeeAllButtonTrailingMargin");
    v25 = left + v26;
  }

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v25, v15, v17, v19);

  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v56 = v29;
  v57 = v30;

  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v31 = x;
  v32 = CGRectGetWidth(v64) - left;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "searchResultsTitleHeaderTextLeadingMargin");
  v35 = v32 - v34;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "searchResultsTitleHeaderInterItemSpacing");
  v38 = v35 - v37;
  v65.origin.x = v25;
  v65.origin.y = v15;
  v65.size.width = v17;
  v65.size.height = v19;
  v39 = v38 - CGRectGetWidth(v65) - right;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "searchSeeAllButtonTrailingMargin");
  v42 = v39 - v41;

  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "font");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_bodyLeading");
  v46 = v45;

  if (v5)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "searchResultsTitleHeaderTextLeadingMargin");
    v49 = left + v48;
    v50 = v57;
  }
  else
  {
    v66.origin.x = v31;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = rect;
    v51 = CGRectGetWidth(v66);
    v67.origin.x = v56;
    v50 = v57;
    v67.origin.y = v57;
    v67.size.width = v42;
    v67.size.height = v46;
    v52 = v51 - CGRectGetWidth(v67) - right;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "searchResultsTitleHeaderTextLeadingMargin");
    v49 = v52 - v53;
  }

  v68.origin.x = v31;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = rect;
  MidY = CGRectGetMidY(v68);
  v69.origin.x = v49;
  v69.origin.y = v50;
  v69.size.width = v42;
  v69.size.height = v46;
  v55 = MidY + CGRectGetHeight(v69) * -0.5;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "setFrame:", v49, v55, v42, v46);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell prepareForReuse](&v7, sel_prepareForReuse);
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[CKSearchResultsTitleHeaderCell setSectionIndex:](self, "setSectionIndex:", 0);
  -[CKSearchResultsTitleHeaderCell setPinnedEffectVisible:](self, "setPinnedEffectVisible:", 0);
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightSearchSegmentedControlBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchResultsTitleHeaderCell setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
  else
  {
    -[CKSearchResultsTitleHeaderCell setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKSearchResultsTitleHeaderCell sectionTitle](self, "sectionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v10, v12);
  v15 = v14;

  -[CKSearchResultsTitleHeaderCell showAllButton](self, "showAllButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v10, v12);
  v18 = v17;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isAccessibilityPreferredContentSizeCategory");

  -[CKSearchResultsTitleHeaderCell titleTopPadding](self, "titleTopPadding");
  if (v20)
  {
    v22 = v18 + v15 + v21;
    -[CKSearchResultsTitleHeaderCell titleBottomPadding](self, "titleBottomPadding");
    v24 = v23;
  }
  else
  {
    v24 = v15 + v21;
    -[CKSearchResultsTitleHeaderCell titleBottomPadding](self, "titleBottomPadding");
    v22 = v25;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v24 + v22);
  return v4;
}

- (void)_showAllButtonTapped:(id)a3
{
  id v4;

  -[CKSearchResultsTitleHeaderCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResultsTitleCellShowAllButtonTapped:", self);

}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (CKSearchResultsTitleHeaderCellDelegate)delegate
{
  return (CKSearchResultsTitleHeaderCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (UIButton)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_showAllButton, a3);
}

- (double)leadingSeparatorInsets
{
  return self->_leadingSeparatorInsets;
}

- (void)setLeadingSeparatorInsets:(double)a3
{
  self->_leadingSeparatorInsets = a3;
}

- (UILabel)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
  objc_storeStrong((id *)&self->_topHairline, a3);
}

- (double)titleTopPadding
{
  return self->_titleTopPadding;
}

- (void)setTitleTopPadding:(double)a3
{
  self->_titleTopPadding = a3;
}

- (double)titleBottomPadding
{
  return self->_titleBottomPadding;
}

- (void)setTitleBottomPadding:(double)a3
{
  self->_titleBottomPadding = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
