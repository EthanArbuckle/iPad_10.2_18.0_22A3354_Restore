@implementation SFToggleBackgroundView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)shapeLayer
{
  if (a1)
  {
    objc_msgSend(a1, "layer");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFToggleBackgroundView;
  -[SFToggleBackgroundView layoutSubviews](&v3, sel_layoutSubviews);
  -[SFToggleBackgroundView _updateShape](self);
}

- (void)_updateShape
{
  uint64_t v2;
  int v3;
  double v4;
  int v5;
  double v6;
  int v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double v16;
  double MaxY;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double MaxX;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (a1)
  {
    v2 = a1[54];
    v3 = objc_msgSend(a1, "_sf_usesLeftToRightLayout");
    objc_msgSend(a1, "_continuousCornerRadius");
    if (v2)
      v5 = v3;
    else
      v5 = 1;
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v7 = v3 ^ 1;
    if (!v2)
      v7 = 1;
    if (v5)
      v8 = v4;
    else
      v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v5)
      v9 = v4;
    else
      v9 = *MEMORY[0x1E0C9D820];
    v28 = v8;
    v29 = v9;
    if (v7)
      v6 = v4;
    else
      v4 = *MEMORY[0x1E0C9D820];
    v30 = v4;
    v31 = v6;
    objc_msgSend(a1, "bounds");
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MinY = CGRectGetMinY(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v16 = CGRectGetMinY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v26 = CGRectGetMaxX(v37);
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MaxY = CGRectGetMaxY(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v27 = CGRectGetMinX(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v18 = CGRectGetMaxY(v40);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "moveToPoint:", MinX, MinY + v28 * 1.528665);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 1, 0, MinX, MinY, v29, v28);
    objc_msgSend(v19, "addLineToPoint:", MaxX - v30 * 1.528665, v16);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 2, 0, MaxX, v16, v30, v31);
    objc_msgSend(v19, "addLineToPoint:", v26, MaxY - v31 * 1.528665);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 8, 0, v26, MaxY, v30, v31);
    objc_msgSend(v19, "addLineToPoint:", v27 + v29 * 1.528665, v18);
    objc_msgSend(v19, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v27, v18, v29, v28);
    objc_msgSend(v19, "closePath");
    objc_msgSend(a1, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_retainAutorelease(v19);
    objc_msgSend(v20, "setPath:", objc_msgSend(v32, "CGPath"));
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentationLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueForKeyPath:", CFSTR("path"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFromValue:", v23);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimingFunction:", v24);

    objc_msgSend(v21, "setFillMode:", *MEMORY[0x1E0CD2B50]);
    objc_msgSend(v21, "setRemovedOnCompletion:", 1);
    objc_msgSend(v20, "addAnimation:forKey:", v21, CFSTR("path"));

  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  double v5;
  objc_super v6;

  -[SFToggleBackgroundView _continuousCornerRadius](self, "_continuousCornerRadius");
  if (v5 != a3)
    -[SFToggleBackgroundView setNeedsLayout](self, "setNeedsLayout");
  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  -[SFToggleBackgroundView _setContinuousCornerRadius:](&v6, sel__setContinuousCornerRadius_, a3);
}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  -[SFToggleBackgroundView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[SFToggleBackgroundView tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[SFToggleBackgroundView shapeLayer](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFToggleBackgroundView;
  -[SFToggleBackgroundView _dynamicUserInterfaceTraitDidChange](&v6, sel__dynamicUserInterfaceTraitDidChange);
  -[SFToggleBackgroundView tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[SFToggleBackgroundView shapeLayer](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

}

@end
