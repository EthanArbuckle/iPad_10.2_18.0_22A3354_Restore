@implementation PKRulerLayer

- (PKRulerLayer)initWithRulerController:(id)a3
{
  PKRulerLayer *v4;
  id v5;
  objc_super v7;
  id location;

  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)PKRulerLayer;
  v4 = -[PKRulerLayer init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_rulerController, v5);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (BOOL)compactRuler
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (id)_rulerImage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC3E88];
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(v2, "traitCollectionWithHorizontalSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ios_ruler_bg"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rulerDialImage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC3E88];
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(v2, "traitCollectionWithHorizontalSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ios_ruler_angle_dial"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rulerDialLevelImage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0DC3E88];
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(v2, "traitCollectionWithHorizontalSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ios_ruler_angle_level"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)rulerWidth
{
  void *v2;
  double v3;
  double v4;

  -[PKRulerLayer _rulerImage](self, "_rulerImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (double)rulerTickMarkInset
{
  return 4.5;
}

- (double)rulerAlignInset
{
  return 9.0;
}

- (void)setRulerAlpha:(double)a3
{
  self->_rulerAlpha = a3;
  -[PKRulerLayer updateRulerAlpha:](self, "updateRulerAlpha:");
}

- (void)updateRulerAlpha:(double)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  unsigned __int8 *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "opacity");
  v6 = v5;

  if (v6 != a3)
  {
    v7 = a3;
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = v7;
    objc_msgSend(v15, "setOpacity:", v8);

    -[PKRulerLayer rulerController](self, "rulerController");
    v9 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v18 = 0;
      goto LABEL_5;
    }
    v10 = v9[18];

    if (v10)
    {
      -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v11 = v7;
      objc_msgSend(v16, "setOpacity:", v11);

      -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v12 = v7;
      objc_msgSend(v17, "setOpacity:", v12);

      -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      *(float *)&v13 = v7;
      objc_msgSend(v18, "setOpacity:", v13);
LABEL_5:

    }
  }
}

- (CGAffineTransform)rulerTransform
{
  void *v4;
  CGAffineTransform *result;
  id v6;

  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "affineTransform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  void *v3;
  __int128 v4;

  -[PKRulerLayer rulerLayer](self, "rulerLayer", *(_QWORD *)&a3->a, *(_QWORD *)&a3->b, *(_QWORD *)&a3->c, *(_QWORD *)&a3->d, *(_QWORD *)&a3->tx, *(_QWORD *)&a3->ty);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAffineTransform:", &v4);

}

- (void)updateRulerTickMarkImage
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGContext *CurrentContext;
  void *v10;
  double v11;
  CGPath *Mutable;
  _BOOL4 v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform *v34;
  void *v35;
  double v36;
  _OWORD v37[3];
  CGAffineTransform v38;
  CGAffineTransform v39;
  _OWORD v40[3];
  CGSize v41;

  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    -[PKRulerLayer rulerWidth](self, "rulerWidth");
    v8 = v7;
    v41.width = 50.0;
    v41.height = v8;
    UIGraphicsBeginImageContextWithOptions(v41, 0, v6);
    CurrentContext = UIGraphicsGetCurrentContext();
    -[PKRulerLayer _rulerImage](self, "_rulerImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerWidth](self, "rulerWidth");
    objc_msgSend(v10, "drawInRect:", 0.0, 0.0, 50.0, v11);

    Mutable = CGPathCreateMutable();
    v13 = -[PKRulerLayer compactRuler](self, "compactRuler");
    v14 = 0;
    if (v13)
      v15 = 10.0;
    else
      v15 = 16.0;
    if (v13)
      v16 = 6.0;
    else
      v16 = 8.0;
    if (v13)
      v17 = 3.0;
    else
      v17 = 5.0;
    v36 = v6;
    v18 = 0.5 / v6;
    do
    {
      v19 = v14 - 5;
      if (v14 < 5)
        v19 = v14;
      if (v19)
        v20 = v17;
      else
        v20 = v16;
      if (v14)
        v21 = v20;
      else
        v21 = v15;
      v22 = v18 + floor((double)v14 * 5.0);
      CGPathMoveToPoint(Mutable, 0, v22, 4.5);
      v23 = (double)(unint64_t)v21 + 4.5;
      CGPathAddLineToPoint(Mutable, 0, v22, v23);
      CGPathMoveToPoint(Mutable, 0, v22, v8 + -4.5);
      CGPathAddLineToPoint(Mutable, 0, v22, v8 - v23);
      ++v14;
    }
    while (v14 != 10);
    CGContextSetLineWidth(CurrentContext, 1.0 / v36);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetRGBStrokeColor(CurrentContext, 0.45, 0.45, 0.45, 1.0);
    CGContextStrokePath(CurrentContext);
    CGPathRelease(Mutable);
    UIGraphicsGetImageFromCurrentImageContext();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
    v25 = objc_retainAutorelease(v24);
    v26 = objc_msgSend(v25, "CGImage");
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContents:", v26);

    if (-[PKRulerLayer zooming](self, "zooming"))
    {
      -[PKRulerLayer rulerZoomStartCenterTValueOnScreen](self, "rulerZoomStartCenterTValueOnScreen");
      v29 = v28;
      -[PKRulerLayer rulerZoomStartScale](self, "rulerZoomStartScale");
      v31 = v30;
      -[PKRulerLayer rulerZoomStartCenterTValueOnScreen](self, "rulerZoomStartCenterTValueOnScreen");
      v33 = v32;
      -[PKRulerLayer rulerController](self, "rulerController");
      v34 = (CGAffineTransform *)objc_claimAutoreleasedReturnValue();
      -[PKRulerLayer rulerZoomStartTransform](self, "rulerZoomStartTransform");
      CGAffineTransformTranslate(&v39, &v38, (v33 - v29 * 50.0 / floor(v31 * 50.0)) * 4000.0, 0.0);
      -[PKRulerLayer rulerLayer](self, "rulerLayer", -[PKRulerController pixelSnapRulerTransform:](v34, (uint64_t)&v39, v40));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v40[0];
      v37[1] = v40[1];
      v37[2] = v40[2];
      objc_msgSend(v35, "setAffineTransform:", v37);

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

  }
}

