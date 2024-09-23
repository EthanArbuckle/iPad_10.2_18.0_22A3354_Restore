@implementation AXCameraFeatureDebuggingView

- (AXCameraFeatureDebuggingView)initWithFrame:(CGRect)a3
{
  AXCameraFeatureDebuggingView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *crossHairX;
  void *v11;
  uint64_t v12;
  UIView *crossHairY;
  void *v14;
  uint64_t v15;
  UIColor *textColor;
  AXCameraFeatureDebuggingView *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AXCameraFeatureDebuggingView;
  v3 = -[AXCameraFeatureDebuggingView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    crossHairX = v3->__crossHairX;
    v3->__crossHairX = (UIView *)v9;

    -[AXCameraFeatureDebuggingView borderColor](v3, "borderColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__crossHairX, "setBackgroundColor:", v11);

    -[AXCameraFeatureDebuggingView addSubview:](v3, "addSubview:", v3->__crossHairX);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v5, v6, v7, v8);
    crossHairY = v3->__crossHairY;
    v3->__crossHairY = (UIView *)v12;

    -[AXCameraFeatureDebuggingView borderColor](v3, "borderColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__crossHairY, "setBackgroundColor:", v14);

    -[AXCameraFeatureDebuggingView addSubview:](v3, "addSubview:", v3->__crossHairY);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v15;

    v17 = v3;
  }

  return v3;
}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[AXCameraFeatureDebuggingView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  -[AXCameraFeatureDebuggingView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (void)setBorderColor:(id)a3
{
  UIColor *v5;
  UIColor *borderColor;
  char v7;
  UIColor *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIColor *v14;

  v5 = (UIColor *)a3;
  borderColor = self->_borderColor;
  if (borderColor != v5)
  {
    v14 = v5;
    v7 = -[UIColor isEqual:](borderColor, "isEqual:", v5);
    v5 = v14;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_borderColor, a3);
      v8 = objc_retainAutorelease(v14);
      v9 = -[UIColor CGColor](v8, "CGColor");
      -[AXCameraFeatureDebuggingView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderColor:", v9);

      -[AXCameraFeatureDebuggingView _crossHairX](self, "_crossHairX");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v8);

      -[AXCameraFeatureDebuggingView _crossHairY](self, "_crossHairY");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v8);

      -[AXCameraFeatureDebuggingView _label](self, "_label");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v8);

      v5 = v14;
    }
  }

}

