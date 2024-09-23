@implementation HUQuickControlCircleButton

- (HUQuickControlCircleButton)initWithFrame:(CGRect)a3
{
  HUQuickControlCircleButton *v3;
  HUQuickControlCircleButton *v4;
  void *v5;
  void *v6;
  void *v7;
  HUQuickControlBackgroundEffectView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUQuickControlCircleButton;
  v3 = -[HUQuickControlCircleButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUQuickControlCircleButton layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[HUQuickControlCircleButton setFontSize:](v4, "setFontSize:", 21.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCircleButton setTitleColor:forState:](v4, "setTitleColor:forState:", v6, 0);

    -[HUQuickControlCircleButton titleLabel](v4, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

    v8 = -[HUQuickControlBackgroundEffectView initWithEffectType:]([HUQuickControlBackgroundEffectView alloc], "initWithEffectType:", 1);
    -[HUQuickControlCircleButton setBackgroundView:](v4, "setBackgroundView:", v8);

    -[HUQuickControlCircleButton backgroundView](v4, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    -[HUQuickControlCircleButton backgroundView](v4, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCircleButton insertSubview:atIndex:](v4, "insertSubview:atIndex:", v10, 0);

    -[HUQuickControlCircleButton backgroundView](v4, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlCircleButton setStandardBackgroundColor:](v4, "setStandardBackgroundColor:", v12);

  }
  return v4;
}

- (double)fontSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HUQuickControlCircleButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  return v5;
}

- (void)setFontSize:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", a3, *MEMORY[0x1E0CEB5F8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCircleButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlCircleButton;
  -[HUQuickControlCircleButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[HUQuickControlCircleButton _controlStateChanged](self, "_controlStateChanged");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlCircleButton;
  -[HUQuickControlCircleButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[HUQuickControlCircleButton _controlStateChanged](self, "_controlStateChanged");
}

- (void)setSelectedColor:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_selectedColor, a3);
  if (v8)
  {
    -[HUQuickControlCircleButton setBackgroundColor:](self, "setBackgroundColor:", v8);
    -[HUQuickControlCircleButton backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  else
  {
    -[HUQuickControlCircleButton setBackgroundColor:](self, "setBackgroundColor:", 0);
    -[HUQuickControlCircleButton backgroundView](self, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setHidden:", v7);

  -[HUQuickControlCircleButton _adjustTitleColor](self, "_adjustTitleColor");
}

- (void)_adjustTitleColor
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlCircleButton selectedColor](self, "selectedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_luminanceDifferenceFromColor:", v4);
  v6 = v5;

  -[HUQuickControlCircleButton selectedColor](self, "selectedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6 < 0.1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v8;
  -[HUQuickControlCircleButton setTitleColor:forState:](self, "setTitleColor:forState:", v8, 0);

}

- (void)_controlStateChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__HUQuickControlCircleButton__controlStateChanged__block_invoke;
  v2[3] = &unk_1E6F4D988;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v2, 0.2);
}

void __50__HUQuickControlCircleButton__controlStateChanged__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  v2 = 1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
    v3 = 0.3;
  else
    v3 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
  if (objc_msgSend(*(id *)(a1 + 32), "isHighlighted"))
    v4 = 0.3;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  if ((objc_msgSend(*(id *)(a1 + 32), "isHighlighted") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) == 0)
  {
    v2 = 0.3;
  }
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v2);

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
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCircleButton;
  -[HUQuickControlCircleButton layoutSubviews](&v19, sel_layoutSubviews);
  -[HUQuickControlCircleButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUQuickControlCircleButton backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[HUQuickControlCircleButton bounds](self, "bounds");
  v13 = v12 * 0.5;
  -[HUQuickControlCircleButton backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v13);

  -[HUQuickControlCircleButton bounds](self, "bounds");
  v17 = v16 * 0.5;
  -[HUQuickControlCircleButton layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", v17);

}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIColor)standardBackgroundColor
{
  return self->_standardBackgroundColor;
}

- (void)setStandardBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_standardBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end
