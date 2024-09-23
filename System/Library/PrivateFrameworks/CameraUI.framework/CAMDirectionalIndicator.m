@implementation CAMDirectionalIndicator

+ (CGSize)_circleSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  v5 = v4 + 27.0;
  v6 = v4 + 27.0;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (id)_createCircleImage
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  void *v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(a1, "_circleSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;
  v15.width = v5;
  v15.height = v7;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  +[CAMFullscreenViewfinder lightControlBackgroundColor](CAMFullscreenViewfinder, "lightControlBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFill");
  v16.origin.x = v2;
  v16.origin.y = v3;
  v16.size.width = v5;
  v16.size.height = v7;
  CGContextFillEllipseInRect(CurrentContext, v16);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v13;
}

- (CAMDirectionalIndicator)initWithFrame:(CGRect)a3
{
  CAMDirectionalIndicator *v3;
  CAShapeLayer *v4;
  CAShapeLayer *arrowLayer;
  CAShapeLayer *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CAMDirectionalIndicator;
  v3 = -[CAMDirectionalIndicator initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CAShapeLayer setFillColor:](v4, "setFillColor:", 0);
    -[CAShapeLayer setLineCap:](v4, "setLineCap:", *MEMORY[0x1E0CD3018]);
    -[CAShapeLayer setLineJoin:](v4, "setLineJoin:", *MEMORY[0x1E0CD3028]);
    arrowLayer = v3->__arrowLayer;
    v3->__arrowLayer = v4;
    v6 = v4;

    -[CAMDirectionalIndicator layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v6);

    objc_msgSend((id)objc_opt_class(), "_createCircleImage");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGImage");
    -[CAMDirectionalIndicator layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContents:", v9);

    v11 = *MEMORY[0x1E0CD2F78];
    -[CAMDirectionalIndicator layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsGravity:", v11);

    -[CAMDirectionalIndicator traitCollection](v3, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    v15 = v14;
    -[CAMDirectionalIndicator layer](v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentsScale:", v15);

    -[CAMDirectionalIndicator _updateArrowColorAnimated:](v3, "_updateArrowColorAnimated:", 0);
    -[CAMDirectionalIndicator _updateArrowLineWidth](v3, "_updateArrowLineWidth");

  }
  return v3;
}

- (void)layoutSubviews
{
  -[CAMDirectionalIndicator _updateArrowShapeAnimated:](self, "_updateArrowShapeAnimated:", 0);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_circleSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDirection:(int64_t)a3
{
  -[CAMDirectionalIndicator setDirection:animated:](self, "setDirection:animated:", a3, 0);
}

- (void)setDirection:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    -[CAMDirectionalIndicator _updateArrowShapeAnimated:](self, "_updateArrowShapeAnimated:", a4);
  }
}

- (void)setSelected:(BOOL)a3
{
  -[CAMDirectionalIndicator setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  int v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[CAMDirectionalIndicator isSelected](self, "isSelected");
  v8.receiver = self;
  v8.super_class = (Class)CAMDirectionalIndicator;
  -[CAMDirectionalIndicator setSelected:](&v8, sel_setSelected_, v5);
  if (v7 != v5)
    -[CAMDirectionalIndicator _updateArrowColorAnimated:](self, "_updateArrowColorAnimated:", v4);
}

- (void)_updateArrowShapeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinY;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat MidX;
  CGFloat MaxX;
  CGPath *Mutable;
  int64_t v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  -[CAMDirectionalIndicator bounds](self, "bounds");
  UIRectGetCenter();
  CAMPixelWidthForView(self);
  CAMPixelWidthForView(self);
  -[CAMDirectionalIndicator direction](self, "direction");
  CAMPixelWidthForView(self);
  CAMPixelWidthForView(self);
  UIRectCenteredAboutPointScale();
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxY = CGRectGetMaxY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MaxX = CGRectGetMaxX(v28);
  Mutable = CGPathCreateMutable();
  v15 = -[CAMDirectionalIndicator direction](self, "direction");
  if (v15)
  {
    if (v15 != 1)
      goto LABEL_6;
    v16 = MinY;
  }
  else
  {
    v16 = MaxY;
    MaxY = MinY;
  }
  CGPathMoveToPoint(Mutable, 0, MinX, v16);
  CGPathAddLineToPoint(Mutable, 0, MidX, MaxY);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v16);
LABEL_6:
  -[CAMDirectionalIndicator _arrowLayer](self, "_arrowLayer");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAdditive:", 1);
    objc_msgSend(v17, "setFromValue:", objc_msgSend(v23, "path"));
    objc_msgSend(v17, "setToValue:", Mutable);
    LODWORD(v18) = 1045220557;
    LODWORD(v19) = 1041865114;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v18, v21, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimingFunction:", v22);

    objc_msgSend(v17, "setDuration:", 0.5);
    objc_msgSend(v23, "addAnimation:forKey:", v17, CFSTR("invertDirection"));

  }
  objc_msgSend(v23, "setPath:", Mutable);
  CGPathRelease(Mutable);

}

- (void)_updateArrowLineWidth
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = 2.0;
  v4 = 2.0 - CAMPixelWidthForView(self);
  -[CAMDirectionalIndicator traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legibilityWeight");

  if (v6 != 1)
    v3 = v4;
  -[CAMDirectionalIndicator _arrowLayer](self, "_arrowLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineWidth:", v3);

}

- (void)_updateArrowColorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v3 = a3;
  if ((-[CAMDirectionalIndicator isSelected](self, "isSelected") & 1) != 0)
    CAMYellowColor();
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");

  -[CAMDirectionalIndicator _arrowLayer](self, "_arrowLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v7;
  else
    v8 = v16;
  v9 = v8;

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", objc_msgSend(v9, "strokeColor"));
    objc_msgSend(v10, "setToValue:", v6);
    LODWORD(v11) = 1045220557;
    LODWORD(v12) = 1041865114;
    LODWORD(v13) = 1.0;
    LODWORD(v14) = 1045220557;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v14, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimingFunction:", v15);

    objc_msgSend(v10, "setDuration:", 0.5);
    objc_msgSend(v16, "addAnimation:forKey:", v10, CFSTR("selectionColor"));

  }
  objc_msgSend(v16, "setStrokeColor:", v6);

}

- (id)accessibilityIdentifier
{
  return CFSTR("StatusBarCameraControlsButton");
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = -[CAMDirectionalIndicator direction](self, "direction", a3);
  v5 = CFSTR("chevron.down");
  if (v4 != 1)
    v5 = 0;
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("chevron.up");
  v7 = (void *)MEMORY[0x1E0DC3870];
  -[CAMDirectionalIndicator traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemImageNamed:compatibleWithTraitCollection:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0DC3418]);
  v11 = (void *)objc_msgSend(v10, "initWithTitle:image:imageInsets:scaleImage:", 0, v9, 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return v11;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  -[CAMDirectionalIndicator sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (int64_t)direction
{
  return self->_direction;
}

- (CAShapeLayer)_arrowLayer
{
  return self->__arrowLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__arrowLayer, 0);
}

@end
