@implementation MRUTransportButton

- (MRUTransportButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUTransportButton *v7;
  MRUTransportButton *v8;
  void *v9;
  uint64_t v10;
  UIView *backgroundView;
  void *v12;
  MRUCAPackageView *v13;
  MRUCAPackageView *packageView;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MRUTransportButton;
  v7 = -[MPButton initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[MRUTransportButton setCursorScale:](v7, "setCursorScale:", 1.0);
    -[MRUTransportButton imageView](v8, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 4);

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = (UIView *)v10;

    -[UIView setUserInteractionEnabled:](v8->_backgroundView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8->_backgroundView, "setBackgroundColor:", v12);

    -[MRUTransportButton insertSubview:atIndex:](v8, "insertSubview:atIndex:", v8->_backgroundView, 0);
    v13 = objc_alloc_init(MRUCAPackageView);
    packageView = v8->_packageView;
    v8->_packageView = v13;

    -[MRUTransportButton addSubview:](v8, "addSubview:", v8->_packageView);
    -[MRUTransportButton setAdjustsImageWhenHighlighted:](v8, "setAdjustsImageWhenHighlighted:", 0);
    v8->_showHighlightCircle = 1;
    v8->_scaleOnHighlight = 1;
    v8->_isRunningSymbolEffect = 0;
    -[MRUTransportButton setPointerInteractionEnabled:](v8, "setPointerInteractionEnabled:", 1);
    -[MRUTransportButton setPointerStyleProvider:](v8, "setPointerStyleProvider:", &__block_literal_global_6);
    -[MRUTransportButton updateBackgroundView](v8, "updateBackgroundView");
    -[MRUTransportButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel_didSelect_, 64);
  }
  return v8;
}

id __36__MRUTransportButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", v2);
  v4 = objc_msgSend(v2, "isSelected");
  v5 = (id *)0x1E0DC3B20;
  if (!v4)
    v5 = (id *)0x1E0DC3B08;
  objc_msgSend(*v5, "effectWithPreview:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3B30];
  v8 = (void *)MEMORY[0x1E0DC3508];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v8, "bezierPathWithOvalInRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shapeWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)MRUTransportButton;
  -[MPButton layoutSubviews](&v10, sel_layoutSubviews);
  -[MRUTransportButton bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetHeight(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetWidth(v12);
  UIRectGetCenter();
  -[UIView setCenter:](self->_backgroundView, "setCenter:");
  -[UIView setBounds:](self->_backgroundView, "setBounds:", 0.0, 0.0, v8, v7);
  -[MRUTransportButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundView);
  UIRectGetCenter();
  -[MRUCAPackageView setCenter:](self->_packageView, "setCenter:");
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v9 * 0.5);
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUTransportButton updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUTransportButton updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setPackageScale:(double)a3
{
  self->_packageScale = a3;
  -[MRUTransportButton updateContentView](self, "updateContentView");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__MRUTransportButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E5818C88;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.2, 0.0);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__MRUTransportButton_setHighlighted___block_invoke_2;
    v5[3] = &unk_1E5818C88;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v5, 0, 0.3175, 0.0, 1.0, 845.74, 58.1632, 0.0);
  }
}

uint64_t __37__MRUTransportButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHighlighted");
}

uint64_t __37__MRUTransportButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateHighlighted");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setSelected:](&v6, sel_setSelected_);
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __34__MRUTransportButton_setSelected___block_invoke;
    v5[3] = &unk_1E5818C88;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v5, 0, 0.2, 0.0);
  }
  else
  {
    -[MRUTransportButton updateBackgroundView](self, "updateBackgroundView");
  }
  -[MRUTransportButton updateVisualStyling](self, "updateVisualStyling");
}

uint64_t __34__MRUTransportButton_setSelected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateBackgroundView");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[MRUTransportButton updateVisualStyling](self, "updateVisualStyling");
}