- (id)addOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 toOpacity:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimingFunction:", v10);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "opacity");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromValue:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToValue:", v13);

  objc_msgSend(v7, "opacity");
  objc_msgSend(v9, "setDuration:", vabdd_f64(v14, a5) * 0.3);
  if (v8)
  {
    objc_msgSend(v9, "setValue:forKey:", v7, CFSTR("ICLayer"));
    objc_msgSend(v9, "setDelegate:", v8);
  }
  *(float *)&v15 = a5;
  objc_msgSend(v7, "setOpacity:", v15);
  objc_msgSend(v7, "addAnimation:forKey:", v9, CFSTR("fade"));

  return v9;
}

- (id)addScaleAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CATransform3D v18;
  CATransform3D v19;
  CATransform3D v20;
  CATransform3D v21;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v12);

  v13 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v21, a5, a5, 1.0);
  objc_msgSend(v13, "valueWithCATransform3D:", &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v14);

  v15 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v20, a6, a6, 1.0);
  objc_msgSend(v15, "valueWithCATransform3D:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToValue:", v16);

  objc_msgSend(v11, "setDuration:", 0.2);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v11, "setRemovedOnCompletion:", 0);
  if (v10)
  {
    objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("ICLayer"));
    objc_msgSend(v11, "setDelegate:", v10);
  }
  CATransform3DMakeScale(&v19, a6, a6, 1.0);
  v18 = v19;
  objc_msgSend(v9, "setTransform:", &v18);
  objc_msgSend(v9, "addAnimation:forKey:", v11, CFSTR("scale"));

  return v11;
}

