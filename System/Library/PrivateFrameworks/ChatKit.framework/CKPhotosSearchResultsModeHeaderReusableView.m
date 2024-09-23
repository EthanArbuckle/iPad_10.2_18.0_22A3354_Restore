@implementation CKPhotosSearchResultsModeHeaderReusableView

+ (id)supplementaryViewType
{
  return CFSTR("PhotoHeaderSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("PhotoResultsToggle");
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKPhotosSearchResultsModeHeaderReusableView)initWithFrame:(CGRect)a3
{
  CKPhotosSearchResultsModeHeaderReusableView *v3;
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
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CKPhotosSearchResultsModeHeaderReusableView;
  v3 = -[CKPhotosSearchResultsModeHeaderReusableView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA990]);
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTOS_ALL_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    CKFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SEARCH_PHOTOS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v8;
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SEARCH_SCREENSHOTS_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v4, "initWithItems:", v11);

    objc_msgSend(v12, "setSelectedSegmentIndex:", 0);
    objc_msgSend(v12, "addTarget:action:forControlEvents:", v3, sel__controlIndexDidChange_, 4096);
    objc_msgSend(v12, "setApportionsSegmentWidthsByContent:", 1);
    -[CKPhotosSearchResultsModeHeaderReusableView addSubview:](v3, "addSubview:", v12);
    -[CKPhotosSearchResultsModeHeaderReusableView setControl:](v3, "setControl:", v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchPhotosSegmentedControlBottomPadding");
    -[CKPhotosSearchResultsModeHeaderReusableView setBottomPadding:](v3, "setBottomPadding:");

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double MidY;
  double v32;
  void *v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)CKPhotosSearchResultsModeHeaderReusableView;
  -[CKPhotosSearchResultsModeHeaderReusableView layoutSubviews](&v34, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spotlightSearchSegmentedControlBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPhotosSearchResultsModeHeaderReusableView setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[CKPhotosSearchResultsModeHeaderReusableView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKPhotosSearchResultsModeHeaderReusableView bottomPadding](self, "bottomPadding");
  v13 = v12 + 44.0;
  -[CKPhotosSearchResultsModeHeaderReusableView setBounds:](self, "setBounds:", v7, v9, v11, v12 + 44.0);
  -[CKPhotosSearchResultsModeHeaderReusableView marginInsets](self, "marginInsets");
  v15 = v14;
  v17 = v16;
  -[CKPhotosSearchResultsModeHeaderReusableView control](self, "control");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  if (CKMainScreenScale_once_5 != -1)
    dispatch_once(&CKMainScreenScale_once_5, &__block_literal_global_9);
  v21 = *(double *)&CKMainScreenScale_sMainScreenScale_5;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_5 == 0.0)
    v21 = 1.0;
  v22 = (v11 - (v15 + v17)) * v21;
  v23 = v20 * v21;
  v24 = v7 * v21 + floor((v11 * v21 - v22) * 0.5);
  v25 = v9 * v21 + floor((v13 * v21 - v20 * v21) * 0.5);
  v26 = 1.0 / v21;
  v27 = v26 * v24;
  v28 = v26 * v25;
  v29 = v22 * v26;
  v30 = v23 * v26;
  v35.origin.x = v7;
  v35.origin.y = v9;
  v35.size.width = v11;
  v35.size.height = v13;
  MidY = CGRectGetMidY(v35);
  v36.origin.x = v27;
  v36.origin.y = v28;
  v36.size.width = v29;
  v36.size.height = v30;
  v32 = MidY + CGRectGetHeight(v36) * -0.5;
  -[CKPhotosSearchResultsModeHeaderReusableView control](self, "control");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v27, v32, v29, v30);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  -[CKPhotosSearchResultsModeHeaderReusableView bottomPadding](self, "bottomPadding");
  objc_msgSend(v4, "setSize:", v6, v7 + 44.0);
  return v4;
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

- (UISegmentedControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
}

@end
