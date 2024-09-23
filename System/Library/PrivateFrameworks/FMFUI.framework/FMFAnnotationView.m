@implementation FMFAnnotationView

- (FMFAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5
{
  id v7;
  FMFAnnotationView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FMFAnnotationView;
  v7 = a3;
  v8 = -[FMAnnotationView initWithAnnotation:reuseIdentifier:tintColor:](&v20, sel_initWithAnnotation_reuseIdentifier_tintColor_, v7, a4, a5);
  -[FMFAnnotationView buildAccuracyLayer](v8, "buildAccuracyLayer", v20.receiver, v20.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView setAccuracyLayer:](v8, "setAccuracyLayer:", v9);

  -[FMFAnnotationView setLastAccuracyRadius:](v8, "setLastAccuracyRadius:", -1.0);
  -[FMAnnotationView locationOuterLayer](v8, "locationOuterLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView accuracyLayer](v8, "accuracyLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSublayer:", v11);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF77B0], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("satellite.fill"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMAnnotationView smallCircleLayer](v8, "smallCircleLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:](v8, "buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:", v14, v15, 26.0, 22.0, 22.0, 16.0, 16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView setStewieSmallBadgeLayer:](v8, "setStewieSmallBadgeLayer:", v16);

  -[FMAnnotationView largeCircleLayer](v8, "largeCircleLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:](v8, "buildStewieLayerWithDiameter:image:size:offsetInParentLayer:by:", v14, v17, 64.0, 30.0, 30.0, 46.0, 46.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView setStewieLargeBadgeLayer:](v8, "setStewieLargeBadgeLayer:", v18);

  -[FMFAnnotationView updateWithLocation:](v8, "updateWithLocation:", v7);
  return v8;
}

- (void)updateWithLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  _BOOL8 v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  float v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  double v53;
  double v54;
  id v55;

  v4 = a3;
  objc_msgSend(v4, "horizontalAccuracy");
  v6 = v5;
  v7 = objc_msgSend(v4, "locationType");
  v9 = v6 <= 200.0 && v7 == 2;
  -[FMFAnnotationView setIsLiveAnimated:](self, "setIsLiveAnimated:", v9);
  v10 = objc_msgSend(v4, "locationType");
  objc_msgSend(v4, "horizontalAccuracy");
  v12 = v11;

  -[MKAnnotationView _pointsForDistance:](self, "_pointsForDistance:", v12);
  v14 = v13;
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  -[FMAnnotationView locationOuterLayer](self, "locationOuterLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "colorWithAlphaComponent:", 0.2);
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend(v28, "CGColor");
  -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFillColor:", v29);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = objc_msgSend(v31, "CGColor");
  -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStrokeColor:", v32);

  -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLineWidth:", 3.0);

  -[FMFAnnotationView lastAccuracyRadius](self, "lastAccuracyRadius");
  if (v35 != v14)
  {
    v36 = v14 + v14;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, v36, v36);
    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = objc_msgSend(v37, "CGPath");

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setPath:", v38);

    -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v17 + v20 * 0.5 - v36 * 0.5, v23 + v26 * 0.5 - v36 * 0.5, v36, v36);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  v41 = 0.0;
  if (v6 > 200.0)
  {
    if (-[MKAnnotationView isSelected](self, "isSelected"))
      v41 = 1.0;
    else
      v41 = 0.0;
  }
  -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "opacity");
  v44 = v43;

  if (v41 != v44)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x24BDD16E0];
    -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "opacity");
    objc_msgSend(v46, "numberWithFloat:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFromValue:", v48);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setToValue:", v49);

    objc_msgSend(v45, "setDuration:", 0.5);
    objc_msgSend(v45, "setRemovedOnCompletion:", 0);
    -[FMFAnnotationView accuracyLayer](self, "accuracyLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addAnimation:forKey:", v45, CFSTR("opacity"));

  }
  if (v10 == 3)
    v51 = 1.0;
  else
    v51 = 0.0;
  -[FMFAnnotationView stewieSmallBadgeLayer](self, "stewieSmallBadgeLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v53 = v51;
  objc_msgSend(v52, "setOpacity:", v53);

  -[FMFAnnotationView stewieLargeBadgeLayer](self, "stewieLargeBadgeLayer");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v54 = v51;
  objc_msgSend(v55, "setOpacity:", v54);

}

- (id)buildAccuracyLayer
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, 0.0, 0.0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setPath:", objc_msgSend(v3, "CGPath"));

  return v2;
}

- (id)buildPulseLayerWithDiameter:(double)a3 centeredInParentLayer:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDF6950];
  v6 = a4;
  objc_msgSend(v5, "systemGreenColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");

  v9 = (void *)objc_opt_new();
  objc_msgSend(v6, "bounds");
  v11 = (v10 - a3) * 0.5;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v9, "setFrame:", v11, (v12 - a3) * 0.5, a3, a3);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, a3, a3);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setPath:", objc_msgSend(v13, "CGPath"));

  objc_msgSend(v9, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v9, "setFillColor:", v8);
  LODWORD(v14) = 0;
  objc_msgSend(v9, "setOpacity:", v14);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", &unk_24C87E6E8);
  objc_msgSend(v15, "setToValue:", &unk_24C87E6F8);
  objc_msgSend(v15, "setDuration:", 1.5);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromValue:", &unk_24C87E708);
  objc_msgSend(v16, "setToValue:", &unk_24C87E718);
  objc_msgSend(v16, "setDuration:", 1.5);
  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  v17 = (void *)objc_opt_new();
  v23[0] = v15;
  v23[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAnimations:", v18);

  objc_msgSend(v17, "setDuration:", 1.5);
  LODWORD(v19) = 0;
  objc_msgSend(v17, "setRepeatCount:", v19);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v20);

  objc_msgSend(v16, "setRemovedOnCompletion:", 0);
  LODWORD(v21) = 2139095039;
  objc_msgSend(v17, "setRepeatCount:", v21);
  objc_msgSend(v6, "insertSublayer:atIndex:", v9, 0);

  objc_msgSend(v9, "addAnimation:forKey:", v17, CFSTR("pulse"));
  return v9;
}