- (void)addScaleAndOpacityAnimationOnLayer:(id)a3 delegate:(id)a4 fromScale:(double)a5 toScale:(double)a6 fromAlpha:(double)a7 toAlpha:(double)a8
{
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  float v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  float v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  CATransform3D v50;
  CATransform3D v51;
  CATransform3D v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  _QWORD v56[7];

  v56[4] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  if (a5 <= a6)
    v15 = a6;
  else
    v15 = a5;
  if (a5 <= a6)
    v16 = 0.133333333;
  else
    v16 = 0.0666666667;
  if (a5 <= a6)
    v17 = 0.0666666667;
  else
    v17 = 0.133333333;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunction:", v20);

  v21 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v55, a5, a5, 1.0);
  objc_msgSend(v21, "valueWithCATransform3D:", &v55);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFromValue:", v22);

  v23 = v15 * 1.066;
  v24 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v54, v23, v23, 1.0);
  objc_msgSend(v24, "valueWithCATransform3D:", &v54);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setToValue:", v25);

  objc_msgSend(v18, "setDuration:", v16);
  v26 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v18, "setRemovedOnCompletion:", 0);
  if (v14)
  {
    objc_msgSend(v18, "setValue:forKey:", v13, CFSTR("ICLayer"));
    objc_msgSend(v18, "setDelegate:", v14);
  }
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTimingFunction:", v28);

  v29 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v53, v23, v23, 1.0);
  objc_msgSend(v29, "valueWithCATransform3D:", &v53);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFromValue:", v30);

  v31 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v52, a6, a6, 1.0);
  objc_msgSend(v31, "valueWithCATransform3D:", &v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setToValue:", v32);

  objc_msgSend(v27, "setBeginTime:", v16);
  objc_msgSend(v27, "setDuration:", v17);
  objc_msgSend(v27, "setFillMode:", v26);
  objc_msgSend(v27, "setRemovedOnCompletion:", 0);
  if (v14)
  {
    objc_msgSend(v27, "setValue:forKey:", v13, CFSTR("ICLayer"));
    objc_msgSend(v27, "setDelegate:", v14);
  }
  CATransform3DMakeScale(&v51, a6, a6, 1.0);
  v50 = v51;
  objc_msgSend(v13, "setTransform:", &v50);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v19);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTimingFunction:", v34);

  *(float *)&v35 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFromValue:", v36);

  if (a5 <= a6)
    v37 = a8;
  else
    v37 = a7;
  v38 = v37;
  *(float *)&v37 = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setToValue:", v39);

  objc_msgSend(v33, "setDuration:", v16);
  objc_msgSend(v33, "setFillMode:", v26);
  objc_msgSend(v33, "setRemovedOnCompletion:", 0);
  if (v14)
  {
    objc_msgSend(v33, "setValue:forKey:", v13, CFSTR("ICLayer"));
    objc_msgSend(v33, "setDelegate:", v14);
  }
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTimingFunction:", v41);

  *(float *)&v42 = v38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFromValue:", v43);

  v44 = a8;
  *(float *)&v45 = v44;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setToValue:", v46);

  objc_msgSend(v40, "setBeginTime:", v16);
  objc_msgSend(v40, "setDuration:", v17);
  objc_msgSend(v40, "setFillMode:", v26);
  objc_msgSend(v40, "setRemovedOnCompletion:", 0);
  if (v14)
  {
    objc_msgSend(v40, "setValue:forKey:", v13, CFSTR("ICLayer"));
    objc_msgSend(v40, "setDelegate:", v14);
  }
  *(float *)&v47 = v44;
  objc_msgSend(v13, "setOpacity:", v47);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v18;
  v56[1] = v27;
  v56[2] = v33;
  v56[3] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAnimations:", v49);

  objc_msgSend(v48, "setDuration:", 0.2);
  objc_msgSend(v13, "addAnimation:forKey:", v48, CFSTR("scaleAndFade"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "valueForKey:", CFSTR("ICLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("ICLayer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperlayer");

  }
}

- (void)showRuler
{
  CGAffineTransform *v3;
  double v4;
  double v5;
  _OWORD *v6;
  __int128 v7;
  _BYTE *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _OWORD *v22;
  void *v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  double v37;
  _OWORD v38[3];

  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v3 = (CGAffineTransform *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PKRulerLayer previousRulerTransform](self, "previousRulerTransform");
    v4 = sqrt(v37 * v37 + v36 * v36);
    if (v4 > 0.01)
    {
      -[PKRulerLayer previousRulerTransform](self, "previousRulerTransform");
    }
    else
    {
      -[PKRulerLayer rulerController](self, "rulerController");
      v3 = (CGAffineTransform *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKRulerController defaultRulerTransform](v3, v38);
    }
    -[PKRulerLayer rulerController](self, "rulerController", v5);
    v6 = (_OWORD *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v38[1];
      v6[7] = v38[0];
      v6[8] = v7;
      v6[9] = v38[2];
    }

    if (v4 <= 0.01)
    -[PKRulerLayer rulerController](self, "rulerController");
    v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v8[18] = 0;

    v9 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[PKRulerLayer setRulerLayer:](self, "setRulerLayer:", v9);

    -[PKRulerLayer rulerWidth](self, "rulerWidth");
    v11 = v10;
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, 4000.0, v11);

    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPosition:", v13, v14);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentsScale:", v18);

    -[PKRulerLayer updateRulerTickMarkImage](self, "updateRulerTickMarkImage");
    v20 = *MEMORY[0x1E0CD29F0];
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentsScaling:", v20);

    -[PKRulerLayer rulerController](self, "rulerController");
    v22 = (_OWORD *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22[8];
      v33 = v22[7];
      v34 = v24;
      v35 = v22[9];
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
    }
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v33;
    v32[1] = v34;
    v32[2] = v35;
    objc_msgSend(v25, "setAffineTransform:", v32);

    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer addSublayer:](self, "addSublayer:", v26);

    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v28) = 0;
    objc_msgSend(v27, "setOpacity:", v28);

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __25__PKRulerLayer_showRuler__block_invoke;
    v31[3] = &unk_1E7776F38;
    v31[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v31);
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", v29, 0, 1.0);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

uint64_t __25__PKRulerLayer_showRuler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRulerAlpha:", 1.0);
}

