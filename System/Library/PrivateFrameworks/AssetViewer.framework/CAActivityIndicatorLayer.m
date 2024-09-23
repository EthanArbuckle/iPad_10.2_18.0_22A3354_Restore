@implementation CAActivityIndicatorLayer

- (CAActivityIndicatorLayer)initWithColor:(id)a3
{
  id v5;
  CAActivityIndicatorLayer *v6;
  CAActivityIndicatorLayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAActivityIndicatorLayer;
  v6 = -[CAActivityIndicatorLayer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_spokeFrameRatio = 2;
    v6->_spokeCount = 8;
    objc_storeStrong((id *)&v6->_uiColor, a3);
    v7->_color = -[UIColor CGColor](v7->_uiColor, "CGColor");
  }

  return v7;
}

- (id)spinnerImages
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CAActivityIndicatorLayer_spinnerImages__block_invoke;
  v3[3] = &unk_1E9F0C3E8;
  v3[4] = self;
  v3[5] = a2;
  if (spinnerImages_onceToken != -1)
    dispatch_once(&spinnerImages_onceToken, v3);
  return (id)spinnerImages__spinnerImages;
}

void __41__CAActivityIndicatorLayer_spinnerImages__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t i;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v2 = _asvLogHandle;
  if (!_asvLogHandle)
  {
    ASVInitLogging();
    v2 = _asvLogHandle;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D93A7000, v2, OS_LOG_TYPE_INFO, "#Inline: Creating spinner images", v10, 2u);
  }
  v3 = (void *)objc_opt_new();
  for (i = 0; i != 16; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageForStep:withColor:", i, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGImage");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("CAActivityIndicatorLayer.m"), 74, CFSTR("Expect image to be generated"));

    }
    objc_msgSend(v3, "addObject:", v6);
  }
  v8 = objc_msgSend(v3, "copy");
  v9 = (void *)spinnerImages__spinnerImages;
  spinnerImages__spinnerImages = v8;

}

- (void)startAnimating
{
  void *v3;
  double v4;
  id v5;

  -[CAActivityIndicatorLayer spinnerImages](self, "spinnerImages");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("contents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  objc_msgSend(v3, "setDuration:", 0.800000012);
  LODWORD(v4) = 2139095040;
  objc_msgSend(v3, "setRepeatCount:", v4);
  objc_msgSend(v3, "setValues:", v5);
  -[CAActivityIndicatorLayer addAnimation:forKey:](self, "addAnimation:forKey:", v3, CFSTR("contents"));

}

- (void)stopAnimating
{
  -[CAActivityIndicatorLayer removeAllAnimations](self, "removeAllAnimations");
  -[CAActivityIndicatorLayer setContents:](self, "setContents:", 0);
}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[CAActivityIndicatorLayer animationKeys](self, "animationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("contents"));

  return v3;
}

- (double)_spokeWidthForGearWidth:(double)a3
{
  double v3;
  BOOL v4;
  double v5;
  double v7;

  v3 = 1.0;
  if (a3 == 14.0)
    return v3;
  if (a3 == 20.0)
  {
    v4 = self->_spokeCount == 12;
    v5 = 1.25;
    v3 = 1.0;
    goto LABEL_4;
  }
  v3 = 1.75;
  if (a3 == 30.0)
    return v3;
  v3 = 2.0;
  if (a3 == 32.0)
    return v3;
  if (a3 == 37.0)
  {
    v4 = self->_spokeCount == 12;
    v5 = 2.5;
    v3 = 1.5;
LABEL_4:
    if (!v4)
      return v5;
    return v3;
  }
  v3 = 3.5;
  if (a3 != 60.0)
  {
    v7 = nearbyint(a3 / 7.5) * 0.5;
    v3 = 1.0;
    if (v7 >= 1.0)
      return v7;
  }
  return v3;
}

- (double)_spokeLengthForGearWidth:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;

  if (a3 != 20.0)
    return nearbyint(a3 * 0.25);
  -[CAActivityIndicatorLayer contentsScale](self, "contentsScale", v3, v4);
  return round(v5 * 6.5 / v5);
}

