@implementation CAMSlashContainer

- (CAMSlashContainer)initWithFrame:(CGRect)a3
{
  CAMSlashContainer *v3;
  CAMSlashContainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMSlashContainer;
  v3 = -[CAMSlashContainer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_orientation = 1;
    -[CAMSlashContainer setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMSlashContainer contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[CAMSlashContainer contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v29;

  -[CAMSlashContainer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  -[CAMSlashContainer traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");

  -[CAMSlashContainer contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewSetBoundsAndCenterForFrame(v12, v4, v6, v8, v10);

  -[CAMSlashContainer _slashView](self, "_slashView");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CAMSlashContainer _slashMaskView](self, "_slashMaskView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CAMSlashContainer _slashMaskView](self, "_slashMaskView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CAMViewSetBoundsAndCenterForFrame(v16, v4, v6, v8, v10);

      -[CAMSlashContainer slashSize](self, "slashSize");
      CEKRectWithSize();
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      UIRectCenteredAboutPointScale();
      UIRectGetCenter();
      v26 = v25;
      v28 = v27;
      -[CAMSlashContainer _slashView](self, "_slashView");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setCenter:", v26, v28);
      objc_msgSend(v29, "setBounds:", v18, v20, v22, v24);
      -[CAMSlashContainer _updateSlashAnimated:](self, "_updateSlashAnimated:", 0);

    }
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMSlashContainer setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[CAMSlashContainer _updateOrientationAnimated:](self, "_updateOrientationAnimated:", a4);
  }
}

- (void)_updateOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = -[CAMSlashContainer orientation](self, "orientation");
  -[CAMSlashContainer contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, v5, v3);

  -[CAMSlashContainer _slashView](self, "_slashView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v7, v5, v3);

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  CAMSlashContainer *v8;
  void *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v11 = v5;
    -[UIView superview](contentView, "superview");
    v8 = (CAMSlashContainer *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[UIView removeFromSuperview](*p_contentView, "removeFromSuperview");
    -[CAMSlashContainer _slashMaskView](self, "_slashMaskView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView maskView](*p_contentView, "maskView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v9)
      -[UIView setMaskView:](*p_contentView, "setMaskView:", 0);
    objc_storeStrong((id *)&self->_contentView, a3);
    -[CAMSlashContainer addSubview:](self, "addSubview:", v11);
    -[UIView setMaskView:](v11, "setMaskView:", v9);
    -[CAMSlashContainer _updateOrientationAnimated:](self, "_updateOrientationAnimated:", 0);

    v5 = v11;
  }

}

- (void)setSlashed:(BOOL)a3
{
  -[CAMSlashContainer setSlashed:animated:](self, "setSlashed:animated:", a3, 0);
}

- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  CAMSlashMaskView *v7;
  void *v8;
  CAMSlashView *v9;

  if (self->_slashed != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CAMSlashContainer _slashView](self, "_slashView");
    v9 = (CAMSlashView *)objc_claimAutoreleasedReturnValue();
    -[CAMSlashContainer _slashMaskView](self, "_slashMaskView");
    v7 = (CAMSlashMaskView *)objc_claimAutoreleasedReturnValue();
    if (v5 && !v9 && !v7)
    {
      v7 = objc_alloc_init(CAMSlashMaskView);
      v9 = objc_alloc_init(CAMSlashView);
      -[CAMSlashContainer _setSlashView:](self, "_setSlashView:", v9);
      -[CAMSlashContainer _setSlashMaskView:](self, "_setSlashMaskView:", v7);
      -[CAMSlashContainer _updateOrientationAnimated:](self, "_updateOrientationAnimated:", 0);
      -[CAMSlashContainer contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMaskView:", v7);

      -[CAMSlashContainer addSubview:](self, "addSubview:", v9);
      -[CAMSlashContainer layoutIfNeeded](self, "layoutIfNeeded");
    }
    self->_slashed = v5;
    -[CAMSlashContainer _updateSlashAnimated:](self, "_updateSlashAnimated:", v4);

  }
}

- (void)_updateSlashAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  -[CAMSlashContainer _slashView](self, "_slashView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSlashContainer _slashMaskView](self, "_slashMaskView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMSlashContainer isSlashed](self, "isSlashed");
  objc_msgSend(v7, "bounds");
  objc_msgSend(v5, "convertRect:fromView:", v7);
  objc_msgSend(v5, "setSlashBounds:animated:", v3);
  objc_msgSend(v7, "setVisible:animated:", v6, v3);

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isSlashed
{
  return self->_slashed;
}

- (CGSize)slashSize
{
  double width;
  double height;
  CGSize result;

  width = self->_slashSize.width;
  height = self->_slashSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSlashSize:(CGSize)a3
{
  self->_slashSize = a3;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (void)_setSlashView:(id)a3
{
  objc_storeStrong((id *)&self->__slashView, a3);
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (void)_setSlashMaskView:(id)a3
{
  objc_storeStrong((id *)&self->__slashMaskView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashMaskView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