- (void)setTextColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[AXCameraFeatureDebuggingView _label](self, "_label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[AXCameraFeatureDebuggingView _label](self, "_label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *label;
  void *v10;
  id v11;

  v11 = a3;
  if (v11 && !self->__label)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AXCameraFeatureDebuggingView textColor](self, "textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    -[AXCameraFeatureDebuggingView borderColor](self, "borderColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v8);

    -[UILabel setTextAlignment:](v5, "setTextAlignment:", 1);
    -[AXCameraFeatureDebuggingView addSubview:](self, "addSubview:", v5);
    label = self->__label;
    self->__label = v5;

  }
  -[AXCameraFeatureDebuggingView _label](self, "_label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  -[AXCameraFeatureDebuggingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextOnTop:(BOOL)a3
{
  if (self->_textOnTop != a3)
  {
    self->_textOnTop = a3;
    -[AXCameraFeatureDebuggingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextInsideBox:(BOOL)a3
{
  if (self->_textInsideBox != a3)
  {
    self->_textInsideBox = a3;
    -[AXCameraFeatureDebuggingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    self->_interfaceOrientation = a3;
    -[AXCameraFeatureDebuggingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinX;
  double v13;
  double MaxY;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  uint64_t v26;
  double v27;
  int64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  unint64_t v38;
  _BOOL4 v39;
  double v40;
  double v41;
  double v42;
  CGFloat angle;
  double v44;
  double v45;
  double v46;
  double v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)AXCameraFeatureDebuggingView;
  -[AXCameraFeatureDebuggingView layoutSubviews](&v50, sel_layoutSubviews);
  -[AXCameraFeatureDebuggingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  MinX = v11;
  MaxY = v13;
  -[AXCameraFeatureDebuggingView borderWidth](self, "borderWidth");
  if (v15 <= 0.0)
    v16 = 0.0;
  else
    v16 = 10.0;
  -[AXCameraFeatureDebuggingView _crossHairX](self, "_crossHairX");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", MinX, MaxY);

  -[AXCameraFeatureDebuggingView _crossHairY](self, "_crossHairY");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCenter:", MinX, MaxY);

  -[AXCameraFeatureDebuggingView _crossHairX](self, "_crossHairX");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, 2.0);

  -[AXCameraFeatureDebuggingView _crossHairY](self, "_crossHairY");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, 2.0, v16);

  -[AXCameraFeatureDebuggingView _label](self, "_label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if ((unint64_t)(-[AXCameraFeatureDebuggingView interfaceOrientation](self, "interfaceOrientation") - 3) >= 2)
      v22 = v8;
    else
      v22 = v10;
    objc_msgSend(v21, "intrinsicContentSize");
    v44 = fmax(v23, v22);
    v45 = v24;
    v46 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v47 = *MEMORY[0x24BDBF090];
    v25 = -[AXCameraFeatureDebuggingView textOnTop](self, "textOnTop");
    v26 = MEMORY[0x24BDBEFB0];
    v27 = *MEMORY[0x24BDBEFB0];
    v28 = -[AXCameraFeatureDebuggingView interfaceOrientation](self, "interfaceOrientation");
    if (v28 == 2)
    {
      v34 = v4;
      v35 = v6;
      v36 = v8;
      v37 = v10;
      if (v25)
      {
        MaxY = CGRectGetMaxY(*(CGRect *)&v34);
        v29 = 1.0;
      }
      else
      {
        MaxY = CGRectGetMinY(*(CGRect *)&v34);
        v29 = -1.0;
      }
      *(double *)&v38 = 3.14159265;
    }
    else
    {
      v29 = *(double *)(v26 + 8);
      v30 = v4;
      v31 = v6;
      v32 = v8;
      v33 = v10;
      if (v28 == 4)
      {
        if (v25)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v30);
          v27 = -1.0;
        }
        else
        {
          MinX = CGRectGetMaxX(*(CGRect *)&v30);
          v27 = 1.0;
        }
        *(double *)&v38 = -1.57079633;
      }
      else if (v28 == 3)
      {
        if (v25)
        {
          MinX = CGRectGetMaxX(*(CGRect *)&v30);
          v27 = 1.0;
        }
        else
        {
          MinX = CGRectGetMinX(*(CGRect *)&v30);
          v27 = -1.0;
        }
        *(double *)&v38 = 1.57079633;
      }
      else
      {
        if (v25)
        {
          MaxY = CGRectGetMinY(*(CGRect *)&v30);
          v29 = -1.0;
        }
        else
        {
          MaxY = CGRectGetMaxY(*(CGRect *)&v30);
          v29 = 1.0;
        }
        *(double *)&v38 = 0.0;
      }
    }
    angle = *(double *)&v38;
    v39 = -[AXCameraFeatureDebuggingView textInsideBox](self, "textInsideBox");
    v40 = -(v45 * 0.5);
    if (!v39)
      v40 = v45 * 0.5;
    v41 = MinX + v27 * v40;
    v42 = MaxY + v29 * v40;
    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeRotation(&v49, angle);
    objc_msgSend(v21, "setCenter:", v41, v42);
    objc_msgSend(v21, "setBounds:", v47, v46, v44, v45);
    v48 = v49;
    objc_msgSend(v21, "setTransform:", &v48);
  }

}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)textOnTop
{
  return self->_textOnTop;
}

- (BOOL)textInsideBox
{
  return self->_textInsideBox;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (BOOL)didReuse
{
  return self->_didReuse;
}

- (void)setDidReuse:(BOOL)a3
{
  self->_didReuse = a3;
}

- (UIView)_crossHairX
{
  return self->__crossHairX;
}

- (UIView)_crossHairY
{
  return self->__crossHairY;
}

- (UILabel)_label
{
  return self->__label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->__crossHairY, 0);
  objc_storeStrong((id *)&self->__crossHairX, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
