@implementation CLKUIChronoButton

- (CLKUIChronoButton)initWithFrame:(CGRect)a3
{
  CLKUIChronoButton *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLKUIChronoButton;
  v3 = -[CLKUIChronoButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_1);
    WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_1);
      if (v7 == v4)
      {
        v8 = objc_msgSend(v4, "version");
        v9 = _LayoutConstants___previousCLKDeviceVersion_1;

        if (v8 == v9)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_1);
          v12 = *(double *)&_LayoutConstants_constants_0;
          v13 = *(double *)&_LayoutConstants_constants_1;

          -[CLKUIChronoButton _setupImagesWithDiameter:lineThickness:](v3, "_setupImagesWithDiameter:lineThickness:", v12, v13);
          return v3;
        }
      }
      else
      {

      }
    }
    v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_1, v4);
    _LayoutConstants___previousCLKDeviceVersion_1 = objc_msgSend(v4, "version");

    ___LayoutConstants_block_invoke_1(v11, (uint64_t)v4);
    goto LABEL_7;
  }
  return v3;
}

- (CLKUIChronoButton)initWithDiameter:(double)a3
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();
  v7 = v6;

  return -[CLKUIChronoButton initWithDiameter:lineThickness:](self, "initWithDiameter:lineThickness:", a3, v7);
}

- (CLKUIChronoButton)initWithDiameter:(double)a3 lineThickness:(double)a4
{
  CLKUIChronoButton *v6;
  CLKUIChronoButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUIChronoButton;
  v6 = -[CLKUIChronoButton initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v7 = v6;
  if (v6)
    -[CLKUIChronoButton _setupImagesWithDiameter:lineThickness:](v6, "_setupImagesWithDiameter:lineThickness:", a3, a4);
  return v7;
}

- (void)_setupImagesWithDiameter:(double)a3 lineThickness:(double)a4
{
  double v6;
  id v7;
  void *v8;
  UIImageView *v9;
  UIImageView *ringView;
  void *v11;
  id v12;
  void *v13;
  UIImageView *v14;
  UIImageView *fillView;
  void *v16;
  void *v17;
  id v18;

  v6 = a3 * 0.5;
  +[CLKUIChronoButton _ringImageWithRadius:lineThickness:](CLKUIChronoButton, "_ringImageWithRadius:lineThickness:", a3 * 0.5, a4);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(v18, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (UIImageView *)objc_msgSend(v7, "initWithImage:", v8);
  ringView = self->_ringView;
  self->_ringView = v9;

  -[UIImageView setUserInteractionEnabled:](self->_ringView, "setUserInteractionEnabled:", 0);
  -[CLKUIChronoButton addSubview:](self, "addSubview:", self->_ringView);
  +[CLKUIChronoButton _fillImageWithRadius:lineThickness:](CLKUIChronoButton, "_fillImageWithRadius:lineThickness:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UIImageView *)objc_msgSend(v12, "initWithImage:", v13);
  fillView = self->_fillView;
  self->_fillView = v14;

  -[UIImageView setUserInteractionEnabled:](self->_fillView, "setUserInteractionEnabled:", 0);
  -[CLKUIChronoButton addSubview:](self, "addSubview:", self->_fillView);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIChronoButton setColor:](self, "setColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIChronoButton setBackgroundColor:](self, "setBackgroundColor:", v17);

}

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[CLKUIChronoButton _updateColors](self, "_updateColors");
  }

}

- (void)setRingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringColor, a3);
  -[CLKUIChronoButton _updateColors](self, "_updateColors");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CLKUIChronoButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUIChronoButton;
    -[CLKUIChronoButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[CLKUIChronoButton _updateColors](self, "_updateColors");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;

  v3 = MEMORY[0x1D17A167C](-[CLKUIChronoButton bounds](self, "bounds"));
  v5 = v4;
  -[UIImageView setCenter:](self->_ringView, "setCenter:");
  -[UIImageView setCenter:](self->_fillView, "setCenter:", v3, v5);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _BOOL4 v5;
  UIColor *swapColor;
  UIColor *v7;
  UIColor *ringSwapColor;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;
  UIColor *color;
  UIColor *v13;
  UIColor *ringColor;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLKUIChronoButton;
  v5 = -[CLKUIChronoButton beginTrackingWithTouch:withEvent:](&v16, sel_beginTrackingWithTouch_withEvent_, a3, a4);
  if (v5)
  {
    swapColor = self->_swapColor;
    if (!swapColor)
      swapColor = self->_color;
    v7 = swapColor;
    ringSwapColor = self->_ringSwapColor;
    if (!ringSwapColor)
      ringSwapColor = self->_ringColor;
    v9 = ringSwapColor;
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = v7;
    -[CLKUIChronoButton _performTouchAnimationThroughColor:toColor:toRingColor:](self, "_performTouchAnimationThroughColor:toColor:toRingColor:", self->_highlightColor, v7, v11);
    objc_storeStrong((id *)&self->_swapColor, self->_color);
    color = self->_color;
    self->_color = v7;
    v13 = v7;

    objc_storeStrong((id *)&self->_ringSwapColor, self->_ringColor);
    ringColor = self->_ringColor;
    self->_ringColor = v10;

  }
  return v5;
}

- (void)_performTouchAnimationThroughColor:(id)a3 toColor:(id)a4 toRingColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke;
  v26[3] = &unk_1E86E0450;
  v26[4] = self;
  v27 = v8;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_2;
  v23[3] = &unk_1E86E0518;
  v23[4] = self;
  v13 = v27;
  v24 = v13;
  v14 = v9;
  v25 = v14;
  objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0x10000, v26, v23, 0.2, 0.0);
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_4;
  v19[3] = &unk_1E86E0540;
  v19[4] = self;
  v20 = v10;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v10;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 0, v19, 0, 0.4, 0.0);

}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  CGAffineTransform v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  result = objc_msgSend(v2, "setTransform:", &v4);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setTintColor:");
  return result;
}

