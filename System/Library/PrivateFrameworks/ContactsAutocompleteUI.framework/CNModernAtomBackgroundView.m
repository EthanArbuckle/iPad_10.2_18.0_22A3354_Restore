@implementation CNModernAtomBackgroundView

- (void)_setupBackgroundView
{
  id v3;
  UIView *v4;
  UIView *selectedView;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  self->_scalingFactor = 1.0;
  -[CNModernAtomBackgroundView setAutoresizesSubviews:](self, "setAutoresizesSubviews:", 1);
  -[UIView removeFromSuperview](self->_selectedView, "removeFromSuperview");
  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CNModernAtomBackgroundView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  selectedView = self->_selectedView;
  self->_selectedView = v4;

  -[CNModernAtomBackgroundView wrappedTintColor](self, "wrappedTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_selectedView, "setBackgroundColor:", v6);

  -[UIView setAlpha:](self->_selectedView, "setAlpha:", 0.0);
  -[UIView setAutoresizingMask:](self->_selectedView, "setAutoresizingMask:", 2);
  -[UIView layer](self->_selectedView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldRasterize:", 1);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  -[UIView layer](self->_selectedView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRasterizationScale:", v10);

  -[UIView _setContinuousCornerRadius:](self->_selectedView, "_setContinuousCornerRadius:", 4.5);
  -[CNModernAtomBackgroundView addSubview:](self, "addSubview:", self->_selectedView);
  self->_selectionStyle = 0;
}

- (CNModernAtomBackgroundView)initWithFrame:(CGRect)a3
{
  CNModernAtomBackgroundView *v3;
  CNModernAtomBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNModernAtomBackgroundView;
  v3 = -[CNModernAtomBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CNModernAtomBackgroundView _setupBackgroundView](v3, "_setupBackgroundView");
  return v4;
}

- (id)wrappedTintColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__CNModernAtomBackgroundView_wrappedTintColor__block_invoke;
  v3[3] = &unk_1E62BFC08;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__CNModernAtomBackgroundView_wrappedTintColor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tintColor");
}

