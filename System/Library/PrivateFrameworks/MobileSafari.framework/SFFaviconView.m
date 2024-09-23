@implementation SFFaviconView

- (UIImage)icon
{
  return self->_icon;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", a3);
}

- (void)setThemeColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_themeColor, a3);
    -[SFFaviconView _updateIconBackingColorAndInset](self, "_updateIconBackingColorAndInset");
  }

}

- (void)setTrailingInsetChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (SFFaviconView)initWithFrame:(CGRect)a3
{
  SFFaviconView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  SFFaviconView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFFaviconView;
  v3 = -[SFFaviconView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[SFFaviconView addSubview:](v3, "addSubview:", v3->_imageView);
    -[SFFaviconView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 3.0);
    v6 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;
  CGRect v5;

  v3.receiver = self;
  v3.super_class = (Class)SFFaviconView;
  -[SFFaviconView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFFaviconView bounds](self, "bounds");
  v5 = CGRectInset(v4, 1.0, 1.0);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (double)trailingInset
{
  return self->_trailingInset;
}

- (void)setIconContentMode:(int64_t)a3
{
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", a3);
}

- (void)setIcon:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[UIImageView setImage:](self->_imageView, "setImage:", v5);
    -[SFFaviconView _updateIconBackingColorAndInset](self, "_updateIconBackingColorAndInset");
  }

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  v4 = v3 + 2.0;
  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  v6 = v5 + 2.0;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)_updateIconBackingColorAndInset
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  SFFaviconView *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  CGRect v19;

  v17 = 0u;
  v18 = 0u;
  -[SFFaviconView _determineIconBackingColorAndInsets:](self, "_determineIconBackingColorAndInsets:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __48__SFFaviconView__updateIconBackingColorAndInset__block_invoke;
  v14 = &unk_1E21E2258;
  v15 = self;
  v16 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", &v11);
  -[UIImage size](self->_icon, "size", v11, v12, v13, v14, v15);
  v7 = v6;
  v8 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v9 = fmax(v7 - *((double *)&v18 + 1), 0.0);
  if (v8)
    v10 = v9;
  else
    v10 = *((double *)&v17 + 1);
  -[UIImageView bounds](self->_imageView, "bounds");
  -[SFFaviconView setTrailingInset:](self, "setTrailingInset:", v10 * (CGRectGetWidth(v19) / v7));

}

- (void)setTrailingInset:(double)a3
{
  void (**trailingInsetChangeHandler)(void);

  if (self->_trailingInset != a3)
  {
    self->_trailingInset = a3;
    trailingInsetChangeHandler = (void (**)(void))self->_trailingInsetChangeHandler;
    if (trailingInsetChangeHandler)
      trailingInsetChangeHandler[2]();
  }
}

- (id)_determineIconBackingColorAndInsets:(UIEdgeInsets *)a3
{
  CGFloat v5;
  CGFloat v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21;
  uint64_t v22;

  if (a3)
  {
    -[UIImage size](self->_icon, "size");
    a3->top = 0.0;
    a3->left = 0.0;
    a3->bottom = v6;
    a3->right = v5;
  }
  if (!-[UIImage isSymbolImage](self->_icon, "isSymbolImage")
    && !-[UIImage sf_isMonogram](self->_icon, "sf_isMonogram")
    && -[UIImage renderingMode](self->_icon, "renderingMode") != UIImageRenderingModeAlwaysTemplate)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("FaviconBackingColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0.0;
    v22 = 0;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(MEMORY[0x1E0D8AC90], "keyColorForIcon:allowAllColors:confidence:nonTransparentConfidence:insets:", self->_icon, 1, &v22, &v21, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && self->_themeColor)
    {
      objc_msgSend(v10, "safari_contrastRatioWithColor:");
      v13 = v12;
      objc_msgSend(v11, "safari_contrastRatioWithColor:", v9);
      if (v13 < 2.5 && v14 > 1.01 && v21 > 0.5)
        goto LABEL_19;
    }
    else
    {
      -[SFFaviconView traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "userInterfaceStyle") == 2)
      {
        v17 = -[UIImage sf_shouldApplyBackingForDarkBackdrop](self->_icon, "sf_shouldApplyBackingForDarkBackdrop");

        if (v17)
        {
LABEL_19:
          v7 = v9;
LABEL_23:

          return v7;
        }
      }
      else
      {

      }
    }
    v7 = 0;
    if (a3)
    {
      v18 = v20;
      *(_OWORD *)&a3->top = v19;
      *(_OWORD *)&a3->bottom = v18;
    }
    goto LABEL_23;
  }
  v7 = 0;
  return v7;
}

uint64_t __48__SFFaviconView__updateIconBackingColorAndInset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  v3 = v2 != 0;
  v4 = 0.0;
  if (v2)
    v4 = 2.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "_setContinuousCornerRadius:", v4);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setClipsToBounds:", v3);
}

- (int64_t)iconContentMode
{
  return -[UIImageView contentMode](self->_imageView, "contentMode");
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return -[UIImageView preferredSymbolConfiguration](self->_imageView, "preferredSymbolConfiguration");
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (id)trailingInsetChangeHandler
{
  return self->_trailingInsetChangeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingInsetChangeHandler, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
