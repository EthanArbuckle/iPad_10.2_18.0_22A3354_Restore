@implementation CompletionListTableHeaderView

- (CompletionListTableHeaderView)initWithReuseIdentifier:(id)a3
{
  CompletionListTableHeaderView *v3;
  CompletionListTableHeaderView *v4;
  UIView *v5;
  UIView *separator;
  void *v7;
  CompletionListTableHeaderView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CompletionListTableHeaderView;
  v3 = -[CompletionListTableHeaderView initWithReuseIdentifier:](&v10, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_showsSeparator = 1;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separator = v4->_separator;
    v4->_separator = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separator, "setBackgroundColor:", v7);

    -[CompletionListTableHeaderView addSubview:](v4, "addSubview:", v4->_separator);
    v8 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double MinX;
  double Width;
  void *v20;
  double MaxX;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  unint64_t v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v31.receiver = self;
  v31.super_class = (Class)CompletionListTableHeaderView;
  -[CompletionListTableHeaderView layoutSubviews](&v31, sel_layoutSubviews);
  -[CompletionListTableHeaderView contentConfiguration](self, "contentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[CompletionListTableHeaderView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    -[CompletionListTableHeaderView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "directionalLayoutMargins");
    v14 = v13;
    v16 = v15;
    -[CompletionListTableHeaderView contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    MinX = CGRectGetMinX(v32);

    v33.origin.x = v6;
    v33.origin.y = v8;
    v33.size.width = v10;
    v33.size.height = v12;
    Width = CGRectGetWidth(v33);
    -[CompletionListTableHeaderView contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    MaxX = CGRectGetMaxX(v34);
    if (v4)
      v22 = v14;
    else
      v22 = v16;
    v23 = v22 + MinX;
    v24 = Width - MaxX;
    if (v4)
      v25 = v16;
    else
      v25 = v14;
    v26 = v25 + v24;

    _SFOnePixel();
    v28 = v27;
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    v29 = CGRectGetHeight(v35) - v28;
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = v10;
    v36.size.height = v12;
    -[UIView setFrame:](self->_separator, "setFrame:", v23, v29, CGRectGetWidth(v36) - v23 - v26, v28);
    LOBYTE(v30) = self->_showsSeparator;
    -[UIView setAlpha:](self->_separator, "setAlpha:", (double)v30);
  }

}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    -[CompletionListTableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
}

@end