- (void)hideRulerAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v3 = a3;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      -[PKRulerLayer removeRulerMarkers](self, "removeRulerMarkers");
      -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", v6, 0, 0.0);

      -[PKRulerLayer rulerLayer](self, "rulerLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", v8, self, 0.0);
    }
    else
    {
      -[PKRulerLayer rulerLayer](self, "rulerLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperlayer");

      -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperlayer");
    }

    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "affineTransform");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    -[PKRulerLayer setPreviousRulerTransform:](self, "setPreviousRulerTransform:", v13);

  }
  -[PKRulerLayer setRulerLayer:](self, "setRulerLayer:", 0);
  -[PKRulerLayer setRulerAngleMarker:](self, "setRulerAngleMarker:", 0);
}

- (BOOL)shouldUseLargestRulerTextFontSize
{
  return 0;
}

- (void)updateAngleWithAngleMarkerPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  float v61;
  float v62;
  void *v63;
  float v64;
  float v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _OWORD v83[3];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  _QWORD v91[2];

  y = a3.y;
  x = a3.x;
  v91[1] = *MEMORY[0x1E0C80C00];
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v6 = 14.0;
  else
    v6 = 18.0;
  if (-[PKRulerLayer shouldUseLargestRulerTextFontSize](self, "shouldUseLargestRulerTextFontSize"))
    v6 = v6 + 10.0;
  -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[PKRulerLayer setRulerAngleMarker:](self, "setRulerAngleMarker:", v8);

    -[PKRulerLayer rulerDialImage](self, "rulerDialImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    v13 = v12;
    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, v11, v13);

    v15 = objc_retainAutorelease(v9);
    v16 = objc_msgSend(v15, "CGImage");
    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContents:", v16);

    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 0;
    objc_msgSend(v18, "setOpacity:", v19);

    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer insertSublayer:above:](self, "insertSublayer:above:", v20, v21);

    v22 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[PKRulerLayer setRulerAngleTick:](self, "setRulerAngleTick:", v22);

    -[PKRulerLayer rulerDialLevelImage](self, "rulerDialLevelImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "size");
    v25 = v24;
    v27 = v26;
    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", 0.0, 0.0, v25, v27);

    objc_msgSend(v15, "size");
    v30 = v29;
    objc_msgSend(v15, "size");
    v32 = v31;
    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setPosition:", v30 * 0.5, v32 * 0.5);

    v34 = objc_retainAutorelease(v23);
    v35 = objc_msgSend(v34, "CGImage");
    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContents:", v35);

    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = 1.0;
    objc_msgSend(v37, "setOpacity:", v38);

    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "insertSublayer:above:", v40, v41);

    v42 = objc_alloc_init(MEMORY[0x1E0CD28A0]);
    -[PKRulerLayer setRulerAngleText:](self, "setRulerAngleText:", v42);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scale");
    v45 = v44;
    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setContentsScale:", v45);

    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", 0.0, 0.0, 75.0, v6 + 4.0);

    objc_msgSend(v15, "size");
    v49 = v48;
    objc_msgSend(v15, "size");
    v51 = v50;
    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setPosition:", v49 * 0.5, v51 * 0.5);

    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v55 = objc_msgSend(v54, "CGColor");
    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setForegroundColor:", v55);

    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "insertSublayer:above:", v58, v59);

  }
  -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "opacity");
  v62 = v61;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "opacity");
  v65 = v64;

  if (v62 < v65)
  {
    -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", v66, 0, 1.0);

  }
  -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setPosition:", x, y);

  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    objc_msgSend(v69, "affineTransform");
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v87 = 0u;
  }

  v89 = 0uLL;
  v84 = v87;
  v85 = v88;
  v86 = 0uLL;
  -[PKRulerLayer rulerAngleTick](self, "rulerAngleTick");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v84;
  v83[1] = v85;
  v83[2] = 0uLL;
  objc_msgSend(v71, "setAffineTransform:", v83);

  v72 = -[PKRulerLayer userAngle](self, "userAngle");
  v73 = objc_alloc(MEMORY[0x1E0CB3778]);
  v74 = (void *)MEMORY[0x1E0CB3940];
  _PencilKitBundle();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("°%d°"), CFSTR("°%d°"), CFSTR("Localizable"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "localizedStringWithFormat:", v76, v72);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v6);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v73, "initWithString:attributes:", v77, v79);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v81, 0, 1);

  -[PKRulerLayer rulerAngleText](self, "rulerAngleText");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setString:", v80);

}

- (int64_t)currentAngle
{
  double v2;
  double v3;
  double v6;

  -[PKRulerLayer rulerTransform](self, "rulerTransform");
  v2 = DKDTransformAngle(&v6);
  v3 = fmod(-v2, 360.0);
  if (v2 >= -360.0 && v2 <= 0.0)
    v3 = -v2;
  if (v3 < 0.0)
    v3 = v3 + 360.0;
  if (v3 == 0.0)
    v3 = 0.0;
  return llround(v3);
}

