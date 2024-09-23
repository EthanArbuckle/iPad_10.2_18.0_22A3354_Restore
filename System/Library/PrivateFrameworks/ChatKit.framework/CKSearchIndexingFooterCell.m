@implementation CKSearchIndexingFooterCell

+ (id)supplementaryViewType
{
  return CFSTR("CKSearchIndexingFooterCellType");
}

+ (id)reuseIdentifier
{
  return CFSTR("CKSearchIndexingFooterCell");
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKSearchIndexingFooterCell)initWithFrame:(CGRect)a3
{
  CKSearchIndexingFooterCell *v3;
  id v4;
  double v5;
  double v6;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKSearchIndexingFooterCell;
  v3 = -[CKSearchIndexingFooterCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchIndexingTitleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v11);

    objc_msgSend(v9, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v12);

    objc_msgSend(v9, "setNumberOfLines:", 0);
    -[CKSearchIndexingFooterCell addSubview:](v3, "addSubview:", v9);
    -[CKSearchIndexingFooterCell setTitleLabel:](v3, "setTitleLabel:", v9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v5, v6, v7, v8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchIndexingSubtitleFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v15);

    objc_msgSend(v13, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v16);

    objc_msgSend(v13, "setNumberOfLines:", 0);
    -[CKSearchIndexingFooterCell addSubview:](v3, "addSubview:", v13);
    -[CKSearchIndexingFooterCell setSubtitleLabel:](v3, "setSubtitleLabel:", v13);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Width;
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
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MaxY;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;

  v49.receiver = self;
  v49.super_class = (Class)CKSearchIndexingFooterCell;
  -[CKSearchIndexingFooterCell layoutSubviews](&v49, sel_layoutSubviews);
  -[CKSearchIndexingFooterCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[CKSearchIndexingFooterCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKSearchIndexingFooterCell safeAreaInsets](self, "safeAreaInsets");
  if (v7)
    v10 = v9;
  else
    v10 = v8;
  v11 = v4 - v10;
  v12 = 0.0;
  if ((-[CKSearchIndexingFooterCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) == 0)
  {
    -[CKSearchIndexingFooterCell safeAreaInsets](self, "safeAreaInsets");
    v12 = v13;
  }
  -[CKSearchIndexingFooterCell bounds](self, "bounds");
  v50.origin.x = v12;
  v50.size.width = v11;
  v50.size.height = v6;
  Width = CGRectGetWidth(v50);
  -[CKSearchIndexingFooterCell marginInsets](self, "marginInsets");
  v17 = Width - (v15 + v16);
  -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v17, 1.79769313e308);
  v20 = v19;
  v22 = v21;

  if (CKMainScreenScale_once_29 != -1)
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_64);
  v23 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_29 == 0.0)
    v23 = 1.0;
  v24 = v20 * v23;
  v25 = v22 * v23;
  v26 = v12 * v23 + floor((v11 * v23 - v20 * v23) * 0.5);
  v27 = 1.0 / v23;
  v28 = v27 * v26;
  v29 = v24 * v27;
  v30 = v25 * v27;
  -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v28, 20.0, v29, v30);

  -[CKSearchIndexingFooterCell subtitleLabel](self, "subtitleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sizeThatFits:", v17, 1.79769313e308);
  v34 = v33;
  v48 = v35;

  v36 = v11;
  if (CKMainScreenScale_once_29 != -1)
    dispatch_once(&CKMainScreenScale_once_29, &__block_literal_global_64);
  v37 = *(double *)&CKMainScreenScale_sMainScreenScale_29;
  v38 = 20.0;
  if (!-[CKSearchIndexingFooterCell titleLabelHidden](self, "titleLabelHidden"))
  {
    v51.origin.y = 20.0;
    v51.origin.x = v28;
    v51.size.width = v29;
    v51.size.height = v30;
    MaxY = CGRectGetMaxY(v51);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "searchIndexingSubtitleFont");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "capHeight");
    v38 = MaxY + v42;

  }
  if (v37 == 0.0)
    v43 = 1.0;
  else
    v43 = v37;
  v44 = 1.0 / v43 * (v12 * v43 + floor((v36 * v43 - v34 * v43) * 0.5));
  v45 = v34 * v43 * (1.0 / v43);
  v46 = v48 * v43 * (1.0 / v43);
  -[CKSearchIndexingFooterCell subtitleLabel](self, "subtitleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v44, v38, v45, v46);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  CGRect v23;

  v4 = a3;
  objc_msgSend(v4, "frame");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  v8 = CGRectGetWidth(v23);
  -[CKSearchIndexingFooterCell marginInsets](self, "marginInsets");
  v11 = v8 - (v9 + v10);
  if (-[CKSearchIndexingFooterCell titleLabelHidden](self, "titleLabelHidden"))
  {
    v12 = 0.0;
  }
  else
  {
    -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeThatFits:", v11, 1.79769313e308);
    v15 = v14 + 0.0;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchIndexingSubtitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "capHeight");
    v12 = v15 + v18;

  }
  -[CKSearchIndexingFooterCell subtitleLabel](self, "subtitleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeThatFits:", v11, 1.79769313e308);
  v21 = v12 + v20;

  objc_msgSend(v4, "setFrame:", x, y, width, v21 + 40.0);
  return v4;
}

- (void)setTitleLabelHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)titleLabelHidden
{
  void *v2;
  char v3;

  -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setTitleString:(id)a3
{
  NSString *v4;
  NSString *titleString;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    titleString = self->_titleString;
    self->_titleString = v4;

    -[CKSearchIndexingFooterCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_titleString);

    -[CKSearchIndexingFooterCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleString:(id)a3
{
  NSString *v4;
  NSString *subtitleString;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleString, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    subtitleString = self->_subtitleString;
    self->_subtitleString = v4;

    -[CKSearchIndexingFooterCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_subtitleString);

    -[CKSearchIndexingFooterCell setNeedsLayout](self, "setNeedsLayout");
  }

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

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
}

@end
