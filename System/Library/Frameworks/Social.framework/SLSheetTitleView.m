@implementation SLSheetTitleView

- (SLSheetTitleView)initWithFrame:(CGRect)a3
{
  SLSheetTitleView *v3;
  uint64_t v4;
  NSMutableArray *constraints;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLSheetTitleView;
  v3 = -[SLSheetTitleView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableArray *)v4;

    -[SLSheetTitleView _setupTitleLabel](v3, "_setupTitleLabel");
  }
  return v3;
}

- (void)updateConstraints
{
  NSMutableArray *constraints;
  void *v4;
  UIImageView *serviceIconView;
  NSMutableArray *v6;
  void *v7;
  UIImageView *v8;
  UILabel *titleLabel;
  void *v10;
  const __CFString *v11;
  UILabel *v12;
  NSMutableArray *v13;
  void *v14;
  objc_super v15;
  const __CFString *v16;
  UILabel *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SLSheetTitleView;
  -[SLSheetTitleView updateConstraints](&v15, sel_updateConstraints);
  -[SLSheetTitleView removeConstraints:](self, "removeConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_serviceIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  constraints = self->_constraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 10, 0, self, 10, 1.0, -0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](constraints, "addObject:", v4);

  serviceIconView = self->_serviceIconView;
  if (serviceIconView)
  {
    v6 = self->_constraints;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", serviceIconView, 10, 0, self->_titleLabel, 10, 1.0, -0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v6, "addObject:", v7);

    v8 = self->_serviceIconView;
    v18[0] = CFSTR("serviceIconView");
    v18[1] = CFSTR("titleLabel");
    titleLabel = self->_titleLabel;
    v19[0] = v8;
    v19[1] = titleLabel;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("|[serviceIconView]-(iconLabelGap)-[titleLabel]|");
  }
  else
  {
    v12 = self->_titleLabel;
    v16 = CFSTR("titleLabel");
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("|[titleLabel]|");
  }
  v13 = self->_constraints;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v11, 0, &unk_1E75AE128, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v14);

  -[SLSheetTitleView addConstraints:](self, "addConstraints:", self->_constraints);
}

- (void)layoutSubviews
{
  objc_super v3;

  -[UILabel layoutIfNeeded](self->_titleLabel, "layoutIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)SLSheetTitleView;
  -[SLSheetTitleView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)_setupTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[SLSheetTitleView addSubview:](self, "addSubview:", self->_titleLabel);
  -[SLSheetTitleView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

  -[UILabel invalidateIntrinsicContentSize](self->_titleLabel, "invalidateIntrinsicContentSize");
  -[SLSheetTitleView setNeedsLayout](self, "setNeedsLayout");
  -[SLSheetTitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);
  -[UILabel invalidateIntrinsicContentSize](self->_titleLabel, "invalidateIntrinsicContentSize");

}

- (void)setServiceIconImage:(id)a3
{
  UIImageView *v4;
  UIImageView *serviceIconView;
  UIImageView *v6;
  id v7;

  v7 = a3;
  -[UIImageView removeFromSuperview](self->_serviceIconView, "removeFromSuperview");
  if (v7)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7);
    serviceIconView = self->_serviceIconView;
    self->_serviceIconView = v4;

    -[UIImageView setAlpha:](self->_serviceIconView, "setAlpha:", 0.4);
    -[SLSheetTitleView addSubview:](self, "addSubview:", self->_serviceIconView);
  }
  else
  {
    v6 = self->_serviceIconView;
    self->_serviceIconView = 0;

  }
  -[SLSheetTitleView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[SLSheetTitleView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[SLSheetTitleView intrinsicContentSize](self, "intrinsicContentSize");
  -[SLSheetTitleView setBounds:](self, "setBounds:", v3, v4, v5, v6);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIImageView *serviceIconView;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[UILabel layoutIfNeeded](self->_titleLabel, "layoutIfNeeded");
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  serviceIconView = self->_serviceIconView;
  if (serviceIconView)
  {
    -[UIImageView intrinsicContentSize](serviceIconView, "intrinsicContentSize");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;

    v13 = 8.0;
    if (v12 > 1.0)
      v13 = 7.5;
    v4 = v4 + v9 + v13;
  }
  v14 = v4;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_serviceIconView, 0);
}

@end
