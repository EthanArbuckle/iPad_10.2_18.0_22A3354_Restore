@implementation AAUIProfileSummaryView

- (AAUIProfileSummaryView)initWithName:(id)a3 email:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  AAUIProfileSummaryView *v15;
  uint64_t v16;
  UIImageView *profileImageView;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  UILabel *nameLabel;
  UILabel *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UILabel *emailLabel;
  UILabel *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)AAUIProfileSummaryView;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[AAUIProfileSummaryView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  if (v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    profileImageView = v15->_profileImageView;
    v15->_profileImageView = (UIImageView *)v16;

    -[AAUIProfileSummaryView addSubview:](v15, "addSubview:", v15->_profileImageView);
    objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v19 = v8;
    else
      v19 = v9;
    v20 = (objc_class *)MEMORY[0x1E0DC3990];
    v21 = v19;
    v22 = objc_msgSend([v20 alloc], "initWithFrame:", v11, v12, v13, v14);
    nameLabel = v15->_nameLabel;
    v15->_nameLabel = (UILabel *)v22;

    -[UILabel setText:](v15->_nameLabel, "setText:", v21);
    v24 = v15->_nameLabel;
    v25 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v18, "scaledValueForValue:", 20.0);
    objc_msgSend(v25, "boldSystemFontOfSize:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v26);

    -[UILabel setNumberOfLines:](v15->_nameLabel, "setNumberOfLines:", 1);
    -[AAUIProfileSummaryView addSubview:](v15, "addSubview:", v15->_nameLabel);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    emailLabel = v15->_emailLabel;
    v15->_emailLabel = (UILabel *)v27;

    -[UILabel setText:](v15->_emailLabel, "setText:", v9);
    v29 = v15->_emailLabel;
    v30 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v18, "scaledValueForValue:", 15.0);
    objc_msgSend(v30, "systemFontOfSize:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v29, "setFont:", v31);

    -[UILabel setNumberOfLines:](v15->_emailLabel, "setNumberOfLines:", 1);
    v32 = v15->_emailLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v32, "setTextColor:", v33);

    -[AAUIProfileSummaryView addSubview:](v15, "addSubview:", v15->_emailLabel);
  }

  return v15;
}

- (void)setHidesPhoto:(BOOL)a3
{
  if (self->_hidesPhoto != a3)
  {
    if (a3)
      -[UIImageView removeFromSuperview](self->_profileImageView, "removeFromSuperview");
    else
      -[AAUIProfileSummaryView addSubview:](self, "addSubview:", self->_profileImageView);
  }
}

- (void)layoutSubviews
{
  void *v3;
  int isKindOfClass;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  int v8;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  objc_super v39;
  CGRect v40;
  CGRect v41;

  v39.receiver = self;
  v39.super_class = (Class)AAUIProfileSummaryView;
  -[AAUIProfileSummaryView layoutSubviews](&v39, sel_layoutSubviews);
  -[AAUIProfileSummaryView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[AAUIProfileSummaryView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v8 = IsAccessibilityCategory & ~isKindOfClass;
  -[UIImageView frame](self->_profileImageView, "frame");
  v10 = v9;
  v12 = v11;
  -[AAUIProfileSummaryView frame](self, "frame");
  UIRoundToViewScale();
  if (v8 == 1)
  {
    -[AAUIProfileSummaryView frame](self, "frame");
    UIRectCenteredXInRect();
LABEL_5:
    v19 = v14;
    v18 = v15;
    v10 = v16;
    v12 = v17;
    goto LABEL_6;
  }
  v18 = v13 + self->_topPadding;
  if (IsAccessibilityCategory)
  {
    -[AAUIProfileSummaryView frame](self, "frame");
    UIRectCenteredYInRect();
    goto LABEL_5;
  }
  v19 = 15.0;
  if (-[AAUIProfileSummaryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    -[AAUIProfileSummaryView bounds](self, "bounds");
    v19 = v30 + -15.0 - v10;
  }
LABEL_6:
  -[UIImageView setFrame:](self->_profileImageView, "setFrame:", v19, v18, v10, v12);
  -[UILabel sizeToFit](self->_nameLabel, "sizeToFit");
  -[UILabel frame](self->_nameLabel, "frame");
  v21 = v20;
  v38 = v19;
  if (v8)
  {
    v40.origin.x = v19;
    v40.origin.y = v18;
    v40.size.width = v10;
    v40.size.height = v12;
    CGRectGetMaxY(v40);
    -[AAUIProfileSummaryView frame](self, "frame");
    -[AAUIProfileSummaryView frame](self, "frame");
    UIRectCenteredXInRect();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v21 = v28;
  }
  else
  {
    v25 = self->_topPadding + 18.0;
    if ((-[AAUIProfileSummaryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      -[AAUIProfileSummaryView bounds](self, "bounds");
      v27 = v29 - v10 + -30.0;
      v23 = v19 + -15.0 - v27;
    }
    else
    {
      v23 = v10 + v19 + 15.0;
      -[AAUIProfileSummaryView frame](self, "frame");
      v27 = v31 - v23;
    }
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v23, v25, v27, v21);
  -[UILabel sizeToFit](self->_emailLabel, "sizeToFit");
  -[UILabel frame](self->_emailLabel, "frame");
  UIRoundToViewScale();
  if (v8)
  {
    v41.origin.x = v23;
    v41.origin.y = v25;
    v41.size.width = v27;
    v41.size.height = v21;
    CGRectGetMaxY(v41);
    -[AAUIProfileSummaryView frame](self, "frame");
    -[AAUIProfileSummaryView frame](self, "frame");
    UIRectCenteredXInRect();
    v23 = v33;
    v35 = v34;
    v36 = 1;
  }
  else
  {
    v35 = v32;
    if ((-[AAUIProfileSummaryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      -[AAUIProfileSummaryView bounds](self, "bounds");
      v23 = v38 + -15.0 - (v37 - v10 + -30.0);
    }
    else
    {
      -[AAUIProfileSummaryView frame](self, "frame");
    }
    v36 = 4;
  }
  -[UILabel setFrame:](self->_emailLabel, "setFrame:", v23, v35);
  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", v36);
  -[UILabel setTextAlignment:](self->_emailLabel, "setTextAlignment:", v36);
}

+ (double)desiredHeight
{
  NSString *v2;
  _BOOL4 IsAccessibilityCategory;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (!IsAccessibilityCategory)
    return 81.0;
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v4, "scaledValueForValue:", 20.0);
  objc_msgSend(v5, "systemFontOfSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v4, "scaledValueForValue:", 15.0);
  objc_msgSend(v7, "systemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bodyLeading");
  v10 = v9 + 60.0;
  objc_msgSend(v8, "_bodyLeading");
  v12 = v10 + v11;

  return v12;
}

- (BOOL)hidesPhoto
{
  return self->_hidesPhoto;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_profileImageView, 0);
}

@end