- (void)tintColorDidChange
{
  id v3;

  -[CNModernAtomBackgroundView wrappedTintColor](self, "wrappedTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_selectedView, "setBackgroundColor:", v3);

}

- (double)separatorWidth
{
  void *v3;
  char v4;
  double result;
  int separatorStyle;
  double v7;
  double v8;

  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWrappingEnabled");

  result = 0.0;
  if ((v4 & 1) == 0)
  {
    separatorStyle = self->_separatorStyle;
    -[UIView bounds](self->_separatorView, "bounds", 0.0);
    if (separatorStyle)
      v8 = 3.0;
    else
      v8 = -7.0;
    return v7 + v8;
  }
  return result;
}

- (UIEdgeInsets)_backgroundBleedArea
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[CNModernAtomBackgroundView separatorWidth](self, "separatorWidth");
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
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
  int v11;
  int v12;
  BOOL v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  double MinX;
  double v31;
  double v32;
  double MaxX;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[CNModernAtomBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v38, "separatorIsLeftAligned");
  v12 = v11;
  if (self->_separatorStyle)
    v13 = 1;
  else
    v13 = v11 == 0;
  v14 = v4;
  if (!v13)
  {
    -[CNModernAtomBackgroundView separatorWidth](self, "separatorWidth", v4);
    v14 = v4 + v15;
  }
  -[UIView setFrame:](self->_selectedView, "setFrame:", v14, v6, v8, v10);
  -[CNModernAtomBackgroundView _setSelectionStyle:](self, "_setSelectionStyle:", self->_selectionStyle);
  v16 = objc_msgSend(v38, "isWrappingEnabled");
  v17 = v38;
  if ((v16 & 1) == 0)
  {
    -[UIView sizeToFit](self->_separatorView, "sizeToFit");
    -[UIView frame](self->_separatorView, "frame");
    v19 = v18;
    v21 = v20;
    UIRoundToViewScale();
    v23 = v22 + 1.0;
    v24 = floor(v4 + v8 - v19) + -3.0;
    if (v12)
      v25 = 3.0;
    else
      v25 = v24;
    if (self->_separatorStyle)
      goto LABEL_24;
    objc_msgSend(v38, "accessoryIconView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v38, "presentationOptions");
    objc_msgSend(v26, "iconImages");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v12)
    {
      if (v29)
      {
        objc_msgSend(v26, "frame");
        MinX = CGRectGetMinX(v39);
        objc_msgSend(v26, "iconPadding");
        v32 = MinX + v31 + -3.0;
      }
      else
      {
        objc_msgSend(v38, "titleLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "frame");
        v32 = CGRectGetMinX(v41);

      }
      v25 = v32 - v19;
      if ((v27 & 4) == 0)
        goto LABEL_23;
      objc_msgSend(v38, "activityIndicator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      v25 = v25 - (CGRectGetWidth(v42) + 3.0);
    }
    else
    {
      if (v29)
      {
        objc_msgSend(v26, "frame");
        MaxX = CGRectGetMaxX(v40);
        objc_msgSend(v26, "iconPadding");
        v25 = MaxX - v34 + 3.0;
        if ((v27 & 4) == 0)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend(v38, "titleLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "frame");
        v25 = CGRectGetMaxX(v43);

        if ((v27 & 4) == 0)
        {
LABEL_23:

LABEL_24:
          -[UIView setFrame:](self->_separatorView, "setFrame:", v25, v23, v19, v21);
          v17 = v38;
          goto LABEL_25;
        }
      }
      objc_msgSend(v38, "activityIndicator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      v25 = v25 + CGRectGetWidth(v44) + 3.0;
    }

    goto LABEL_23;
  }
LABEL_25:

}

- (void)_setSelectionStyle:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  self->_selectionStyle = a3;
  v3 = 5;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    v3 = 0;
  if (a3 - 1 >= 2)
    v4 = v3;
  else
    v4 = v3 | 0xA;
  -[UIView layer](self->_selectedView, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", v4);

}

- (BOOL)appearsSelected
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[CNModernAtomBackgroundView isSelected](self, "isSelected"))
    return 0;
  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activeAppearance") == 1;

  return v5;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5 updateVisualSelection:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;

  v6 = a6;
  v7 = a4;
  if (self->_selected != a3 || self->_selectionStyle != a5)
  {
    self->_selected = a3;
    -[CNModernAtomBackgroundView _setSelectionStyle:](self, "_setSelectionStyle:", a5);
    if (v6)
      -[CNModernAtomBackgroundView displaySelectionChangeWithAnimation:](self, "displaySelectionChangeWithAnimation:", v7);
  }
}

- (void)displaySelectionChangeWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v5 = -[CNModernAtomBackgroundView appearsSelected](self, "appearsSelected");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CNModernAtomBackgroundView_displaySelectionChangeWithAnimation___block_invoke;
  v8[3] = &unk_1E62BFBB8;
  v8[4] = self;
  v9 = v5;
  v6 = MEMORY[0x1B5E16810](v8);
  v7 = (void *)v6;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.15);
  else
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  -[CNModernAtomBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
  -[CNModernAtomBackgroundView layoutSubviews](self, "layoutSubviews");

}

void __66__CNModernAtomBackgroundView_displaySelectionChangeWithAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if (!objc_msgSend(*(id *)(a1 + 32), "separatorStyle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "separatorView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 0.0;
    if (!*(_BYTE *)(a1 + 40))
      v4 = 1.0;
    objc_msgSend(v2, "setAlpha:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "selectedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v6 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v6 = 0.0;
  objc_msgSend(v5, "setAlpha:", v6);

}

- (id)_chevronImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(v2, "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v3, "configurationWithPointSize:weight:scale:", 6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithTintColor:renderingMode:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setSeparatorStyle:(int)a3
{
  int v5;
  UIView *separatorView;
  void *v7;
  UIView *v8;
  UIView *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *v16;
  id v17;

  self->_separatorStyle = a3;
  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v17, "isWrappingEnabled");
  separatorView = self->_separatorView;
  if (a3 == 2 || v5)
  {
    -[UIView removeFromSuperview](separatorView, "removeFromSuperview");
    v9 = self->_separatorView;
    self->_separatorView = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (!separatorView || self->_separatorStyle != a3)
  {
    if (a3)
    {
      if (a3 != 1)
        -[CNModernAtomBackgroundView setSeparatorStyle:].cold.1();
      -[CNModernAtomBackgroundView _chevronImage](self, "_chevronImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v7);

    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA700]);
      v8 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      CNAUILocalizedAddressSeparator();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setText:](v8, "setText:", v11);

      +[CNAtomView defaultFont](CNAtomView, "defaultFont");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setFont:](v8, "setFont:", v12);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTextColor:](v8, "setTextColor:", v13);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v14);

      -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 0);
      -[UIView sizeToFit](v8, "sizeToFit");
      -[UIView setHidden:](v8, "setHidden:", -[CNModernAtomBackgroundView isSelected](self, "isSelected"));
    }
    v15 = self->_separatorView;
    if (v15)
      -[UIView removeFromSuperview](v15, "removeFromSuperview");
    v16 = self->_separatorView;
    self->_separatorView = v8;
    v9 = v8;

    -[CNModernAtomBackgroundView addSubview:](self, "addSubview:", self->_separatorView);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  char v4;
  void *v5;
  UIView *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNModernAtomBackgroundView;
  -[CNModernAtomBackgroundView invalidateIntrinsicContentSize](&v7, sel_invalidateIntrinsicContentSize);
  -[CNModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWrappingEnabled");

  if ((v4 & 1) == 0)
  {
    if (-[CNModernAtomBackgroundView separatorStyle](self, "separatorStyle") == 1)
    {
      -[CNModernAtomBackgroundView _chevronImage](self, "_chevronImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIView setImage:](self->_separatorView, "setImage:", v5);
      goto LABEL_8;
    }
    if (!-[CNModernAtomBackgroundView separatorStyle](self, "separatorStyle"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView setHidden:](self->_separatorView, "setHidden:", -[CNModernAtomBackgroundView isSelected](self, "isSelected"));
        v6 = self->_separatorView;
        +[CNAtomView defaultFont](CNAtomView, "defaultFont");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setFont:](v6, "setFont:", v5);

LABEL_8:
      }
    }
  }
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (CNAtomView)hostAtomView
{
  return (CNAtomView *)objc_loadWeakRetained((id *)&self->_hostAtomView);
}

- (void)setHostAtomView:(id)a3
{
  objc_storeWeak((id *)&self->_hostAtomView, a3);
}

- (UIView)selectedView
{
  return self->_selectedView;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostAtomView);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_selectedView, 0);
}

- (void)setSeparatorStyle:.cold.1()
{
  __assert_rtn("-[CNModernAtomBackgroundView setSeparatorStyle:]", "CNAtomView.m", 2031, "0 && \"unexpected separatorStyle\");
}

@end
