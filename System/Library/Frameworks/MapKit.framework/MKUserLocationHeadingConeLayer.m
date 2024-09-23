@implementation MKUserLocationHeadingConeLayer

- (void)updateHeading:(double)a3
{
  CATransform3D v4;
  CATransform3D v5;

  memset(&v5, 0, sizeof(v5));
  CATransform3DMakeRotation(&v5, a3 * 0.0174532925, 0.0, 0.0, 1.0);
  v4 = v5;
  -[MKUserLocationHeadingConeLayer setTransform:](self, "setTransform:", &v4);
}

- (MKUserLocationHeadingConeLayer)initWithUserLocationView:(id)a3 shouldMatchAccuracyRadius:(BOOL)a4 minimumPresentationAngle:(double)a5
{
  id v8;
  MKUserLocationHeadingConeLayer *v9;
  MKUserLocationHeadingConeLayer *v10;
  uint64_t v11;
  UIColor *tintColor;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  MKUserLocationHeadingConeLayer *v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKUserLocationHeadingConeLayer;
  v9 = -[MKUserLocationHeadingConeLayer init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_userLocationView, v8);
    v10->_shouldMatchAccuracyRadius = a4;
    v10->_halfMinAngle = a5 * 0.5;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v11 = objc_claimAutoreleasedReturnValue();
    tintColor = v10->_tintColor;
    v10->_tintColor = (UIColor *)v11;

    v20[0] = CFSTR("locations");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("colors");
    v21[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKUserLocationHeadingConeLayer setActions:](v10, "setActions:", v15);

    -[MKUserLocationHeadingConeLayer setName:](v10, "setName:", CFSTR("heading"));
    -[MKUserLocationHeadingConeLayer setAnchorPoint:](v10, "setAnchorPoint:", 0.5, 0.5);
    -[CAGradientLayer setType:](v10, "setType:", *MEMORY[0x1E0CD2F58]);
    -[CAGradientLayer setStartPoint:](v10, "setStartPoint:", 0.5, 0.5);
    -[CAGradientLayer setEndPoint:](v10, "setEndPoint:", 1.0, 1.0);
    objc_msgSend((id)objc_opt_class(), "baseDiameter");
    -[MKUserLocationHeadingConeLayer setBounds:](v10, "setBounds:", 0.0, 0.0, v16 + 66.0, v16 + 66.0);
    -[MKUserLocationHeadingConeLayer _createMaskLayer](v10, "_createMaskLayer");
    v17 = v10;
  }

  return v10;
}

