@implementation CCUICAPackageView

- (BOOL)ccui_configureForPunchOutRendering:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  v3 = a3;
  -[CCUICAPackageView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = *MEMORY[0x1E0CD2C50];
  else
    v6 = 0;
  objc_msgSend(v4, "setCompositingFilter:", v6);
  objc_msgSend(v5, "superlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = !v3;
  objc_msgSend(v7, "setAllowsGroupOpacity:", v8);
  objc_msgSend(v7, "setAllowsGroupBlending:", v8);

  return 1;
}

- (id)ccui_punchOutCompensatingCopy
{
  void *v2;

  v2 = (void *)-[CCUICAPackageView copy](self, "copy");
  objc_msgSend(v2, "ccui_updatePunchOutCompensationIfNecessary");
  return v2;
}

- (void)ccui_setCompensationAlpha:(double)a3
{
  if (a3 > 0.15)
    a3 = 0.15;
  -[CCUICAPackageView setAlpha:](self, "setAlpha:", a3);
}

- (void)ccui_updatePunchOutCompensationIfNecessary
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.37254902, 0.37254902, 0.37254902, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICAPackageView ccui_applyGlyphTintColor:](self, "ccui_applyGlyphTintColor:", v3);

  -[CCUICAPackageView alpha](self, "alpha");
  -[CCUICAPackageView ccui_setCompensationAlpha:](self, "ccui_setCompensationAlpha:");
}

- (void)ccui_applyGlyphTintColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  -[CCUICAPackageView _ccui_colorAppearanceTraitRegistration](self, "_ccui_colorAppearanceTraitRegistration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CCUICAPackageView unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v5);

  }
  v7 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke;
    v23[3] = &unk_1E8E20640;
    v24 = v4;
    -[CCUICAPackageView registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v8, v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[CCUICAPackageView _ccui_setColorAppearanceTraitRegistration:](self, "_ccui_setColorAppearanceTraitRegistration:", v9);
  -[CCUICAPackageView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_2;
  aBlock[3] = &unk_1E8E20668;
  v22 = v14;
  v15 = v14;
  v16 = _Block_copy(aBlock);
  -[CCUICAPackageView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_3;
  v19[3] = &unk_1E8E20690;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "ccuiEnumerateSubtreeUsingBlock:", v19);

}

uint64_t __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ccui_applyGlyphTintColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_2(uint64_t a1, CGColorRef color)
{
  id v2;
  uint64_t v3;

  if (!color)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", CGColorGetAlpha(color));
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

void __71__CCUICAPackageView_CCUIGlyphTintingSupport__ccui_applyGlyphTintColor___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v8;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setFillColor:", (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "fillColor")));
    objc_msgSend(v7, "setStrokeColor:", (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v7, "strokeColor")));
  }
  else if (!v4)
  {
    objc_msgSend(v8, "setBackgroundColor:", (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "backgroundColor")));
  }

}

- (id)_ccui_colorAppearanceTraitRegistration
{
  return objc_getAssociatedObject(self, "CCUIGlyphTintingColorAppearanceTraitRegistrationKey");
}

- (void)_ccui_setColorAppearanceTraitRegistration:(id)a3
{
  objc_setAssociatedObject(self, "CCUIGlyphTintingColorAppearanceTraitRegistrationKey", a3, (void *)1);
}

- (void)setPackage:(id)a3
{
  CAPackage *v5;

  v5 = (CAPackage *)a3;
  if (self->_package != v5)
  {
    objc_storeStrong((id *)&self->_package, a3);
    -[CCUICAPackageView _setPackage:](self, "_setPackage:", v5);
  }

}

- (void)setPackageDescription:(id)a3
{
  CCUICAPackageDescription *v5;
  CCUICAPackageDescription **p_packageDescription;
  void *v7;
  void *v8;
  CCUICAPackageDescription *v9;
  _QWORD v10[5];

  v5 = (CCUICAPackageDescription *)a3;
  p_packageDescription = &self->_packageDescription;
  if (self->_packageDescription != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_packageDescription, a3);
    objc_msgSend(MEMORY[0x1E0CD27F8], "ccuiPackageFromDescription:", *p_packageDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackage:](self, "setPackage:", v7);

    -[CCUICAPackageDescription stateUpdateHandlers](*p_packageDescription, "stateUpdateHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __43__CCUICAPackageView_setPackageDescription___block_invoke;
      v10[3] = &unk_1E8E20988;
      v10[4] = self;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
    }

    v5 = v9;
  }

}

