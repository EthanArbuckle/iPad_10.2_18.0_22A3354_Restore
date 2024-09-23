@implementation MUImageView

- (MUImageView)initWithFrame:(CGRect)a3
{
  MUImageView *v3;
  MUImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUImageView;
  v3 = -[MUImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUImageView _setupSubviews](v3, "_setupSubviews");
  return v4;
}

- (void)_setupSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *v8;
  UIImageView *fallbackImageView;
  void *v10;
  UIImageView *v11;
  UIImageView *contentImageView;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  fallbackImageView = self->_fallbackImageView;
  self->_fallbackImageView = v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.78039217, 0.78039217, 0.800000012, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_fallbackImageView, "setTintColor:", v10);

  -[UIImageView setContentMode:](self->_fallbackImageView, "setContentMode:", 1);
  -[UIImageView setFrame:](self->_fallbackImageView, "setFrame:", 0.0, 0.0, 50.0, 50.0);
  -[MUImageView addSubview:](self, "addSubview:", self->_fallbackImageView);
  v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  contentImageView = self->_contentImageView;
  self->_contentImageView = v11;

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_contentImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIImageView setClipsToBounds:](self->_contentImageView, "setClipsToBounds:", 1);
  -[UIImageView setContentMode:](self->_contentImageView, "setContentMode:", 2);
  -[MUImageView addSubview:](self, "addSubview:", self->_contentImageView);
}

- (void)layoutSubviews
{
  double MidX;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)MUImageView;
  -[MUImageView layoutSubviews](&v4, sel_layoutSubviews);
  -[MUImageView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_contentImageView, "setFrame:");
  -[MUImageView bounds](self, "bounds");
  MidX = CGRectGetMidX(v5);
  -[MUImageView bounds](self, "bounds");
  -[UIImageView setCenter:](self->_fallbackImageView, "setCenter:", MidX, CGRectGetMidY(v6));
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  -[MUImageView image](self, "image");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    if (a4)
    {
      objc_initWeak(&location, self);
      v8 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __33__MUImageView_setImage_animated___block_invoke;
      v11[3] = &unk_1E2E01AB0;
      objc_copyWeak(&v13, &location);
      v12 = v6;
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __33__MUImageView_setImage_animated___block_invoke_2;
      v9[3] = &unk_1E2E01DA8;
      objc_copyWeak(&v10, &location);
      -[UIView _mapsui_performImageLoadingTransitionWithAnimations:completion:](self, "_mapsui_performImageLoadingTransitionWithAnimations:completion:", v11, v9);
      objc_destroyWeak(&v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      -[UIImageView setImage:](self->_contentImageView, "setImage:", v6);
      -[MUImageView _updateAppearance](self, "_updateAppearance");
    }
  }

}

void __33__MUImageView_setImage_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[53], "setImage:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __33__MUImageView_setImage_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAppearance");
    WeakRetained = v2;
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;

  -[MUImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    || (-[MUImageView fallbackImage](self, "fallbackImage"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = v3 == 0;
    v6 = v3 == 0;
    v7 = !v5;
    -[UIImageView setHidden:](self->_fallbackImageView, "setHidden:", v7);
    -[UIImageView setHidden:](self->_contentImageView, "setHidden:", v6);
  }
}

- (void)setImage:(id)a3
{
  -[MUImageView setImage:animated:](self, "setImage:animated:", a3, 0);
}

- (UIImage)image
{
  return -[UIImageView image](self->_contentImageView, "image");
}

- (void)setFallbackImage:(id)a3
{
  -[UIImageView setImage:](self->_fallbackImageView, "setImage:", a3);
  -[MUImageView _updateAppearance](self, "_updateAppearance");
}

- (UIImage)fallbackImage
{
  return -[UIImageView image](self->_fallbackImageView, "image");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImageView sizeThatFits:](self->_contentImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_contentImageView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UIImageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentImageView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_fallbackImageView, 0);
}

@end
