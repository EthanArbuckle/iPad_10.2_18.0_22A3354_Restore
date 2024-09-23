@implementation MKViewWithHairline

- (MKViewWithHairline)initWithFrame:(CGRect)a3
{
  MKViewWithHairline *v3;
  MKHairlineView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  MKHairlineView *bottomHairline;
  MKHairlineView *v11;
  MKHairlineView *topHairline;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MKViewWithHairline;
  v3 = -[MKViewWithHairline initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MKHairlineView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[MKHairlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    bottomHairline = v3->_bottomHairline;
    v3->_bottomHairline = (MKHairlineView *)v9;

    -[MKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bottomHairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKViewWithHairline addSubview:](v3, "addSubview:", v3->_bottomHairline);
    v11 = -[MKHairlineView initWithFrame:]([MKHairlineView alloc], "initWithFrame:", v5, v6, v7, v8);
    topHairline = v3->_topHairline;
    v3->_topHairline = v11;

    -[MKHairlineView setTranslatesAutoresizingMaskIntoConstraints:](v3->_topHairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKHairlineView setHidden:](v3->_topHairline, "setHidden:", 1);
  }
  return v3;
}

- (void)setHairlineColor:(id)a3
{
  UIColor *v5;
  UIColor **p_hairlineColor;
  UIColor *v7;

  v5 = (UIColor *)a3;
  p_hairlineColor = &self->_hairlineColor;
  if (self->_hairlineColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_hairlineColor, a3);
    -[MKHairlineView setFillColor:](self->_topHairline, "setFillColor:", *p_hairlineColor);
    -[MKHairlineView setFillColor:](self->_bottomHairline, "setFillColor:", *p_hairlineColor);
    v5 = v7;
  }

}

- (void)setLeftHairlineInset:(double)a3
{
  if (self->_leftHairlineInset != a3)
  {
    self->_leftHairlineInset = a3;
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
  }
}

- (void)setRightHairlineInset:(double)a3
{
  if (self->_rightHairlineInset != a3)
  {
    self->_rightHairlineInset = a3;
    -[UIView _mapkit_setNeedsLayout](self, "_mapkit_setNeedsLayout");
  }
}

- (void)setTopHairlineHidden:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[MKHairlineView setHidden:](self->_topHairline, "setHidden:");
  if (v3)
    -[MKHairlineView removeFromSuperview](self->_topHairline, "removeFromSuperview");
  else
    -[MKViewWithHairline addSubview:](self, "addSubview:", self->_topHairline);
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[MKHairlineView setHidden:](self->_bottomHairline, "setHidden:");
  if (v3)
    -[MKHairlineView removeFromSuperview](self->_bottomHairline, "removeFromSuperview");
  else
    -[MKViewWithHairline addSubview:](self, "addSubview:", self->_bottomHairline);
}

- (BOOL)isTopHairlineHidden
{
  return -[MKHairlineView isHidden](self->_topHairline, "isHidden");
}

- (BOOL)isBottomHairlineHidden
{
  return -[MKHairlineView isHidden](self->_bottomHairline, "isHidden");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinY;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  if (!-[MKHairlineView isHidden](self->_topHairline, "isHidden")
    || (-[MKHairlineView isHidden](self->_bottomHairline, "isHidden") & 1) == 0)
  {
    v31.receiver = self;
    v31.super_class = (Class)MKViewWithHairline;
    -[MKViewWithHairline layoutSubviews](&v31, sel_layoutSubviews);
    -[MKViewWithHairline bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[MKViewWithHairline window](self, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "nativeScale");
      v15 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nativeScale");
      v15 = v17;

    }
    v18 = 1.0 / v15;
    if ((-[MKHairlineView isHidden](self->_bottomHairline, "isHidden") & 1) == 0)
    {
      -[MKViewWithHairline leftHairlineInset](self, "leftHairlineInset");
      v20 = v4 + v19;
      v32.origin.x = v4;
      v32.origin.y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      v21 = CGRectGetMaxY(v32) - v18;
      -[MKViewWithHairline leftHairlineInset](self, "leftHairlineInset");
      v23 = v8 - v22;
      -[MKViewWithHairline rightHairlineInset](self, "rightHairlineInset");
      -[MKHairlineView setFrame:](self->_bottomHairline, "setFrame:", v20, v21, v23 - v24, v18);
    }
    if ((-[MKHairlineView isHidden](self->_topHairline, "isHidden") & 1) == 0)
    {
      -[MKViewWithHairline leftHairlineInset](self, "leftHairlineInset");
      v26 = v4 + v25;
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      MinY = CGRectGetMinY(v33);
      -[MKViewWithHairline leftHairlineInset](self, "leftHairlineInset");
      v29 = v8 - v28;
      -[MKViewWithHairline rightHairlineInset](self, "rightHairlineInset");
      -[MKHairlineView setFrame:](self->_topHairline, "setFrame:", v26, MinY, v29 - v30, v18);
    }
  }
}

- (UIColor)hairlineColor
{
  return self->_hairlineColor;
}

- (double)leftHairlineInset
{
  return self->_leftHairlineInset;
}

- (double)rightHairlineInset
{
  return self->_rightHairlineInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColor, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
}

@end