- (int64_t)userAngle
{
  int64_t v2;

  v2 = -[PKRulerLayer currentAngle](self, "currentAngle");
  if (v2 % 180 <= 90)
    return v2 % 180;
  else
    return 180 - v2 % 180;
}

- (void)hideRulerAngleMarker
{
  id v3;
  id v4;

  -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKRulerLayer addOpacityAnimationOnLayer:delegate:toOpacity:](self, "addOpacityAnimationOnLayer:delegate:toOpacity:", 0.0);

}

- (BOOL)viewPointInRuler:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:fromLayer:", self, x, y);
  v9 = v8;

  -[PKRulerLayer rulerWidth](self, "rulerWidth");
  if (v9 <= v10 * 0.15)
    return 0;
  -[PKRulerLayer rulerWidth](self, "rulerWidth");
  return v9 < v11 * 0.85;
}

- (CGPoint)getRulerCenterLineOriginAndTangent:(CGPoint *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGPoint result;

  memset(&v22, 0, sizeof(v22));
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "affineTransform");
  else
    memset(&v22, 0, sizeof(v22));

  memset(&v21, 0, sizeof(v21));
  -[PKRulerLayer rulerController](self, "rulerController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7 && (WeakRetained = objc_loadWeakRetained((id *)(v7 + 40))) != 0)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "strokeTransform");
  }
  else
  {
    v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformInvert(&v21, &v20);

  t1 = v22;
  v17 = v21;
  CGAffineTransformConcat(&v19, &t1, &v17);
  v22 = v19;
  v11 = *(_OWORD *)&v19.a;
  v12 = *(_OWORD *)&v19.tx;
  v13 = v19.c * 0.0;
  v14 = v19.d * 0.0;
  if (a3)
  {
    a3->x = v19.tx + v13 + v19.a * 2000.0;
    a3->y = *((double *)&v12 + 1) + v14 + *((double *)&v11 + 1) * 2000.0;
  }
  v15 = *(double *)&v12 + v13 + *(double *)&v11 * -2000.0;
  v16 = *((double *)&v12 + 1) + v14 + *((double *)&v11 + 1) * -2000.0;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)_fontSizeForRulerTextHUD:(id)a3
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v27;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(&stru_1E777DEE8, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(v29, "length"), CFSTR("X"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerLayer _distanceMarkerFontSize](self, "_distanceMarkerFontSize");
  v6 = v5;
  v7 = *MEMORY[0x1E0DC1138];
  v32 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATextLayer frame](self->_rulerDistanceText, "frame");
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, 1.79769313e308, v10);
  v12 = v11;
  -[CATextLayer frame](self->_rulerDistanceText, "frame");
  v14 = v13 - v12;
  if (v13 - v12 <= 3.0)
  {
    v16 = v14 > 3.5 && v14 < 3.0;
    v15 = 8.0;
    v17 = 8.0;
    if (v16 || v6 != 8.0)
    {
      v19 = v9;
      do
      {
        v15 = (v6 + v17) * 0.5;
        v30 = v7;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[CATextLayer frame](self->_rulerDistanceText, "frame");
        objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, 1.79769313e308, v21);
        v23 = v22;
        -[CATextLayer frame](self->_rulerDistanceText, "frame");
        v25 = v24 - v23;
        if (v24 - v23 < 3.0)
          v6 = (v6 + v17) * 0.5;
        else
          v17 = (v6 + v17) * 0.5;
        v27 = (v25 <= 3.5 || v25 >= 3.0) && v15 == v17;
        v19 = v9;
      }
      while (!v27);
    }
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

- (id)_textForRulerHUD:(double)a3
{
  PKRulerController **p_rulerController;
  id *WeakRetained;
  id *v7;
  id v8;
  void *v9;
  id *v10;
  id *v11;
  id v12;
  char v13;
  id *v14;
  id *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  p_rulerController = &self->_rulerController;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_rulerController);
  v7 = WeakRetained;
  if (!WeakRetained || (v8 = objc_loadWeakRetained(WeakRetained + 6)) == 0)
  {

LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), (uint64_t)a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer _fontSizeForRulerTextHUD:](self, "_fontSizeForRulerTextHUD:", v17);
    v26 = v25;
    v27 = objc_alloc(MEMORY[0x1E0CB3498]);
    v29 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v27, "initWithString:attributes:", v17, v22);
    goto LABEL_11;
  }
  v9 = v8;
  v10 = (id *)objc_loadWeakRetained((id *)p_rulerController);
  v11 = v10;
  if (v10)
    v12 = objc_loadWeakRetained(v10 + 6);
  else
    v12 = 0;
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
    goto LABEL_10;
  v14 = (id *)objc_loadWeakRetained((id *)p_rulerController);
  v15 = v14;
  if (v14)
    v16 = objc_loadWeakRetained(v14 + 6);
  else
    v16 = 0;
  objc_msgSend(v16, "rulerHostingStringFromPixels:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKRulerLayer _fontSizeForRulerTextHUD:](self, "_fontSizeForRulerTextHUD:", v17);
  v19 = v18;
  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@"), v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v23);

LABEL_11:
  return v24;
}

