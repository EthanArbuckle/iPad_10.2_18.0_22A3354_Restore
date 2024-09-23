@implementation NTKCFaceContainerView

- (NTKCFaceContainerView)initWithFaceSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  double v8;
  double v9;
  NTKCFaceContainerView *v10;
  NTKCFaceContainerView *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v30;
  const __CFString *v31;
  _QWORD v32[2];

  height = a3.height;
  width = a3.width;
  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "sizeForFaceSize:style:", a4, a3.width, a3.height);
  v30.receiver = self;
  v30.super_class = (Class)NTKCFaceContainerView;
  v10 = -[NTKCFaceContainerView initWithFrame:](&v30, sel_initWithFrame_, 0.0, 0.0, v8, v9);
  v11 = v10;
  if (v10)
  {
    -[NTKCFaceContainerView setStyle:](v10, "setStyle:", a4);
    v11->_faceSize.width = width;
    v11->_faceSize.height = height;
    v12 = (void *)objc_opt_new();
    -[NTKCFaceContainerView setBackgroundView:](v11, "setBackgroundView:", v12);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_backgroundView, "setBackgroundColor:", v13);

    -[NTKCFaceContainerView addSubview:](v11, "addSubview:", v11->_backgroundView);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v11->_faceSize.width, v11->_faceSize.height);
    -[NTKCFaceContainerView setFaceContainer:](v11, "setFaceContainer:", v14);

    -[NTKCFaceContainerView addSubview:](v11, "addSubview:", v11->_faceContainer);
    -[NTKCFaceContainerView _outlineLineWidth](v11, "_outlineLineWidth");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceContainerView setOutline:](v11, "setOutline:", v17);

    v31 = CFSTR("strokeColor");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setActions:](v11->_outline, "setActions:", v19);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v11->_outline, "setFillColor:", objc_msgSend(v20, "CGColor"));

    -[CAShapeLayer setLineWidth:](v11->_outline, "setLineWidth:", v16);
    -[NTKCFaceContainerView layer](v11, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v11->_outline);

    -[NTKCFaceContainerView _updateOutlineColor](v11, "_updateOutlineColor");
    v22 = (void *)objc_opt_new();
    -[NTKCFaceContainerView setHighlightView:](v11, "setHighlightView:", v22);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "colorWithAlphaComponent:", 0.23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_highlightView, "setBackgroundColor:", v24);

    -[UIView setAlpha:](v11->_highlightView, "setAlpha:", 0.0);
    -[NTKCFaceContainerView addSubview:](v11, "addSubview:", v11->_highlightView);
    -[NTKCFaceContainerView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
    LODWORD(v25) = 1148846080;
    -[NTKCFaceContainerView setContentCompressionResistancePriority:forAxis:](v11, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[NTKCFaceContainerView setContentCompressionResistancePriority:forAxis:](v11, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v27) = 1148846080;
    -[NTKCFaceContainerView setContentHuggingPriority:forAxis:](v11, "setContentHuggingPriority:forAxis:", 0, v27);
    LODWORD(v28) = 1148846080;
    -[NTKCFaceContainerView setContentHuggingPriority:forAxis:](v11, "setContentHuggingPriority:forAxis:", 1, v28);
  }
  return v11;
}

