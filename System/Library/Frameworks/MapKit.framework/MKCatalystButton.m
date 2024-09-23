@implementation MKCatalystButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MKCatalystButton;
  objc_msgSendSuper2(&v6, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setTallHeight:", 42.0);
    objc_msgSend(v4, "setShortHeight:", 22.0);
  }
  return v4;
}

+ (id)catalystButton
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[MKCatalystButton buttonWithType:](MKCatalystButton, "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentHorizontalAlignment:", 4);
  objc_msgSend(v2, "setContentEdgeInsets:", 5.0, 10.0, 7.0, 10.0);
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakMode:", 0);

  objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "registerForTraitChanges:withAction:", v4, sel_traitEnvironment_didChangeTraitCollection_);

  return v2;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKCatalystButton;
  -[MKCatalystButton didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[MKCatalystButton _updateColors](self, "_updateColors");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[MKCatalystButton subTitle](self, "subTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0CEBDE0];
  if (v3)
    -[MKCatalystButton tallHeight](self, "tallHeight");
  else
    -[MKCatalystButton shortHeight](self, "shortHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_maps_intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)MKCatalystButton;
  -[MKCatalystButton intrinsicContentSize](&v10, sel_intrinsicContentSize);
  v4 = v3;
  -[MKCatalystButton subTitle](self, "subTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[MKCatalystButton tallHeight](self, "tallHeight");
  else
    -[MKCatalystButton shortHeight](self, "shortHeight");
  v7 = v6;

  v8 = v4;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  CGRect v34;

  v33.receiver = self;
  v33.super_class = (Class)MKCatalystButton;
  -[MKCatalystButton layoutSubviews](&v33, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[MKCatalystButton bounds](self, "bounds");
  v4 = round(CGRectGetHeight(v34) * 0.189999998);
  -[MKCatalystButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 0);

  -[MKCatalystButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMasksToBounds:", 0);

  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v4);

  v18 = *MEMORY[0x1E0CD2A68];
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerCurve:", v18);

  -[MKCatalystButton layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCornerRadius:", v4);

  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCornerCurve:", v18);

  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMasksToBounds:", 1);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v3);
}

- (void)buttonSelected:(id)a3
{
  void *v4;
  id WeakRetained;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  id v8;

  v8 = a3;
  -[MKCatalystButton buttonController](self, "buttonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(WeakRetained, "buttonSelectedBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v8;
      else
        v7 = 0;
      ((void (**)(_QWORD, id))v6)[2](v6, v7);
    }

  }
}

- (void)applyBorder:(BOOL)a3
{
  void *v3;
  id v4;
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a3;
  if (a3)
  {
    -[MKCatalystButton titleLabel](self, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v4, "CGColor");
  }
  else
  {
    v7 = 0;
  }
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

  v9 = 0.0;
  if (v5)
  {

    v9 = 1.0;
  }
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", v9);

  if (v5)
  {
    -[MKCatalystButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v4, "CGColor");
  }
  else
  {
    v11 = 0;
  }
  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBorderColor:", v11);

  if (v5)
  {

  }
  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBorderWidth:", v9);

}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB5F8]);
}

- (void)setButtonController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_buttonController);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_buttonController, obj);
    objc_msgSend(obj, "setDelegate:", self);

    v6 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v6, "buttonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)&self->_buttonController);
    objc_msgSend(v8, "buttonSubTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCatalystButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v7, v9);

    -[MKCatalystButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel_buttonSelected_, 64);
    v10 = objc_loadWeakRetained((id *)&self->_buttonController);
    -[MKCatalystButton setEnabled:](self, "setEnabled:", objc_msgSend(v10, "disabled") ^ 1);

  }
}

- (CALayer)extraShadowLayer
{
  CALayer *extraShadowLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;

  extraShadowLayer = self->_extraShadowLayer;
  if (!extraShadowLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_extraShadowLayer;
    self->_extraShadowLayer = v4;

    -[MKCatalystButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:atIndex:", self->_extraShadowLayer, 0);

    -[CALayer setActions:](self->_extraShadowLayer, "setActions:", 0);
    extraShadowLayer = self->_extraShadowLayer;
  }
  return extraShadowLayer;
}

- (CAGradientLayer)gradientLayer
{
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v4;
  CAGradientLayer *v5;
  void *v6;
  CAGradientLayer *v7;
  void *v8;

  gradientLayer = self->_gradientLayer;
  if (!gradientLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v4 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gradientLayer;
    self->_gradientLayer = v4;

    -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", 1);
    -[MKCatalystButton layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_gradientLayer;
    -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:above:", v7, v8);

    -[CAGradientLayer setActions:](self->_gradientLayer, "setActions:", 0);
    gradientLayer = self->_gradientLayer;
  }
  return gradientLayer;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKCatalystButton;
  -[MKCatalystButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[MKCatalystButton _updateColors](self, "_updateColors");
}

- (void)setIsPrimaryButton:(BOOL)a3
{
  self->_isPrimaryButton = a3;
  -[MKCatalystButton _updateColors](self, "_updateColors");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKCatalystButton;
  -[MKCatalystButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[MKCatalystButton _updateColors](self, "_updateColors");
}

- (void)setPrimaryTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MKCatalystButton *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v20 = self;
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "length");
          objc_msgSend(v5, "attributedSubstringFromRange:", v12, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);
          v12 += v15 + objc_msgSend(CFSTR("\n"), "length");

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      self = v20;
      if (!objc_msgSend(v18, "length"))
      {
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));

        v18 = (void *)v19;
      }
    }
    else
    {
      v18 = 0;
      v17 = 0;
      self = v20;
    }

  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  -[MKCatalystButton setTitle:](self, "setTitle:", v17);
  -[MKCatalystButton setSubTitle:](self, "setSubTitle:", v18);
  -[MKCatalystButton _updateColors](self, "_updateColors");

}