- (double)_distanceMarkerFontSize
{
  _BOOL4 v2;
  double result;

  v2 = -[PKRulerLayer compactRuler](self, "compactRuler");
  result = 18.0;
  if (v2)
    return 14.0;
  return result;
}

- (void)updateDistanceMarkerWithSpacing:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  float64x2_t v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  uint64_t v84;
  _QWORD v85[2];

  v85[1] = *MEMORY[0x1E0C80C00];
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v5 = 36.0;
  else
    v5 = 49.0;
  -[PKRulerLayer _distanceMarkerFontSize](self, "_distanceMarkerFontSize");
  v7 = v6;
  if (-[PKRulerLayer compactRuler](self, "compactRuler"))
    v8 = 9.0;
  else
    v8 = 13.0;
  v9 = -[PKRulerLayer shouldUseLargestRulerTextFontSize](self, "shouldUseLargestRulerTextFontSize");
  v10 = v7 + 10.0;
  if (v9)
    v11 = v8 + 7.0;
  else
    v11 = v8;
  if (v9)
    v12 = v7 + 10.0;
  else
    v12 = v7;
  if (v9)
    v13 = v5 + 26.0;
  else
    v13 = v5;
  -[PKRulerLayer maxTValueForSnappedDrawing](self, "maxTValueForSnappedDrawing", v5 + 26.0, v10);
  v15 = v14;
  -[PKRulerLayer minTValueForSnappedDrawing](self, "minTValueForSnappedDrawing");
  v17 = v16;
  -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[PKRulerLayer maxTValueForSnappedDrawing](self, "maxTValueForSnappedDrawing");
    v20 = v19;
    -[PKRulerLayer originTValueForSnappedDrawing](self, "originTValueForSnappedDrawing");
    v22 = vabdd_f64(v20, v21);
    -[PKRulerLayer minTValueForSnappedDrawing](self, "minTValueForSnappedDrawing");
    v24 = v23;
    -[PKRulerLayer originTValueForSnappedDrawing](self, "originTValueForSnappedDrawing");
    -[PKRulerLayer setIsRulerDrawingMovingToEndOfRuler:](self, "setIsRulerDrawingMovingToEndOfRuler:", v22 > vabdd_f64(v24, v25));
    v26 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[PKRulerLayer setRulerDistanceHUD:](self, "setRulerDistanceHUD:", v26);

    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v13, v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.96, 0.8);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v29);

    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", v13 * 0.5);

    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerLayer](self, "rulerLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer insertSublayer:above:](self, "insertSublayer:above:", v32, v33);

    v34 = objc_alloc_init(MEMORY[0x1E0CD28A0]);
    -[PKRulerLayer setRulerDistanceText:](self, "setRulerDistanceText:", v34);

    v35 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%ld"), 1234567890);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v35, "initWithString:attributes:", v36, v38);
    objc_msgSend(v39, "size");
    v41 = v40;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = objc_msgSend(v42, "CGColor");
    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setForegroundColor:", v43);

    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFontSize:", v12);

    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", 0.0, v11, v13, v41);

    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "scale");
    v50 = v49;
    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setContentsScale:", v50);

    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "insertSublayer:above:", v53, v54);

    -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerLayer addScaleAndOpacityAnimationOnLayer:delegate:fromScale:toScale:fromAlpha:toAlpha:](self, "addScaleAndOpacityAnimationOnLayer:delegate:fromScale:toScale:fromAlpha:toAlpha:", v55, 0, 0.25, 1.0, 0.0, 1.0);

  }
  -[PKRulerLayer currentTValueForSnappedDrawing](self, "currentTValueForSnappedDrawing");
  v57 = v56;
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    objc_msgSend(v58, "affineTransform");
    v79 = v81;
    v80 = v83;
    v60 = vmulq_f64(v82, (float64x2_t)0);
  }
  else
  {
    v60 = 0uLL;
    v80 = 0u;
    v79 = 0u;
  }
  v78 = v60;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "scale");
  v77 = v62;
  -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setPosition:", vmulq_n_f64(vrndaq_f64(vmulq_n_f64(vaddq_f64(v80, vmlaq_n_f64(v78, v79, v57 + -2000.0)), v77)), 1.0 / v77));

  v64 = (v15 - v17) / (a3 * 0.5);
  -[PKRulerLayer _textForRulerHUD:](self, "_textForRulerHUD:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "size");
  v68 = v67;
  -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "size");
  v71 = v70;
  objc_msgSend(v65, "size");
  v73 = v72;

  -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFrame:", v68 * 0.5 - v13 * 0.5, v71 * 0.5 - v73 * 0.5, v13, v73);

  -[PKRulerLayer _textForRulerHUD:](self, "_textForRulerHUD:", v64);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerLayer rulerDistanceText](self, "rulerDistanceText");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setString:", v75);

}