- (void)setPackageState:(unint64_t)a3
{
  id v4;

  self->_packageState = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("State %ld"), a3 + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setPackageGlyphState:](self, "setPackageGlyphState:", v4);

}

- (void)setTransportControlItem:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  objc_storeStrong((id *)&self->_transportControlItem, a3);
  v5 = a3;
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton setAsset:](self, "setAsset:", v6);

  v7 = objc_msgSend(v5, "isEnabled");
  -[MRUTransportButton setEnabled:](self, "setEnabled:", v7);
}

- (void)setAsset:(id)a3
{
  -[MRUTransportButton setAsset:animated:](self, "setAsset:animated:", a3, 0);
}

- (void)setAsset:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "packageAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MRUTransportButton setImage:forState:animated:](self, "setImage:forState:animated:", 0, 0, v4);
    -[MRUTransportButton packageView](self, "packageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "packageAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAsset:", v9);

    objc_msgSend(v6, "accessibilityIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[MRUTransportButton packageView](self, "packageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

  }
  else
  {
    -[MRUTransportButton clearPackage](self, "clearPackage");
    objc_msgSend(v6, "image");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[MRUTransportButton setImage:forState:animated:](self, "setImage:forState:animated:", v11, 0, v4);
  }

}

- (void)setImage:(id)a3 forState:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;

  v5 = a5;
  v8 = a3;
  if (!v5)
    goto LABEL_8;
  -[MRUTransportButton currentImage](self, "currentImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  v11 = objc_msgSend(v9, "isEqual:", v8);

  if (v11)
  {
LABEL_7:

    goto LABEL_8;
  }
  -[MRUTransportButton currentImage](self, "currentImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_8:
    -[MRUTransportButton setImage:forState:](self, "setImage:forState:", v8, a4);
    goto LABEL_9;
  }
  -[MRUTransportButton imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_removeAllAnimations:", 1);
  -[MRUTransportButton setPendingImage:](self, "setPendingImage:", v8);
  v14 = MEMORY[0x1E0C809B0];
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke;
  v22[3] = &unk_1E5818CB0;
  v22[4] = self;
  v23 = v13;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke_2;
  v17[3] = &unk_1E5819600;
  v17[4] = self;
  v20 = a4;
  v21 = 6;
  v18 = v8;
  v19 = v23;
  v16 = v23;
  objc_msgSend(v15, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 6, v22, v17, 0.3175, 0.0, 1.0, 845.74, 58.1632, 0.0);

LABEL_9:
}

uint64_t __49__MRUTransportButton_setImage_forState_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scaleDownImageView");
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __49__MRUTransportButton_setImage_forState_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "pendingImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:forState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = *(_QWORD *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MRUTransportButton_setImage_forState_animated___block_invoke_3;
  v6[3] = &unk_1E5818CB0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v5, v6, 0, 0.9975, 0.0, 2.0, 300.0, 30.0, 0.0);

}

uint64_t __49__MRUTransportButton_setImage_forState_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resetImageViewScale");
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  -[MRUTransportButton setPendingImage:](self, "setPendingImage:", 0);
  v7.receiver = self;
  v7.super_class = (Class)MRUTransportButton;
  -[MRUTransportButton setImage:forState:](&v7, sel_setImage_forState_, v6, a4);

}

- (void)setPackageGlyphState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRUTransportButton packageView](self, "packageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGlyphState:", v4);

}

- (void)clearPackage
{
  -[MRUCAPackageView clear](self->_packageView, "clear");
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)addSymbolEffectIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!-[MRUTransportButton isRunningSymbolEffect](self, "isRunningSymbolEffect"))
  {
    -[MRUTransportButton transportControlItem](self, "transportControlItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "symbolEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolEffectOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[MRUTransportButton setIsRunningSymbolEffect:](self, "setIsRunningSymbolEffect:", 1);
      objc_initWeak(&location, self);
      -[MRUTransportButton imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__MRUTransportButton_addSymbolEffectIfNeeded__block_invoke;
      v8[3] = &unk_1E5819628;
      objc_copyWeak(&v9, &location);
      objc_msgSend(v7, "addSymbolEffect:options:animated:completion:", v5, v6, 1, v8);

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }

  }
}

