@implementation MUBlurView

- (MUBlurView)initWithVariableBlurWithRadius:(double)a3 maskImage:(CGImage *)a4
{
  MUBlurView *v6;
  MUBlurView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MUBlurView;
  v6 = -[MUBlurView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_isVariableBlur = 1;
    v6->_blurRadius = a3;
    v6->_variableBlurMaskImage = a4;
    -[MUBlurView _setup](v6, "_setup");
  }
  return v7;
}

- (void)setNonBlurredColor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  UIColor *v8;
  UIColor *nonBlurredColor;
  id v10;

  v4 = a3;
  v5 = self->_nonBlurredColor;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v10 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v10;
    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)objc_msgSend(v10, "copy");
      nonBlurredColor = self->_nonBlurredColor;
      self->_nonBlurredColor = v8;

      if (-[MUBlurView style](self, "style") == 2)
        -[MUBlurView setBackgroundColor:](self, "setBackgroundColor:", self->_nonBlurredColor);
      else
        -[MUBlurView _update](self, "_update");
      v6 = (unint64_t)v10;
    }
  }

}

- (void)_update
{
  uint64_t v3;
  void (**v4)(void);
  void (**v5)(void);
  unint64_t v6;
  unint64_t v7;
  void (**v8)(void);
  _QWORD v9[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__MUBlurView__update__block_invoke;
  aBlock[3] = &unk_1E2E01970;
  aBlock[4] = self;
  v4 = (void (**)(void))_Block_copy(aBlock);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __21__MUBlurView__update__block_invoke_2;
  v9[3] = &unk_1E2E01970;
  v9[4] = self;
  v5 = (void (**)(void))_Block_copy(v9);
  v6 = -[MUBlurView style](self, "style");
  if (v6 == 2)
  {
    v8 = v5;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = v4;
  if (v7 == 1)
  {
LABEL_8:
    v8[2]();
    goto LABEL_9;
  }
  if (!v7)
  {
    if (-[MUBlurView shouldBlur](self, "shouldBlur"))
      v8 = v4;
    else
      v8 = v5;
    goto LABEL_8;
  }
LABEL_9:

}

- (unint64_t)style
{
  return self->_style;
}

void __21__MUBlurView__update__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "backgroundEffects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "materialBlurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundEffects:", v2);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "blurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v5, 0);

  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (id)blurView
{
  if (self->_isVariableBlur)
    -[MUBlurView variableBlurView](self, "variableBlurView");
  else
    -[MUBlurView materialBlurView](self, "materialBlurView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIView)variableBlurView
{
  UIView *variableBlurView;
  _MUVariableBlurView *v4;
  UIView *v5;

  variableBlurView = self->_variableBlurView;
  if (!variableBlurView)
  {
    if (self->_isVariableBlur)
    {
      v4 = -[_MUVariableBlurView initWithRadius:maskImage:]([_MUVariableBlurView alloc], "initWithRadius:maskImage:", self->_variableBlurMaskImage, self->_blurRadius);
      v5 = self->_variableBlurView;
      self->_variableBlurView = &v4->super;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_variableBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      variableBlurView = self->_variableBlurView;
    }
    else
    {
      variableBlurView = 0;
    }
  }
  return variableBlurView;
}

- (BOOL)shouldBlur
{
  return self->_shouldBlur;
}

- (UIVisualEffectView)materialBlurView
{
  UIVisualEffectView *materialBlurView;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *backgroundEffects;

  materialBlurView = self->_materialBlurView;
  if (!materialBlurView)
  {
    if (self->_isVariableBlur)
    {
      materialBlurView = 0;
    }
    else
    {
      if (self->_isGaussianBlur)
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", self->_blurRadius);
      else
        objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", self->_blurEffectStyle);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
      v6 = self->_materialBlurView;
      self->_materialBlurView = v5;

      -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_materialBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MUBlurView blurGroupName](self, "blurGroupName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setGroupName:](self->_materialBlurView, "_setGroupName:", v7);

      -[MUBlurView overlayColor](self, "overlayColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](self->_materialBlurView, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

      if (-[NSArray count](self->_backgroundEffects, "count"))
      {
        -[UIVisualEffectView setBackgroundEffects:](self->_materialBlurView, "setBackgroundEffects:", self->_backgroundEffects);
      }
      else
      {
        -[UIVisualEffectView backgroundEffects](self->_materialBlurView, "backgroundEffects");
        v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
        backgroundEffects = self->_backgroundEffects;
        self->_backgroundEffects = v10;

      }
      materialBlurView = self->_materialBlurView;
    }
  }
  return materialBlurView;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (void)_setup
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__transparencyStatusDidChange, *MEMORY[0x1E0DC45B8], 0);

  self->_shouldBlur = !UIAccessibilityIsReduceTransparencyEnabled();
  -[MUBlurView _update](self, "_update");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBlurView, 0);
  objc_storeStrong((id *)&self->_variableBlurView, 0);
  objc_storeStrong((id *)&self->_materialBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_nonBlurredColor, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MUBlurView _update](self, "_update");
  }
}

- (void)setBlurGroupName:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  NSString *v8;
  NSString *blurGroupName;
  id v10;

  v4 = a3;
  v5 = self->_blurGroupName;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v10 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v10;
    if ((v7 & 1) == 0 && !self->_isVariableBlur)
    {
      v8 = (NSString *)objc_msgSend(v10, "copy");
      blurGroupName = self->_blurGroupName;
      self->_blurGroupName = v8;

      -[UIVisualEffectView _setGroupName:](self->_materialBlurView, "_setGroupName:", self->_blurGroupName);
      v6 = (unint64_t)v10;
    }
  }

}