- (BOOL)isLiveAnimated
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FMFAnnotationView smallPulseLayer](self, "smallPulseLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)setIsLiveAnimated:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[FMFAnnotationView isLiveAnimated](self, "isLiveAnimated") != a3)
  {
    if (v3)
      -[FMFAnnotationView startLiveAnimation](self, "startLiveAnimation");
    else
      -[FMFAnnotationView stopLiveAnimation](self, "stopLiveAnimation");
  }
}

- (void)startLiveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FMAnnotationView smallCircleLayer](self, "smallCircleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView buildPulseLayerWithDiameter:centeredInParentLayer:](self, "buildPulseLayerWithDiameter:centeredInParentLayer:", v3, 26.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView setSmallPulseLayer:](self, "setSmallPulseLayer:", v4);

  -[FMAnnotationView largeCircleLayer](self, "largeCircleLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView buildPulseLayerWithDiameter:centeredInParentLayer:](self, "buildPulseLayerWithDiameter:centeredInParentLayer:", v6, 64.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMFAnnotationView setLargePulseLayer:](self, "setLargePulseLayer:", v5);

}

- (void)stopLiveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[FMFAnnotationView smallPulseLayer](self, "smallPulseLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[FMFAnnotationView smallPulseLayer](self, "smallPulseLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[FMFAnnotationView setSmallPulseLayer:](self, "setSmallPulseLayer:", 0);
  -[FMFAnnotationView largePulseLayer](self, "largePulseLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

  -[FMFAnnotationView largePulseLayer](self, "largePulseLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperlayer");

  -[FMFAnnotationView setLargePulseLayer:](self, "setLargePulseLayer:", 0);
}

- (id)buildStewieLayerWithDiameter:(double)a3 image:(id)a4 size:(CGSize)a5 offsetInParentLayer:(id)a6 by:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  y = a7.y;
  x = a7.x;
  height = a5.height;
  width = a5.width;
  v13 = a6;
  v14 = a4;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v13, "bounds");
  v17 = x + (v16 - a3) * 0.5;
  objc_msgSend(v13, "bounds");
  objc_msgSend(v15, "setFrame:", v17, y + (v18 - a3) * 0.5, width, height);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, width, height);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setPath:", objc_msgSend(v20, "CGPath"));

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v19, "setFillColor:", objc_msgSend(v21, "CGColor"));

  v22 = (void *)objc_opt_new();
  objc_msgSend(v19, "frame");
  v31 = CGRectInset(v30, 2.0, 2.0);
  objc_msgSend(v22, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, width + -4.0, height + -4.0);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "setPath:", objc_msgSend(v23, "CGPath"));

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "setFillColor:", objc_msgSend(v24, "CGColor"));

  v25 = (void *)objc_opt_new();
  objc_msgSend(v22, "frame");
  v33 = CGRectInset(v32, 2.0, 2.0);
  objc_msgSend(v25, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  objc_msgSend(v25, "setContentsGravity:", *MEMORY[0x24BDE5C98]);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tintedImageWithColor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_retainAutorelease(v27);
  objc_msgSend(v25, "setContents:", objc_msgSend(v28, "CGImage"));

  objc_msgSend(v15, "addSublayer:", v19);
  objc_msgSend(v15, "addSublayer:", v22);
  objc_msgSend(v15, "addSublayer:", v25);
  objc_msgSend(v13, "addSublayer:", v15);

  return v15;
}

- (CAShapeLayer)accuracyLayer
{
  return self->_accuracyLayer;
}

- (void)setAccuracyLayer:(id)a3
{
  objc_storeStrong((id *)&self->_accuracyLayer, a3);
}

- (CAShapeLayer)smallPulseLayer
{
  return self->_smallPulseLayer;
}

- (void)setSmallPulseLayer:(id)a3
{
  objc_storeStrong((id *)&self->_smallPulseLayer, a3);
}

- (CAShapeLayer)largePulseLayer
{
  return self->_largePulseLayer;
}

- (void)setLargePulseLayer:(id)a3
{
  objc_storeStrong((id *)&self->_largePulseLayer, a3);
}

- (double)lastAccuracyRadius
{
  return self->_lastAccuracyRadius;
}

- (void)setLastAccuracyRadius:(double)a3
{
  self->_lastAccuracyRadius = a3;
}

- (CALayer)stewieSmallBadgeLayer
{
  return self->_stewieSmallBadgeLayer;
}

- (void)setStewieSmallBadgeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_stewieSmallBadgeLayer, a3);
}

- (CALayer)stewieLargeBadgeLayer
{
  return self->_stewieLargeBadgeLayer;
}

- (void)setStewieLargeBadgeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_stewieLargeBadgeLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieLargeBadgeLayer, 0);
  objc_storeStrong((id *)&self->_stewieSmallBadgeLayer, 0);
  objc_storeStrong((id *)&self->_largePulseLayer, 0);
  objc_storeStrong((id *)&self->_smallPulseLayer, 0);
  objc_storeStrong((id *)&self->_accuracyLayer, 0);
}

@end