void __45__MRUTransportButton_addSymbolEffectIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsRunningSymbolEffect:", 0);

}

- (void)didSelect:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v4 = a3;
  -[MRUTransportButton transportControlItem](self, "transportControlItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHolding");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v8, "mainAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MRUTransportButton setPackageState:](self, "setPackageState:", (-[MRUTransportButton packageState](self, "packageState") + 1) & 3);
      -[MRUTransportButton addSymbolEffectIfNeeded](self, "addSymbolEffectIfNeeded");
      objc_msgSend(v8, "mainAction");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }

}

- (id)pointerStyleWithProposedEffect:(id)a3 proposedShape:(id)a4
{
  void *v4;
  id v7;
  id v8;
  int64_t pointerStyle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  v7 = a3;
  v8 = a4;
  pointerStyle = self->_pointerStyle;
  if (pointerStyle == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
    objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3B30];
    v15 = (void *)MEMORY[0x1E0DC3508];
    -[MRUTransportButton bounds](self, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[MRUTransportButton _continuousCornerRadius](self, "_continuousCornerRadius");
    objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shapeWithPath:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v13, v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (!pointerStyle)
  {
    -[MRUTransportButton bounds](self, "bounds");
    CGRectGetWidth(v28);
    -[MRUTransportButton bounds](self, "bounds");
    CGRectGetHeight(v29);
    -[MRUTransportButton bounds](self, "bounds");
    UIRectCenteredRect();
    v10 = (void *)MEMORY[0x1E0DC3B30];
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shapeWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v7, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  }
  return v4;
}

- (void)updateVisualStyling
{
  uint64_t v3;
  MRUVisualStylingProvider *stylingProvider;
  void *v5;
  MRUVisualStylingProvider *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[MRUTransportButton isDimmed](self, "isDimmed"))
  {
    v3 = 3;
  }
  else if (-[MRUTransportButton isEnabled](self, "isEnabled"))
  {
    v3 = 0;
  }
  else
  {
    v3 = 2;
  }
  stylingProvider = self->_stylingProvider;
  -[MRUTransportButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVisualStylingProvider applyStyle:toView:](stylingProvider, "applyStyle:toView:", v3, v5);

  v6 = self->_stylingProvider;
  -[MRUTransportButton packageView](self, "packageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUVisualStylingProvider applyStyle:toView:](v6, "applyStyle:toView:", v3, v7);

  -[MRUVisualStylingProvider colorForStyle:](self->_stylingProvider, "colorForStyle:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUTransportButton backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void)updateBackgroundView
{
  UIView *backgroundView;
  CGAffineTransform *v4;
  int v5;
  UIView *v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  _OWORD v10[3];
  CGAffineTransform v11;
  CGAffineTransform v12;

  -[UIView setHidden:](self->_backgroundView, "setHidden:", -[MRUTransportButton showHighlightCircle](self, "showHighlightCircle") ^ 1);
  if (-[MRUTransportButton isHighlighted](self, "isHighlighted") && self->_scaleOnHighlight)
  {
    -[UIView setAlpha:](self->_backgroundView, "setAlpha:", 0.1);
    CGAffineTransformMakeScale(&v12, 1.2, 1.2);
    backgroundView = self->_backgroundView;
    v11 = v12;
    v4 = &v11;
  }
  else
  {
    v5 = -[MRUTransportButton isSelected](self, "isSelected");
    v6 = self->_backgroundView;
    if (v5)
    {
      -[UIView setAlpha:](v6, "setAlpha:", 0.1);
      backgroundView = self->_backgroundView;
      v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v10[0] = *MEMORY[0x1E0C9BAA8];
      v10[1] = v7;
      v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v4 = (CGAffineTransform *)v10;
    }
    else
    {
      -[UIView setAlpha:](v6, "setAlpha:", 0.0);
      CGAffineTransformMakeScale(&v9, 1.4, 1.4);
      backgroundView = self->_backgroundView;
      v8 = v9;
      v4 = &v8;
    }
  }
  -[UIView setTransform:](backgroundView, "setTransform:", v4, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)updateContentView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  if (-[MRUTransportButton isHighlighted](self, "isHighlighted"))
  {
    if (self->_scaleOnHighlight)
    {
      -[MRUTransportButton packageScale](self, "packageScale");
      v4 = 0.8 * v3;
      -[MRUTransportButton packageView](self, "packageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setScale:", v4);

      -[MRUTransportButton scaleDownImageViewWithSpeed:](self, "scaleDownImageViewWithSpeed:", 2.0);
    }
  }
  else if (self->_scaleOnHighlight)
  {
    -[MRUTransportButton packageScale](self, "packageScale");
    v7 = v6;
    -[MRUTransportButton packageView](self, "packageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScale:", v7);

    -[MRUTransportButton resetImageViewScaleWithSpeed:](self, "resetImageViewScaleWithSpeed:", 2.0);
  }
}

- (void)updateHighlighted
{
  -[MRUTransportButton updateContentView](self, "updateContentView");
  -[MRUTransportButton updateBackgroundView](self, "updateBackgroundView");
}

- (void)scaleDownImageViewWithSpeed:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  -[MRUTransportButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRUTransportButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isSymbolImage");

    if (v9)
    {
      -[MRUTransportButton imageView](self, "imageView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE8700], "scaleDownEffect");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithSpeed:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSymbolEffect:options:animated:", v10, v11, 1);

    }
    else
    {
      CGAffineTransformMakeScale(&v15, 0.8, 0.8);
      -[MRUTransportButton imageView](self, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      objc_msgSend(v12, "setTransform:", &v14);

    }
  }
}

- (void)scaleDownImageView
{
  -[MRUTransportButton scaleDownImageViewWithSpeed:](self, "scaleDownImageViewWithSpeed:", 1.0);
}

- (void)resetImageViewScaleWithSpeed:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  id v14;
  _OWORD v15[3];

  -[MRUTransportButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRUTransportButton imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_isSymbolImage");

    -[MRUTransportButton imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CE8700], "scaleDownEffect");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CE86E8], "optionsWithSpeed:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeSymbolEffectOfType:options:", v11, v12);

    }
    else
    {
      v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v15[0] = *MEMORY[0x1E0C9BAA8];
      v15[1] = v13;
      v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v10, "setTransform:", v15);

    }
  }
}

