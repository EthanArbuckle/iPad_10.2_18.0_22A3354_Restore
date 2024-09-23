@implementation HUCheckmarkAccessoryView

- (HUCheckmarkAccessoryView)initWithFrame:(CGRect)a3
{
  HUCheckmarkAccessoryView *v3;
  HUCheckmarkAccessoryView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUCheckmarkAccessoryView;
  v3 = -[HUCheckmarkAccessoryView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_checked = 0;
    v3->_disabled = 0;
    objc_msgSend(MEMORY[0x1E0CEA638], "checkmarkImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resizableImageWithCapInsets:resizingMode:", 1, *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v6);
    -[HUCheckmarkAccessoryView setCheckmarkImageView:](v4, "setCheckmarkImageView:", v7);

    -[HUCheckmarkAccessoryView checkmarkImageView](v4, "checkmarkImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[HUCheckmarkAccessoryView checkmarkImageView](v4, "checkmarkImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCheckmarkAccessoryView addSubview:](v4, "addSubview:", v9);

    -[HUCheckmarkAccessoryView setOpaque:](v4, "setOpaque:", 0);
    objc_msgSend((id)objc_opt_class(), "borderWidth");
    v11 = v10;
    -[HUCheckmarkAccessoryView layer](v4, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", v11);

    -[HUCheckmarkAccessoryView _updateColors](v4, "_updateColors");
  }
  return v4;
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)HUCheckmarkAccessoryView;
  -[HUCheckmarkAccessoryView layoutSubviews](&v5, sel_layoutSubviews);
  -[HUCheckmarkAccessoryView bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[HUCheckmarkAccessoryView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[HUCheckmarkAccessoryView checkmarkImageView](self, "checkmarkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCheckmarkAccessoryView;
  -[HUCheckmarkAccessoryView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[HUCheckmarkAccessoryView _updateColors](self, "_updateColors");
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  self->_checked = a3;
  -[HUCheckmarkAccessoryView _updateColors](self, "_updateColors");
  -[HUCheckmarkAccessoryView checkmarkImageView](self, "checkmarkImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", !v3);

}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[HUCheckmarkAccessoryView _updateColors](self, "_updateColors");
}

- (void)_updateColors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[HUCheckmarkAccessoryView disabled](self, "disabled"))
    objc_msgSend((id)objc_opt_class(), "grayBorderColor");
  else
    -[HUCheckmarkAccessoryView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCheckmarkAccessoryView checkmarkImageView](self, "checkmarkImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  if (-[HUCheckmarkAccessoryView checked](self, "checked"))
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend((id)objc_opt_class(), "grayBorderColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v7, "CGColor");
  -[HUCheckmarkAccessoryView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

}

+ (double)borderWidth
{
  void *v2;
  double v3;
  double v4;
  double result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  result = 1.66666663;
  if (v4 < 3.0)
    return 1.5;
  return result;
}

+ (id)grayBorderColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.400000006);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
