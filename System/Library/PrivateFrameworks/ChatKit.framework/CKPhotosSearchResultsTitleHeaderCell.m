@implementation CKPhotosSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return CFSTR("SearchPhotosHeaderSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("SearchPhotosResultsTitle");
}

- (CKPhotosSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  CKPhotosSearchResultsTitleHeaderCell *v3;
  id v4;
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
  double v15;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA990]);
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTOS_ALL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTOS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v8;
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEARCH_SCREENSHOTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "initWithItems:", v11);

    objc_msgSend(v12, "setSelectedSegmentIndex:", 0);
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v3, sel__controlIndexDidChange_, 4096);
    -[CKPhotosSearchResultsTitleHeaderCell addSubview:](v3, "addSubview:", v12);
    -[CKPhotosSearchResultsTitleHeaderCell setControl:](v3, "setControl:", v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v13, "isAccessibilityPreferredContentSizeCategory");

    v14 = 2.0;
    if ((_DWORD)v6)
    {
      v14 = 8.0;
      v15 = 11.0;
    }
    else
    {
      v15 = 4.0;
    }
    -[CKPhotosSearchResultsTitleHeaderCell setControlTopPadding:](v3, "setControlTopPadding:", v14);
    -[CKPhotosSearchResultsTitleHeaderCell setControlBottomPadding:](v3, "setControlBottomPadding:", v15);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MaxY;
  double v16;
  double v17;
  double Height;
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
  double v30;
  double v31;
  double v32;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell layoutSubviews](&v34, sel_layoutSubviews);
  -[CKPhotosSearchResultsTitleHeaderCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[CKSearchResultsTitleHeaderCell marginInsets](self, "marginInsets");
  v14 = v8 - (v12 + v13);
  -[CKPhotosSearchResultsTitleHeaderCell bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v35);
  -[CKPhotosSearchResultsTitleHeaderCell controlBottomPadding](self, "controlBottomPadding");
  v17 = v16;
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v14;
  v36.size.height = v11;
  Height = CGRectGetHeight(v36);
  -[CKPhotosSearchResultsTitleHeaderCell bounds](self, "bounds");
  v20 = v19;
  v22 = v21;
  if (CKMainScreenScale_once_106 != -1)
    dispatch_once(&CKMainScreenScale_once_106, &__block_literal_global_276);
  v23 = *(double *)&CKMainScreenScale_sMainScreenScale_106;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_106 == 0.0)
    v23 = 1.0;
  v24 = (MaxY - v17 - Height) * v23;
  v25 = v14 * v23;
  v26 = v11 * v23;
  v27 = v20 * v23 + floor((v22 * v23 - v14 * v23) * 0.5);
  v28 = 1.0 / v23;
  v29 = v28 * v27;
  v30 = v24 * v28;
  v31 = v25 * v28;
  v32 = v26 * v28;
  -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v29, v30, v31, v32);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
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
  double v19;
  double v20;
  double v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell preferredLayoutAttributesFittingAttributes:](&v23, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alpha");
  v15 = v14;

  if (v15 > 0.0)
  {
    -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeThatFits:", v10, v12);
    v18 = v17;

    -[CKPhotosSearchResultsTitleHeaderCell controlTopPadding](self, "controlTopPadding");
    v20 = v18 + v19;
    -[CKPhotosSearchResultsTitleHeaderCell controlBottomPadding](self, "controlBottomPadding");
    v12 = v12 + v20 + v21;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v12);
  return v4;
}

- (void)setTitle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPhotosSearchResultsTitleHeaderCell;
  -[CKSearchResultsTitleHeaderCell setTitle:](&v3, sel_setTitle_, a3);
}

- (void)updateSegmentedControlToFitWidth:(double)a3
{
  void *v5;
  double v6;
  _BOOL8 v7;
  id v8;

  -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6 >= a3;

  -[CKPhotosSearchResultsTitleHeaderCell control](self, "control");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApportionsSegmentWidthsByContent:", v7);

}

- (UISegmentedControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (double)controlTopPadding
{
  return self->_controlTopPadding;
}

- (void)setControlTopPadding:(double)a3
{
  self->_controlTopPadding = a3;
}

- (double)controlBottomPadding
{
  return self->_controlBottomPadding;
}

- (void)setControlBottomPadding:(double)a3
{
  self->_controlBottomPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
}

@end
