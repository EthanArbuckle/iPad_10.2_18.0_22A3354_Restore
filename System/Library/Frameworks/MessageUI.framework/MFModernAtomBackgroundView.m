@implementation MFModernAtomBackgroundView

- (MFModernAtomBackgroundView)initWithFrame:(CGRect)a3
{
  MFModernAtomBackgroundView *v3;
  MFModernAtomBackgroundView *v4;
  id v5;
  uint64_t v6;
  UIView *selectedView;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MFModernAtomBackgroundView;
  v3 = -[MFModernAtomBackgroundView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    -[MFModernAtomBackgroundView setAutoresizesSubviews:](v3, "setAutoresizesSubviews:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[MFModernAtomBackgroundView bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    selectedView = v4->_selectedView;
    v4->_selectedView = (UIView *)v6;

    -[MFModernAtomBackgroundView tintColor](v4, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_selectedView, "setBackgroundColor:", v8);

    -[UIView setAlpha:](v4->_selectedView, "setAlpha:", 0.0);
    -[UIView setAutoresizingMask:](v4->_selectedView, "setAutoresizingMask:", 2);
    -[UIView layer](v4->_selectedView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldRasterize:", 1);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;
    -[UIView layer](v4->_selectedView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRasterizationScale:", v12);

    -[MFModernAtomBackgroundView addSubview:](v4, "addSubview:", v4->_selectedView);
    v4->_selectionStyle = 0;
  }
  return v4;
}

- (void)tintColorDidChange
{
  id v3;

  -[MFModernAtomBackgroundView tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_selectedView, "setBackgroundColor:");

}

- (double)separatorWidth
{
  void *v3;
  char v4;
  double result;
  int64_t separatorStyle;
  double v7;
  double v8;

  -[MFModernAtomBackgroundView hostAtomView](self, "hostAtomView");
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

  -[MFModernAtomBackgroundView separatorWidth](self, "separatorWidth");
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
  double v12;
  double v13;
  int v14;
  double v15;
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
  char v26;
  void *v27;
  uint64_t v28;
  double MinX;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double MaxX;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[MFModernAtomBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MFModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v39, "separatorIsLeftAligned");
  v12 = v8;
  if ((self->_selectionStyle & 0x20) != 0)
  {
    -[MFModernAtomBackgroundView _backgroundBleedArea](self, "_backgroundBleedArea");
    v12 = v8 + v13;
  }
  if (self->_separatorStyle)
    v14 = 0;
  else
    v14 = v11;
  v15 = v4;
  if (v14 == 1)
  {
    -[MFModernAtomBackgroundView separatorWidth](self, "separatorWidth", v4);
    v15 = v4 + v16;
  }
  -[UIView setFrame:](self->_selectedView, "setFrame:", v15, v6, v12, v10);
  -[MFModernAtomBackgroundView _setSelectionStyle:](self, "_setSelectionStyle:", self->_selectionStyle);
  if ((objc_msgSend(v39, "isWrappingEnabled") & 1) == 0)
  {
    -[UIView sizeToFit](self->_separatorView, "sizeToFit");
    -[UIView frame](self->_separatorView, "frame");
    v18 = v17;
    v20 = v19;
    UIRoundToViewScale();
    v22 = v21;
    v23 = floor(v4 + v8 - v18) + -3.0;
    if (v11)
      v24 = 3.0;
    else
      v24 = v23;
    if (self->_separatorStyle)
      goto LABEL_26;
    objc_msgSend(v39, "accessoryIconView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v39, "presentationOptions");
    if (v11)
    {
      objc_msgSend(v25, "iconImages");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28)
      {
        objc_msgSend(v25, "frame");
        MinX = CGRectGetMinX(v40);
        objc_msgSend(v25, "iconPadding");
        v31 = MinX + v30 + -3.0;
      }
      else
      {
        objc_msgSend(v39, "titleLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "frame");
        v31 = CGRectGetMinX(v42);

      }
      v24 = v31 - v18;
      if ((v26 & 4) == 0)
        goto LABEL_25;
      objc_msgSend(v39, "activityIndicator");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v24 = v24 - (CGRectGetWidth(v43) + 3.0);
    }
    else
    {
      objc_msgSend(v25, "iconImages");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33)
      {
        objc_msgSend(v25, "frame");
        MaxX = CGRectGetMaxX(v41);
        objc_msgSend(v25, "iconPadding");
        v24 = MaxX - v35 + 3.0;
        if ((v26 & 4) == 0)
          goto LABEL_25;
      }
      else
      {
        objc_msgSend(v39, "titleLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "frame");
        v24 = CGRectGetMaxX(v44);

        if ((v26 & 4) == 0)
        {
LABEL_25:

LABEL_26:
          -[UIView setFrame:](self->_separatorView, "setFrame:", v24, v22, v18, v20);
          goto LABEL_27;
        }
      }
      objc_msgSend(v39, "activityIndicator");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "frame");
      v24 = v24 + CGRectGetWidth(v45) + 3.0;
    }

    goto LABEL_25;
  }
LABEL_27:

}

- (void)_setSelectionStyle:(unint64_t)a3
{
  char v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v3 = a3;
  self->_selectionStyle = a3;
  if ((~(_DWORD)a3 & 0xCLL) != 0)
  {
    -[MFModernAtomBackgroundView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = 10;
    if ((v3 & 4) == 0)
      v13 = -1;
    if ((v3 & 8) != 0)
      v14 = 5;
    else
      v14 = v13;
    if ((v3 & 0x20) != 0)
    {
      -[MFModernAtomBackgroundView _backgroundBleedArea](self, "_backgroundBleedArea");
      v10 = v10 + v15;
    }
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v19, "setBounds:", v6, v8, v10, v12);
    v16 = (void *)MEMORY[0x1E0DC3508];
    -[UIView bounds](self->_selectedView, "bounds");
    objc_msgSend(v16, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setPath:", objc_msgSend(v17, "CGPath"));

    -[UIView layer](self->_selectedView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMask:", v19);

  }
  else
  {
    -[UIView layer](self->_selectedView, "layer");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMask:", 0);
  }

}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 style:(unint64_t)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  v5 = a4;
  if (self->_selected != a3 || self->_selectionStyle != a5)
  {
    self->_selected = a3;
    -[MFModernAtomBackgroundView _setSelectionStyle:](self, "_setSelectionStyle:", a5);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFModernAtomBackgroundView_setSelected_animated_style___block_invoke;
    aBlock[3] = &unk_1E5A65480;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v5)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.15);
    else
      (*((void (**)(void *))v7 + 2))(v7);
    -[MFModernAtomBackgroundView setNeedsDisplay](self, "setNeedsDisplay");
    -[MFModernAtomBackgroundView layoutSubviews](self, "layoutSubviews");

  }
}

uint64_t __57__MFModernAtomBackgroundView_setSelected_animated_style___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  double v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 440))
  {
    v3 = 0.0;
    if (!*(_BYTE *)(v1 + 448))
      v3 = 1.0;
    objc_msgSend(*(id *)(v1 + 432), "setAlpha:", v3);
    v1 = *(_QWORD *)(a1 + 32);
  }
  v4 = 1.0;
  if (!*(_BYTE *)(v1 + 448))
    v4 = 0.0;
  return objc_msgSend(*(id *)(v1 + 416), "setAlpha:", v4);
}

