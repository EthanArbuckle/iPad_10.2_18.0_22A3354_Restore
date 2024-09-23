@implementation MPAVClippingTableViewCell

- (MPAVClippingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v4;
  MPAVClippingTableViewCell *v5;
  __int128 v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  UIView *clippingMaskView;
  void *v14;
  uint64_t v15;
  UIView *clippingContentView;
  UIView *v17;
  void *v18;
  uint64_t v19;
  UIView *bottomSeparatorView;
  void *v21;
  void *v22;
  uint64_t v23;
  UIView *topSeparatorView;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MPAVClippingTableViewCell;
  v4 = -[MPAVClippingTableViewCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = (MPAVClippingTableViewCell *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)(v4 + 1064) = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)(v4 + 1080) = v6;
    objc_msgSend(v4, "setClipsToBounds:", 1);
    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
    clippingMaskView = v5->_clippingMaskView;
    v5->_clippingMaskView = (UIView *)v12;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_clippingMaskView, "setBackgroundColor:", v14);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    clippingContentView = v5->_clippingContentView;
    v5->_clippingContentView = (UIView *)v15;

    v17 = v5->_clippingContentView;
    -[MPAVClippingTableViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v17, "addSubview:", v18);

    -[MPAVClippingTableViewCell addSubview:](v5, "addSubview:", v5->_clippingContentView);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    bottomSeparatorView = v5->_bottomSeparatorView;
    v5->_bottomSeparatorView = (UIView *)v19;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_bottomSeparatorView, "setBackgroundColor:", v21);

    -[MPAVClippingTableViewCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v5->_bottomSeparatorView);

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
    topSeparatorView = v5->_topSeparatorView;
    v5->_topSeparatorView = (UIView *)v23;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5->_topSeparatorView, "setBackgroundColor:", v25);

    -[UIView setHidden:](v5->_topSeparatorView, "setHidden:", 1);
    -[MPAVClippingTableViewCell contentView](v5, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v5->_topSeparatorView);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MPAVClippingTableViewCell accessoryView](self, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaskView:", 0);

  v4.receiver = self;
  v4.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell dealloc](&v4, sel_dealloc);
}

- (void)setAccessoryView:(id)a3
{
  id v4;
  void *v5;
  UIView *clippingMaskView;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[MPAVClippingTableViewCell accessoryView](self, "accessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskView:", 0);

  v8.receiver = self;
  v8.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell setAccessoryView:](&v8, sel_setAccessoryView_, v4);

  clippingMaskView = self->_clippingMaskView;
  -[MPAVClippingTableViewCell accessoryView](self, "accessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskView:", clippingMaskView);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[MPAVClippingTableViewCell setClippingInsets:](self, "setClippingInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
  _BOOL4 v7;
  uint64_t v8;

  if (a3.left != self->_clippingInsets.left
    || a3.top != self->_clippingInsets.top
    || a3.right != self->_clippingInsets.right
    || a3.bottom != self->_clippingInsets.bottom)
  {
    self->_clippingInsets = a3;
    v7 = a3.left != *(double *)(MEMORY[0x1E0DC49E8] + 8);
    if (a3.top != *MEMORY[0x1E0DC49E8])
      v7 = 1;
    if (a3.right != *(double *)(MEMORY[0x1E0DC49E8] + 24))
      v7 = 1;
    v8 = a3.bottom != *(double *)(MEMORY[0x1E0DC49E8] + 16) || v7;
    -[UIView setClipsToBounds:](self->_clippingContentView, "setClipsToBounds:", v8);
    -[MPAVClippingTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIView *v14;
  UIView *clippingMaskView;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double Width;
  void *v34;
  double MaxY;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37.receiver = self;
  v37.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell layoutSubviews](&v37, sel_layoutSubviews);
  -[MPAVClippingTableViewCell bounds](self, "bounds");
  top = self->_clippingInsets.top;
  left = self->_clippingInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_clippingInsets.right);
  v12 = v11 - (top + self->_clippingInsets.bottom);
  -[UIView setFrame:](self->_clippingContentView, "setFrame:", v5 + left, v7 + top, v10, v12);
  -[MPAVClippingTableViewCell _defaultAccessoryView](self, "_defaultAccessoryView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maskView");
  v14 = (UIView *)objc_claimAutoreleasedReturnValue();
  clippingMaskView = self->_clippingMaskView;

  if (v14 != clippingMaskView)
    objc_msgSend(v13, "setMaskView:", self->_clippingMaskView);
  objc_msgSend(v13, "convertRect:fromView:", self, v6, v8, v10, v12);
  -[UIView setFrame:](self->_clippingMaskView, "setFrame:");
  -[MPAVClippingTableViewCell contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = -self->_clippingInsets.top;
  -[MPAVClippingTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v18, v23, v20, v22);

  -[MPAVClippingTableViewCell _separatorFrame](self, "_separatorFrame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[MPAVClippingTableViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v38);
  v39.origin.x = v26;
  v39.origin.y = v28;
  v39.size.width = v30;
  v39.size.height = v32;
  -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v39));
  -[MPAVClippingTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  MaxY = CGRectGetMaxY(v40);
  v41.origin.x = v26;
  v41.origin.y = v28;
  v41.size.width = v30;
  v41.size.height = v32;
  v36 = MaxY - CGRectGetHeight(v41);

  -[UIView setFrame:](self->_bottomSeparatorView, "setFrame:", v26, v36, v30, v32);
}

- (void)_setShouldHaveFullLengthTopSeparator:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell _setShouldHaveFullLengthTopSeparator:](&v5, sel__setShouldHaveFullLengthTopSeparator_);
  -[UIView setHidden:](self->_topSeparatorView, "setHidden:", !v3);
}

- (void)_setShouldHaveFullLengthBottomSeparator:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MPAVClippingTableViewCell;
  -[MPAVClippingTableViewCell _setShouldHaveFullLengthBottomSeparator:](&v6, sel__setShouldHaveFullLengthBottomSeparator_);
  v5 = v3 && self->_shouldHideSectionBottomSeparator;
  -[UIView setHidden:](self->_bottomSeparatorView, "setHidden:", v5);
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (UIView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (BOOL)shouldHideSectionBottomSeparator
{
  return self->_shouldHideSectionBottomSeparator;
}

- (void)setShouldHideSectionBottomSeparator:(BOOL)a3
{
  self->_shouldHideSectionBottomSeparator = a3;
}

- (UIView)clippingContentView
{
  return self->_clippingContentView;
}

- (void)setClippingContentView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingContentView, a3);
}

- (UIView)clippingMaskView
{
  return self->_clippingMaskView;
}

- (void)setClippingMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingMaskView, a3);
}

- (UIEdgeInsets)clippingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_clippingInsets.top;
  left = self->_clippingInsets.left;
  bottom = self->_clippingInsets.bottom;
  right = self->_clippingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingMaskView, 0);
  objc_storeStrong((id *)&self->_clippingContentView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
}

@end