- (void)updateRulerMarkerForLocation:(CGPoint)a3 firstTouch:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  _QWORD v26[8];
  double v27;
  double v28;
  uint64_t v29;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v29 = *MEMORY[0x1E0C80C00];
  -[PKRulerLayer rulerLayer](self, "rulerLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    return;
  -[PKRulerLayer rulerController](self, "rulerController");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 40));
  else
    WeakRetained = 0;
  if (!objc_msgSend(WeakRetained, "isDrawing"))
  {

    if (!v4)
      return;
    goto LABEL_10;
  }
  -[PKRulerLayer rulerController](self, "rulerController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = objc_loadWeakRetained((id *)(v12 + 40));
  else
    v14 = 0;
  objc_msgSend(v14, "drawingController");
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKController inputController](v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isSnappedToRuler") | v4;

  if ((v17 & 1) != 0)
  {
LABEL_10:
    -[PKRulerLayer getRulerCenterLineOriginAndTangent:](self, "getRulerCenterLineOriginAndTangent:", &v27);
    *(double *)&v26[6] = v18;
    *(double *)&v26[7] = v19;
    v20 = ((y - v19) * (v28 - v19) + (x - v18) * (v27 - v18))
        / ((v28 - v19) * (v28 - v19) + (v27 - v18) * (v27 - v18))
        * 4000.0;
    -[PKRulerLayer setCurrentTValueForSnappedDrawing:](self, "setCurrentTValueForSnappedDrawing:", v20);
    if (v4)
    {
      -[PKRulerLayer setMinTValueForSnappedDrawing:](self, "setMinTValueForSnappedDrawing:", v20);
      -[PKRulerLayer setMaxTValueForSnappedDrawing:](self, "setMaxTValueForSnappedDrawing:", v20);
      -[PKRulerLayer setOriginTValueForSnappedDrawing:](self, "setOriginTValueForSnappedDrawing:", v20);
    }
    else
    {
      -[PKRulerLayer minTValueForSnappedDrawing](self, "minTValueForSnappedDrawing");
      -[PKRulerLayer setMinTValueForSnappedDrawing:](self, "setMinTValueForSnappedDrawing:", fmin(v21, v20));
      -[PKRulerLayer maxTValueForSnappedDrawing](self, "maxTValueForSnappedDrawing");
      -[PKRulerLayer setMaxTValueForSnappedDrawing:](self, "setMaxTValueForSnappedDrawing:", fmax(v22, v20));
      -[PKRulerLayer rulerController](self, "rulerController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRulerController canvasTransform]((uint64_t)v23, (uint64_t)v26);
      v24 = *(double *)v26;
      v25 = *(double *)&v26[1];

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
      -[PKRulerLayer updateDistanceMarkerWithSpacing:](self, "updateDistanceMarkerWithSpacing:", sqrt(v25 * v25 + v24 * v24));
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (void)removeRulerMarkers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKRulerLayer rulerLayer](self, "rulerLayer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "removeFromSuperlayer");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[PKRulerLayer rulerDistanceHUD](self, "rulerDistanceHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRulerLayer addScaleAndOpacityAnimationOnLayer:delegate:fromScale:toScale:fromAlpha:toAlpha:](self, "addScaleAndOpacityAnimationOnLayer:delegate:fromScale:toScale:fromAlpha:toAlpha:", v9, self, 1.0, 0.25, 1.0, 0.0);

  -[PKRulerLayer setRulerDistanceHUD:](self, "setRulerDistanceHUD:", 0);
  -[PKRulerLayer setRulerDistanceText:](self, "setRulerDistanceText:", 0);
  -[PKRulerLayer rulerAngleMarker](self, "rulerAngleMarker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperlayer");

  -[PKRulerLayer setRulerAngleMarker:](self, "setRulerAngleMarker:", 0);
  -[PKRulerLayer setRulerDistanceText:](self, "setRulerDistanceText:", 0);
}

- (PKRulerController)rulerController
{
  return (PKRulerController *)objc_loadWeakRetained((id *)&self->_rulerController);
}

- (void)setRulerController:(id)a3
{
  objc_storeWeak((id *)&self->_rulerController, a3);
}

- (double)rulerAlpha
{
  return self->_rulerAlpha;
}

- (CALayer)rulerAngleMarker
{
  return self->_rulerAngleMarker;
}

- (void)setRulerAngleMarker:(id)a3
{
  objc_storeStrong((id *)&self->_rulerAngleMarker, a3);
}

- (NSTimer)imageTransformTimer
{
  return self->_imageTransformTimer;
}

- (void)setImageTransformTimer:(id)a3
{
  objc_storeStrong((id *)&self->_imageTransformTimer, a3);
}

- (double)initialDrawingBoundsYOrigin
{
  return self->_initialDrawingBoundsYOrigin;
}

- (void)setInitialDrawingBoundsYOrigin:(double)a3
{
  self->_initialDrawingBoundsYOrigin = a3;
}

- (BOOL)isInlineResizing
{
  return self->_isInlineResizing;
}

- (void)setIsInlineResizing:(BOOL)a3
{
  self->_isInlineResizing = a3;
}

- (BOOL)isExpandedInline
{
  return self->_isExpandedInline;
}

- (void)setIsExpandedInline:(BOOL)a3
{
  self->_isExpandedInline = a3;
}

- (CALayer)rulerLayer
{
  return self->_rulerLayer;
}

- (void)setRulerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rulerLayer, a3);
}

