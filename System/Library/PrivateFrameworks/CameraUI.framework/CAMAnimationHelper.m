@implementation CAMAnimationHelper

+ (void)configurePowerSensitiveAnimation:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v3, "setDiscretizesTime:", 1);

}

+ (void)animateLayer:(id)a3 toFrame:(CGRect)a4 fromCurrentState:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double MidX;
  double MidY;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v23 = a3;
  objc_msgSend(v23, "presentationLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && a5)
  {
    objc_msgSend(v23, "presentationLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForKeyPath:", CFSTR("position"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "valueForKeyPath:", CFSTR("position"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v23, "presentationLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && a5)
  {
    objc_msgSend(v23, "presentationLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKeyPath:", CFSTR("bounds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v23, "valueForKeyPath:", CFSTR("bounds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MidX = CGRectGetMidX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v19 = CGRectGetWidth(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v20 = CGRectGetHeight(v27);
  objc_msgSend(v23, "setPosition:", MidX, MidY);
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v19, v20);
  objc_msgSend(a1, "_animationWithKeyPath:", CFSTR("position"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFromValue:", v13);
  objc_msgSend(a1, "_animationWithKeyPath:", CFSTR("bounds"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", v16);
  objc_msgSend(v23, "addAnimation:forKey:", v21, CFSTR("positionAnimation"));
  objc_msgSend(v23, "addAnimation:forKey:", v22, CFSTR("boundsAnimation"));

}

+ (id)_animationWithKeyPath:(id)a3
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 2.0);
  objc_msgSend(v3, "setStiffness:", 300.0);
  objc_msgSend(v3, "setDamping:", 400.0);
  objc_msgSend(v3, "setVelocity:", 0.0);
  UIAnimationDragCoefficient();
  objc_msgSend(v3, "setDuration:", v4 * 0.91);
  LODWORD(v5) = 1043928040;
  LODWORD(v6) = 1058272560;
  LODWORD(v7) = 1063980840;
  LODWORD(v8) = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v9);

  objc_msgSend(v3, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  return v3;
}

+ (void)animateLayer:(id)a3 forButtonHighlighted:(BOOL)a4 layoutStyle:(int64_t)a5
{
  objc_msgSend(a1, "setLayer:highlighted:inverted:animated:layoutStyle:", a3, a4, 0, 1, a5);
}

+ (void)setLayer:(id)a3 highlighted:(BOOL)a4 inverted:(BOOL)a5 animated:(BOOL)a6 layoutStyle:(int64_t)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  objc_msgSend(v12, "presentationLayer");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  v16 = v15;

  objc_msgSend(v16, "valueForKeyPath:", CFSTR("transform.scale.xy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  memset(&v34, 0, sizeof(v34));
  objc_msgSend(v16, "valueForKeyPath:", CFSTR("transform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
    objc_msgSend(v20, "CATransform3DValue");
  else
    memset(&v34, 0, sizeof(v34));

  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeScale(&v33, v19, v19, 1.0);
  memset(&v32, 0, sizeof(v32));
  a = v33;
  CATransform3DInvert(&b, &a);
  a = v34;
  CATransform3DConcat(&v32, &a, &b);
  if (v10)
  {
    objc_msgSend(a1, "highlightScaleForLayoutStyle:", a7);
    memset(&a.m21, 0, 96);
    if (v9)
      v22 = 1.0 / v22;
    memset(&a, 0, 32);
    CATransform3DMakeScale(&a, v22, v22, 1.0);
    v28 = v32;
    v27 = a;
    CATransform3DConcat(&v29, &v28, &v27);
    v32 = v29;
  }
  if (v8)
  {
    objc_msgSend(a1, "highlightTransformAnimation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    a = v34;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFromValue:", v24);

    a = v32;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &a);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setToValue:", v25);

    objc_msgSend(v12, "addAnimation:forKey:", v23, CFSTR("highlightScaleAnimation"));
  }
  v26 = v32;
  objc_msgSend(v12, "setTransform:", &v26);

}

+ (double)highlightScaleForLayoutStyle:(int64_t)a3
{
  return dbl_1DB9A8030[a3 == 1];
}

+ (id)highlightTransformAnimation
{
  float v2;
  float v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  UIAnimationDragCoefficient();
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", 0.8);
  objc_msgSend(v4, "setVelocity:", 0.0);
  objc_msgSend(v4, "setDamping:", 12.0 / v3);
  objc_msgSend(v4, "setStiffness:", 300.0 / (float)(v3 * v3));
  objc_msgSend(v4, "durationForEpsilon:", 0.01);
  objc_msgSend(v4, "setDuration:");
  LODWORD(v5) = 1041865114;
  LODWORD(v6) = 0;
  LODWORD(v7) = 0.5;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v9);

  return v4;
}

@end