- (void)setPrimaryTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!v9)
  {
    -[MKCatalystButton setTitle:](self, "setTitle:", 0);
    if (v6)
      goto LABEL_3;
LABEL_5:
    -[MKCatalystButton setSubTitle:](self, "setSubTitle:", 0);
    goto LABEL_6;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
  -[MKCatalystButton setTitle:](self, "setTitle:", v7);

  if (!v6)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v6);
  -[MKCatalystButton setSubTitle:](self, "setSubTitle:", v8);

LABEL_6:
  -[MKCatalystButton _updateColors](self, "_updateColors");

}

- (void)placeActionButtonControllerTextDidChange:(id)a3
{
  _MKPlaceActionButtonController **p_buttonController;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  p_buttonController = &self->_buttonController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_buttonController);

  if (WeakRetained == v5)
  {
    v10 = objc_loadWeakRetained((id *)p_buttonController);
    objc_msgSend(v10, "buttonTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)p_buttonController);
    objc_msgSend(v8, "buttonSubTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCatalystButton setPrimaryTitle:subtitle:](self, "setPrimaryTitle:subtitle:", v7, v9);

  }
}

- (id)_attributedStringWithTitle:(id)a3 subtitle:(id)a4 controlState:(unint64_t)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  if (v8)
  {
    v9 = (objc_class *)MEMORY[0x1E0CB3778];
    v10 = a3;
    v11 = objc_alloc_init(v9);
    -[MKCatalystButton _attributedStringForTitle:controlState:](self, "_attributedStringForTitle:controlState:", v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "appendAttributedString:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v11, "appendAttributedString:", v13);

    -[MKCatalystButton _attributedStringForSubTitle:controlState:](self, "_attributedStringForSubTitle:controlState:", v8, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendAttributedString:", v14);

    v15 = objc_msgSend(v11, "copy");
  }
  else
  {
    v11 = a3;
    -[MKCatalystButton _attributedStringForTitle:controlState:](self, "_attributedStringForTitle:controlState:", v11, a5);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

  return v16;
}

- (id)_attributedStringForTitle:(id)a3 controlState:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v6 = (void *)MEMORY[0x1E0CEA478];
  v7 = a3;
  objc_msgSend(v6, "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((uint64_t)a4 <= 3)
  {
    if (a4 != 1)
    {
      if (a4 != 2)
        goto LABEL_12;
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.3);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a4 == 4)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a4 != 16711680)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v12 = (void *)v10;

  v9 = v12;
LABEL_12:
  -[MKCatalystButton traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "activeAppearance"))
  {
LABEL_15:

    goto LABEL_16;
  }
  v14 = -[MKCatalystButton isPrimaryButton](self, "isPrimaryButton");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v7);

  objc_msgSend(v15, "removeAttribute:range:", *MEMORY[0x1E0CEA0D0], 0, objc_msgSend(v15, "length"));
  v18[0] = *MEMORY[0x1E0CEA098];
  objc_msgSend((id)objc_opt_class(), "titleFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = *MEMORY[0x1E0CEA0A0];
  v19[0] = v16;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAttributes:range:", v17, 0, objc_msgSend(v15, "length"));

  return v15;
}

- (id)_attributedStringForSubTitle:(id)a3 controlState:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CEA478];
  v7 = a3;
  objc_msgSend(v6, "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  switch(a4)
  {
    case 0uLL:
      -[MKCatalystButton traitCollection](self, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "activeAppearance"))
        goto LABEL_10;
      v12 = -[MKCatalystButton isPrimaryButton](self, "isPrimaryButton");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.850000024);
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_11;
    case 1uLL:
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      objc_msgSend(v8, "colorWithAlphaComponent:", 0.3);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      goto LABEL_11;
    default:
      if (a4 != 16711680)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = v9;
      v9 = (void *)v10;