- (double)_widthForGearWidth:(double)result
{
  if (result == 37.0)
    return 35.0;
  return result;
}

- (double)_alphaValueForStep:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  double result;

  v5 = -[CAActivityIndicatorLayer _spokeCount](self, "_spokeCount");
  v6 = -[CAActivityIndicatorLayer _spokeFrameRatio](self, "_spokeFrameRatio") * v5;
  result = 1.0;
  if ((unint64_t)(v6 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    result = (double)a3 * (-0.68 / (double)(v6 / 2)) + 1.0;
    if (result < 0.32)
      return 0.32;
  }
  return result;
}

- (id)imageForStep:(int64_t)a3 withColor:(CGColor *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t spokeCount;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CGContext *CurrentContext;
  size_t NumberOfComponents;
  const CGFloat *Components;
  double v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  double v28;
  CGColor *CopyWithAlpha;
  void *v30;
  CGSize v32;

  -[CAActivityIndicatorLayer _spokeWidthForGearWidth:](self, "_spokeWidthForGearWidth:", 20.0);
  v8 = v7;
  -[CAActivityIndicatorLayer _spokeLengthForGearWidth:](self, "_spokeLengthForGearWidth:", 20.0);
  v10 = v9;
  spokeCount = self->_spokeCount;
  -[CAActivityIndicatorLayer _widthForGearWidth:](self, "_widthForGearWidth:", 20.0);
  v13 = v12 * 0.5;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v12 * 0.5 - v8, v10, v8 + v8, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAActivityIndicatorLayer _widthForGearWidth:](self, "_widthForGearWidth:", 20.0);
  v16 = v15;
  v32.width = 20.0;
  v32.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  NumberOfComponents = CGColorGetNumberOfComponents(a4);
  Components = CGColorGetComponents(a4);
  if (NumberOfComponents)
    v20 = Components[NumberOfComponents - 1];
  else
    v20 = 1.0;
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, 0.0);
  v21 = -[CAActivityIndicatorLayer _spokeFrameRatio](self, "_spokeFrameRatio");
  v22 = -[CAActivityIndicatorLayer _spokeFrameRatio](self, "_spokeFrameRatio");
  if (spokeCount >= 1)
  {
    v23 = 0;
    v24 = a3 % v21;
    v25 = a3 / v22;
    do
    {
      v26 = v24 + -[CAActivityIndicatorLayer _spokeFrameRatio](self, "_spokeFrameRatio") * (v25 + v23);
      v27 = v26 % (-[CAActivityIndicatorLayer _spokeFrameRatio](self, "_spokeFrameRatio") * spokeCount);
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, v13, v13);
      CGContextRotateCTM(CurrentContext, -6.28318531 / (double)spokeCount * (double)(int)v23);
      CGContextTranslateCTM(CurrentContext, -v13, -v13);
      -[CAActivityIndicatorLayer _alphaValueForStep:](self, "_alphaValueForStep:", v27);
      CopyWithAlpha = CGColorCreateCopyWithAlpha(a4, v20 * v28);
      CGContextSetFillColorWithColor(CurrentContext, CopyWithAlpha);
      CGContextSetStrokeColorWithColor(CurrentContext, CopyWithAlpha);
      objc_msgSend(v14, "fillWithBlendMode:alpha:", 17, 0.85);
      CGContextRestoreGState(CurrentContext);
      ++v23;
    }
    while (spokeCount != v23);
  }
  CGContextTranslateCTM(CurrentContext, (20.0 - v16) * -0.5, (20.0 - v16) * -0.5);
  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v30;
}

- (int64_t)_spokeCount
{
  return self->_spokeCount;
}

- (int64_t)_spokeFrameRatio
{
  return self->_spokeFrameRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiColor, 0);
}

@end