- (void)_createMaskLayer
{
  CAShapeLayer *v3;
  CAShapeLayer *maskLayer;
  id WeakRetained;
  double v6;
  double v7;
  double MidX;
  id v9;
  void *v10;
  id v11;
  CGRect v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v3 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  maskLayer = self->_maskLayer;
  self->_maskLayer = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v7 = v6;

  -[CAShapeLayer setBounds:](self->_maskLayer, "setBounds:", 0.0, 0.0, v7 + 33.0, v7 + 33.0);
  -[MKUserLocationHeadingConeLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v12);
  -[MKUserLocationHeadingConeLayer bounds](self, "bounds");
  -[CAShapeLayer setPosition:](self->_maskLayer, "setPosition:", MidX, CGRectGetMidY(v13));
  -[CAShapeLayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 0.5, 0.5);
  -[CAShapeLayer setFillColor:](self->_maskLayer, "setFillColor:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setStrokeColor:](self->_maskLayer, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  -[CAShapeLayer setLineWidth:](self->_maskLayer, "setLineWidth:", 33.0);
  v10 = (void *)MEMORY[0x1E0CEA390];
  -[CAShapeLayer bounds](self->_maskLayer, "bounds");
  objc_msgSend(v10, "bezierPathWithOvalInRect:");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", objc_msgSend(v11, "CGPath"));

  -[MKUserLocationHeadingConeLayer setMask:](self, "setMask:", self->_maskLayer);
}

- (void)animateToSetVisible:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3)
  {
    v7 = v6;
    -[MKUserLocationHeadingConeLayer _opacityForAccuracy:locationAccuracy:](self, "_opacityForAccuracy:locationAccuracy:", self->_headingAccuracy, self->_lastAccuracyRadius);
    -[MKUserLocationHeadingConeLayer _animateToOpacity:completion:](self, "_animateToOpacity:completion:", v7);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    v7 = v6;
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_updateShowHeadingForAccuracy:(double)a3
{
  double v4;
  double v5;
  float v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  -[MKUserLocationHeadingConeLayer _opacityForAccuracy:locationAccuracy:](self, "_opacityForAccuracy:locationAccuracy:", a3, self->_lastAccuracyRadius);
  v5 = v4;
  -[MKUserLocationHeadingConeLayer opacity](self, "opacity");
  if (vabdd_f64(v5, v6) >= 0.01)
  {
    -[MKUserLocationHeadingConeLayer superlayer](self, "superlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[MKUserLocationHeadingConeLayer _animateToOpacity:completion:](self, "_animateToOpacity:completion:", 0, v5);
    }
    else
    {
      +[MKThreadContext currentContext](MKThreadContext, "currentContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_CA_setDisableActions:", 1);

      *(float *)&v9 = v5;
      -[MKUserLocationHeadingConeLayer setOpacity:](self, "setOpacity:", v9);
      +[MKThreadContext currentContext](MKThreadContext, "currentContext");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_CA_setDisableActions:", 0);

    }
  }
}

- (double)_opacityForAccuracy:(double)a3 locationAccuracy:(double)a4
{
  _BOOL4 v4;
  double result;

  v4 = -[MKUserLocationHeadingConeLayer _shouldShowHeadingForAccuracy:](self, "_shouldShowHeadingForAccuracy:", self->_headingAccuracy, a4);
  result = 0.0;
  if (v4)
    return 1.0;
  return result;
}

- (BOOL)_shouldShowHeadingForAccuracy:(double)a3
{
  BOOL v3;
  id WeakRetained;
  char v6;

  if (a3 < 0.0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  v6 = objc_msgSend(WeakRetained, "shouldDisplayInaccurateHeading");
  if (a3 < 90.0)
    v3 = 1;
  else
    v3 = v6;

  return v3;
}

- (void)_animateToOpacity:(double)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v6 = (void *)MEMORY[0x1E0CD2710];
  v7 = a4;
  objc_msgSend(v6, "animationWithKeyPath:", CFSTR("opacity"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CALayer currentLayer](self, "currentLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "opacity");
  objc_msgSend(v8, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromValue:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setToValue:", v11);

  objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v16, "setDuration:", 0.5);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v12);

  objc_msgSend(v16, "setRemovedOnCompletion:", 1);
  -[CALayer _mapkit_addAnimation:forKey:completion:](self, "_mapkit_addAnimation:forKey:completion:", v16, CFSTR("fadeAnimation"), v7);

  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_CA_setDisableActions:", 1);

  *(float *)&v14 = a3;
  -[MKUserLocationHeadingConeLayer setOpacity:](self, "setOpacity:", v14);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_CA_setDisableActions:", 0);

}

- (void)_updateColors
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", self->_traitCollection);
  -[MKUserLocationHeadingConeLayer _colorsForAccuracyRadius:](self, "_colorsForAccuracyRadius:", self->_lastAccuracyRadius);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](self, "setColors:", v3);

  -[MKUserLocationHeadingConeLayer _accuracyGradientLocationsForAccuracyRadius:](self, "_accuracyGradientLocationsForAccuracyRadius:", self->_lastAccuracyRadius);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setLocations:](self, "setLocations:", v4);

  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v5);
}