- (CGAffineTransform)previousRulerTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].b;
  return self;
}

- (void)setPreviousRulerTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_previousRulerTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_previousRulerTransform.c = v4;
  *(_OWORD *)&self->_previousRulerTransform.tx = v3;
}

- (CALayer)rulerAngleTick
{
  return self->_rulerAngleTick;
}

- (void)setRulerAngleTick:(id)a3
{
  objc_storeStrong((id *)&self->_rulerAngleTick, a3);
}

- (CATextLayer)rulerAngleText
{
  return self->_rulerAngleText;
}

- (void)setRulerAngleText:(id)a3
{
  objc_storeStrong((id *)&self->_rulerAngleText, a3);
}

- (CALayer)rulerDistanceHUD
{
  return self->_rulerDistanceHUD;
}

- (void)setRulerDistanceHUD:(id)a3
{
  objc_storeStrong((id *)&self->_rulerDistanceHUD, a3);
}

- (CATextLayer)rulerDistanceText
{
  return self->_rulerDistanceText;
}

- (void)setRulerDistanceText:(id)a3
{
  objc_storeStrong((id *)&self->_rulerDistanceText, a3);
}

- (BOOL)isRulerDrawingMovingToEndOfRuler
{
  return self->_isRulerDrawingMovingToEndOfRuler;
}

- (void)setIsRulerDrawingMovingToEndOfRuler:(BOOL)a3
{
  self->_isRulerDrawingMovingToEndOfRuler = a3;
}

- (double)currentTValueForSnappedDrawing
{
  return self->_currentTValueForSnappedDrawing;
}

- (void)setCurrentTValueForSnappedDrawing:(double)a3
{
  self->_currentTValueForSnappedDrawing = a3;
}

- (double)minTValueForSnappedDrawing
{
  return self->_minTValueForSnappedDrawing;
}

- (void)setMinTValueForSnappedDrawing:(double)a3
{
  self->_minTValueForSnappedDrawing = a3;
}

- (double)maxTValueForSnappedDrawing
{
  return self->_maxTValueForSnappedDrawing;
}

- (void)setMaxTValueForSnappedDrawing:(double)a3
{
  self->_maxTValueForSnappedDrawing = a3;
}

- (double)originTValueForSnappedDrawing
{
  return self->_originTValueForSnappedDrawing;
}

- (void)setOriginTValueForSnappedDrawing:(double)a3
{
  self->_originTValueForSnappedDrawing = a3;
}

- (double)rulerZoomStartCenterTValueOnScreen
{
  return self->_rulerZoomStartCenterTValueOnScreen;
}

- (void)setRulerZoomStartCenterTValueOnScreen:(double)a3
{
  self->_rulerZoomStartCenterTValueOnScreen = a3;
}

- (double)rulerZoomStartScale
{
  return self->_rulerZoomStartScale;
}

- (void)setRulerZoomStartScale:(double)a3
{
  self->_rulerZoomStartScale = a3;
}

- (CGAffineTransform)rulerZoomStartTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].b;
  return self;
}

- (void)setRulerZoomStartTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerZoomStartTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_rulerZoomStartTransform.c = v4;
  *(_OWORD *)&self->_rulerZoomStartTransform.tx = v3;
}

- (BOOL)zooming
{
  return self->_zooming;
}

- (void)setZooming:(BOOL)a3
{
  self->_zooming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulerDistanceText, 0);
  objc_storeStrong((id *)&self->_rulerDistanceHUD, 0);
  objc_storeStrong((id *)&self->_rulerAngleText, 0);
  objc_storeStrong((id *)&self->_rulerAngleTick, 0);
  objc_storeStrong((id *)&self->_rulerLayer, 0);
  objc_storeStrong((id *)&self->_imageTransformTimer, 0);
  objc_storeStrong((id *)&self->_rulerAngleMarker, 0);
  objc_destroyWeak((id *)&self->_rulerController);
}

@end
