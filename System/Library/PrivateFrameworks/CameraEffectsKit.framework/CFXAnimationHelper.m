@implementation CFXAnimationHelper

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

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", a3);
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
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v5, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimingFunction:", v9);

  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5970]);
  return v3;
}

+ (void)animateLayer:(id)a3 forButtonHighlighted:(BOOL)a4 layoutStyle:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  float v9;
  float v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  CGFloat v26;
  void *v27;
  void *v28;
  CATransform3D v29;
  CATransform3D v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v35;
  CATransform3D v36;
  CATransform3D v37;

  v6 = a4;
  v8 = a3;
  UIAnimationDragCoefficient();
  v10 = v9;
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("transform"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMass:", 0.8);
  objc_msgSend(v11, "setVelocity:", 0.0);
  objc_msgSend(v11, "setDamping:", 12.0 / v10);
  objc_msgSend(v11, "setStiffness:", 300.0 / (float)(v10 * v10));
  objc_msgSend(v11, "durationForEpsilon:", 0.01);
  objc_msgSend(v11, "setDuration:");
  LODWORD(v12) = 1041865114;
  LODWORD(v13) = 0;
  LODWORD(v14) = 0.5;
  LODWORD(v15) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v16);

  objc_msgSend(v8, "presentationLayer");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v8;
  v20 = v19;

  objc_msgSend(v20, "valueForKeyPath:", CFSTR("transform.scale.xy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  memset(&v37, 0, sizeof(v37));
  objc_msgSend(v20, "valueForKeyPath:", CFSTR("transform"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    objc_msgSend(v24, "CATransform3DValue");
  else
    memset(&v37, 0, sizeof(v37));

  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeScale(&v36, v23, v23, 1.0);
  memset(&v35, 0, sizeof(v35));
  a = v36;
  CATransform3DInvert(&b, &a);
  a = v37;
  CATransform3DConcat(&v35, &a, &b);
  if (v6)
  {
    objc_msgSend(a1, "_highlightScaleForLayoutStyle:", a5);
    memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&a, v26, v26, 1.0);
    v31 = v35;
    v30 = a;
    CATransform3DConcat(&v32, &v31, &v30);
    v35 = v32;
  }
  a = v37;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &a);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v27);

  a = v35;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &a);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v28);

  objc_msgSend(v8, "addAnimation:forKey:", v11, CFSTR("highlightScaleAnimation"));
  v29 = v35;
  objc_msgSend(v8, "setTransform:", &v29);

}

+ (double)_highlightScaleForLayoutStyle:(int64_t)a3
{
  return dbl_226AB6EB0[a3 == 1];
}

+ (void)configurePowerSensitiveAnimation:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setFrameInterval:", 0.0166666667);
  objc_msgSend(v3, "setDiscretizesTime:", 1);

}

@end