void __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_3;
  v4[3] = &unk_1E86E04F0;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v4[1] = 3221225472;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0x20000, v4, 0, 0.2, 0.0);

}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_3(_QWORD *a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  v2 = *(void **)(a1[4] + 472);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  result = objc_msgSend(v2, "setTransform:", v5);
  if (a1[5])
    return objc_msgSend(*(id *)(a1[4] + 472), "setTintColor:", a1[6]);
  return result;
}

uint64_t __76__CLKUIChronoButton__performTouchAnimationThroughColor_toColor_toRingColor___block_invoke_4(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 464), "setTintColor:", a1[5]);
  if (!a1[6])
    return objc_msgSend(*(id *)(a1[4] + 472), "setTintColor:", a1[7]);
  return result;
}

- (void)_updateColors
{
  int v3;
  UIColor *color;
  UIColor *v5;
  int v6;
  UIColor *ringColor;
  UIColor *v8;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;

  v3 = -[CLKUIChronoButton isEnabled](self, "isEnabled");
  color = self->_color;
  if (v3)
  {
    v5 = color;
  }
  else
  {
    -[UIColor colorWithAlphaComponent:](color, "colorWithAlphaComponent:", 0.2);
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v5;
  v6 = -[CLKUIChronoButton isEnabled](self, "isEnabled");
  ringColor = self->_ringColor;
  if (v6)
  {
    v8 = ringColor;
  }
  else
  {
    -[UIColor colorWithAlphaComponent:](ringColor, "colorWithAlphaComponent:", 0.2);
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[UIImageView setTintColor:](self->_fillView, "setTintColor:", v11);
  if (v9)
    v10 = v9;
  else
    v10 = v11;
  -[UIImageView setTintColor:](self->_ringView, "setTintColor:", v10);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[CLKUIChronoButton bounds](self, "bounds", a4);
  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchEdgeInsets.right);
  v15.size.height = v12 - (top + self->_touchEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

+ (id)_fillImageWithRadius:(double)a3 lineThickness:(double)a4
{
  void *v4;
  BOOL v5;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;
  CGSize v18;

  v4 = (void *)_fillImageWithRadius_lineThickness__image;
  if (_fillImageWithRadius_lineThickness__image)
    v5 = *(double *)&_fillImageWithRadius_lineThickness__cachedRadius == a3;
  else
    v5 = 0;
  if (!v5 || *(double *)&_fillImageWithRadius_lineThickness__cachedThickness != a4)
  {
    _fillImageWithRadius_lineThickness__cachedRadius = *(_QWORD *)&a3;
    _fillImageWithRadius_lineThickness__cachedThickness = *(_QWORD *)&a4;
    v7 = a4 + a4;
    v8 = a3 - (a4 + a4);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v7, v7, v8 + v8, v8 + v8);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setPath:", objc_msgSend(v10, "CGPath"));

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screenScale");
    v14 = v13;
    v18.width = v7 + v8 + v7 + v8;
    v18.height = v18.width;
    UIGraphicsBeginImageContextWithOptions(v18, 0, v14);

    objc_msgSend(v9, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)_fillImageWithRadius_lineThickness__image;
    _fillImageWithRadius_lineThickness__image = v15;

    UIGraphicsEndImageContext();
    v4 = (void *)_fillImageWithRadius_lineThickness__image;
  }
  return v4;
}

+ (id)_ringImageWithRadius:(double)a3 lineThickness:(double)a4
{
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  void *v18;
  CGSize v20;

  v6 = (void *)_ringImageWithRadius_lineThickness__image;
  if (_ringImageWithRadius_lineThickness__image)
    v7 = *(double *)&_ringImageWithRadius_lineThickness__cachedRadius == a3;
  else
    v7 = 0;
  if (!v7 || *(double *)&_ringImageWithRadius_lineThickness__cachedThickness != a4)
  {
    _ringImageWithRadius_lineThickness__cachedRadius = *(_QWORD *)&a3;
    _ringImageWithRadius_lineThickness__cachedThickness = *(_QWORD *)&a4;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3, a3, a3 + a4 * -0.5, 0.0, 6.28318531);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBounds:", 0.0, 0.0, a3, a3);
    v11 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setFillColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v10, "setLineWidth:", a4);
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "screenScale");
    v16 = v15;
    v20.width = a3 + a3;
    v20.height = a3 + a3;
    UIGraphicsBeginImageContextWithOptions(v20, 0, v16);

    objc_msgSend(v10, "renderInContext:", UIGraphicsGetCurrentContext());
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)_ringImageWithRadius_lineThickness__image;
    _ringImageWithRadius_lineThickness__image = v17;

    UIGraphicsEndImageContext();
    v6 = (void *)_ringImageWithRadius_lineThickness__image;
  }
  return v6;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)swapColor
{
  return self->_swapColor;
}

- (void)setSwapColor:(id)a3
{
  objc_storeStrong((id *)&self->_swapColor, a3);
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
}

- (UIColor)ringColor
{
  return self->_ringColor;
}

- (UIColor)ringSwapColor
{
  return self->_ringSwapColor;
}

- (void)setRingSwapColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringSwapColor, a3);
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  bottom = self->_touchEdgeInsets.bottom;
  right = self->_touchEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringSwapColor, 0);
  objc_storeStrong((id *)&self->_ringColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_swapColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end