- (void)setFaceView:(id)a3
{
  id v5;
  UIView **p_faceView;
  void *v7;
  int v8;
  UIView *v9;
  __int128 v10;
  UIView *v11;
  _OWORD v12[6];
  _OWORD v13[3];

  v5 = a3;
  p_faceView = &self->_faceView;
  -[UIView superview](self->_faceView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", self->_faceContainer);

  if (v8)
  {
    -[UIView removeFromSuperview](*p_faceView, "removeFromSuperview");
    v9 = *p_faceView;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13[0] = *MEMORY[0x1E0C9BAA8];
    v13[1] = v10;
    v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v9, "setTransform:", v13);
  }
  objc_storeStrong((id *)&self->_faceView, a3);
  if (*p_faceView)
  {
    -[NTKCFaceContainerView _transformForFaceView](self, "_transformForFaceView");
    v11 = *p_faceView;
    v12[0] = v12[3];
    v12[1] = v12[4];
    v12[2] = v12[5];
    -[UIView setTransform:](v11, "setTransform:", v12);
    -[UIView addSubview:](self->_faceContainer, "addSubview:", *p_faceView);
    -[NTKCFaceContainerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setFaceSize:(CGSize)a3
{
  UIView *faceView;
  _OWORD v6[6];

  if (a3.width != self->_faceSize.width || a3.height != self->_faceSize.height)
  {
    self->_faceSize = a3;
    -[UIView setBounds:](self->_faceContainer, "setBounds:", 0.0, 0.0);
    -[NTKCFaceContainerView _transformForFaceView](self, "_transformForFaceView");
    faceView = self->_faceView;
    v6[0] = v6[3];
    v6[1] = v6[4];
    v6[2] = v6[5];
    -[UIView setTransform:](faceView, "setTransform:", v6);
    -[NTKCFaceContainerView sizeToFit](self, "sizeToFit");
  }
}

- (CGAffineTransform)_transformForFaceView
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat rect;
  double rect_8;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[UIView bounds](self->_faceView, "bounds");
  v6 = v5;
  rect = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self->_faceContainer, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  rect_8 = CGRectGetWidth(v25);
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  v17 = CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v18 = CGRectGetHeight(v27);
  v28.origin.x = rect;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v19 = CGRectGetHeight(v28);
  v20 = 1.0;
  if (rect_8 != 0.0 && v17 != 0.0 && v18 != 0.0 && v19 != 0.0)
  {
    v20 = rect_8 / v17;
    v21 = v18 / v19;
    if (rect_8 / v17 >= v21)
      v20 = v21;
  }
  return CGAffineTransformMakeScale(retstr, v20, v20);
}

- (void)setActive:(BOOL)a3
{
  id v4;

  if (self->_active != a3)
  {
    self->_active = a3;
    NTKCOutlineColor(a3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](self->_outline, "setStrokeColor:", objc_msgSend(v4, "CGColor"));

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];
  BOOL v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKCFaceContainerView;
  -[NTKCFaceContainerView setHighlighted:](&v8, sel_setHighlighted_);
  v5 = 0.2;
  if (v3)
    v5 = 0.0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__NTKCFaceContainerView_setHighlighted___block_invoke;
  v6[3] = &unk_1E6BCF930;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, v5, 0.0);
}

uint64_t __40__NTKCFaceContainerView_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setAlpha:", v1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "sizeForFaceSize:style:", self->_style, self->_faceSize.width, self->_faceSize.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[NTKCFaceContainerView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double height;
  void *v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double x;
  double y;
  double width;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BYTE v34[48];
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[NTKCFaceContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = _LayoutConstants_45((uint64_t)v34);
  v12 = v35;
  height = self->_faceSize.height;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "screenBounds");
  v15 = v12 * (height / CGRectGetHeight(v36));

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screenBounds");
  v31 = v12 / CGRectGetHeight(v37);

  -[NTKCFaceContainerView _outlineLineWidth](self, "_outlineLineWidth");
  v18 = v17 * 0.5;
  v19 = v4;
  v38.origin.x = v4;
  v32 = v6;
  v38.origin.y = v6;
  v33 = v8;
  v38.size.width = v8;
  v38.size.height = v10;
  v39 = CGRectInset(v38, v18, v18);
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  v23 = v39.size.height;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "deviceCategory");

  if ((unint64_t)(v25 - 3) >= 3)
  {
    if (v25 == 2)
    {
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = v23;
      v12 = v31 * CGRectGetHeight(v41) * 1.25;
    }
  }
  else
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = v23;
    v12 = v15 + (CGRectGetHeight(v40) - self->_faceSize.height) * 0.5;
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", x, y, width, v23);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v12);
  -[NTKCFaceContainerView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v12);
  -[CAShapeLayer frame](self->_outline, "frame");
  v45.origin.x = v19;
  v45.origin.y = v32;
  v45.size.width = v33;
  v45.size.height = v10;
  if (!CGRectEqualToRect(v42, v45))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, v23, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setFrame:](self->_outline, "setFrame:", v19, v32, v33, v10);
    v27 = objc_retainAutorelease(v26);
    -[CAShapeLayer setPath:](self->_outline, "setPath:", objc_msgSend(v27, "CGPath"));

  }
  -[UIView frame](self->_faceContainer, "frame");
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->_faceContainer, "setFrame:", 0);
  -[UIView frame](self->_faceView, "frame");
  -[UIView bounds](self->_faceContainer, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UIView setFrame:](self->_faceView, "setFrame:", 0);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v19, v32, v33, v10);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "deviceCategory");

  if ((unint64_t)(v29 - 3) >= 3)
  {
    v30 = v12;
    if (v29 == 2)
    {
      -[UIView frame](self->_highlightView, "frame", v12);
      v30 = v31 * CGRectGetHeight(v44) * 1.25;
    }
  }
  else
  {
    -[UIView frame](self->_highlightView, "frame");
    v30 = v15 + (CGRectGetHeight(v43) - self->_faceSize.height) * 0.5;
  }
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", v30);
}