void __43__CCUICAPackageView_setPackageDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void (**v6)(id, id);
  void *v7;
  BOOL v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v6 = a3;
  objc_msgSend(v5, "stateWithName:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeState:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "addState:", v7);
  }

}

- (void)setStateName:(id)a3
{
  _BOOL4 v4;
  double v5;
  int v6;
  id v7;

  -[CALayer stateWithName:](self->_packageLayer, "stateWithName:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CCUICAPackageDescription honorsUIViewAnimationState](self->_packageDescription, "honorsUIViewAnimationState");
  LODWORD(v5) = 1.0;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", v5);
    LODWORD(v5) = 0;
    if (v6)
      *(float *)&v5 = 1.0;
  }
  -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v7, self->_packageLayer, v5);

}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[CCUICAPackageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CCUICAPackageView)initWithFrame:(CGRect)a3
{
  CCUICAPackageView *v3;
  CCUICAPackageView *v4;
  UIView *v5;
  UIView *packageContentView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUICAPackageView;
  v3 = -[CCUICAPackageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scale = 1.0;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    packageContentView = v4->_packageContentView;
    v4->_packageContentView = v5;

    -[CCUICAPackageView addSubview:](v4, "addSubview:", v4->_packageContentView);
    -[CCUICAPackageView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  UIView *packageContentView;
  double scale;
  __int128 v5;
  UIView *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUICAPackageView;
  -[CCUICAPackageView layoutSubviews](&v9, sel_layoutSubviews);
  packageContentView = self->_packageContentView;
  -[CCUICAPackageView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](packageContentView, "setCenter:");
  scale = self->_scale;
  memset(&v8, 0, sizeof(v8));
  if (fabs(scale + -1.0) >= 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v8, scale, scale);
  }
  else
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8.c = v5;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v6 = self->_packageContentView;
  v7 = v8;
  -[UIView setTransform:](v6, "setTransform:", &v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CCUICAPackageView *v4;
  CCUICAPackageView *v5;
  CAStateController *stateController;
  void *v7;

  v4 = [CCUICAPackageView alloc];
  -[CCUICAPackageView frame](self, "frame");
  v5 = -[CCUICAPackageView initWithFrame:](v4, "initWithFrame:");
  -[CCUICAPackageView setPackageDescription:](v5, "setPackageDescription:", self->_packageDescription);
  stateController = v5->_stateController;
  -[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", self->_packageLayer);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAStateController setState:ofLayer:](stateController, "setState:ofLayer:", v7, v5->_packageLayer);

  -[CCUICAPackageView setScale:](v5, "setScale:", self->_scale);
  return v5;
}

- (void)_setPackage:(id)a3
{
  CALayer *packageLayer;
  id v5;
  CALayer *v6;
  uint64_t v7;
  void *v8;
  UIView *packageContentView;
  CALayer *v10;
  CALayer *v11;
  CAStateController *v12;
  CAStateController *stateController;

  packageLayer = self->_packageLayer;
  v5 = a3;
  -[CALayer removeFromSuperlayer](packageLayer, "removeFromSuperlayer");
  objc_msgSend(v5, "rootLayer");
  v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isGeometryFlipped");

  -[CALayer setGeometryFlipped:](v6, "setGeometryFlipped:", v7);
  -[UIView layer](self->_packageContentView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSublayer:", v6);

  packageContentView = self->_packageContentView;
  -[CALayer bounds](v6, "bounds");
  -[UIView setBounds:](packageContentView, "setBounds:");
  v10 = self->_packageLayer;
  self->_packageLayer = v6;
  v11 = v6;

  v12 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v11);
  stateController = self->_stateController;
  self->_stateController = v12;

  -[CCUICAPackageView setNeedsLayout](self, "setNeedsLayout");
}

- (CAPackage)package
{
  return self->_package;
}

- (CCUICAPackageDescription)packageDescription
{
  return self->_packageDescription;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageDescription, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_packageContentView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