LABEL_10:

LABEL_11:
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v7);

      objc_msgSend(v13, "removeAttribute:range:", *MEMORY[0x1E0CEA0D0], 0, objc_msgSend(v13, "length"));
      v14 = *MEMORY[0x1E0CEA0A0];
      v24[0] = v9;
      v15 = *MEMORY[0x1E0CEA098];
      v23[0] = v14;
      v23[1] = v15;
      objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB538]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAttributes:range:", v17, 0, objc_msgSend(v13, "length"));

      if (-[MKCatalystButton isPrimaryButton](self, "isPrimaryButton") && objc_msgSend(v13, "length"))
      {
        v21 = v15;
        objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB540]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAttributes:range:", v19, 0, 1);

      }
      return v13;
  }
}

- (void)_updateColors
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  _BYTE v47[128];
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[MKCatalystButton isHighlighted](self, "isHighlighted") & 1) != 0)
  {
    v5 = objc_retainAutorelease(v4);
    v48[0] = objc_msgSend(v5, "CGColor");
    v48[1] = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MKCatalystButton gradientLayer](self, "gradientLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColors:", v6);
  }
  else
  {
    v45 = 0.0;
    v46 = 0.0;
    v43 = 0;
    v44 = 0.0;
    objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v46, &v45, &v44, &v43);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v46, v45, v44 + 0.1, 1.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49[0] = objc_msgSend(v6, "CGColor");
    v49[1] = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCatalystButton gradientLayer](self, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColors:", v7);

  }
  -[MKCatalystButton traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "activeAppearance"))
  {
    if (-[MKCatalystButton isPrimaryButton](self, "isPrimaryButton"))
      v10 = 0;
    else
      v10 = -[MKCatalystButton isHighlighted](self, "isHighlighted") ^ 1;
  }
  else
  {
    v10 = 1;
  }

  -[MKCatalystButton gradientLayer](self, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  v12 = (void *)objc_opt_class();
  -[MKCatalystButton traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "extraShadowLayerBackgroundColorWithDarkMode:isbuttonEnabled:", objc_msgSend(v13, "userInterfaceStyle") == 2, -[MKCatalystButton isEnabled](self, "isEnabled"));
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v3);
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "colorWithAlphaComponent:", 0.07);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGColor");
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBorderColor:", v18);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "CGColor");
  -[MKCatalystButton extraShadowLayer](self, "extraShadowLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowColor:", v21);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24 = objc_msgSend(v23, "CGColor");
  -[MKCatalystButton layer](self, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShadowColor:", v24);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = objc_msgSend(&unk_1E215A0F0, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(&unk_1E215A0F0);
        v30 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "unsignedIntegerValue");
        -[MKCatalystButton title](self, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKCatalystButton subTitle](self, "subTitle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKCatalystButton _attributedStringWithTitle:subtitle:controlState:](self, "_attributedStringWithTitle:subtitle:controlState:", v31, v32, v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKCatalystButton setAttributedTitle:forState:](self, "setAttributedTitle:forState:", v33, v30);

      }
      v27 = objc_msgSend(&unk_1E215A0F0, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v27);
  }
  -[MKCatalystButton subTitle](self, "subTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCatalystButton titleLabel](self, "titleLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLineBreakMode:", 4 * (v34 == 0));

  -[MKCatalystButton subTitle](self, "subTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    v37 = 2;
  else
    v37 = 1;
  -[MKCatalystButton titleLabel](self, "titleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setNumberOfLines:", v37);

}

+ (CGColor)extraShadowLayerBackgroundColorWithDarkMode:(BOOL)a3 isbuttonEnabled:(BOOL)a4
{
  double v4;
  double v5;
  id v6;
  CGColor *v7;

  if (a3)
  {
    if (a4)
      v4 = 0.2;
    else
      v4 = 0.02;
    v5 = 1.0;
  }
  else if (a4)
  {
    v5 = 1.0;
    v4 = 0.5;
  }
  else
  {
    v4 = 0.02;
    v5 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v5, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (CGColor *)objc_msgSend(v6, "CGColor");

  return v7;
}

- (_MKPlaceActionButtonController)buttonController
{
  return (_MKPlaceActionButtonController *)objc_loadWeakRetained((id *)&self->_buttonController);
}

- (BOOL)isPrimaryButton
{
  return self->_isPrimaryButton;
}

- (double)tallHeight
{
  return self->_tallHeight;
}

- (void)setTallHeight:(double)a3
{
  self->_tallHeight = a3;
}

- (double)shortHeight
{
  return self->_shortHeight;
}

- (void)setShortHeight:(double)a3
{
  self->_shortHeight = a3;
}

- (void)setExtraShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_extraShadowLayer, a3);
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSAttributedString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_extraShadowLayer, 0);
  objc_destroyWeak((id *)&self->_buttonController);
}

@end