- (id)_colorsForAccuracyRadius:(double)a3
{
  float v4;
  unint64_t mapType;
  float v6;
  double v7;
  UIColor **p_tintColor;
  id v9;
  void *v10;
  uint64_t *v11;
  UIUserInterfaceStyle v12;
  UIColor *tintColor;
  unint64_t v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (self->_shouldMatchAccuracyRadius && self->_minimumAccuracyRadius < a3)
  {
    v4 = flt_18B2AF908[-[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle") == UIUserInterfaceStyleDark];
    mapType = self->_mapType;
    if (mapType - 1 < 4 || (v6 = 1.0, mapType == 107))
      v6 = 2.0;
    v7 = (float)(v4 * v6);
    p_tintColor = &self->_tintColor;
    -[UIColor colorWithAlphaComponent:](self->_tintColor, "colorWithAlphaComponent:", 0.0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[0] = objc_msgSend(v9, "CGColor");
    -[UIColor colorWithAlphaComponent:](self->_tintColor, "colorWithAlphaComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
  }
  else
  {
    v12 = -[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle", a3);
    p_tintColor = &self->_tintColor;
    tintColor = self->_tintColor;
    if (v12 == UIUserInterfaceStyleDark)
    {
      -[UIColor colorWithAlphaComponent:](tintColor, "colorWithAlphaComponent:", 1.0);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v9, "CGColor");
      v14 = self->_mapType;
      if (v14 - 1 < 4 || v14 == 107)
        v15 = 0.600000024;
      else
        v15 = 0.400000006;
      -[UIColor colorWithAlphaComponent:](*p_tintColor, "colorWithAlphaComponent:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = &v21;
    }
    else
    {
      -[UIColor colorWithAlphaComponent:](tintColor, "colorWithAlphaComponent:", 0.800000012);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[UIColor colorWithAlphaComponent:](*p_tintColor, "colorWithAlphaComponent:", 0.25, objc_msgSend(v9, "CGColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = &v20;
    }
  }
  v16 = objc_retainAutorelease(v10);
  v11[1] = objc_msgSend(v16, "CGColor");
  -[UIColor colorWithAlphaComponent:](*p_tintColor, "colorWithAlphaComponent:", 0.0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11[2] = objc_msgSend(v17, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_accuracyGradientLocationsForAccuracyRadius:(double)a3
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (self->_shouldMatchAccuracyRadius && self->_minimumAccuracyRadius < a3)
  {
    v3 = a3 / (a3 + 18.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 * 0.45);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v5;
    v8[2] = &unk_1E2159460;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &unk_1E215A150;
  }
  return v6;
}

- (void)updateTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  -[MKUserLocationHeadingConeLayer _updateColors](self, "_updateColors");
}

- (void)updateHeadingAccuracy:(double)a3 previousAccuracy:(double)a4
{
  self->_headingAccuracy = a3;
  -[MKUserLocationHeadingConeLayer _updateHeadingMaskForAccuracy:previousAccuracy:](self, "_updateHeadingMaskForAccuracy:previousAccuracy:");
  -[MKUserLocationHeadingConeLayer _updateShowHeadingForAccuracy:](self, "_updateShowHeadingForAccuracy:", a3);
}

- (void)_updateHeadingMaskForAccuracy:(double)halfMinAngle previousAccuracy:(double)a4
{
  double v5;

  if (halfMinAngle < 0.0)
    halfMinAngle = 180.0;
  if (halfMinAngle <= self->_halfMinAngle)
    halfMinAngle = self->_halfMinAngle;
  v5 = fmin(halfMinAngle, 90.0);
  -[CAShapeLayer setStrokeStart:](self->_maskLayer, "setStrokeStart:", (270.0 - v5) / 360.0);
  -[CAShapeLayer setStrokeEnd:](self->_maskLayer, "setStrokeEnd:", (v5 + 270.0) / 360.0);
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  -[MKUserLocationHeadingConeLayer _updateColors](self, "_updateColors");
}

- (void)setMinimumAccuracyRadius:(double)a3
{
  self->_minimumAccuracyRadius = a3;
}

- (void)setMapType:(unint64_t)a3
{
  if (self->_mapType != a3)
  {
    self->_mapType = a3;
    -[MKUserLocationHeadingConeLayer _updateColors](self, "_updateColors");
  }
}

- (void)setAccuracyRadius:(double)a3 duration:(double)a4
{
  double lastAccuracyRadius;
  double minimumAccuracyRadius;
  double v8;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  const CGPath *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  _QWORD *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  const CGPath *v106;
  double v107;
  double v108;
  double MidY;
  double MidX;
  void *v111;
  _QWORD v112[4];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[2];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[3];
  _QWORD v123[3];
  _QWORD v124[5];
  CGRect v125;
  CGRect v126;

  v124[3] = *MEMORY[0x1E0C80C00];
  if (!self->_shouldMatchAccuracyRadius)
    return;
  lastAccuracyRadius = self->_lastAccuracyRadius;
  minimumAccuracyRadius = self->_minimumAccuracyRadius;
  if (minimumAccuracyRadius <= a3)
    v8 = a3;
  else
    v8 = self->_minimumAccuracyRadius;
  if (lastAccuracyRadius <= minimumAccuracyRadius && minimumAccuracyRadius >= a3)
  {
    self->_lastAccuracyRadius = v8;
    return;
  }
  if (minimumAccuracyRadius < a3)
  {
    v108 = v8 + 18.0;
    v14 = v108 + v108;
    v15 = (v8 + 18.0) * 0.5 + (v8 + 18.0) * 0.5;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
    objc_msgSend((id)objc_opt_class(), "baseDiameter");
    v13 = v12;

    v14 = v13 + 66.0;
    v108 = 33.0;
    v15 = v13 + 33.0;
  }
  v16 = 0.0;
  v125.origin.x = 0.0;
  v125.origin.y = 0.0;
  v125.size.width = v14;
  v125.size.height = v14;
  MidX = CGRectGetMidX(v125);
  v126.origin.x = 0.0;
  v126.origin.y = 0.0;
  v126.size.width = v14;
  v126.size.height = v14;
  MidY = CGRectGetMidY(v126);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 0.0, 0.0, v15, v15);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = CGPathRetain((CGPathRef)objc_msgSend(v17, "CGPath"));

  if (a4 <= 0.0)
  {
    -[MKUserLocationHeadingConeLayer animationForKey:](self, "animationForKey:", CFSTR("accuracy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v107 = 0.0;
    if (v19)
    {
      objc_msgSend(v19, "beginTime");
      v107 = v21;
      -[MKUserLocationHeadingConeLayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v23 = v22;
      objc_msgSend(v20, "beginTime");
      v25 = v23 - v24;
      objc_msgSend(v20, "timeOffset");
      v16 = v25 - v26;
      objc_msgSend(v20, "duration");
      a4 = v27;
    }

  }
  else
  {
    v107 = 0.0;
  }
  -[MKUserLocationHeadingConeLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("accuracy"));
  -[CAShapeLayer removeAnimationForKey:](self->_maskLayer, "removeAnimationForKey:", CFSTR("accuracy"));
  -[MKUserLocationHeadingConeLayer _accuracyGradientLocationsForAccuracyRadius:](self, "_accuracyGradientLocationsForAccuracyRadius:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", self->_traitCollection);
  if (lastAccuracyRadius <= minimumAccuracyRadius == minimumAccuracyRadius >= a3)
  {
    v30 = 0;
  }
  else
  {
    -[MKUserLocationHeadingConeLayer _colorsForAccuracyRadius:](self, "_colorsForAccuracyRadius:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v29);
  if (a4 > 0.0)
  {
    v104 = v30;
    v105 = v28;
    v103 = v29;
    v106 = v18;
    v124[0] = &unk_1E2159478;
    v31 = v16 / a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v32;
    v124[2] = &unk_1E2159460;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 3);
    v33 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0CB3B18];
    -[CALayer currentLayer](self, "currentLayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    objc_msgSend(v35, "valueWithCGRect:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v123[0] = v37;
    v38 = (void *)MEMORY[0x1E0CB3B18];
    -[CALayer currentLayer](self, "currentLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    objc_msgSend(v38, "valueWithCGRect:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v123[1] = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v14, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v123[2] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setValues:", v42);

    v111 = (void *)v33;
    objc_msgSend(v34, "setKeyTimes:", v33);
    v43 = v34;
    v44 = v43;
    if (!self->_shouldMatchAccuracyRadius)
    {
LABEL_39:
      objc_msgSend(v44, "setRemovedOnCompletion:", 1);
      objc_msgSend(v44, "setDuration:", a4);
      if (v107 > 0.0)
        objc_msgSend(v44, "setBeginTime:", v107);
      -[MKUserLocationHeadingConeLayer addAnimation:forKey:](self, "addAnimation:forKey:", v44, CFSTR("accuracy"));

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)MEMORY[0x1E0CB3B18];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "bounds");
      objc_msgSend(v70, "valueWithCGRect:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v72;
      v73 = (void *)MEMORY[0x1E0CB3B18];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "bounds");
      objc_msgSend(v73, "valueWithCGRect:");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v75;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v15, v15);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v76;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v69;
      objc_msgSend(v69, "setValues:", v77);

      objc_msgSend(v69, "setKeyTimes:", v111);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)MEMORY[0x1E0CB3B18];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "position");
      objc_msgSend(v79, "valueWithCGPoint:");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v81;
      v82 = (void *)MEMORY[0x1E0CB3B18];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "position");
      objc_msgSend(v82, "valueWithCGPoint:");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v84;
      v61 = MidY;
      v62 = MidX;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", MidX, MidY);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v85;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setValues:", v86);

      objc_msgSend(v78, "setKeyTimes:", v111);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("path"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = objc_msgSend(v88, "path");
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = objc_msgSend(v89, "path");
      v114[2] = v106;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setValues:", v90);

      objc_msgSend(v87, "setKeyTimes:", v111);
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("lineWidth"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)MEMORY[0x1E0CB37E8];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "lineWidth");
      objc_msgSend(v92, "numberWithDouble:");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v94;
      v95 = (void *)MEMORY[0x1E0CB37E8];
      -[CAShapeLayer currentLayer](self->_maskLayer, "currentLayer");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "lineWidth");
      objc_msgSend(v95, "numberWithDouble:");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v97;
      v60 = v108;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v108);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v113[2] = v98;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 3);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setValues:", v99);

      objc_msgSend(v91, "setKeyTimes:", v111);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v102;
      v112[1] = v78;
      v112[2] = v87;
      v112[3] = v91;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 4);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setAnimations:", v101);

      objc_msgSend(v100, "setRemovedOnCompletion:", 1);
      objc_msgSend(v100, "setDuration:", a4);
      if (v107 > 0.0)
        objc_msgSend(v100, "setBeginTime:", v107);
      -[CAShapeLayer addAnimation:forKey:](self->_maskLayer, "addAnimation:forKey:", v100, CFSTR("accuracy"));

      v28 = v105;
      v18 = v106;
      v29 = v103;
      v30 = v104;
      goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("locations"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer currentLayer](self, "currentLayer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "locations");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v47;
    -[CALayer currentLayer](self, "currentLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "locations");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v49;
    v122[2] = v105;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 3);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setValues:", v50);

    objc_msgSend(v45, "setKeyTimes:", v33);
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("colors"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer currentLayer](self, "currentLayer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "colors");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = v53;
      -[CALayer currentLayer](self, "currentLayer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "colors");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v121[1] = v55;
      v121[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setValues:", v56);

      if (minimumAccuracyRadius >= a3)
      {
        v120[0] = &unk_1E2159478;
        v57 = 0.6;
        if (v31 >= 0.6)
          v57 = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v120[1] = v58;
        v120[2] = &unk_1E2159460;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 3);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setKeyTimes:", v59);
LABEL_34:

        goto LABEL_35;
      }
      if (lastAccuracyRadius <= minimumAccuracyRadius)
      {
        v119[0] = &unk_1E2159478;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v119[1] = v58;
        v63 = 0.4;
        if (v31 >= 0.4)
          v63 = v31;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v63);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v119[2] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 3);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setKeyTimes:", v64);

        goto LABEL_34;
      }
    }
    else
    {
      v51 = 0;
    }
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      v118[0] = v43;
      v118[1] = v45;
      v118[2] = v51;
      v65 = (void *)MEMORY[0x1E0C99D20];
      v66 = v118;
      v67 = 3;
    }
    else
    {
      v117[0] = v43;
      v117[1] = v45;
      v65 = (void *)MEMORY[0x1E0C99D20];
      v66 = v117;
      v67 = 2;
    }
    objc_msgSend(v65, "arrayWithObjects:count:", v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAnimations:", v68);

    goto LABEL_39;
  }
  v60 = v108;
  v61 = MidY;
  v62 = MidX;
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[MKUserLocationHeadingConeLayer setBounds:](self, "setBounds:", 0.0, 0.0, v14, v14);
  -[CAShapeLayer setBounds:](self->_maskLayer, "setBounds:", 0.0, 0.0, v15, v15);
  -[CAShapeLayer setPosition:](self->_maskLayer, "setPosition:", v62, v61);
  -[CAShapeLayer setPath:](self->_maskLayer, "setPath:", v18);
  -[CAShapeLayer setLineWidth:](self->_maskLayer, "setLineWidth:", v60);
  self->_lastAccuracyRadius = v8;
  if (self->_shouldMatchAccuracyRadius)
  {
    -[CAGradientLayer setLocations:](self, "setLocations:", v28);
    if (v30)
      -[CAGradientLayer setColors:](self, "setColors:", v30);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  CGPathRelease(v18);

}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_destroyWeak((id *)&self->_userLocationView);
}

@end
