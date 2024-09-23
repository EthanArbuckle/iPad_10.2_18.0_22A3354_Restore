@implementation AVBackgroundView

- (BOOL)_isContainedInOverlappingBackgroundView
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;

  -[AVBackgroundView superview](self, "superview");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  do
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend(v3, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  while (v3 && !v6);

  return v7;
}

- (void)_updateBackdropShape
{
  uint64_t v3;
  id v4;

  if (-[AVBackgroundView isCircular](self, "isCircular"))
  {
    v3 = 1;
  }
  else if (-[AVBackgroundView automaticallyDrawsRoundedCorners](self, "automaticallyDrawsRoundedCorners"))
  {
    v3 = 0;
  }
  else
  {
    v3 = 2;
  }
  -[AVBackgroundView layoutView](self, "layoutView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShapeStyle:", v3);

}

- (void)_ensureOrRemoveLayoutView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  AVLayoutView *v6;
  AVLayoutView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[AVBackgroundView _isContainedInOverlappingBackgroundView](self, "_isContainedInOverlappingBackgroundView");
  -[AVBackgroundView layoutView](self, "layoutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "removeFromSuperview");

    -[AVBackgroundView setLayoutView:](self, "setLayoutView:", 0);
  }
  else
  {

    if (!v5)
    {
      v6 = [AVLayoutView alloc];
      -[AVBackgroundView bounds](self, "bounds");
      v7 = -[AVLayoutView initWithFrame:](v6, "initWithFrame:");
      -[AVBackgroundView setLayoutView:](self, "setLayoutView:", v7);

      -[AVBackgroundView _updateBackdropShape](self, "_updateBackdropShape");
      -[AVBackgroundView layoutView](self, "layoutView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPrefersLowQualityEffects:", -[AVBackgroundView prefersLowQualityEffects](self, "prefersLowQualityEffects"));

      -[AVBackgroundView layoutView](self, "layoutView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);

    }
    -[AVBackgroundView layoutView](self, "layoutView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVBackgroundView sendSubviewToBack:](self, "sendSubviewToBack:", v10);

    -[AVBackgroundView layoutView](self, "layoutView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[AVBackgroundView bounds](self, "bounds");
    objc_msgSend(v11, "setFrame:");

  }
}

- (AVLayoutView)layoutView
{
  return self->_layoutView;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)setLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_layoutView, a3);
}

- (BOOL)prefersLowQualityEffects
{
  return self->_prefersLowQualityEffects;
}

- (BOOL)automaticallyDrawsRoundedCorners
{
  return self->_automaticallyDrawsRoundedCorners;
}

- (void)addSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  if (v8)
  {
    v12 = v8;
    -[AVBackgroundView _ensureOrRemoveLayoutView](self, "_ensureOrRemoveLayoutView");
    if (a5 == 1)
    {
      +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v12);
    }
    else if (!a5)
    {
      +[AVBackdropView applyPrimaryGlyphTintToView:](AVBackdropView, "applyPrimaryGlyphTintToView:", v12);
    }
    -[AVBackgroundView addSubview:](self, "addSubview:", v12);
    v8 = v12;
    if (a4 == 1)
    {
      +[AVBackdropView secondaryMaterialOverlayView](AVBackdropView, "secondaryMaterialOverlayView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AVBackgroundView addSubview:](self, "addSubview:", v9);
      v10 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v9, "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activateConstraints:", v11);

      v8 = v12;
    }
  }

}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  -[AVBackgroundView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[AVBackgroundView _ensureOrRemoveLayoutView](self, "_ensureOrRemoveLayoutView");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  -[AVBackgroundView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[AVBackgroundView _ensureOrRemoveLayoutView](self, "_ensureOrRemoveLayoutView");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVBackgroundView;
  -[AVBackgroundView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVBackgroundView _ensureOrRemoveLayoutView](self, "_ensureOrRemoveLayoutView");
}

- (void)setCircular:(BOOL)a3
{
  if (self->_circular != a3)
  {
    self->_circular = a3;
    -[AVBackgroundView _updateBackdropShape](self, "_updateBackdropShape");
  }
}

- (AVBackgroundView)initWithFrame:(CGRect)a3
{
  AVBackgroundView *v3;
  AVBackgroundView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVBackgroundView;
  v3 = -[AVBackgroundView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_automaticallyDrawsRoundedCorners = 1;
    -[AVBackgroundView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);

  }
  return v4;
}

- (void)setAutomaticallyDrawsRoundedCorners:(BOOL)a3
{
  if (self->_automaticallyDrawsRoundedCorners != a3)
  {
    self->_automaticallyDrawsRoundedCorners = a3;
    -[AVBackgroundView _updateBackdropShape](self, "_updateBackdropShape");
  }
}

- (void)setPrefersLowQualityEffects:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_prefersLowQualityEffects != a3)
  {
    v3 = a3;
    self->_prefersLowQualityEffects = a3;
    -[AVBackgroundView layoutView](self, "layoutView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrefersLowQualityEffects:", v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutView, 0);
}

@end
