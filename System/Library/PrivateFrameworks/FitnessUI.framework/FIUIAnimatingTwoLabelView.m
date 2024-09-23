@implementation FIUIAnimatingTwoLabelView

- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  FIUIAnimatingTwoLabelView *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc(MEMORY[0x24BEBD708]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = -[FIUIAnimatingTwoLabelView initWithFrame:mainLabel:secondaryLabel:](self, "initWithFrame:mainLabel:secondaryLabel:", v9, 0, x, y, width, height);

  return v10;
}

- (FIUIAnimatingTwoLabelView)initWithFrame:(CGRect)a3 mainLabel:(id)a4 secondaryLabel:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  FIUIAnimatingTwoLabelView *v13;
  FIUIAnimatingTwoLabelView *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FIUIAnimatingTwoLabelView;
  v13 = -[FIUIAnimatingTwoLabelView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[FIUIAnimatingTwoLabelView setClipsToBounds:](v13, "setClipsToBounds:", 1);
    -[FIUIAnimatingTwoLabelView setMainLabel:](v14, "setMainLabel:", v11);
    -[FIUIAnimatingTwoLabelView setSecondaryLabel:](v14, "setSecondaryLabel:", v12);
    objc_msgSend(MEMORY[0x24BEBB520], "fu_mediumFontOfSize:", 17.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIAnimatingTwoLabelView applyFont:](v14, "applyFont:", v15);

    -[FIUIAnimatingTwoLabelView mainLabel](v14, "mainLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIAnimatingTwoLabelView addSubview:](v14, "addSubview:", v16);

    -[FIUIAnimatingTwoLabelView secondaryLabel](v14, "secondaryLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIAnimatingTwoLabelView addSubview:](v14, "addSubview:", v17);

    -[FIUIAnimatingTwoLabelView showMainLabelAnimated:](v14, "showMainLabelAnimated:", 0);
  }

  return v14;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUIAnimatingTwoLabelView;
  -[FIUIAnimatingTwoLabelView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[FIUIAnimatingTwoLabelView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  UILabel *secondaryLabel;
  UILabel *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FIUIAnimatingTwoLabelView;
  -[FIUIAnimatingTwoLabelView layoutSubviews](&v5, sel_layoutSubviews);
  secondaryLabel = self->_secondaryLabel;
  if (self->_visibleLabel == secondaryLabel)
    secondaryLabel = self->_mainLabel;
  v4 = secondaryLabel;
  -[FIUIAnimatingTwoLabelView _frameAboveBounds](self, "_frameAboveBounds");
  -[UILabel setFrame:](v4, "setFrame:");
  -[FIUIAnimatingTwoLabelView bounds](self, "bounds");
  -[UILabel setFrame:](self->_visibleLabel, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];
  CGSize result;

  v30[1] = *MEMORY[0x24BDAC8D0];
  -[FIUIAnimatingTwoLabelView mainLabel](self, "mainLabel", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)MEMORY[0x24BEBB360];
  if (v4)
  {
    -[FIUIAnimatingTwoLabelView mainLabel](self, "mainLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *v5;
    -[FIUIAnimatingTwoLabelView mainLabel](self, "mainLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeWithAttributes:", v10);
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
    v14 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  -[FIUIAnimatingTwoLabelView secondaryLabel](self, "secondaryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[FIUIAnimatingTwoLabelView secondaryLabel](self, "secondaryLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *v5;
    -[FIUIAnimatingTwoLabelView secondaryLabel](self, "secondaryLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "font");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeWithAttributes:", v20);
    v22 = v21;
    v24 = v23;

  }
  else
  {
    v22 = *MEMORY[0x24BDBF148];
    v24 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  if (v12 >= v22)
    v25 = v12;
  else
    v25 = v22;
  if (v14 >= v24)
    v26 = v14;
  else
    v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (CGRect)_frameAboveBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;
  CGRect v13;

  -[FIUIAnimatingTwoLabelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FIUIAnimatingTwoLabelView bounds](self, "bounds");
  v11 = -CGRectGetHeight(v12);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectOffset(v13, 0.0, v11);
}

- (CGRect)_frameBelowBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat Height;
  CGRect v12;
  CGRect v13;

  -[FIUIAnimatingTwoLabelView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FIUIAnimatingTwoLabelView bounds](self, "bounds");
  Height = CGRectGetHeight(v12);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  return CGRectOffset(v13, 0.0, Height);
}

- (UILabel)visibleLabel
{
  return self->_visibleLabel;
}

- (void)showMainLabelAnimated:(BOOL)a3
{
  UILabel **p_visibleLabel;
  UILabel *mainLabel;
  _BOOL4 v6;
  UILabel *v7;
  void *v8;
  double v9;
  float v10;
  _QWORD v11[5];
  _QWORD v12[5];

  p_visibleLabel = &self->_visibleLabel;
  mainLabel = self->_mainLabel;
  if (*p_visibleLabel != mainLabel)
  {
    v6 = a3;
    objc_storeStrong((id *)p_visibleLabel, mainLabel);
    v7 = self->_mainLabel;
    -[FIUIAnimatingTwoLabelView _frameBelowBounds](self, "_frameBelowBounds");
    -[UILabel setFrame:](v7, "setFrame:");
    -[UILabel setHidden:](self->_mainLabel, "setHidden:", 0);
    v8 = (void *)MEMORY[0x24BEBDB00];
    v9 = 0.0;
    if (v6)
    {
      UIAnimationDragCoefficient();
      v9 = (float)(v10 * 0.5);
    }
    v11[4] = self;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke;
    v12[3] = &unk_24CF30600;
    v12[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke_2;
    v11[3] = &unk_24CF30600;
    objc_msgSend(v8, "fiui_animateIfNeededWithDuration:delay:options:animations:completion:", 0x20000, v12, v11, v9, 0.0);
  }
}

uint64_t __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[53];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 1.0);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[54];
  objc_msgSend(v4, "_frameAboveBounds");
  objc_msgSend(v5, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.2);
}

uint64_t __51__FIUIAnimatingTwoLabelView_showMainLabelAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHidden");
}

- (void)showSecondaryLabelAnimated:(BOOL)a3
{
  UILabel **p_visibleLabel;
  UILabel *secondaryLabel;
  _BOOL4 v6;
  UILabel *v7;
  void *v8;
  double v9;
  float v10;
  _QWORD v11[5];
  _QWORD v12[5];

  p_visibleLabel = &self->_visibleLabel;
  secondaryLabel = self->_secondaryLabel;
  if (*p_visibleLabel != secondaryLabel)
  {
    v6 = a3;
    objc_storeStrong((id *)p_visibleLabel, secondaryLabel);
    v7 = self->_secondaryLabel;
    -[FIUIAnimatingTwoLabelView _frameAboveBounds](self, "_frameAboveBounds");
    -[UILabel setFrame:](v7, "setFrame:");
    -[UILabel setHidden:](self->_secondaryLabel, "setHidden:", 0);
    v8 = (void *)MEMORY[0x24BEBDB00];
    v9 = 0.0;
    if (v6)
    {
      UIAnimationDragCoefficient();
      v9 = (float)(v10 * 0.5);
    }
    v11[4] = self;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke;
    v12[3] = &unk_24CF30600;
    v12[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke_2;
    v11[3] = &unk_24CF30600;
    objc_msgSend(v8, "fiui_animateIfNeededWithDuration:delay:options:animations:completion:", 0x20000, v12, v11, v9, 0.0);
  }
}

uint64_t __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[54];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
  v4 = *(_QWORD **)(a1 + 32);
  v5 = (void *)v4[53];
  objc_msgSend(v4, "_frameBelowBounds");
  objc_msgSend(v5, "setFrame:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.2);
}

uint64_t __56__FIUIAnimatingTwoLabelView_showSecondaryLabelAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateHidden");
}

- (void)_updateHidden
{
  UILabel *secondaryLabel;
  UILabel *v4;

  secondaryLabel = self->_secondaryLabel;
  if (self->_visibleLabel == secondaryLabel)
    secondaryLabel = self->_mainLabel;
  v4 = secondaryLabel;
  -[UILabel setHidden:](v4, "setHidden:", 1);
  -[UILabel setHidden:](self->_visibleLabel, "setHidden:", 0);

}

- (void)applyFont:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FIUIAnimatingTwoLabelView mainLabel](self, "mainLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[FIUIAnimatingTwoLabelView secondaryLabel](self, "secondaryLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v4);

}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_visibleLabel, 0);
}

@end