- (void)setOverlayColor:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  UIColor *v8;
  UIColor *overlayColor;
  void *v10;
  id v11;

  v4 = a3;
  v5 = self->_overlayColor;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v11 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v11;
    if ((v7 & 1) == 0 && !self->_isVariableBlur)
    {
      v8 = (UIColor *)objc_msgSend(v11, "copy");
      overlayColor = self->_overlayColor;
      self->_overlayColor = v8;

      -[UIVisualEffectView contentView](self->_materialBlurView, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v11);

      -[UIView setBackgroundColor:](self->_nonBlurView, "setBackgroundColor:", v11);
      v6 = (unint64_t)v11;
    }
  }

}

- (MUBlurView)initWithBlurEffectStyle:(int64_t)a3
{
  MUBlurView *v4;
  MUBlurView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUBlurView;
  v4 = -[MUBlurView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_blurEffectStyle = a3;
    -[MUBlurView _setup](v4, "_setup");
  }
  return v5;
}

- (MUBlurView)initWithGaussianBlurWithRadius:(double)a3
{
  MUBlurView *v4;
  MUBlurView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUBlurView;
  v4 = -[MUBlurView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isGaussianBlur = 1;
    v4->_blurRadius = a3;
    -[MUBlurView _setup](v4, "_setup");
  }
  return v5;
}

- (void)setShouldBlur:(BOOL)a3
{
  if (self->_shouldBlur != a3)
  {
    self->_shouldBlur = a3;
    if (!-[MUBlurView style](self, "style"))
      -[MUBlurView _update](self, "_update");
  }
}

void __21__MUBlurView__update__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "blurViewIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "nonBlurredColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "nonBlurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v5, 0);

  v16 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(*(id *)(a1 + 32), "nonBlurView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(*(id *)(a1 + 32), "nonBlurView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v6;
  objc_msgSend(*(id *)(a1 + 32), "nonBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  objc_msgSend(*(id *)(a1 + 32), "nonBlurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

}

- (id)blurViewIfExists
{
  uint64_t v2;

  v2 = 6;
  if (!self->_isVariableBlur)
    v2 = 7;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___MUBlurView__blurEffectStyle[v2]));
}

- (UIView)nonBlurView
{
  UIView *nonBlurView;
  UIView *v4;
  UIView *v5;
  void *v6;

  nonBlurView = self->_nonBlurView;
  if (!nonBlurView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_nonBlurView;
    self->_nonBlurView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_nonBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUBlurView overlayColor](self, "overlayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_nonBlurView, "setBackgroundColor:", v6);

    nonBlurView = self->_nonBlurView;
  }
  return nonBlurView;
}

- (void)setBackgroundEffects:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  NSArray *v8;
  NSArray *backgroundEffects;
  id v10;

  v4 = a3;
  v5 = self->_backgroundEffects;
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v10 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v10;
    if ((v7 & 1) == 0 && !self->_isVariableBlur)
    {
      v8 = (NSArray *)objc_msgSend(v10, "copy");
      backgroundEffects = self->_backgroundEffects;
      self->_backgroundEffects = v8;

      -[MUBlurView _update](self, "_update");
      v6 = (unint64_t)v10;
    }
  }

}

- (void)_transparencyStatusDidChange
{
  -[MUBlurView setShouldBlur:](self, "setShouldBlur:", !UIAccessibilityIsReduceTransparencyEnabled());
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (UIColor)nonBlurredColor
{
  return self->_nonBlurredColor;
}

- (void)setMaterialBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_materialBlurView, a3);
}

- (void)setVariableBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_variableBlurView, a3);
}

- (void)setNonBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_nonBlurView, a3);
}

@end