- (id)_chevronImage
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (!_chevronImage__chevronImageCache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_chevronImage__chevronImageCache;
    _chevronImage__chevronImageCache = (uint64_t)v3;

  }
  -[MFModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_preferredIconVariant");
  v7 = objc_msgSend(v5, "isPrimaryAddressAtom");
  if (v6 < 6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1)
  {
    ++v6;
  }
  else
  {
    objc_msgSend(v5, "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
    {
      if (v6 == 1)
        v12 = 0;
      else
        v12 = v6;
      if (v6 >= 2)
        v6 -= 2;
      else
        v6 = v12;
    }
  }
  _MFAtomViewIconImageVariantNameForGlyphType((uint64_t)CFSTR("chevron"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_chevronImage__chevronImageCache, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:inBundle:", v13, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_flatImageWithColor:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_chevronImage__chevronImageCache, "setObject:forKeyedSubscript:", v14, v13);
  }

  return v14;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  void *v5;
  int v6;
  UIView **p_separatorView;
  UIView *separatorView;
  UIView *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  CGAffineTransform v18;
  CGAffineTransform v19;

  self->_separatorStyle = a3;
  -[MFModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWrappingEnabled") ^ 1;
  p_separatorView = &self->_separatorView;
  separatorView = self->_separatorView;
  if (a3 == 2)
    LOBYTE(v6) = 0;
  if ((v6 & 1) != 0)
  {
    if (!separatorView || self->_separatorStyle != a3)
    {
      if (a3)
      {
        if (a3 != 1)
          __assert_rtn("-[MFModernAtomBackgroundView setSeparatorStyle:]", "MFModernAtomView.m", 1567, "0 && \"unexpected separatorStyle\");
        -[MFModernAtomBackgroundView _chevronImage](self, "_chevronImage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
        if (objc_msgSend(v5, "separatorIsLeftAligned"))
        {
          CGAffineTransformMakeScale(&v19, -1.0, 1.0);
        }
        else
        {
          v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&v19.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v19.c = v17;
          *(_OWORD *)&v19.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        }
        v18 = v19;
        objc_msgSend(v11, "setTransform:", &v18);

      }
      else
      {
        v12 = objc_alloc(MEMORY[0x1E0DC3990]);
        v11 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        MFLocalizedAddressSeparator();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v13);

        +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFont:", v14);

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextColor:", v15);

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v16);

        objc_msgSend(v11, "setAutoresizingMask:", 0);
        objc_msgSend(v11, "sizeToFit");
      }
      if (*p_separatorView)
        -[UIView removeFromSuperview](*p_separatorView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_separatorView, v11);
      -[MFModernAtomBackgroundView addSubview:](self, "addSubview:", *p_separatorView);

    }
  }
  else
  {
    -[UIView removeFromSuperview](separatorView, "removeFromSuperview");
    v9 = *p_separatorView;
    *p_separatorView = 0;

  }
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  char v4;
  UIView *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFModernAtomBackgroundView;
  -[MFModernAtomBackgroundView invalidateIntrinsicContentSize](&v7, sel_invalidateIntrinsicContentSize);
  -[MFModernAtomBackgroundView hostAtomView](self, "hostAtomView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWrappingEnabled");

  if ((v4 & 1) == 0)
  {
    if (-[MFModernAtomBackgroundView separatorStyle](self, "separatorStyle") == 1)
    {
      -[MFModernAtomBackgroundView _chevronImage](self, "_chevronImage");
      v5 = (UIView *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIView setImage:](self->_separatorView, "setImage:", v5);
      goto LABEL_8;
    }
    if (!-[MFModernAtomBackgroundView separatorStyle](self, "separatorStyle"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = self->_separatorView;
        +[MFModernAtomView defaultFont](MFModernAtomView, "defaultFont");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setFont:](v5, "setFont:", v6);

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

- (MFModernAtomView)hostAtomView
{
  return (MFModernAtomView *)objc_loadWeakRetained((id *)&self->_hostAtomView);
}

- (void)setHostAtomView:(id)a3
{
  objc_storeWeak((id *)&self->_hostAtomView, a3);
}

- (UIView)selectedView
{
  return self->_selectedView;
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostAtomView);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_selectedView, 0);
}

@end