- (void)resetImageViewScale
{
  -[MRUTransportButton resetImageViewScaleWithSpeed:](self, "resetImageViewScaleWithSpeed:", 1.0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUTransportControlItem)transportControlItem
{
  return self->_transportControlItem;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (int64_t)pointerStyle
{
  return self->_pointerStyle;
}

- (void)setPointerStyle:(int64_t)a3
{
  self->_pointerStyle = a3;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)showHighlightCircle
{
  return self->_showHighlightCircle;
}

- (void)setShowHighlightCircle:(BOOL)a3
{
  self->_showHighlightCircle = a3;
}

- (BOOL)scaleOnHighlight
{
  return self->_scaleOnHighlight;
}

- (void)setScaleOnHighlight:(BOOL)a3
{
  self->_scaleOnHighlight = a3;
}

- (double)cursorScale
{
  return self->_cursorScale;
}

- (void)setCursorScale:(double)a3
{
  self->_cursorScale = a3;
}

- (double)packageScale
{
  return self->_packageScale;
}

- (unint64_t)packageState
{
  return self->_packageState;
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (UIImage)pendingImage
{
  return self->_pendingImage;
}

- (void)setPendingImage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingImage, a3);
}

- (BOOL)isRunningSymbolEffect
{
  return self->_isRunningSymbolEffect;
}

- (void)setIsRunningSymbolEffect:(BOOL)a3
{
  self->_isRunningSymbolEffect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingImage, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_transportControlItem, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