- (double)_outlineLineWidth
{
  int64_t style;
  double result;
  _BYTE v4[8];
  double v5;
  _BYTE v6[24];
  double v7;
  _BYTE v8[40];
  double v9;

  style = self->_style;
  if (style == 2)
  {
    _LayoutConstants_45((uint64_t)v4);
    return v5;
  }
  else if (style == 1)
  {
    _LayoutConstants_45((uint64_t)v6);
    return v7;
  }
  else
  {
    result = 0.0;
    if (!style)
    {
      _LayoutConstants_45((uint64_t)v8);
      return v9;
    }
  }
  return result;
}

- (void)_updateOutlineColor
{
  id v3;

  NTKCOutlineColor(0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_outline, "setStrokeColor:", objc_msgSend(v3, "CGColor"));

}

+ (CGSize)sizeForFaceSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "_insetPaddingForStyle:", a4);
  v7 = -v6;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = width;
  v11.size.height = height;
  v12 = CGRectInset(v11, v7, v7);
  v8 = v12.size.width;
  v9 = v12.size.height;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)faceSizeForSize:(CGSize)a3 style:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "_insetPaddingForStyle:", a4);
  v7 = v6;
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = width;
  v11.size.height = height;
  v12 = CGRectInset(v11, v7, v7);
  v8 = v12.size.width;
  v9 = v12.size.height;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (double)_insetPaddingForStyle:(int64_t)a3
{
  double v3;
  double v4;
  _QWORD v6[7];
  _BYTE v7[16];
  double v8;
  double v9;
  _BYTE v10[32];
  double v11;
  double v12;

  if (a3 == 2)
  {
    _LayoutConstants_45((uint64_t)v6);
    v3 = *(double *)v6;
    v4 = *(double *)&v6[1];
  }
  else if (a3 == 1)
  {
    _LayoutConstants_45((uint64_t)v7);
    v3 = v8;
    v4 = v9;
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    if (!a3)
    {
      _LayoutConstants_45((uint64_t)v10);
      v3 = v11;
      v4 = v12;
    }
  }
  return v3 + v4;
}

- (CGSize)faceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_faceSize.width;
  height = self->_faceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIView)faceView
{
  return self->_faceView;
}

- (BOOL)active
{
  return self->_active;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (CAShapeLayer)outline
{
  return self->_outline;
}

- (void)setOutline:(id)a3
{
  objc_storeStrong((id *)&self->_outline, a3);
}

- (UIView)faceContainer
{
  return self->_faceContainer;
}

- (void)setFaceContainer:(id)a3
{
  objc_storeStrong((id *)&self->_faceContainer, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_faceContainer, 0);
  objc_storeStrong((id *)&self->_outline, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
}

@end
