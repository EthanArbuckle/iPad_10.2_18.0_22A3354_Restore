@implementation _MKPuckAnnotationView

- (void)_updateFromMap
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  long double v10;
  double v11;
  id v12;

  -[MKAnnotationView _mapView](self, "_mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altitude");
  v6 = v5;
  -[MKAnnotationView _mapView](self, "_mapView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_mapLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pitch");
  v10 = v6 / cos(v9 * 0.0174532925);

  if (vabdd_f64(v10, self->_mapCameraDistance) >= 0.00000011920929)
  {
    self->_mapCameraDistance = v10;
    -[_MKPuckAccuracyLayer setMapCameraDistance:](self->_accuracyLayer, "setMapCameraDistance:", (double)v10);
    if (self->_faux3DEnabled)
    {
      -[MKAnnotationView _mapPitchRadians](self, "_mapPitchRadians");
      if (v11 > 0.0)
        -[_MKPuckAnnotationView _updateFaux3DLayers](self, "_updateFaux3DLayers");
    }
  }
  -[_MKPuckAnnotationView window](self, "window");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAnnotationView _updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:](self, "_updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:", v12 != 0, 0.0);

}

- (void)_updateToReflectLocationAccuracyWithDuration:(double)a3 allowShowHideAnimation:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double minimumAccuracyRadius;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];

  v4 = a4;
  v34[2] = *MEMORY[0x1E0C80C00];
  -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  v8 = v7;
  -[_MKPuckAccuracyLayer accuracy](self->_accuracyLayer, "accuracy");
  v10 = v9;
  v11 = 0.0;
  if (v4)
  {
    if (v8 >= v9)
      v12 = v9;
    else
      v12 = v8;
    minimumAccuracyRadius = self->_minimumAccuracyRadius;
    if (v12 >= minimumAccuracyRadius)
    {
      v11 = a3;
    }
    else
    {
      if (v8 <= v10)
        v14 = v10;
      else
        v14 = v8;
      v11 = a3;
      if (v14 >= minimumAccuracyRadius)
      {
        v15 = v10 - v8;
        if (v10 - v8 < 0.0)
          v15 = -(v10 - v8);
        v11 = fmin(v15 / self->_maxRadiusToShowAccuracyRing, 1.0) * 0.75 + 0.25;
        a3 = v11;
      }
    }
  }
  if (vabdd_f64(v8, v10) >= 0.25)
  {
    -[_MKPuckAccuracyLayer setAccuracy:duration:](self->_accuracyLayer, "setAccuracy:duration:", v8, a3);
    -[MKUserLocationHeadingIndicator setAccuracyRadius:duration:](self->_headingLayer, "setAccuracyRadius:duration:", v8, a3);
    -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:", v8, a3);
    -[_MKPuckAnnotationView _updatePuckVisibilityForRadius:previousRadius:duration:](self, "_updatePuckVisibilityForRadius:previousRadius:duration:", v8, v10, v11);
    -[MKAnnotationView _calloutView](self, "_calloutView");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[MKAnnotationView _calloutView](self, "_calloutView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[MKAnnotationView _calloutView](self, "_calloutView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setShowsArrow:animated:", -[_MKPuckAnnotationView _balloonCalloutShouldShowArrow](self, "_balloonCalloutShouldShowArrow"), 1);
        objc_msgSend(v20, "updateWithNewCalloutOffset");

      }
    }
    -[_MKPuckAnnotationView _layerToMatchAccuracyRing](self, "_layerToMatchAccuracyRing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if ((-[_MKPuckAccuracyLayer isHidden](self->_accuracyLayer, "isHidden") & 1) != 0)
      {
        -[_MKPuckAnnotationView _resetLayerToMatchAccuracyRing](self, "_resetLayerToMatchAccuracyRing");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v21, "currentLayer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bounds");
        objc_msgSend(v23, "valueWithCGRect:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFromValue:", v25);

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v8 + v8, v8 + v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setToValue:", v26);

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v21, "currentLayer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "cornerRadius");
        objc_msgSend(v28, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFromValue:", v30);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setToValue:", v31);

        objc_msgSend(MEMORY[0x1E0CD2700], "animation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v22;
        v34[1] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAnimations:", v33);

        objc_msgSend(v32, "setRemovedOnCompletion:", 1);
        objc_msgSend(v32, "setDuration:", a3);
        objc_msgSend(v21, "addAnimation:forKey:", v32, CFSTR("accuracy"));
        objc_msgSend(v21, "setBounds:", 0.0, 0.0, v8 + v8, v8 + v8);
        objc_msgSend(v21, "setCornerRadius:", v8);

      }
    }

  }
}

- (double)_locationAccuracyInScreenPoints
{
  double presentationAccuracy;
  double v4;
  double v5;
  double locationAccuracy;
  double v7;
  double v8;
  double result;

  if (self->_animatingPresentationAccuracy)
  {
    presentationAccuracy = self->_presentationAccuracy;
LABEL_4:
    -[MKAnnotationView _pointsForDistance:](self, "_pointsForDistance:", 1.0);
    locationAccuracy = presentationAccuracy / v5;
    goto LABEL_5;
  }
  -[MKAnnotationView _pointsForDistance:](self, "_pointsForDistance:", self->_locationAccuracy);
  presentationAccuracy = v4;
  if (self->_animatingPresentationAccuracy)
    goto LABEL_4;
  locationAccuracy = self->_locationAccuracy;
LABEL_5:
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  if (presentationAccuracy <= v7 * 0.5)
  {
    objc_msgSend((id)objc_opt_class(), "baseDiameter");
    presentationAccuracy = v8 * 0.5;
  }
  if (presentationAccuracy >= self->_minimumAccuracyRadius && locationAccuracy >= self->_minimumAccuracyUncertainty)
    return presentationAccuracy;
  -[_MKPuckAccuracyLayer minimumRadius](self->_accuracyLayer, "minimumRadius");
  return result;
}

+ (double)baseDiameter
{
  return 22.0;
}

- (void)_setMapRotationRadians:(double)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapRotationRadians:](&v7, sel__setMapRotationRadians_);
  self->_mapRotation = a3 * 57.2957795;
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_CA_setDisableActions:", 1);

  -[_MKPuckAnnotationView _updateHeadingIndicators](self, "_updateHeadingIndicators");
  -[_MKPuckAnnotationView _updateInnerCourseRotation](self, "_updateInnerCourseRotation");
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_CA_setDisableActions:", 0);

}

- (void)_updateHeadingIndicators
{
  double v2;

  v2 = 0.0;
  if (!self->_forceHeadingUp)
    v2 = self->_heading - self->_mapRotation;
  -[MKUserLocationHeadingIndicator updateHeading:](self->_headingLayer, "updateHeading:", v2);
}

- (void)_updateInnerCourseRotation
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CATransform3D v22;
  CATransform3D v23;
  CATransform3D v24;

  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v24.m31 = v3;
  *(_OWORD *)&v24.m33 = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v24.m41 = v5;
  *(_OWORD *)&v24.m43 = v6;
  v7 = *MEMORY[0x1E0CD2610];
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  *(_OWORD *)&v24.m11 = *MEMORY[0x1E0CD2610];
  *(_OWORD *)&v24.m13 = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  *(_OWORD *)&v24.m21 = v9;
  *(_OWORD *)&v24.m23 = v10;
  if (self->_rotateInnerImageToMatchCourse)
  {
    v14 = v3;
    v15 = v4;
    v16 = v5;
    v17 = v6;
    v18 = v7;
    v19 = v8;
    v20 = v9;
    v21 = v10;
    -[MKAnnotationView _presentationCourse](self, "_presentationCourse");
    v12 = v11;
    -[MKAnnotationView _mapRotationRadians](self, "_mapRotationRadians");
    *(_OWORD *)&v23.m31 = v14;
    *(_OWORD *)&v23.m33 = v15;
    *(_OWORD *)&v23.m41 = v16;
    *(_OWORD *)&v23.m43 = v17;
    *(_OWORD *)&v23.m11 = v18;
    *(_OWORD *)&v23.m13 = v19;
    *(_OWORD *)&v23.m21 = v20;
    *(_OWORD *)&v23.m23 = v21;
    CATransform3DRotate(&v24, &v23, -(v13 - v12 * 0.0174532925), 0.0, 0.0, 1.0);
  }
  v22 = v24;
  -[CALayer setTransform:](self->_innerCircleLayer, "setTransform:", &v22);
}

- (id)_layerToMatchAccuracyRing
{
  return self->_pulseLayer;
}

- (void)setHeadingAccuracy:(double)a3
{
  double headingAccuracy;
  double v4;

  headingAccuracy = self->_headingAccuracy;
  v4 = a3 - headingAccuracy;
  if (a3 - headingAccuracy < 0.0)
    v4 = -(a3 - headingAccuracy);
  if (v4 > 1.0 || a3 < 0.0 == headingAccuracy >= 0.0)
  {
    self->_headingAccuracy = a3;
    -[MKUserLocationHeadingIndicator updateHeadingAccuracy:previousAccuracy:](self->_headingLayer, "updateHeadingAccuracy:previousAccuracy:");
  }
}

- (void)setEffectsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_effectsEnabled != a3)
  {
    v3 = a3;
    self->_effectsEnabled = a3;
    -[_MKPuckAnnotationView _updatePulse](self, "_updatePulse");
    if (v3)
    {
      -[CALayer timeOffset](self->_innerCircleLayer, "timeOffset");
      v6 = v5;
      LODWORD(v5) = 1.0;
      -[CALayer setSpeed:](self->_innerCircleLayer, "setSpeed:", v5);
      -[CALayer setTimeOffset:](self->_innerCircleLayer, "setTimeOffset:", 0.0);
      -[CALayer setBeginTime:](self->_innerCircleLayer, "setBeginTime:", 0.0);
      -[CALayer convertTime:fromLayer:](self->_innerCircleLayer, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      -[CALayer setBeginTime:](self->_innerCircleLayer, "setBeginTime:", v7 - v6);
    }
    else
    {
      -[CALayer convertTime:fromLayer:](self->_innerCircleLayer, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v9 = v8;
      LODWORD(v8) = 0;
      -[CALayer setSpeed:](self->_innerCircleLayer, "setSpeed:", v8);
      -[CALayer setTimeOffset:](self->_innerCircleLayer, "setTimeOffset:", v9);
    }
  }
}

- (void)setHeading:(double)a3
{
  double v3;

  if (self->_hasValidHeading)
  {
    v3 = a3 - self->_heading;
    if (v3 < 0.0)
      v3 = -v3;
    if (v3 > 1.0)
    {
      self->_heading = a3;
      -[_MKPuckAnnotationView _updateHeadingIndicators](self, "_updateHeadingIndicators");
    }
  }
  else
  {
    self->_heading = a3;
    self->_hasValidHeading = 1;
    -[_MKPuckAnnotationView _updateShowHeadingLayerAnimatedIfPossible:](self, "_updateShowHeadingLayerAnimatedIfPossible:", 1);
  }
}

- (void)_setupLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  CALayer *v10;
  CALayer *accuracyContainerLayer;
  double MidX;
  void *v13;
  _MKPuckAccuracyLayer *v14;
  _MKPuckAccuracyLayer *accuracyLayer;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CALayer *v25;
  CALayer *puckContainerLayer;
  double v27;
  void *v28;
  CALayer *v29;
  CALayer *puckLayer;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  CALayer *v36;
  CALayer *headingContainerLayer;
  void *v38;
  CALayer *v39;
  CALayer *shadowLayer;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  CAGradientLayer *v45;
  CAGradientLayer *faux3DFaceLayer;
  void *v47;
  void *v48;
  void *v49;
  CAGradientLayer *v50;
  CAGradientLayer *faux3DBaseBottomLayer;
  void *v52;
  void *v53;
  void *v54;
  CALayer *v55;
  CALayer *baseLayer;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  CALayer *v63;
  CALayer *innerCircleLayer;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[6];
  _QWORD v73[6];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[5];
  _QWORD v85[7];
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v85[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v4 = v3;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v6 = v4 + v5 * 2.0;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v8 = v4 + v7 * 2.0 + 2.0;
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_useDarkAppearance = objc_msgSend(v9, "userInterfaceStyle") == 2;

  -[MKAnnotationView setBounds:](self, "setBounds:", 0.0, 0.0, v6, v8);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v10 = (CALayer *)objc_claimAutoreleasedReturnValue();
  accuracyContainerLayer = self->_accuracyContainerLayer;
  self->_accuracyContainerLayer = v10;

  -[CALayer setBounds:](self->_accuracyContainerLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  MidX = CGRectGetMidX(v86);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_accuracyContainerLayer, "setPosition:", MidX, CGRectGetMidY(v87));
  -[CALayer setAllowsGroupBlending:](self->_accuracyContainerLayer, "setAllowsGroupBlending:", 0);
  -[CALayer setAllowsGroupOpacity:](self->_accuracyContainerLayer, "setAllowsGroupOpacity:", 0);
  -[_MKPuckAnnotationView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSublayer:", self->_accuracyContainerLayer);

  +[_MKPuckAccuracyLayer layer](_MKPuckAccuracyLayer, "layer");
  v14 = (_MKPuckAccuracyLayer *)objc_claimAutoreleasedReturnValue();
  accuracyLayer = self->_accuracyLayer;
  self->_accuracyLayer = v14;

  -[_MKPuckAccuracyLayer setFaux3DEnabled:](self->_accuracyLayer, "setFaux3DEnabled:", self->_faux3DEnabled);
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v17 = v16 * 0.5;
  -[_MKPuckAccuracyLayer setMinimumRadius:](self->_accuracyLayer, "setMinimumRadius:", v16 * 0.5);
  v84[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v18;
  v84[1] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v19;
  v84[2] = CFSTR("cornerRadius");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v20;
  v84[3] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v21;
  v84[4] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAccuracyLayer setActions:](self->_accuracyLayer, "setActions:", v23);

  -[_MKPuckAccuracyLayer setZPosition:](self->_accuracyLayer, "setZPosition:", -10000.0);
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAccuracyLayer setTraitCollection:](self->_accuracyLayer, "setTraitCollection:", v24);

  -[CALayer addSublayer:](self->_accuracyContainerLayer, "addSublayer:", self->_accuracyLayer);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v25 = (CALayer *)objc_claimAutoreleasedReturnValue();
  puckContainerLayer = self->_puckContainerLayer;
  self->_puckContainerLayer = v25;

  -[CALayer setBounds:](self->_puckContainerLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  v27 = CGRectGetMidX(v88);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_puckContainerLayer, "setPosition:", v27, CGRectGetMidY(v89));
  -[CALayer _mapkit_setActionsToRemoveDefaultImplicitActions](self->_puckContainerLayer, "_mapkit_setActionsToRemoveDefaultImplicitActions");
  -[_MKPuckAnnotationView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSublayer:", self->_puckContainerLayer);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v29 = (CALayer *)objc_claimAutoreleasedReturnValue();
  puckLayer = self->_puckLayer;
  self->_puckLayer = v29;

  -[CALayer setBounds:](self->_puckLayer, "setBounds:", 0.0, 0.0, 0.0, 0.0);
  v31 = *MEMORY[0x1E0C9D538];
  v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CALayer setPosition:](self->_puckLayer, "setPosition:", *MEMORY[0x1E0C9D538], v32);
  v82[0] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v33;
  v82[1] = CFSTR("opacity");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setActions:](self->_puckLayer, "setActions:", v35);

  -[CALayer setAllowsGroupBlending:](self->_puckLayer, "setAllowsGroupBlending:", 0);
  -[CALayer setAllowsGroupOpacity:](self->_puckLayer, "setAllowsGroupOpacity:", 0);
  -[CALayer addSublayer:](self->_puckContainerLayer, "addSublayer:", self->_puckLayer);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v36 = (CALayer *)objc_claimAutoreleasedReturnValue();
  headingContainerLayer = self->_headingContainerLayer;
  self->_headingContainerLayer = v36;

  -[CALayer setBounds:](self->_headingContainerLayer, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CALayer setPosition:](self->_headingContainerLayer, "setPosition:", v31, v32);
  -[CALayer setActions:](self->_headingContainerLayer, "setActions:", MEMORY[0x1E0C9AA70]);
  -[CALayer setAllowsGroupBlending:](self->_headingContainerLayer, "setAllowsGroupBlending:", 0);
  -[CALayer setAllowsGroupOpacity:](self->_headingContainerLayer, "setAllowsGroupOpacity:", 0);
  -[CALayer setZPosition:](self->_headingContainerLayer, "setZPosition:", -10001.0);
  -[_MKPuckAnnotationView layer](self, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "insertSublayer:below:", self->_headingContainerLayer, self->_accuracyLayer);

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v39 = (CALayer *)objc_claimAutoreleasedReturnValue();
  shadowLayer = self->_shadowLayer;
  self->_shadowLayer = v39;

  -[CALayer setName:](self->_shadowLayer, "setName:", CFSTR("shadow"));
  -[CALayer setBounds:](self->_shadowLayer, "setBounds:", 0.0, 0.0, v6, v8);
  v80[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = CFSTR("opacity");
  v81[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setActions:](self->_shadowLayer, "setActions:", v43);

  LODWORD(v44) = 1050253722;
  if (!self->_useDarkAppearance)
    *(float *)&v44 = 0.25;
  -[CALayer setOpacity:](self->_shadowLayer, "setOpacity:", v44);
  -[CALayer addSublayer:](self->_puckLayer, "addSublayer:", self->_shadowLayer);
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v45 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  faux3DFaceLayer = self->_faux3DFaceLayer;
  self->_faux3DFaceLayer = v45;

  -[CAGradientLayer setName:](self->_faux3DFaceLayer, "setName:", CFSTR("faux3DFace"));
  -[CAGradientLayer setStartPoint:](self->_faux3DFaceLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_faux3DFaceLayer, "setEndPoint:", 1.0, 0.5);
  -[CAGradientLayer setBounds:](self->_faux3DFaceLayer, "setBounds:", 0.0, 0.0, v4, 0.0);
  v78[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = CFSTR("transform");
  v79[0] = v47;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setActions:](self->_faux3DFaceLayer, "setActions:", v49);

  -[CALayer addSublayer:](self->_puckLayer, "addSublayer:", self->_faux3DFaceLayer);
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v50 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  faux3DBaseBottomLayer = self->_faux3DBaseBottomLayer;
  self->_faux3DBaseBottomLayer = v50;

  -[CAGradientLayer setName:](self->_faux3DBaseBottomLayer, "setName:", CFSTR("faux3DBaseBottom"));
  -[CAGradientLayer setStartPoint:](self->_faux3DBaseBottomLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_faux3DBaseBottomLayer, "setEndPoint:", 1.0, 0.5);
  -[CAGradientLayer setBounds:](self->_faux3DBaseBottomLayer, "setBounds:", 0.0, 0.0, v4, v4);
  v76[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = CFSTR("cornerRadius");
  v77[0] = v52;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setActions:](self->_faux3DBaseBottomLayer, "setActions:", v54);

  -[CAGradientLayer setCornerRadius:](self->_faux3DBaseBottomLayer, "setCornerRadius:", v17);
  -[CALayer addSublayer:](self->_puckLayer, "addSublayer:", self->_faux3DBaseBottomLayer);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v55 = (CALayer *)objc_claimAutoreleasedReturnValue();
  baseLayer = self->_baseLayer;
  self->_baseLayer = v55;

  -[CALayer setName:](self->_baseLayer, "setName:", CFSTR("base"));
  -[CALayer setBounds:](self->_baseLayer, "setBounds:", 0.0, 0.0, v4, v4);
  v74[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v57;
  v74[1] = CFSTR("cornerRadius");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v58;
  v74[2] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setActions:](self->_baseLayer, "setActions:", v60);

  -[CALayer addSublayer:](self->_puckLayer, "addSublayer:", self->_baseLayer);
  objc_msgSend((id)objc_opt_class(), "innerDiameter");
  v62 = v61;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v63 = (CALayer *)objc_claimAutoreleasedReturnValue();
  innerCircleLayer = self->_innerCircleLayer;
  self->_innerCircleLayer = v63;

  -[CALayer setName:](self->_innerCircleLayer, "setName:", CFSTR("inner"));
  -[CALayer setBounds:](self->_innerCircleLayer, "setBounds:", 0.0, 0.0, v62, v62);
  v72[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v65;
  v72[1] = CFSTR("cornerRadius");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v66;
  v72[2] = CFSTR("contents");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v67;
  v72[3] = CFSTR("backgroundColor");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v68;
  v72[4] = CFSTR("mask");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v69;
  v72[5] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setActions:](self->_innerCircleLayer, "setActions:", v71);

  -[CALayer setPosition:](self->_innerCircleLayer, "setPosition:", v4 * 0.5, v4 * 0.5);
  -[CALayer setAllowsEdgeAntialiasing:](self->_innerCircleLayer, "setAllowsEdgeAntialiasing:", 0);
  -[CALayer addSublayer:](self->_baseLayer, "addSublayer:", self->_innerCircleLayer);
  -[_MKPuckAnnotationView _createOrRemoveFaux3DRingsIfNecessary](self, "_createOrRemoveFaux3DRingsIfNecessary");
  -[_MKPuckAnnotationView _updateShadowImage](self, "_updateShadowImage");
  -[_MKPuckAnnotationView _updateBaseImage](self, "_updateBaseImage");
  -[_MKPuckAnnotationView _updateInnerMaskLayer](self, "_updateInnerMaskLayer");
  -[_MKPuckAnnotationView _updateGlyphImage](self, "_updateGlyphImage");
  -[_MKPuckAnnotationView _updateAccuracyColors](self, "_updateAccuracyColors");
  -[_MKPuckAnnotationView _updateFaux3DColors](self, "_updateFaux3DColors");
}

- (void)_updateShadowImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  id v26;
  CGColor *v27;
  double v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGImage *Image;
  long double v35;
  double v36;
  long double v37;
  long double v38;
  CGSize v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[_MKPuckAnnotationView _currentScreenScale](self, "_currentScreenScale");
  v4 = fmax(v3, 1.0);
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v6 = v5;
  v7 = v5 * v4;
  v8 = 0.0;
  if (-[_MKPuckAnnotationView shouldShowOuterRing](self, "shouldShowOuterRing"))
  {
    objc_msgSend((id)objc_opt_class(), "outerRingWidth");
    if (v9 > 0.0)
    {
      objc_msgSend((id)objc_opt_class(), "outerRingWidth");
      v8 = v10;
    }
  }
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v12 = v6 + v11 * 2.0;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v14 = v6 + v13 * 2.0 + 2.0;
  v15 = v4 * v12;
  v16 = v4 * v14;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v19 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSaveGState(v19);
  v20 = round(v8 + v15 - v7) * 0.5;
  v21 = round(v8 + v16 - v7) * 0.5;
  v22 = v7 - v8;
  v23 = v21 - v16;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v25 = v4 * v24;
  objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckShadowColor"));
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = (CGColor *)objc_msgSend(v26, "CGColor");
  v39.width = 0.0;
  v39.height = v16 - v4;
  CGContextSetShadowWithColor(v19, v39, v25, v27);

  if (self->_displaysPuckAsAccuracy)
  {
    objc_msgSend((id)objc_opt_class(), "innerDiameter");
    v29 = (v7 - v4 * v28) * 0.5;
    v40.origin.x = v20;
    v40.origin.y = v23;
    v40.size.width = v22;
    v40.size.height = v22;
    v41 = CGRectInset(v40, v29 * 0.5, v29 * 0.5);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    CGContextSetLineWidth(v19, v29);
    CGContextSetRGBStrokeColor(v19, 1.0, 1.0, 1.0, 1.0);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    CGContextStrokeEllipseInRect(v19, v42);
  }
  else
  {
    CGContextSetRGBFillColor(v19, 1.0, 0.0, 0.0, 1.0);
    v43.origin.x = v20;
    v43.origin.y = v23;
    v43.size.width = v22;
    v43.size.height = v22;
    CGContextFillEllipseInRect(v19, v43);
  }
  CGContextRestoreGState(v19);
  Image = CGBitmapContextCreateImage(v19);
  -[CALayer setContents:](self->_shadowLayer, "setContents:", Image);
  CGImageRelease(Image);
  CGContextRelease(v19);
  -[MKAnnotationView _mapPitchRadians](self, "_mapPitchRadians");
  if (self->_useDarkAppearance)
    v36 = 0.300000012;
  else
    v36 = 0.25;
  v37 = cos(v35);
  v38 = (1.0 - v37) * 0.5 + (1.0 - (1.0 - v37)) * v36;
  *(float *)&v38 = v38;
  -[CALayer setOpacity:](self->_shadowLayer, "setOpacity:", (double)v38);
}

+ (double)shadowBlur
{
  return 10.0;
}

- (void)_updateBaseImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  CGColor *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  CGColor *v23;
  CGFloat v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  id v33;
  CGImage *Image;
  double v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v3);

  -[_MKPuckAnnotationView _currentScreenScale](self, "_currentScreenScale");
  v5 = fmax(v4, 1.0);
  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v7 = v6 * v5;
  objc_msgSend((id)objc_opt_class(), "innerDiameter");
  v9 = v8;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v7, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSaveGState(v12);
  v13 = 0.0;
  if (-[_MKPuckAnnotationView shouldShowOuterRing](self, "shouldShowOuterRing"))
  {
    objc_msgSend((id)objc_opt_class(), "outerRingWidth");
    if (v14 > 0.0)
    {
      objc_msgSend((id)objc_opt_class(), "outerRingWidth");
      v13 = v15;
      if (-[_MKPuckAnnotationView isStale](self, "isStale"))
        objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_74);
      else
        -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (CGColor *)objc_msgSend(v16, "CGColor");

      CGContextSetFillColorWithColor(v12, v17);
      v37.origin.x = round(v7 - v7) * 0.5;
      v37.origin.y = v37.origin.x;
      v37.size.width = v7;
      v37.size.height = v7;
      CGContextFillEllipseInRect(v12, v37);
    }
  }
  v18 = v5 * v9;
  _MKPuckAnnotationViewBaseColor(-[MKAnnotationView _mapType](self, "_mapType"), self->_displaysPuckAsAccuracy);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSaveGState(v12);
  v20 = round(v7 - v7 + v13) * 0.5;
  v21 = v7 - v13;
  v22 = objc_retainAutorelease(v19);
  v23 = (CGColor *)objc_msgSend(v22, "CGColor");
  v35 = v18;
  if (self->_displaysPuckAsAccuracy)
  {
    v24 = (v7 - v18) * 0.5;
    v38.origin.x = v20;
    v38.origin.y = v20;
    v38.size.width = v21;
    v38.size.height = v21;
    v39 = CGRectInset(v38, v24 * 0.5, v24 * 0.5);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    CGContextSetLineWidth(v12, v24);
    CGContextSetStrokeColorWithColor(v12, v23);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    CGContextStrokeEllipseInRect(v12, v40);
  }
  else
  {
    CGContextSetFillColorWithColor(v12, v23);
    v41.origin.x = v20;
    v41.origin.y = v20;
    v41.size.width = v7 - v13;
    v41.size.height = v7 - v13;
    CGContextFillEllipseInRect(v12, v41);
  }
  CGContextRestoreGState(v12);
  if (self->_displaysPuckAsAccuracy)
  {
    v42.origin.x = v20;
    v42.origin.y = v20;
    v42.size.width = v21;
    v42.size.height = v21;
    v43 = CGRectInset(v42, (v7 - v35) * 0.5, (v7 - v35) * 0.5);
    v29 = v43.origin.x;
    v30 = v43.origin.y;
    v31 = v43.size.width;
    v32 = v43.size.height;
    CGContextSaveGState(v12);
    -[_MKPuckAnnotationView _currentInnerColor](self, "_currentInnerColor");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v12, (CGColorRef)objc_msgSend(v33, "CGColor"));

    v44.origin.x = v29;
    v44.origin.y = v30;
    v44.size.width = v31;
    v44.size.height = v32;
    CGContextFillEllipseInRect(v12, v44);
    CGContextRestoreGState(v12);
  }
  Image = CGBitmapContextCreateImage(v12);
  -[CALayer setContents:](self->_baseLayer, "setContents:", Image);
  CGImageRelease(Image);
  CGContextRelease(v12);
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v36);

}

- (BOOL)shouldShowOuterRing
{
  return self->_shouldShowOuterRing;
}

- (void)_updateInnerImage
{
  void *v3;
  id v4;
  CGColor *v5;
  int v6;
  CGImage *v7;
  CGImage *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v16;
  double v17;
  unint64_t i;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGImage *Image;
  void *v24;
  void *v25;
  id v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v3);

  -[_MKPuckAnnotationView _currentInnerColor](self, "_currentInnerColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  if (self->_innerImageMask)
  {
    -[CALayer setContents:](self->_innerCircleLayer, "setContents:", 0);
    -[CALayer setBackgroundColor:](self->_innerCircleLayer, "setBackgroundColor:", v5);
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_shouldAdoptImplicitAnimationParameters");
    -[CALayer contents](self->_innerCircleLayer, "contents");
    v7 = (CGImage *)objc_claimAutoreleasedReturnValue();
    v8 = CGImageRetain(v7);

    -[_MKPuckAnnotationView _currentScreenScale](self, "_currentScreenScale");
    v10 = fmax(v9, 1.0);
    objc_msgSend((id)objc_opt_class(), "innerDiameter");
    v12 = v11 * v10;
    v13 = v10 * (v11 * 10.0);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v16 = CGBitmapContextCreate(0, (unint64_t)v13, (unint64_t)v12, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
    CGColorSpaceRelease(DeviceRGB);
    CGContextSaveGState(v16);
    if (!self->_displaysPuckAsAccuracy)
    {
      v17 = v12 * 0.5;
      for (i = 1; i != 11; ++i)
      {
        CGContextSaveGState(v16);
        v19 = v17 * ((double)i / 10.0 * 0.1875 + 0.8125);
        v20 = v17 + (double)(i - 1) * v12 - v19;
        v21 = v17 - v19;
        v22 = v19 + v19;
        CGContextSetFillColorWithColor(v16, v5);
        v27.origin.x = v20;
        v27.origin.y = v21;
        v27.size.width = v22;
        v27.size.height = v22;
        CGContextFillEllipseInRect(v16, v27);
        CGContextRestoreGState(v16);
      }
    }
    CGContextRestoreGState(v16);
    Image = CGBitmapContextCreateImage(v16);
    -[CALayer setContents:](self->_innerCircleLayer, "setContents:", Image);
    -[CALayer setBackgroundColor:](self->_innerCircleLayer, "setBackgroundColor:", 0);
    CGContextRelease(v16);
    -[_MKPuckAnnotationView _resetInnerPulseFrame](self, "_resetInnerPulseFrame");
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contents"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFromValue:", v8);
      objc_msgSend(v24, "setToValue:", Image);
      objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationDuration");
      objc_msgSend(v24, "setDuration:");
      objc_msgSend(MEMORY[0x1E0CEABB0], "_mapkit_currentAnimationTimingFunction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTimingFunction:", v25);

      objc_msgSend(v24, "setRemovedOnCompletion:", 1);
      -[CALayer addAnimation:forKey:](self->_innerCircleLayer, "addAnimation:forKey:", v24, CFSTR("image"));

    }
    CGImageRelease(v8);
    CGImageRelease(Image);
    objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v26);
  }

}

+ (double)innerDiameter
{
  return 16.0;
}

- (void)_resetInnerPulseFrame
{
  double v3;

  if (self->_shouldInnerPulse)
    v3 = 0.500000007;
  else
    v3 = (double)-[_MKPuckAnnotationView _innerPulseFrameWhenDisabled:](self, "_innerPulseFrameWhenDisabled:", 10)
       * 0.100000001;
  -[CALayer setContentsRect:](self->_innerCircleLayer, "setContentsRect:", v3, 0.0, 0.100000001, 1.0);
}

- (void)_updateInnerMaskLayer
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double MidX;
  CGRect v8;
  CGRect v9;

  if (self->_innerImageMask)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContents:", -[UIImage CGImage](self->_innerImageMask, "CGImage"));
    -[UIImage size](self->_innerImageMask, "size");
    v5 = v4;
    -[UIImage size](self->_innerImageMask, "size");
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v5, v6);
    -[CALayer bounds](self->_innerCircleLayer, "bounds");
    MidX = CGRectGetMidX(v8);
    -[CALayer bounds](self->_innerCircleLayer, "bounds");
    objc_msgSend(v3, "setPosition:", MidX, CGRectGetMidY(v9));
    -[CALayer setMask:](self->_innerCircleLayer, "setMask:", v3);

  }
  else
  {
    -[CALayer setMask:](self->_innerCircleLayer, "setMask:", 0);
  }
  -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
}

- (void)_updateGlyphImage
{
  CALayer *v3;
  CALayer *glyphLayer;
  void *v5;
  void *v6;
  CALayer *v7;
  _QWORD v8[5];

  if (self->_glyphImage)
  {
    if (self->_innerCircleLayer)
    {
      if (!self->_glyphLayer)
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
        glyphLayer = self->_glyphLayer;
        self->_glyphLayer = v3;

        -[CALayer _mapkit_setActionsToRemoveDefaultImplicitActions](self->_glyphLayer, "_mapkit_setActionsToRemoveDefaultImplicitActions");
        -[CALayer setContentsGravity:](self->_glyphLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
        -[CALayer addSublayer:](self->_innerCircleLayer, "addSublayer:", self->_glyphLayer);
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __42___MKPuckAnnotationView__updateGlyphImage__block_invoke;
      v8[3] = &unk_1E20D7D98;
      v8[4] = self;
      v5 = (void *)MEMORY[0x18D778DB8](v8, a2);
      -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "performAsCurrentTraitCollection:", v5);

    }
  }
  else
  {
    -[CALayer removeFromSuperlayer](self->_glyphLayer, "removeFromSuperlayer");
    v7 = self->_glyphLayer;
    self->_glyphLayer = 0;

  }
}

- (void)_updateFaux3DColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (self->_faux3DEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckFaux3DFaceHighlight"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckFaux3DFaceDark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_mapkit_blendedColorWithFraction:ofColor:", v6, 0.200000003);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11[0] = objc_msgSend(v7, "CGColor");
    v8 = objc_retainAutorelease(v5);
    v11[1] = objc_msgSend(v8, "CGColor", v11[0]);
    v9 = objc_retainAutorelease(v6);
    v11[2] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](self->_faux3DFaceLayer, "setColors:", v10);
    -[CAGradientLayer setLocations:](self->_faux3DFaceLayer, "setLocations:", &unk_1E215A018);
    -[CAGradientLayer setColors:](self->_faux3DBaseBottomLayer, "setColors:", v10);
    -[CAGradientLayer setLocations:](self->_faux3DBaseBottomLayer, "setLocations:", &unk_1E215A018);
    objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v3);

  }
}

- (void)_createOrRemoveFaux3DRingsIfNecessary
{
  CALayer *v3;
  CALayer *faux3DHighlightMask;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  NSArray *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  NSArray *faux3DHighlightMaskRings;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  CALayer *v22;
  NSArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_faux3DEnabled && self->_displaysPuckAsAccuracy)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
    faux3DHighlightMask = self->_faux3DHighlightMask;
    self->_faux3DHighlightMask = v3;

    -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
    -[CALayer setFrame:](self->_faux3DHighlightMask, "setFrame:");
    -[CAGradientLayer setMask:](self->_faux3DFaceLayer, "setMask:", self->_faux3DHighlightMask);
    objc_msgSend((id)objc_opt_class(), "baseDiameter");
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "innerDiameter");
    v8 = (v6 - v7) * 0.5;
    v9 = vcvtpd_u64_f64(12.0 / v8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      do
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBounds:", 0.0, 0.0, v6, v6);
        objc_msgSend(v13, "setAnchorPoint:", v11, v12);
        objc_msgSend(v13, "setPosition:", v11, v12);
        objc_msgSend(v13, "bounds");
        objc_msgSend(v13, "setCornerRadius:", v14 * 0.5);
        objc_msgSend(v13, "setBorderWidth:", v8);
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "setBorderColor:", objc_msgSend(v15, "CGColor"));

        objc_msgSend(v13, "_mapkit_setActionsToRemoveDefaultImplicitActions");
        objc_msgSend(v13, "setHidden:", 1);
        -[NSArray addObject:](v10, "addObject:", v13);
        -[CALayer insertSublayer:above:](self->_faux3DHighlightMask, "insertSublayer:above:", v13, self->_shadowLayer);

        --v9;
      }
      while (v9);
    }
    faux3DHighlightMaskRings = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = v10;

  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = self->_faux3DHighlightMaskRings;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "removeFromSuperlayer", (_QWORD)v24);
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

    -[CAGradientLayer setMask:](self->_faux3DFaceLayer, "setMask:", 0);
    v22 = self->_faux3DHighlightMask;
    self->_faux3DHighlightMask = 0;

    v23 = self->_faux3DHighlightMaskRings;
    self->_faux3DHighlightMaskRings = 0;

  }
}

- (BOOL)shouldDisplayInaccurateHeading
{
  return self->_shouldDisplayInaccurateHeading;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  -[_MKPuckAnnotationView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[_MKPuckAnnotationView _updatePulse](self, "_updatePulse");
  -[_MKPuckAnnotationView _updatePulseAnimation](self, "_updatePulseAnimation");
  -[_MKPuckAnnotationView _updateAccuracyAnimation](self, "_updateAccuracyAnimation");
  -[_MKPuckAnnotationView _updateShadowImage](self, "_updateShadowImage");
  -[_MKPuckAnnotationView _updateBaseImage](self, "_updateBaseImage");
  -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
  -[_MKPuckAnnotationView _updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:](self, "_updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:", 0, 0.0);
}

- (void)_updateAccuracyAnimation
{
  _BOOL4 shouldShowDynamicLocationAnimations;
  _MKPuckAccuracyLayer *accuracyLayer;

  shouldShowDynamicLocationAnimations = self->_shouldShowDynamicLocationAnimations;
  accuracyLayer = self->_accuracyLayer;
  if (shouldShowDynamicLocationAnimations)
    -[_MKPuckAccuracyLayer startAnimationsIfNecessary](accuracyLayer, "startAnimationsIfNecessary");
  else
    -[_MKPuckAccuracyLayer stopAnimations](accuracyLayer, "stopAnimations");
}

- (id)_innerPulseAnimation
{
  void *v2;
  void *v3;
  unint64_t i;
  void *v5;
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("contentsRect"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 10; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (double)i * 0.100000001, 0.0, 0.100000001, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(v2, "setValues:", v3);
  objc_msgSend(v2, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  objc_msgSend(v2, "setDuration:", 1.5);
  objc_msgSend(v2, "setAutoreverses:", 1);
  LODWORD(v6) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v6);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v7);

  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v2, "setFrameInterval:", 0.0250000004);

  return v2;
}

- (void)_updatePulseAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CALayer *pulseLayer;
  CALayer *innerCircleLayer;
  id v9;
  CALayer *v10;
  id v11;
  CALayer *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  long double v23;
  long double v24;
  id v25;

  if (self->_shouldInnerPulse && self->_shouldShowDynamicLocationAnimations)
  {
    -[CALayer animationForKey:](self->_innerCircleLayer, "animationForKey:", CFSTR("pulse"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[_MKPuckAnnotationView _innerPulseAnimation](self, "_innerPulseAnimation");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[CALayer animationForKey:](self->_pulseLayer, "animationForKey:", CFSTR("outerPulse"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[CALayer animationForKey:](self->_pulseLayer, "animationForKey:", CFSTR("outerPulse"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v5, "copy");

        pulseLayer = self->_pulseLayer;
        innerCircleLayer = self->_innerCircleLayer;
        v9 = v6;
        v10 = pulseLayer;
        v11 = v25;
        if (v11)
        {
          v12 = innerCircleLayer;
          v13 = objc_msgSend(v11, "autoreverses");
          objc_msgSend(v11, "duration");
          if (v13)
            v15 = v14 + v14;
          else
            v15 = v14;
          -[CALayer convertTime:fromLayer:](v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
          v17 = v16;
          objc_msgSend(v11, "beginTime");
          v19 = v18;
          objc_msgSend(v11, "timeOffset");
          v21 = fmod(v17 - (v19 + v20), v15);
          objc_msgSend(v11, "beginTime");
          -[CALayer convertTime:toLayer:](v12, "convertTime:toLayer:", v10);
          v23 = v22;

          objc_msgSend(v9, "duration");
          objc_msgSend(v9, "setBeginTime:", (double)fmod(v23, v24));
          objc_msgSend(v9, "setTimeOffset:", v15 - v21);
          objc_msgSend(v9, "setDuration:", v15);
        }

        -[CALayer addAnimation:forKey:](self->_pulseLayer, "addAnimation:forKey:", v9, CFSTR("outerPulse"));
      }
      -[CALayer addAnimation:forKey:](self->_innerCircleLayer, "addAnimation:forKey:", v25, CFSTR("pulse"));

    }
  }
  else
  {
    -[CALayer removeAnimationForKey:](self->_innerCircleLayer, "removeAnimationForKey:", CFSTR("pulse"));
  }
}

- (void)_updateAccuracyOpacityForRadius:(double)a3 duration:(double)a4
{
  double minimumAccuracyRadius;
  double maxRadiusToShowAccuracyRing;
  void *v9;
  float v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;

  minimumAccuracyRadius = self->_minimumAccuracyRadius;
  maxRadiusToShowAccuracyRing = self->_maxRadiusToShowAccuracyRing;
  -[CALayer currentLayer](self->_accuracyContainerLayer, "currentLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "opacity");
  v11 = v10;

  v12 = 1.0;
  v13 = 1.0;
  if (maxRadiusToShowAccuracyRing >= minimumAccuracyRadius && maxRadiusToShowAccuracyRing >= 0.1)
  {
    v14 = fmax((a3 - minimumAccuracyRadius) / (maxRadiusToShowAccuracyRing - minimumAccuracyRadius), 0.0);
    if (v14 >= 1.0)
      v15 = 0.0;
    else
      v15 = 1.0 - v14;
    v13 = v15;
    v16 = fmax((a3 - self->_accuracyRingStrokeOpacityThreshold)/ (maxRadiusToShowAccuracyRing - self->_accuracyRingStrokeOpacityThreshold), 0.0);
    if (v16 >= 1.0)
      v17 = 0.0;
    else
      v17 = 1.0 - v16;
    v18 = v17;
    v12 = v18;
  }
  if (vabdd_f64(v13, v11) >= 0.01)
  {
    -[_MKPuckAccuracyLayer setFillOpacity:duration:](self->_accuracyLayer, "setFillOpacity:duration:", v13, a4);
    -[_MKPuckAccuracyLayer setStrokeOpacity:duration:](self->_accuracyLayer, "setStrokeOpacity:duration:", v12, a4);
    -[CALayer removeAnimationForKey:](self->_headingContainerLayer, "removeAnimationForKey:", CFSTR("accuracyOpacity"));
    if (a4 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFromValue:", v22);

      *(float *)&v23 = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setToValue:", v24);

      objc_msgSend(v21, "setDuration:", a4);
      objc_msgSend(v21, "setRemovedOnCompletion:", 1);
      -[CALayer addAnimation:forKey:](self->_headingContainerLayer, "addAnimation:forKey:", v21, CFSTR("accuracyOpacity"));

    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    *(float *)&v25 = v13;
    -[CALayer setOpacity:](self->_headingContainerLayer, "setOpacity:", v25);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    -[CALayer opacity](self->_headingContainerLayer, "opacity");
    v20 = vabds_f32(v13, v19);
    if (v20 >= 0.01)
    {
      *(float *)&v20 = v13;
      -[CALayer setOpacity:](self->_headingContainerLayer, "setOpacity:", v20);
    }
  }
}

- (void)setMaxRadiusToShowAccuracyRing:(double)a3
{
  self->_maxRadiusToShowAccuracyRing = a3;
  -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
}

- (void)_setAccuracyRingStrokeOpacityThreshold:(double)a3
{
  if (vabdd_f64(self->_accuracyRingStrokeOpacityThreshold, a3) >= 0.00000011920929)
  {
    self->_accuracyRingStrokeOpacityThreshold = a3;
    -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
    -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
  }
}

- (id)_vkNavigationPuckMarker
{
  return self->_navigationPuckMarker;
}

- (void)_setMapType:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapType:](&v7, sel__setMapType_);
  -[_MKPuckAnnotationView _updatePulseColor](self, "_updatePulseColor");
  -[_MKPuckAccuracyLayer setMapType:](self->_accuracyLayer, "setMapType:", a3);
  -[MKUserLocationHeadingIndicator setMapType:](self->_headingLayer, "setMapType:", a3);
  if (a3 == 107)
    v5 = 2;
  else
    v5 = 0;
  if (a3 - 1 >= 4)
    v6 = v5;
  else
    v6 = 2;
  -[_MKPuckAnnotationView _setOverrideUserInterfaceStyle:](self, "_setOverrideUserInterfaceStyle:", v6);
}

- (void)_setMapPitchRadians:(double)a3
{
  void *v5;
  CALayer *accuracyContainerLayer;
  CALayer *headingContainerLayer;
  CALayer *puckLayer;
  CALayer *puckTransitionContainer;
  void *v10;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;
  CATransform3D v14;
  CATransform3D v15;
  CATransform3D v16;
  CATransform3D v17;
  CATransform3D v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setMapPitchRadians:](&v19, sel__setMapPitchRadians_);
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_CA_setDisableActions:", 1);

  CATransform3DMakeRotation(&v18, a3, 1.0, 0.0, 0.0);
  accuracyContainerLayer = self->_accuracyContainerLayer;
  v17 = v18;
  -[CALayer setTransform:](accuracyContainerLayer, "setTransform:", &v17);
  CATransform3DMakeRotation(&v16, a3, 1.0, 0.0, 0.0);
  headingContainerLayer = self->_headingContainerLayer;
  v15 = v16;
  -[CALayer setTransform:](headingContainerLayer, "setTransform:", &v15);
  if (self->_shouldHidePuckWhenAccuracyVisible || self->_faux3DEnabled)
  {
    CATransform3DMakeRotation(&v14, a3, 1.0, 0.0, 0.0);
    puckLayer = self->_puckLayer;
    v13 = v14;
    -[CALayer setTransform:](puckLayer, "setTransform:", &v13);
    CATransform3DMakeRotation(&v12, a3, 1.0, 0.0, 0.0);
    puckTransitionContainer = self->_puckTransitionContainer;
    v11 = v12;
    -[CALayer setTransform:](puckTransitionContainer, "setTransform:", &v11);
  }
  -[_MKPuckAccuracyLayer setMapPitchRadians:](self->_accuracyLayer, "setMapPitchRadians:", a3);
  -[_MKPuckAnnotationView _updateFaux3DLayers](self, "_updateFaux3DLayers");
  +[MKThreadContext currentContext](MKThreadContext, "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_CA_setDisableActions:", 0);

}

- (void)_updateFaux3DLayers
{
  _BOOL4 faux3DEnabled;
  CAGradientLayer *faux3DFaceLayer;
  long double v5;
  double v6;
  double mapCameraDistance;
  double v8;
  double v9;
  double v10;
  double v11;
  CALayer *baseLayer;
  CALayer *v13;
  CALayer *v14;
  CALayer *v15;
  CALayer *puckTransitionLayer;
  double v17;
  CALayer *shadowLayer;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  double v43;
  double v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CATransform3D v53;
  CATransform3D v54;
  CATransform3D v55;
  CATransform3D v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CATransform3D v61;
  CATransform3D v62;
  _OWORD v63[8];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  CATransform3D v72;
  CATransform3D v73;
  _OWORD v74[8];
  _OWORD v75[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  faux3DEnabled = self->_faux3DEnabled;
  faux3DFaceLayer = self->_faux3DFaceLayer;
  if (faux3DEnabled)
  {
    if (-[CAGradientLayer isHidden](faux3DFaceLayer, "isHidden"))
      -[CAGradientLayer setHidden:](self->_faux3DFaceLayer, "setHidden:", 0);
    -[CAGradientLayer setHidden:](self->_faux3DBaseBottomLayer, "setHidden:", self->_displaysPuckAsAccuracy);
    -[MKAnnotationView _mapPitchRadians](self, "_mapPitchRadians");
    v6 = v5;
    mapCameraDistance = self->_mapCameraDistance;
    v8 = 1.0 - cos(v5);
    v9 = 23000.0;
    if (mapCameraDistance <= 23000.0)
      v9 = mapCameraDistance;
    if (v9 <= 1440.0)
      v10 = 1.0;
    else
      v10 = (v9 + -1440.0) / -21560.0 + 1.0;
    v11 = v10 * 12.0 + (1.0 - v10) * 0.0;
    CATransform3DMakeTranslation(&v73, 0.0, -(v8 * v11), 0.0);
    baseLayer = self->_baseLayer;
    v72 = v73;
    -[CALayer setTransform:](baseLayer, "setTransform:", &v72);
    v13 = self->_baseLayer;
    if (v13)
    {
      -[CALayer transform](v13, "transform");
    }
    else
    {
      v71 = 0u;
      v70 = 0u;
      v69 = 0u;
      v68 = 0u;
      v67 = 0u;
      v66 = 0u;
      v65 = 0u;
      v64 = 0u;
    }
    puckTransitionLayer = self->_puckTransitionLayer;
    v17 = v8 * v11;
    v63[5] = v69;
    v63[6] = v70;
    v63[7] = v71;
    v63[0] = v64;
    v63[1] = v65;
    v63[2] = v66;
    v63[3] = v67;
    v63[4] = v68;
    -[CALayer setTransform:](puckTransitionLayer, "setTransform:", v63);
    CATransform3DMakeTranslation(&v62, 0.0, v8 + v8, 0.0);
    shadowLayer = self->_shadowLayer;
    v61 = v62;
    -[CALayer setTransform:](shadowLayer, "setTransform:", &v61);
    v19 = 0.300000012;
    if (!self->_useDarkAppearance)
      v19 = 0.25;
    v20 = v8 * 0.5 + (1.0 - v8) * v19;
    *(float *)&v20 = v20;
    -[CALayer setOpacity:](self->_shadowLayer, "setOpacity:", v20);
    if (self->_displaysPuckAsAccuracy)
    {
      -[CALayer frame](self->_baseLayer, "frame");
      v22 = v21;
      v24 = v23;
    }
    else
    {
      -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
      v22 = v25 * -0.5;
      v24 = -1.0 - v17;
      -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
    }
    -[CAGradientLayer setFrame:](self->_faux3DFaceLayer, "setFrame:", v22, v24);
    if (fabs(v6) >= 0.000001)
    {
      if (self->_displaysPuckAsAccuracy)
      {
        -[NSArray objectAtIndexedSubscript:](self->_faux3DHighlightMaskRings, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "borderWidth");
        v28 = v27;

        -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
        v30 = v29;
        -[NSArray firstObject](self->_faux3DHighlightMaskRings, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bounds");
        v33 = v32;

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v34 = self->_faux3DHighlightMaskRings;
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v57, v82, 16);
        if (v35)
        {
          v36 = v35;
          v37 = 0;
          v38 = v30 - v33;
          v39 = v38 - v17 + v28 * -0.5;
          v40 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v58 != v40)
                objc_enumerationMutation(v34);
              v42 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              v39 = v28 + v39;
              if (v39 >= v38)
              {
                if ((v37 & 1) != 0)
                {
                  v37 = 1;
                  objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 1);
                }
                else
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 0);
                  CATransform3DMakeTranslation(&v56, 0.0, v38, 0.0);
                  v55 = v56;
                  objc_msgSend(v42, "setTransform:", &v55);
                  v37 = 1;
                }
              }
              else
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setHidden:", 0);
                CATransform3DMakeTranslation(&v54, 0.0, v39, 0.0);
                v53 = v54;
                objc_msgSend(v42, "setTransform:", &v53);
              }
            }
            v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v57, v82, 16);
          }
          while (v36);
        }

      }
      else
      {
        -[CAGradientLayer setHidden:](self->_faux3DFaceLayer, "setHidden:", 0);
        -[CAGradientLayer setHidden:](self->_faux3DBaseBottomLayer, "setHidden:", 0);
        -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
        v44 = v43 * -0.5;
        -[CAGradientLayer bounds](self->_faux3DFaceLayer, "bounds");
        -[CAGradientLayer setFrame:](self->_faux3DFaceLayer, "setFrame:", v44, -1.0 - v17);
      }
    }
    else
    {
      -[CAGradientLayer setHidden:](self->_faux3DFaceLayer, "setHidden:", 1);
      -[CAGradientLayer setHidden:](self->_faux3DBaseBottomLayer, "setHidden:", 1);
    }
  }
  else
  {
    -[CAGradientLayer setHidden:](faux3DFaceLayer, "setHidden:", 1);
    -[CAGradientLayer setHidden:](self->_faux3DBaseBottomLayer, "setHidden:", 1);
    v14 = self->_baseLayer;
    v52 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v78 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v51 = v78;
    v79 = v52;
    v50 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v80 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v49 = v80;
    v81 = v50;
    v48 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v75[0] = *MEMORY[0x1E0CD2610];
    v47 = v75[0];
    v75[1] = v48;
    v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v76 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v45 = v76;
    v77 = v46;
    -[CALayer setTransform:](v14, "setTransform:", v75);
    v15 = self->_shadowLayer;
    v74[4] = v51;
    v74[5] = v52;
    v74[6] = v49;
    v74[7] = v50;
    v74[0] = v47;
    v74[1] = v48;
    v74[2] = v45;
    v74[3] = v46;
    -[CALayer setTransform:](v15, "setTransform:", v74);
  }
}

- (void)_setMapDisplayStyle:(id)a3
{
  uint64_t v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3.var0;
  if (((-[MKAnnotationView _mapDisplayStyle](self, "_mapDisplayStyle") ^ *(_QWORD *)&a3.var0) & 0x1FFFFFFFFFFLL) != 0)
  {
    v5 = -[MKAnnotationView _mapDisplayStyle](self, "_mapDisplayStyle") == 1;
    v6.receiver = self;
    v6.super_class = (Class)_MKPuckAnnotationView;
    -[MKAnnotationView _setMapDisplayStyle:](&v6, sel__setMapDisplayStyle_, v3 & 0xFFFFFFFFFFFFLL);
    if ((((v3 != 1) ^ v5) & 1) == 0)
    {
      -[_MKPuckAnnotationView _updatePulseColor](self, "_updatePulseColor");
      -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
    }
  }
}

- (void)_updatePulse
{
  if (self->_shouldPulse && self->_allowsPulse)
  {
    if (-[_MKPuckAnnotationView isEffectsEnabled](self, "isEffectsEnabled"))
      -[_MKPuckAnnotationView _resumePulse](self, "_resumePulse");
    else
      -[_MKPuckAnnotationView _pausePulse](self, "_pausePulse");
  }
  else
  {
    -[_MKPuckAnnotationView _removePulse](self, "_removePulse");
  }
}

- (void)_removePulse
{
  void *v3;
  BOOL v4;
  CALayer *pulseLayer;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;
  double v15;
  CALayer *v16;
  _QWORD v17[5];

  -[CALayer superlayer](self->_pulseLayer, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[_MKPuckAnnotationView _hideLargeAccuracyRing](self, "_hideLargeAccuracyRing");
    pulseLayer = self->_pulseLayer;
    if (v4)
    {
      -[CALayer animationForKey:](pulseLayer, "animationForKey:", CFSTR("fadePulse"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[CALayer animationForKey:](self->_pulseLayer, "animationForKey:", CFSTR("outerPulse"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = CACurrentMediaTime();
          objc_msgSend(v7, "beginTime");
          v10 = v8 - v9;
          objc_msgSend(v7, "timeOffset");
          v12 = v10 + v11;
          objc_msgSend(v7, "duration");
          v14 = fmod(v12, v13);
          -[_MKPuckAnnotationView _pulseAnimation](self, "_pulseAnimation");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = 0;
          objc_msgSend(v6, "setRepeatCount:", v15);
          objc_msgSend(v6, "setRemovedOnCompletion:", 1);
          objc_msgSend(v6, "setBeginTime:", -v14);
          objc_msgSend(v6, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
          -[CALayer removeAnimationForKey:](self->_pulseLayer, "removeAnimationForKey:", CFSTR("outerPulse"));
          v16 = self->_pulseLayer;
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __37___MKPuckAnnotationView__removePulse__block_invoke;
          v17[3] = &unk_1E20D82F8;
          v17[4] = self;
          -[CALayer _mapkit_addAnimation:forKey:completion:](v16, "_mapkit_addAnimation:forKey:completion:", v6, CFSTR("fadePulse"), v17);
        }
        else
        {
          -[CALayer removeFromSuperlayer](self->_pulseLayer, "removeFromSuperlayer");
          v6 = 0;
        }

      }
    }
    else
    {
      -[CALayer removeAnimationForKey:](pulseLayer, "removeAnimationForKey:", CFSTR("outerPulse"));
      -[CALayer removeFromSuperlayer](self->_pulseLayer, "removeFromSuperlayer");
    }
  }
}

- (void)setShouldDisplayInaccurateHeading:(BOOL)a3
{
  if (self->_shouldDisplayInaccurateHeading != a3)
  {
    self->_shouldDisplayInaccurateHeading = a3;
    -[MKUserLocationHeadingIndicator updateHeadingAccuracy:previousAccuracy:](self->_headingLayer, "updateHeadingAccuracy:previousAccuracy:", self->_headingAccuracy, self->_headingAccuracy);
  }
}

- (void)tintColorDidChange
{
  MKUserLocationHeadingIndicator *headingLayer;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[_MKPuckAnnotationView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
  -[_MKPuckAnnotationView _updateAccuracyColors](self, "_updateAccuracyColors");
  -[_MKPuckAnnotationView _updatePulseColor](self, "_updatePulseColor");
  headingLayer = self->_headingLayer;
  -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKUserLocationHeadingIndicator updateTintColor:](headingLayer, "updateTintColor:", v4);

}

- (void)_updatePulseColor
{
  unint64_t v3;
  BOOL v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = -[MKAnnotationView _mapType](self, "_mapType");
  v4 = v3 - 1 < 4 || v3 == 107;
  v5 = (char)-[MKAnnotationView _mapDisplayStyle](self, "_mapDisplayStyle");
  -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_mapkit_blendedColorWithFraction:ofColor:", v7, 0.400000006);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;

      v6 = v9;
    }

  }
  v10 = objc_retainAutorelease(v6);
  -[CALayer setBackgroundColor:](self->_pulseLayer, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

}

- (void)_updateAccuracyColors
{
  id v3;

  -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAccuracyLayer setTintColor:](self->_accuracyLayer, "setTintColor:", v3);

}

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  CLLocation *v5;
  CLLocation *lastLocation;
  CLLocation *v7;
  BOOL v8;

  v5 = (CLLocation *)a3;
  -[_MKPuckAnnotationView setStale:](self, "setStale:", -[_MKPuckAnnotationView _isLocationStale:](self, "_isLocationStale:", v5));
  lastLocation = self->_lastLocation;
  self->_lastLocation = v5;
  v7 = v5;

  -[CLLocation horizontalAccuracy](v7, "horizontalAccuracy");
  -[_MKPuckAnnotationView setLocationAccuracy:duration:](self, "setLocationAccuracy:duration:");
  -[_MKPuckAnnotationView _updateShowHeadingLayer](self, "_updateShowHeadingLayer");
  -[_MKPuckAnnotationView _updateLayers](self, "_updateLayers");
  v8 = -[_MKPuckAnnotationView _shouldPulseForLocation:](self, "_shouldPulseForLocation:", self->_lastLocation);

  self->_shouldPulse = v8;
  -[_MKPuckAnnotationView _updatePulse](self, "_updatePulse");
}

- (void)_updateShowHeadingLayerAnimatedIfPossible:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if (self->_shouldDisplayHeading && self->_canShowHeadingIndicator && self->_hasValidHeading)
    v5 = -[_MKPuckAnnotationView isStale](self, "isStale") ^ 1;
  else
    v5 = 0;
  -[_MKPuckAnnotationView _updateShowHeadingLayer:animatedIfPossible:](self, "_updateShowHeadingLayer:animatedIfPossible:", v5, v3);
}

- (void)_updateShowHeadingLayer:(BOOL)a3 animatedIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  int v7;
  uint64_t v8;
  _BOOL8 v9;
  MKUserLocationHeadingIndicator *v10;
  int64_t v11;
  MKUserLocationHeadingIndicator *v12;
  MKUserLocationHeadingIndicator *headingLayer;
  double v14;
  void *v15;
  MKUserLocationHeadingIndicator *v16;
  void *v17;
  MKUserLocationHeadingIndicator *v18;
  CALayer *puckLayer;
  void *v20;
  MKUserLocationHeadingIndicator *v21;
  _QWORD v22[4];
  MKUserLocationHeadingIndicator *v23;

  v4 = a4;
  v5 = a3;
  v7 = self->_headingLayer == 0;
  v8 = _MKModernPuckDesignEnabled();
  v9 = v8;
  if (v7 == v5 || self->_headingLayerTracksAccuracy != (_DWORD)v8)
  {
    v10 = self->_headingLayer;
    if (v5)
    {
      v11 = -[_MKPuckAnnotationView _enforcedHeadingIndicatorStyle](self, "_enforcedHeadingIndicatorStyle");
      +[MKUserLocationHeadingLayerFactory headingLayerWithStyle:userLocationView:shouldMatchAccuracyRadius:](MKUserLocationHeadingLayerFactory, "headingLayerWithStyle:userLocationView:shouldMatchAccuracyRadius:", v11, self, v9);
      v12 = (MKUserLocationHeadingIndicator *)objc_claimAutoreleasedReturnValue();
      headingLayer = self->_headingLayer;
      self->_headingLayer = v12;

      objc_msgSend((id)objc_opt_class(), "baseDiameter");
      -[MKUserLocationHeadingIndicator setMinimumAccuracyRadius:](self->_headingLayer, "setMinimumAccuracyRadius:", v14 * 0.5);
      -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKUserLocationHeadingIndicator setTraitCollection:](self->_headingLayer, "setTraitCollection:", v15);

      -[MKUserLocationHeadingIndicator setMapType:](self->_headingLayer, "setMapType:", -[MKAnnotationView _mapType](self, "_mapType"));
      v16 = self->_headingLayer;
      -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKUserLocationHeadingIndicator updateTintColor:](v16, "updateTintColor:", v17);

      -[MKUserLocationHeadingIndicator updateHeadingAccuracy:previousAccuracy:](self->_headingLayer, "updateHeadingAccuracy:previousAccuracy:", self->_headingAccuracy, self->_headingAccuracy);
      -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
      -[MKUserLocationHeadingIndicator setAccuracyRadius:duration:](self->_headingLayer, "setAccuracyRadius:duration:");
      self->_headingLayerTracksAccuracy = v9;
      -[_MKPuckAnnotationView _updateHeadingIndicators](self, "_updateHeadingIndicators");
      v18 = self->_headingLayer;
      if (v11 == 2 || v9)
      {
        -[CALayer addSublayer:](self->_headingContainerLayer, "addSublayer:", self->_headingLayer);
        if (!v4)
          goto LABEL_13;
      }
      else
      {
        puckLayer = self->_puckLayer;
        -[_MKPuckAnnotationView _baseLayer](self, "_baseLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CALayer insertSublayer:below:](puckLayer, "insertSublayer:below:", v18, v20);

        if (!v4)
          goto LABEL_13;
      }
    }
    else
    {
      v21 = self->_headingLayer;
      self->_headingLayer = 0;

      if (!v4)
        goto LABEL_13;
    }
    if (-[MKUserLocationHeadingIndicator conformsToProtocol:](self->_headingLayer, "conformsToProtocol:", &unk_1EE0315F0)&& !-[_MKPuckAnnotationView isStale](self, "isStale"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68___MKPuckAnnotationView__updateShowHeadingLayer_animatedIfPossible___block_invoke;
      v22[3] = &unk_1E20D82F8;
      v23 = v10;
      -[MKUserLocationHeadingIndicator animateToSetVisible:completion:](v23, "animateToSetVisible:completion:", 0, v22);
      -[MKUserLocationHeadingIndicator animateToSetVisible:completion:](self->_headingLayer, "animateToSetVisible:completion:", 1, 0);

      goto LABEL_14;
    }
LABEL_13:
    -[MKUserLocationHeadingIndicator removeFromSuperlayer](v10, "removeFromSuperlayer");
LABEL_14:

  }
}

- (void)setStale:(BOOL)a3
{
  if (self->_stale != a3)
  {
    self->_stale = a3;
    -[_MKPuckAccuracyLayer setStale:](self->_accuracyLayer, "setStale:");
    -[_MKPuckAnnotationView _updateLayers](self, "_updateLayers");
  }
}

- (void)setLocationAccuracy:(double)a3 duration:(double)a4
{
  void *v6;
  _BOOL4 animatingPresentationAccuracy;

  if (vabdd_f64(a3, self->_locationAccuracy) >= 0.000001)
  {
    self->_locationAccuracy = a3;
    -[_MKPuckAnnotationView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      animatingPresentationAccuracy = self->_animatingPresentationAccuracy;

      if (!animatingPresentationAccuracy)
        -[_MKPuckAnnotationView _updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:](self, "_updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:", 1, a4);
    }
  }
}

- (void)_updateShowHeadingLayer
{
  -[_MKPuckAnnotationView _updateShowHeadingLayerAnimatedIfPossible:](self, "_updateShowHeadingLayerAnimatedIfPossible:", 0);
}

- (void)_updateLayers
{
  _BOOL4 isShowingStaleColor;

  isShowingStaleColor = self->_isShowingStaleColor;
  if (isShowingStaleColor != -[_MKPuckAnnotationView isStale](self, "isStale"))
  {
    self->_isShowingStaleColor = -[_MKPuckAnnotationView isStale](self, "isStale");
    -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
    -[_MKPuckAnnotationView _updateGlyphImage](self, "_updateGlyphImage");
  }
}

- (BOOL)_shouldPulseForLocation:(id)a3
{
  id v4;
  BOOL v5;
  unsigned int v6;

  v4 = a3;
  if (-[_MKPuckAnnotationView isStale](self, "isStale"))
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "type");
    v5 = 0;
    if (v6 <= 0xA && ((1 << v6) & 0x40E) != 0)
    {
      if (-[_MKPuckAnnotationView _hideLargeAccuracyRing](self, "_hideLargeAccuracyRing"))
        v5 = -[_MKPuckAnnotationView _shouldShowAccuracyRing](self, "_shouldShowAccuracyRing");
      else
        v5 = 1;
    }
  }

  return v5;
}

- (id)_currentInnerColor
{
  void *v3;
  double v4;
  unint64_t v5;
  uint64_t v6;

  if (-[_MKPuckAnnotationView isStale](self, "isStale"))
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", &__block_literal_global_74);
  else
    -[_MKPuckAnnotationView _effectiveTintColor](self, "_effectiveTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_displaysPuckAsAccuracy)
  {
    if (-[_MKPuckAnnotationView isStale](self, "isStale"))
    {
      v4 = 0.449999988;
    }
    else
    {
      v5 = -[MKAnnotationView _mapType](self, "_mapType");
      if (v5 - 1 < 4 || v5 == 107)
        v4 = 0.400000006;
      else
        v4 = 0.300000012;
    }
    objc_msgSend(v3, "colorWithAlphaComponent:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (id)_effectiveTintColor
{
  void *v2;
  uint64_t v3;

  -[_MKPuckAnnotationView tintColor](self, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_mapkit_isWhite"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (BOOL)_isLocationStale:(id)a3
{
  if (!a3 || self->_overrideIsStale)
    return 1;
  else
    return objc_msgSend(a3, "_navigation_isStale");
}

- (BOOL)_hideLargeAccuracyRing
{
  return self->_maxRadiusToShowAccuracyRing > 0.0;
}

- (void)setShouldDisplayHeading:(BOOL)a3
{
  self->_shouldDisplayHeading = a3;
  if (!a3)
    self->_hasValidHeading = 0;
  -[_MKPuckAnnotationView _updateShowHeadingLayerAnimatedIfPossible:](self, "_updateShowHeadingLayerAnimatedIfPossible:", 1);
}

- (void)setForcesConeIndicator:(BOOL)a3
{
  int64_t v5;

  if (self->_forcesConeIndicator != a3)
  {
    v5 = -[_MKPuckAnnotationView _enforcedHeadingIndicatorStyle](self, "_enforcedHeadingIndicatorStyle");
    self->_forcesConeIndicator = a3;
    if (v5 != -[_MKPuckAnnotationView _enforcedHeadingIndicatorStyle](self, "_enforcedHeadingIndicatorStyle"))
      -[_MKPuckAnnotationView _updateHeadingLayerForStyleChange:](self, "_updateHeadingLayerForStyleChange:", 0);
  }
}

- (_MKPuckAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  id v7;
  _MKPuckAnnotationView *v8;
  _MKPuckAnnotationView *v9;
  uint64_t v10;
  UIColor *glyphTintColor;
  id v12;
  void *v13;
  uint64_t v14;
  id newPuckConfigListener;
  id v16;
  uint64_t v17;
  id faux3DPuckConfigListener;
  id v19;
  uint64_t v20;
  id shelbyvilleConfigListener;
  int v22;
  uint64_t v23;
  id minAccuracyConfigListener;
  double v25;
  uint64_t v26;
  id minUncertaintyConfigListener;
  double v28;
  void *v29;
  id v30;
  double v31;
  id v33[5];
  id v34[5];
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42[5];
  id v43;
  id location;
  objc_super v45;

  v6 = a3;
  v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)_MKPuckAnnotationView;
  v8 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v45, sel_initWithAnnotation_reuseIdentifier_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[MKAnnotationView setCanShowCallout:](v8, "setCanShowCallout:", 1);
    v9->_shouldHidePuckWhenAccuracyVisible = 0;
    v9->_canShowHeadingIndicator = 1;
    v9->_allowsAccuracyRing = 1;
    v9->_effectsEnabled = 1;
    v9->_shouldShowDynamicLocationAnimations = 1;
    v9->_shouldDisplayInaccurateHeading = 1;
    v9->_puckScale = 1.0;
    v9->super._collisionMode = 2;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    glyphTintColor = v9->_glyphTintColor;
    v9->_glyphTintColor = (UIColor *)v10;

    objc_msgSend((id)objc_opt_class(), "_calloutOffset");
    -[MKAnnotationView setCalloutOffset:](v9, "setCalloutOffset:");
    objc_initWeak(&location, v9);
    v12 = MEMORY[0x1E0C80D38];
    v13 = (void *)MEMORY[0x1E0C809B0];
    v42[1] = (id)MEMORY[0x1E0C809B0];
    v42[2] = (id)3221225472;
    v42[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke;
    v42[4] = &unk_1E20DC360;
    objc_copyWeak(&v43, &location);
    _GEOConfigAddBlockListenerForKey();
    v14 = objc_claimAutoreleasedReturnValue();
    newPuckConfigListener = v9->_newPuckConfigListener;
    v9->_newPuckConfigListener = (id)v14;

    -[_MKPuckAnnotationView _updateLegacyConfiguration](v9, "_updateLegacyConfiguration");
    v41[0] = v13;
    v41[1] = 3221225472;
    v41[2] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_2;
    v41[3] = &unk_1E20D8A58;
    objc_copyWeak(v42, &location);
    v36 = v13;
    v37 = 3221225472;
    v38 = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_3;
    v39 = &unk_1E20DC388;
    v16 = (id)MEMORY[0x18D778DB8](v41);
    v40 = v16;
    _GEOConfigAddBlockListenerForKey();
    v17 = objc_claimAutoreleasedReturnValue();
    faux3DPuckConfigListener = v9->_faux3DPuckConfigListener;
    v9->_faux3DPuckConfigListener = (id)v17;

    v34[1] = v13;
    v34[2] = (id)3221225472;
    v34[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_4;
    v34[4] = &unk_1E20DC3B0;
    v19 = v16;
    v35 = v19;
    MapsFeature_AddBlockListener();
    v20 = objc_claimAutoreleasedReturnValue();
    shelbyvilleConfigListener = v9->_shelbyvilleConfigListener;
    v9->_shelbyvilleConfigListener = (id)v20;

    v22 = _MKLinkedOnOrAfterReleaseSet(3081);
    if (v22)
      LOBYTE(v22) = GEOConfigGetBOOL();
    v9->_faux3DEnabled = v22;
    v33[1] = v13;
    v33[2] = (id)3221225472;
    v33[3] = __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_5;
    v33[4] = &unk_1E20DC360;
    objc_copyWeak(v34, &location);
    _GEOConfigAddBlockListenerForKey();
    v23 = objc_claimAutoreleasedReturnValue();
    minAccuracyConfigListener = v9->_minAccuracyConfigListener;
    v9->_minAccuracyConfigListener = (id)v23;

    GEOConfigGetDouble();
    v9->_minimumAccuracyRadius = v25;
    objc_copyWeak(v33, &location);
    _GEOConfigAddBlockListenerForKey();
    v26 = objc_claimAutoreleasedReturnValue();
    minUncertaintyConfigListener = v9->_minUncertaintyConfigListener;
    v9->_minUncertaintyConfigListener = (id)v26;

    GEOConfigGetDouble();
    v9->_minimumAccuracyUncertainty = v28;
    -[_MKPuckAnnotationView _setupLayers](v9, "_setupLayers", v13, 3221225472, __60___MKPuckAnnotationView_initWithAnnotation_reuseIdentifier___block_invoke_6, &unk_1E20DC360);
    -[_MKPuckAnnotationView setShouldInnerPulse:](v9, "setShouldInnerPulse:", 1);
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)-[_MKPuckAnnotationView registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v29, sel_traitEnvironment_didChangeTraitCollection_);

    LODWORD(v31) = 0;
    -[MKAnnotationView setZPriority:](v9, "setZPriority:", v31);
    objc_destroyWeak(v33);
    objc_destroyWeak(v34);

    objc_destroyWeak(v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)_updatePuckVisibilityForRadius:(double)a3 previousRadius:(double)a4 duration:(double)a5
{
  BOOL v9;
  double v10;
  double locationAccuracy;
  double minimumAccuracyUncertainty;
  float v13;
  char v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const CGPath *v45;
  const CGPath *CopyByStrokingPath;
  void *v47;
  void *v48;
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
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
  const CGPath *v84;
  const CGPath *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  id v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  CALayer *pulseLayer;
  uint64_t v102;
  id v103;
  CALayer *v104;
  void *v105;
  double v106;
  id v107;
  CALayer *v108;
  void *v109;
  void *v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  CALayer *v117;
  CALayer *v118;
  void (**v119)(_QWORD);
  void (**v120)(_QWORD);
  void (**v121)(_QWORD);
  void (**v122)(_QWORD);
  _QWORD v123[5];
  id v124;
  CALayer *v125;
  _QWORD v126[4];
  id v127;
  CALayer *v128;
  _MKPuckAnnotationView *v129;
  _QWORD v130[5];
  _QWORD v131[5];
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  CGRect v144;
  CGRect v145;

  v143 = *MEMORY[0x1E0C80C00];
  v9 = self->_shouldHidePuckWhenAccuracyVisible
    && (-[_MKPuckAccuracyLayer isHidden](self->_accuracyLayer, "isHidden") & 1) == 0
    && self->_minimumAccuracyRadius <= a3;
  if (self->_animatingPresentationAccuracy)
  {
    -[MKAnnotationView _pointsForDistance:](self, "_pointsForDistance:", 1.0);
    locationAccuracy = a3 / v10;
  }
  else
  {
    locationAccuracy = self->_locationAccuracy;
  }
  minimumAccuracyUncertainty = self->_minimumAccuracyUncertainty;
  -[CALayer opacity](self->_puckLayer, "opacity");
  v14 = !v9;
  if (locationAccuracy < minimumAccuracyUncertainty)
    v14 = 1;
  if ((v14 & 1) != 0)
  {
    v16 = 0;
    v15 = fabsf(v13) < 0.000001;
  }
  else
  {
    v15 = 0;
    v16 = v13 > 0.0;
    if (v13 > 0.0)
      goto LABEL_15;
  }
  if (!v15)
    return;
LABEL_15:
  v17 = MEMORY[0x1E0C809B0];
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke;
  v131[3] = &unk_1E20D7D98;
  v131[4] = self;
  v18 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v131);
  v130[0] = v17;
  v130[1] = 3221225472;
  v130[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_2;
  v130[3] = &unk_1E20DC3D8;
  v130[4] = self;
  v19 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v130);
  if (v16)
  {
    v18[2](v18);
    if (a5 > 0.0)
    {
      v119 = v19;
      v121 = v18;
      v19[2](v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = self->_puckTransitionContainer;
      objc_storeStrong((id *)&self->_puckTransitionLayer, v20);
      v21 = v20;
      objc_msgSend(v21, "bounds");
      if (20.0 / (a3 + v22 * -0.5) > 0.400000006
        || (objc_msgSend(v21, "bounds"), v24 = 0.150000006, 20.0 / (a3 + v23 * -0.5) > 0.150000006))
      {
        objc_msgSend(v21, "bounds");
        v24 = 0.400000006;
        if (20.0 / (a3 + v25 * -0.5) <= 0.400000006)
        {
          objc_msgSend(v21, "bounds");
          v24 = 20.0 / (a3 + v26 * -0.5);
        }
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v21, "bounds");
      objc_msgSend(v28, "valueWithCGRect:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setFromValue:", v29);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, a3 + a3, a3 + a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setToValue:", v30);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "cornerRadius");
      objc_msgSend(v32, "numberWithDouble:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFromValue:", v33);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setToValue:", v34);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setValues:", &unk_1E215A060);
      v140 = &unk_1E2158E48;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setKeyTimes:", v37);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("borderWidth"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v21, "borderWidth");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setValues:", v42);

      objc_msgSend(v35, "keyTimes");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setKeyTimes:", v43);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowPath"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFromValue:", objc_msgSend(v21, "shadowPath"));
      v144.origin.x = 0.0;
      v144.origin.y = 0.0;
      v144.size.width = a3 + a3;
      v144.size.height = a3 + a3;
      v45 = CGPathCreateWithEllipseInRect(v144, 0);
      CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v45, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
      objc_msgSend(v44, "setToValue:", CopyByStrokingPath);
      CGPathRelease(CopyByStrokingPath);
      CGPathRelease(v45);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v27;
      v133 = v31;
      v134 = v35;
      v135 = v38;
      v136 = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAnimations:", v48);

      objc_msgSend(v47, "setDuration:", a5);
      objc_msgSend(v47, "setRemovedOnCompletion:", 1);

      if (self->_displaysPuckAsAccuracy)
      {
        v49 = v21;
        objc_msgSend(v49, "bounds");
        if (20.0 / (a3 + v50 * -0.5) > 0.400000006
          || (objc_msgSend(v49, "bounds"), v52 = 0.150000006, 20.0 / (a3 + v51 * -0.5) > 0.150000006))
        {
          objc_msgSend(v49, "bounds");
          v52 = 0.400000006;
          if (20.0 / (a3 + v53 * -0.5) <= 0.400000006)
          {
            objc_msgSend(v49, "bounds");
            v52 = 20.0 / (a3 + v54 * -0.5);
          }
        }
        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setValues:", &unk_1E215A078);
        v132 = &unk_1E2158E48;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v56;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 2);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setKeyTimes:", v57);

        objc_msgSend(v55, "setDuration:", a5);
        objc_msgSend(v55, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(v55, "setRemovedOnCompletion:", 1);

      }
      else
      {
        v55 = 0;
      }
      v126[0] = MEMORY[0x1E0C809B0];
      v126[1] = 3221225472;
      v126[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_3;
      v126[3] = &unk_1E20D8E68;
      v103 = v21;
      v127 = v103;
      v104 = v117;
      v128 = v104;
      v129 = self;
      objc_msgSend(v103, "_mapkit_addAnimation:forKey:completion:", v47, CFSTR("show/hide"), v126);
      v19 = v119;
      if (v55)
        -[_MKPuckAccuracyLayer addAnimation:forKey:](self->_accuracyLayer, "addAnimation:forKey:", v55, CFSTR("show/hide"));

      v18 = v121;
    }
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "_CA_setDisableActions:", 1);

    LODWORD(v106) = 0;
    -[CALayer setOpacity:](self->_puckLayer, "setOpacity:", v106);
    pulseLayer = self->_pulseLayer;
    v102 = 1;
    goto LABEL_45;
  }
  if (v15)
  {
    if (a5 > 0.0)
    {
      v122 = v18;
      v18[2](v18);
      v120 = v19;
      v19[2](v19);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = self->_puckTransitionContainer;
      objc_storeStrong((id *)&self->_puckTransitionLayer, v58);
      v59 = v58;
      objc_msgSend(v59, "bounds");
      if (20.0 / (a4 + v60 * -0.5) > 0.400000006
        || (objc_msgSend(v59, "bounds"), v62 = 0.150000006, 20.0 / (a4 + v61 * -0.5) > 0.150000006))
      {
        objc_msgSend(v59, "bounds");
        v62 = 0.400000006;
        if (20.0 / (a4 + v63 * -0.5) <= 0.400000006)
        {
          objc_msgSend(v59, "bounds");
          v62 = 20.0 / (a4 + v64 * -0.5);
        }
      }
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, a4 + a4, a4 + a4);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = v65;
      objc_msgSend(v65, "setFromValue:", v66);

      v67 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v59, "bounds");
      objc_msgSend(v67, "valueWithCGRect:");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setToValue:", v68);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v69;
      objc_msgSend(v69, "setFromValue:", v70);

      v71 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v59, "cornerRadius");
      objc_msgSend(v71, "numberWithDouble:");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setToValue:", v72);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setValues:", &unk_1E215A090);
      v140 = &unk_1E2158E48;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v62);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = v74;
      v142 = &unk_1E2158E60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v140, 3);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setKeyTimes:", v75);

      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("borderWidth"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v77;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = v78;
      v79 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v59, "borderWidth");
      objc_msgSend(v79, "numberWithDouble:");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = v80;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 3);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setValues:", v81);

      objc_msgSend(v73, "keyTimes");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setKeyTimes:", v82);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowPath"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setToValue:", objc_msgSend(v59, "shadowPath"));
      v145.origin.x = 0.0;
      v145.origin.y = 0.0;
      v145.size.width = a4 + a4;
      v145.size.height = a4 + a4;
      v84 = CGPathCreateWithEllipseInRect(v145, 0);
      v85 = CGPathCreateCopyByStrokingPath(v84, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
      objc_msgSend(v83, "setFromValue:", v85);
      CGPathRelease(v85);
      CGPathRelease(v84);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v86 = v59;
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = v115;
      v133 = v113;
      v134 = v73;
      v135 = v76;
      v136 = v83;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 5);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setAnimations:", v88);

      objc_msgSend(v87, "setDuration:", a5);
      v116 = *MEMORY[0x1E0CD2B68];
      objc_msgSend(v87, "setFillMode:");
      v114 = v87;
      objc_msgSend(v87, "setRemovedOnCompletion:", 0);

      if (self->_displaysPuckAsAccuracy)
      {
        v90 = v86;
        objc_msgSend(v90, "bounds");
        if (20.0 / (a4 + v91 * -0.5) > 0.400000006
          || (objc_msgSend(v90, "bounds"), v93 = 0.150000006, 20.0 / (a4 + v92 * -0.5) > 0.150000006))
        {
          objc_msgSend(v90, "bounds");
          v93 = 0.400000006;
          if (20.0 / (a4 + v94 * -0.5) <= 0.400000006)
          {
            objc_msgSend(v90, "bounds");
            v93 = 20.0 / (a4 + v95 * -0.5);
          }
        }
        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setValues:", &unk_1E215A0A8);
        v132 = &unk_1E2158E48;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v93);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v97;
        v134 = &unk_1E2158E60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 3);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setKeyTimes:", v98);

        objc_msgSend(v96, "setDuration:", a5);
        objc_msgSend(v96, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(v96, "setRemovedOnCompletion:", 0);

      }
      else
      {
        v96 = 0;
      }
      LODWORD(v89) = 0;
      objc_msgSend(v86, "setOpacity:", v89);
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = __80___MKPuckAnnotationView__updatePuckVisibilityForRadius_previousRadius_duration___block_invoke_4;
      v123[3] = &unk_1E20D8E68;
      v123[4] = self;
      v107 = v86;
      v124 = v107;
      v108 = v118;
      v125 = v108;
      objc_msgSend(v107, "_mapkit_addAnimation:forKey:completion:", v114, CFSTR("show/hide"), v123);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setDuration:", a5);
      objc_msgSend(v109, "setFromValue:", &unk_1E2158E48);
      objc_msgSend(v109, "setToValue:", &unk_1E2158E48);
      objc_msgSend(v109, "setRemovedOnCompletion:", 1);
      objc_msgSend(v109, "setFillMode:", v116);
      -[CALayer addAnimation:forKey:](self->_puckLayer, "addAnimation:forKey:", v109, CFSTR("show/hide"));
      if (v96)
        -[_MKPuckAccuracyLayer addAnimation:forKey:](self->_accuracyLayer, "addAnimation:forKey:", v96, CFSTR("show/hide"));
      +[MKThreadContext currentContext](MKThreadContext, "currentContext");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_CA_setDisableActions:", 1);

      LODWORD(v111) = 1.0;
      -[CALayer setOpacity:](self->_puckLayer, "setOpacity:", v111);
      +[MKThreadContext currentContext](MKThreadContext, "currentContext");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "_CA_setDisableActions:", 0);

      v19 = v120;
      v18 = v122;
      goto LABEL_46;
    }
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "_CA_setDisableActions:", 1);

    v18[2](v18);
    LODWORD(v100) = 1.0;
    -[CALayer setOpacity:](self->_puckLayer, "setOpacity:", v100);
    pulseLayer = self->_pulseLayer;
    v102 = 0;
LABEL_45:
    -[CALayer setHidden:](pulseLayer, "setHidden:", v102);
    +[MKThreadContext currentContext](MKThreadContext, "currentContext");
    v107 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "_CA_setDisableActions:", 0);
LABEL_46:

    -[_MKPuckAnnotationView _updateShowHeadingLayerAnimatedIfPossible:](self, "_updateShowHeadingLayerAnimatedIfPossible:", 1);
  }

}

- (void)setShouldInnerPulse:(BOOL)a3
{
  if (self->_shouldInnerPulse != a3)
  {
    self->_shouldInnerPulse = a3;
    -[_MKPuckAnnotationView _updatePulseAnimation](self, "_updatePulseAnimation");
    -[_MKPuckAnnotationView _resetInnerPulseFrame](self, "_resetInnerPulseFrame");
  }
}

- (void)layoutSubviews
{
  double MidX;
  double v4;
  double v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView layoutSubviews](&v6, sel_layoutSubviews);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_accuracyContainerLayer, "setPosition:", MidX, CGRectGetMidY(v8));
  -[_MKPuckAnnotationView bounds](self, "bounds");
  v4 = CGRectGetMidX(v9);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_puckContainerLayer, "setPosition:", v4, CGRectGetMidY(v10));
  -[_MKPuckAnnotationView bounds](self, "bounds");
  v5 = CGRectGetMidX(v11);
  -[_MKPuckAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_headingContainerLayer, "setPosition:", v5, CGRectGetMidY(v12));
}

- (void)_updateLegacyConfiguration
{
  self->_allowsPulse = _MKModernPuckDesignEnabled() ^ 1;
  -[_MKPuckAnnotationView setHeadingIndicatorStyle:](self, "setHeadingIndicatorStyle:");
  -[_MKPuckAccuracyLayer updateLegacyConfiguration](self->_accuracyLayer, "updateLegacyConfiguration");
}

- (void)setHeadingIndicatorStyle:(int64_t)a3
{
  int64_t v5;

  if (self->_headingIndicatorStyle != a3)
  {
    v5 = -[_MKPuckAnnotationView _enforcedHeadingIndicatorStyle](self, "_enforcedHeadingIndicatorStyle");
    self->_headingIndicatorStyle = a3;
    if (v5 != -[_MKPuckAnnotationView _enforcedHeadingIndicatorStyle](self, "_enforcedHeadingIndicatorStyle"))
      -[_MKPuckAnnotationView _updateHeadingLayerForStyleChange:](self, "_updateHeadingLayerForStyleChange:", a3 == 2);
  }
}

- (void)_setShouldHidePuckWhenAccuracyVisible:(BOOL)a3
{
  double v4;
  double v5;
  double v6;

  if (self->_shouldHidePuckWhenAccuracyVisible != a3)
  {
    self->_shouldHidePuckWhenAccuracyVisible = a3;
    -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
    v5 = v4;
    -[_MKPuckAccuracyLayer currentAccuracy](self->_accuracyLayer, "currentAccuracy");
    -[_MKPuckAnnotationView _updatePuckVisibilityForRadius:previousRadius:duration:](self, "_updatePuckVisibilityForRadius:previousRadius:duration:", v5, v6, 0.25);
  }
}

- (void)_setForceHeadingUp:(BOOL)a3
{
  if (self->_forceHeadingUp != a3)
  {
    self->_forceHeadingUp = a3;
    -[_MKPuckAnnotationView _updateHeadingIndicators](self, "_updateHeadingIndicators");
  }
}

- (int64_t)_enforcedHeadingIndicatorStyle
{
  if (-[_MKPuckAnnotationView forcesConeIndicator](self, "forcesConeIndicator"))
    return 0;
  else
    return self->_headingIndicatorStyle;
}

- (BOOL)forcesConeIndicator
{
  return self->_forcesConeIndicator;
}

+ (CGPoint)_calloutOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a1, "shadowBlur");
  v3 = v2;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  GEOConfigRemoveBlockListener();
  MapsFeatureFlag_RemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView dealloc](&v3, sel_dealloc);
}

- (BOOL)_isSelectable
{
  float v3;
  double v4;
  objc_super v6;

  if (self->_shouldHidePuckWhenAccuracyVisible)
  {
    -[CALayer opacity](self->_puckLayer, "opacity");
    if (fabsf(v3) < 0.01)
    {
      -[_MKPuckAccuracyLayer presentationFillOpacity](self->_accuracyLayer, "presentationFillOpacity");
      if (v4 < 0.100000001)
        return 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  return -[MKAnnotationView _isSelectable](&v6, sel__isSelectable);
}

- (float)_selectionPriority
{
  float v3;
  float v4;
  float v5;
  double v6;
  float result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _selectionPriority](&v8, sel__selectionPriority);
  v4 = v3;
  if (v3 != 1000.0)
    return v4;
  if (!self->_shouldHidePuckWhenAccuracyVisible)
    return v4;
  -[CALayer opacity](self->_puckLayer, "opacity");
  v6 = fabsf(v5);
  result = 0.0;
  if (v6 >= 0.000001)
    return v4;
  return result;
}

- (CGRect)_significantBounds
{
  float v3;
  _MKPuckAccuracyLayer *accuracyLayer;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect result;

  if (self->_shouldHidePuckWhenAccuracyVisible
    && (-[CALayer opacity](self->_puckLayer, "opacity"), fabsf(v3) < 0.000001))
  {
    accuracyLayer = self->_accuracyLayer;
    -[_MKPuckAccuracyLayer significantBounds](accuracyLayer, "significantBounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[_MKPuckAnnotationView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKPuckAccuracyLayer convertRect:toLayer:](accuracyLayer, "convertRect:toLayer:", v13, v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)_MKPuckAnnotationView;
    -[MKAnnotationView _significantBounds](&v30, sel__significantBounds);
    v15 = v22;
    v17 = v23;
    v19 = v24;
    v21 = v25;
  }
  v26 = v15;
  v27 = v17;
  v28 = v19;
  v29 = v21;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  void *v3;
  void *v4;
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
  UIEdgeInsets result;

  if (_MKModernPuckDesignEnabled())
  {
    -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationView _annotationContainer](self, "_annotationContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_visibleCenteringRectInView:", v4);
    v6 = v5;
    v8 = v7;

    v9 = -[_MKPuckAnnotationView shouldDisplayHeading](self, "shouldDisplayHeading");
    v10 = 0.100000001;
    if (v9)
      v10 = 0.200000003;
    if (v6 >= v8)
      v11 = v8;
    else
      v11 = v6;
    v12 = fmin(v11 * v10, 64.0);
    v13 = v12;
    v14 = v12;
    v15 = v12;
  }
  else
  {
    v12 = *MEMORY[0x1E0CEB4B0];
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v15 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setCollisionMode:(int64_t)a3
{
  objc_super v3;

  self->_hasExplicitCollisionMode = 1;
  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView setCollisionMode:](&v3, sel_setCollisionMode_, a3);
}

- (int64_t)collisionMode
{
  objc_super *v3;
  _MKPuckAnnotationView *v5;
  objc_super v6;

  if (_MKLinkedOnOrAfterReleaseSet(2824))
  {
    v5 = self;
    v3 = (objc_super *)&v5;
LABEL_5:
    v3->super_class = (Class)_MKPuckAnnotationView;
    return (int64_t)-[objc_super collisionMode](v3, sel_collisionMode, v5);
  }
  if (self->_hasExplicitCollisionMode)
  {
    v6.receiver = self;
    v3 = &v6;
    goto LABEL_5;
  }
  return 1;
}

- (void)setDisplayPriority:(float)a3
{
  int64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView setDisplayPriority:](&v5, sel_setDisplayPriority_);
  if (!_MKLinkedOnOrAfterReleaseSet(2824) && !self->_hasExplicitCollisionMode)
  {
    v4 = 2;
    if (self->super._displayPriority < 1000.0)
      v4 = 1;
    self->super._collisionMode = v4;
  }
}

- (id)_createFakePuckLayer
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double puckScale;
  double v10;
  double v11;
  double v12;
  long double v13;
  float v14;
  double v15;
  id v16;
  id v17;
  double v18;
  id v19;
  double v20;
  double v21;
  long double v22;
  const CGPath *v23;
  const CGPath *CopyByStrokingPath;
  CGRect v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v5);

  objc_msgSend((id)objc_opt_class(), "baseDiameter");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "innerDiameter");
  puckScale = self->_puckScale;
  v10 = v7 * puckScale;
  v11 = (v7 - v8) * 0.5 * puckScale;
  -[MKAnnotationView _mapPitchRadians](self, "_mapPitchRadians");
  v13 = v12;
  objc_msgSend(v3, "setName:", CFSTR("accuracyTransition"));
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v10, v10);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "setCornerRadius:", CGRectGetWidth(v26) * 0.5);
  objc_msgSend(v3, "setBorderWidth:", v11);
  v14 = 0.0;
  LODWORD(v15) = 0;
  objc_msgSend(v3, "setOpacity:", v15);
  _MKPuckAnnotationViewBaseColor(-[MKAnnotationView _mapType](self, "_mapType"), self->_displaysPuckAsAccuracy);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v16, "CGColor"));

  -[_MKPuckAnnotationView _currentInnerColor](self, "_currentInnerColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v3, "setMasksToBounds:", 0);
  objc_msgSend(v3, "setShadowOffset:", 0.0, 1.0);
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  objc_msgSend(v3, "setShadowRadius:", v18 * 0.5);
  objc_msgSend(MEMORY[0x1E0CEA478], "_mapkit_colorNamed:", CFSTR("PuckShadowColor"));
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setShadowColor:", objc_msgSend(v19, "CGColor"));

  v20 = fabs(v13);
  if (v20 < 0.000001)
  {
    if (self->_useDarkAppearance)
      v21 = 0.300000012;
    else
      v21 = 0.25;
    v22 = 1.0 - cos(v13);
    v20 = v22 * 0.5 + (1.0 - v22) * v21;
    v14 = v20;
  }
  *(float *)&v20 = v14;
  objc_msgSend(v3, "setShadowOpacity:", v20);
  objc_msgSend(v3, "_mapkit_setActionsToRemoveDefaultImplicitActions");
  objc_msgSend(v3, "bounds");
  v23 = CGPathCreateWithEllipseInRect(v27, 0);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v23, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  objc_msgSend(v3, "setShadowPath:", CopyByStrokingPath);
  CGPathRelease(CopyByStrokingPath);
  CGPathRelease(v23);
  objc_msgSend(MEMORY[0x1E0CEAB40], "setCurrentTraitCollection:", v4);

  return v3;
}

- (void)setRotateInnerImageToMatchCourse:(BOOL)a3
{
  if (self->_rotateInnerImageToMatchCourse != a3)
  {
    self->_rotateInnerImageToMatchCourse = a3;
    -[_MKPuckAnnotationView _updateInnerCourseRotation](self, "_updateInnerCourseRotation");
  }
}

- (void)_setDisplaysPuckAsAccuracy:(BOOL)a3
{
  if (self->_displaysPuckAsAccuracy != a3)
  {
    self->_displaysPuckAsAccuracy = a3;
    -[_MKPuckAnnotationView _updateBaseImage](self, "_updateBaseImage");
    -[_MKPuckAnnotationView _updateInnerImage](self, "_updateInnerImage");
    -[_MKPuckAnnotationView _createOrRemoveFaux3DRingsIfNecessary](self, "_createOrRemoveFaux3DRingsIfNecessary");
    -[_MKPuckAnnotationView _updateFaux3DColors](self, "_updateFaux3DColors");
    -[_MKPuckAnnotationView _updateFaux3DLayers](self, "_updateFaux3DLayers");
  }
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[_MKPuckAnnotationView traitCollection](self, "traitCollection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_useDarkAppearance = objc_msgSend(v5, "userInterfaceStyle") == 2;

  -[_MKPuckAnnotationView _updateAccuracyColors](self, "_updateAccuracyColors");
  -[_MKPuckAnnotationView _updateFaux3DColors](self, "_updateFaux3DColors");
  -[_MKPuckAnnotationView _updateBaseImage](self, "_updateBaseImage");
  -[_MKPuckAnnotationView _updateGlyphImage](self, "_updateGlyphImage");
  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKUserLocationHeadingIndicator setTraitCollection:](self->_headingLayer, "setTraitCollection:", v6);

  -[_MKPuckAnnotationView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAccuracyLayer setTraitCollection:](self->_accuracyLayer, "setTraitCollection:", v7);

  -[_MKPuckAnnotationView _accessibilitySetInterfaceStyleIntent:](self, "_accessibilitySetInterfaceStyleIntent:", 1);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView setSelected:animated:](&v6, sel_setSelected_animated_, a3, a4);
  -[_MKPuckAnnotationView _setHeadingLayerHidden:](self, "_setHeadingLayerHidden:", v4);
}

- (CGRect)_mapkit_visibleRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;
  CGRect v30;
  CGRect v31;

  -[_MKPuckAnnotationView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if ((-[_MKPuckAccuracyLayer isHidden](self->_accuracyLayer, "isHidden") & 1) == 0)
  {
    -[_MKPuckAccuracyLayer frame](self->_accuracyLayer, "frame");
    v30.origin.x = v11;
    v30.origin.y = v12;
    v30.size.width = v13;
    v30.size.height = v14;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectUnion(v25, v30);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
  }
  -[MKAnnotationView _calloutView](self, "_calloutView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[MKAnnotationView _calloutView](self, "_calloutView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v31.origin.x = v17;
    v31.origin.y = v18;
    v31.size.width = v19;
    v31.size.height = v20;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v28 = CGRectUnion(v27, v31);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;

  }
  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (float)opacity
{
  void *v2;
  float v3;
  float v4;

  -[_MKPuckAnnotationView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3;

  return v4;
}

- (void)setOpacity:(float)a3
{
  double v4;
  id v5;

  -[_MKPuckAnnotationView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (double)puckAlpha
{
  float v2;

  -[CALayer opacity](self->_puckLayer, "opacity");
  return v2;
}

- (void)setPuckAlpha:(double)a3
{
  *(float *)&a3 = a3;
  -[CALayer setOpacity:](self->_puckLayer, "setOpacity:", a3);
}

- (void)setPuckScale:(double)a3
{
  double v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  void *v19;
  void *v20;
  CALayer *puckLayer;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[8];
  CATransform3D v36;
  _OWORD v37[8];
  CATransform3D v38;

  if (vabdd_f64(a3, self->_puckScale) >= 0.00000011920929)
  {
    self->_puckScale = a3;
    v4 = fabs(a3 + -1.0);
    memset(&v38, 0, sizeof(v38));
    if (v4 >= 0.00000011920929)
    {
      CATransform3DMakeScale(&v38, a3, a3, 1.0);
    }
    else
    {
      v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v38.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&v38.m33 = v5;
      v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v38.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&v38.m43 = v6;
      v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v38.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&v38.m13 = v7;
      v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v38.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&v38.m23 = v8;
    }
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3B18];
    -[CALayer currentLayer](self->_puckContainerLayer, "currentLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "transform");
    else
      memset(v37, 0, sizeof(v37));
    objc_msgSend(v10, "valueWithCATransform3D:", v37, 0.00000011920929);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v13);

    v36 = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToValue:", v14);

    objc_msgSend(v9, "setDuration:", 0.2);
    objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v9, "setRemovedOnCompletion:", v4 < 0.00000011920929);
    -[CALayer removeAnimationForKey:](self->_puckContainerLayer, "removeAnimationForKey:", CFSTR("scale"));
    -[CALayer addAnimation:forKey:](self->_puckContainerLayer, "addAnimation:forKey:", v9, CFSTR("scale"));
    if (self->_faux3DEnabled)
    {
      v15 = v9;
    }
    else
    {
      v15 = (void *)objc_msgSend(v9, "copy");

      v16 = (void *)MEMORY[0x1E0CB3B18];
      -[CALayer currentLayer](self->_puckLayer, "currentLayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        objc_msgSend(v17, "transform");
      else
        memset(v35, 0, sizeof(v35));
      objc_msgSend(v16, "valueWithCATransform3D:", v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFromValue:", v19);

      v20 = (void *)MEMORY[0x1E0CB3B18];
      if (v4 >= 0.00000011920929)
      {
        v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
        v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
        v32 = v22;
        v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
        v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
        v34 = v23;
        v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
        v27 = *MEMORY[0x1E0CD2610];
        v28 = v24;
        v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
        v29 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
        v30 = v25;
      }
      else
      {
        puckLayer = self->_puckLayer;
        if (puckLayer)
        {
          -[CALayer transform](puckLayer, "transform");
        }
        else
        {
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
        }
      }
      objc_msgSend(v20, "valueWithCATransform3D:", &v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setToValue:", v26);

      -[CALayer removeAnimationForKey:](self->_puckLayer, "removeAnimationForKey:", CFSTR("scale"));
      -[CALayer addAnimation:forKey:](self->_puckLayer, "addAnimation:forKey:", v15, CFSTR("scale"));
    }

  }
}

+ (double)outerRingWidth
{
  return 0.0;
}

- (UIEdgeInsets)_defaultCollisionAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v3 = v2 + 1.0;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v7 = v6 + 1.0;
  objc_msgSend((id)objc_opt_class(), "shadowBlur");
  v9 = v8;
  v10 = v3;
  v11 = v5;
  v12 = v7;
  result.right = v9;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (id)_baseLayer
{
  return self->_baseLayer;
}

- (void)setShouldShowOuterRing:(BOOL)a3
{
  if (self->_shouldShowOuterRing != a3)
  {
    self->_shouldShowOuterRing = a3;
    -[_MKPuckAnnotationView _updateShadowImage](self, "_updateShadowImage");
    -[_MKPuckAnnotationView _updateBaseImage](self, "_updateBaseImage");
  }
}

- (void)setInnerImageMask:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_innerImageMask != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_innerImageMask, a3);
    -[_MKPuckAnnotationView _updateInnerMaskLayer](self, "_updateInnerMaskLayer");
    v5 = v6;
  }

}

- (void)setGlyphImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_glyphImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_glyphImage, a3);
    -[_MKPuckAnnotationView _updateGlyphImage](self, "_updateGlyphImage");
    v5 = v6;
  }

}

- (void)setGlyphTintColor:(id)a3
{
  UIColor *v4;
  UIColor *glyphTintColor;

  if (self->_glyphTintColor != a3)
  {
    v4 = (UIColor *)objc_msgSend(a3, "copy");
    glyphTintColor = self->_glyphTintColor;
    self->_glyphTintColor = v4;

    -[_MKPuckAnnotationView _updateGlyphImage](self, "_updateGlyphImage");
  }
}

- (void)locationManagerFailedToUpdateLocation
{
  -[_MKPuckAnnotationView setStale:](self, "setStale:", -[_MKPuckAnnotationView _isLocationStale:](self, "_isLocationStale:", 0));
  -[_MKPuckAnnotationView _updateShowHeadingLayer](self, "_updateShowHeadingLayer");
  -[_MKPuckAnnotationView _updateLayers](self, "_updateLayers");
  self->_shouldPulse = -[_MKPuckAnnotationView _shouldPulseForLocation:](self, "_shouldPulseForLocation:", self->_lastLocation);
  -[_MKPuckAnnotationView _updatePulse](self, "_updatePulse");
}

- (void)_setMinimumAccuracyRadius:(double)a3
{
  self->_minimumAccuracyRadius = a3;
  -[_MKPuckAnnotationView _updateFromMap](self, "_updateFromMap");
}

- (double)_minimumAccuracyUncertainty
{
  return self->_minimumAccuracyUncertainty;
}

- (void)_setMinimumAccuracyUncertainty:(double)a3
{
  self->_minimumAccuracyUncertainty = a3;
  -[_MKPuckAnnotationView _updateFromMap](self, "_updateFromMap");
}

- (BOOL)_shouldShowAccuracyRing
{
  double v3;

  if (!-[_MKPuckAnnotationView _hideLargeAccuracyRing](self, "_hideLargeAccuracyRing"))
    return 1;
  -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  return v3 < self->_maxRadiusToShowAccuracyRing;
}

- (void)setAllowsAccuracyRing:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  if (self->_allowsAccuracyRing != a3)
  {
    self->_allowsAccuracyRing = a3;
    if (self->_shouldHidePuckWhenAccuracyVisible && a3)
    {
      -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
      v5 = v4;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "baseDiameter");
      v5 = v6 * 0.5;
    }
    -[_MKPuckAccuracyLayer setHidden:](self->_accuracyLayer, "setHidden:", !self->_allowsAccuracyRing);
    -[_MKPuckAccuracyLayer currentAccuracy](self->_accuracyLayer, "currentAccuracy");
    -[_MKPuckAnnotationView _updatePuckVisibilityForRadius:previousRadius:duration:](self, "_updatePuckVisibilityForRadius:previousRadius:duration:", v5, v7, 0.25);
    -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:", v5, 0.0);
  }
}

- (void)setAccuracyRingAlpha:(double)a3
{
  self->_accuracyRingAlpha = a3;
  -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  -[_MKPuckAnnotationView _updateAccuracyOpacityForRadius:duration:](self, "_updateAccuracyOpacityForRadius:duration:");
}

- (void)_resetLayerToMatchAccuracyRing
{
  CALayer *pulseLayer;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
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
  _QWORD v19[3];
  CGRect v20;
  CGRect v21;

  v19[2] = *MEMORY[0x1E0C80C00];
  pulseLayer = self->_pulseLayer;
  if (pulseLayer)
  {
    -[CALayer bounds](pulseLayer, "bounds");
    v21.origin.x = v4;
    v21.origin.y = v5;
    v21.size.width = v6;
    v21.size.height = v7;
    v20.size.width = 120.0;
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.height = 120.0;
    if (!CGRectEqualToRect(v20, v21))
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3B18];
      -[CALayer currentLayer](self->_pulseLayer, "currentLayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v9, "valueWithCGRect:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFromValue:", v11);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, 120.0, 120.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setToValue:", v12);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("cornerRadius"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[CALayer currentLayer](self->_pulseLayer, "currentLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cornerRadius");
      objc_msgSend(v14, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFromValue:", v16);

      objc_msgSend(v13, "setToValue:", &unk_1E2158570);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      v19[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAnimations:", v18);

      objc_msgSend(v17, "setRemovedOnCompletion:", 1);
      -[CALayer removeAnimationForKey:](self->_pulseLayer, "removeAnimationForKey:", CFSTR("accuracy"));
      -[CALayer addAnimation:forKey:](self->_pulseLayer, "addAnimation:forKey:", v17, CFSTR("reset"));
      -[CALayer setBounds:](self->_pulseLayer, "setBounds:", 0.0, 0.0, 120.0, 120.0);
      -[CALayer setCornerRadius:](self->_pulseLayer, "setCornerRadius:", 60.0);

    }
  }
}

- (void)setAnimatingPresentationAccuracy:(BOOL)a3
{
  double v5;

  -[_MKPuckAccuracyLayer currentAccuracy](self->_accuracyLayer, "currentAccuracy");
  self->_presentationAccuracy = v5;
  self->_animatingPresentationAccuracy = a3;
}

- (double)presentationAccuracy
{
  double result;

  if (self->_animatingPresentationAccuracy)
    return self->_presentationAccuracy;
  -[_MKPuckAccuracyLayer currentAccuracy](self->_accuracyLayer, "currentAccuracy");
  return result;
}

- (void)setPresentationAccuracy:(double)a3
{
  id v4;

  self->_presentationAccuracy = a3;
  -[_MKPuckAnnotationView window](self, "window");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MKPuckAnnotationView _updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:](self, "_updateToReflectLocationAccuracyWithDuration:allowShowHideAnimation:", v4 != 0, 0.0);

}

- (BOOL)_balloonCalloutShouldShowArrow
{
  double v2;

  if (!self->_shouldHidePuckWhenAccuracyVisible)
    return 1;
  -[_MKPuckAnnotationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  return v2 <= 50.0;
}

- (CGPoint)calloutOffset
{
  float v3;
  double v4;
  double v5;
  objc_super v6;
  objc_super v7;
  CGPoint result;
  CGRect v9;

  if (self->_shouldHidePuckWhenAccuracyVisible)
  {
    -[CALayer opacity](self->_puckLayer, "opacity");
    if (fabsf(v3) >= 0.000001)
    {
      -[MKAnnotationView calloutOffset](&v6, sel_calloutOffset, self, _MKPuckAnnotationView, v7.receiver, v7.super_class);
    }
    else
    {
      -[_MKPuckAnnotationView frame](self, "frame");
      v4 = CGRectGetHeight(v9) * 0.5;
      v5 = 0.0;
    }
  }
  else
  {
    -[MKAnnotationView calloutOffset](&v7, sel_calloutOffset, v6.receiver, v6.super_class, self, _MKPuckAnnotationView);
  }
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)_setShouldShowDynamicLocationAnimations:(BOOL)a3
{
  if (self->_shouldShowDynamicLocationAnimations != a3)
  {
    self->_shouldShowDynamicLocationAnimations = a3;
    -[_MKPuckAnnotationView _updatePulseAnimation](self, "_updatePulseAnimation");
    -[_MKPuckAnnotationView _resetInnerPulseFrame](self, "_resetInnerPulseFrame");
    -[_MKPuckAnnotationView _updateAccuracyAnimation](self, "_updateAccuracyAnimation");
  }
}

- (unint64_t)_innerPulseFrameWhenDisabled:(unint64_t)a3
{
  if (a3)
    return a3 - 1;
  else
    return 0;
}

- (id)_pulseLayer
{
  CALayer *pulseLayer;
  CALayer *v4;
  CALayer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  pulseLayer = self->_pulseLayer;
  if (!pulseLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pulseLayer;
    self->_pulseLayer = v4;

    -[CALayer setBounds:](self->_pulseLayer, "setBounds:", 0.0, 0.0, 120.0, 120.0);
    -[CALayer setCornerRadius:](self->_pulseLayer, "setCornerRadius:", 60.0);
    v12[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v12[1] = CFSTR("cornerRadius");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    v12[2] = CFSTR("transform");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](self->_pulseLayer, "setActions:", v9);

    -[CALayer setZPosition:](self->_pulseLayer, "setZPosition:", -9999.0);
    LODWORD(v10) = 0;
    -[CALayer setOpacity:](self->_pulseLayer, "setOpacity:", v10);
    -[_MKPuckAnnotationView _updatePulseColor](self, "_updatePulseColor");
    pulseLayer = self->_pulseLayer;
  }
  return pulseLayer;
}

- (id)_animationToSynchronizePulse:(id *)a3
{
  if (a3)
    *a3 = objc_retainAutorelease(self->_innerCircleLayer);
  return -[CALayer animationForKey:](self->_innerCircleLayer, "animationForKey:", CFSTR("pulse"));
}

- (id)_pulseAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", 0x1E20DFB80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", &unk_1E2158E48);
  objc_msgSend(v2, "setToValue:", &unk_1E2158E60);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyTimes:", &unk_1E215A030);
  objc_msgSend(v3, "setValues:", &unk_1E215A048);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimations:", v5);

  objc_msgSend(v4, "setDuration:", 3.0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v6);

  objc_msgSend(v4, "setFrameInterval:", 0.0250000004);
  LODWORD(v7) = 2139095040;
  objc_msgSend(v4, "setRepeatCount:", v7);
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);

  return v4;
}

- (void)_resumePulse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  id v28;

  -[_MKPuckAnnotationView _pulseLayer](self, "_pulseLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("fadePulse"));
  objc_msgSend(v3, "animationForKey:", CFSTR("outerPulse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "removeFromSuperlayer");
    -[CALayer insertSublayer:atIndex:](self->_accuracyContainerLayer, "insertSublayer:atIndex:", v3, 0);
    -[_MKPuckAnnotationView _pulseAnimation](self, "_pulseAnimation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    -[_MKPuckAnnotationView _animationToSynchronizePulse:](self, "_animationToSynchronizePulse:", &v28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v28;
    -[_MKPuckAnnotationView _pulseLayer](self, "_pulseLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (v10)
    {
      v12 = objc_msgSend(v10, "autoreverses");
      objc_msgSend(v10, "duration");
      if (v12)
        v14 = v13 + v13;
      else
        v14 = v13;
      objc_msgSend(v11, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v16 = v15;
      objc_msgSend(v10, "beginTime");
      v18 = v17;
      objc_msgSend(v10, "timeOffset");
      v20 = fmod(v16 - (v18 + v19), v14);
      objc_msgSend(v10, "beginTime");
      objc_msgSend(v11, "convertTime:toLayer:", v8);
      v22 = v21;
      objc_msgSend(v9, "duration");
      objc_msgSend(v9, "setBeginTime:", (double)fmod(v22, v23));
      objc_msgSend(v9, "setTimeOffset:", v14 - v20);
      objc_msgSend(v9, "setDuration:", v14);
    }

    objc_msgSend(v3, "addAnimation:forKey:", v9, CFSTR("outerPulse"));
  }
  objc_msgSend(v3, "speed");
  if (fabsf(v24) < 0.000001)
  {
    objc_msgSend(v3, "timeOffset");
    v26 = v25;
    LODWORD(v25) = 1.0;
    objc_msgSend(v3, "setSpeed:", v25);
    objc_msgSend(v3, "setTimeOffset:", 0.0);
    objc_msgSend(v3, "setBeginTime:", 0.0);
    objc_msgSend(v3, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    objc_msgSend(v3, "setBeginTime:", v27 - v26);
  }

}

- (void)_pausePulse
{
  CALayer *pulseLayer;
  float v4;
  double v5;
  double v6;

  pulseLayer = self->_pulseLayer;
  if (pulseLayer)
  {
    -[CALayer speed](pulseLayer, "speed");
    if (fabsf(v4 + -1.0) < 0.000001)
    {
      -[CALayer convertTime:fromLayer:](self->_pulseLayer, "convertTime:fromLayer:", 0, CACurrentMediaTime());
      v6 = v5;
      LODWORD(v5) = 0;
      -[CALayer setSpeed:](self->_pulseLayer, "setSpeed:", v5);
      -[CALayer setTimeOffset:](self->_pulseLayer, "setTimeOffset:", v6);
    }
  }
}

- (void)setAllowsPulse:(BOOL)a3
{
  if (self->_allowsPulse != a3)
  {
    self->_allowsPulse = a3;
    -[_MKPuckAnnotationView _updatePulse](self, "_updatePulse");
  }
}

- (void)setCanShowHeadingIndicator:(BOOL)a3
{
  self->_canShowHeadingIndicator = a3;
  -[_MKPuckAnnotationView _updateShowHeadingLayer](self, "_updateShowHeadingLayer");
}

- (void)_updateHeadingLayerForStyleChange:(BOOL)a3
{
  -[_MKPuckAnnotationView _updateShowHeadingLayer:animatedIfPossible:](self, "_updateShowHeadingLayer:animatedIfPossible:", 0, 1);
  -[_MKPuckAnnotationView _updateShowHeadingLayerAnimatedIfPossible:](self, "_updateShowHeadingLayerAnimatedIfPossible:", 1);
}

- (void)_setHeadingLayerHidden:(BOOL)a3
{
  -[MKUserLocationHeadingIndicator setHidden:](self->_headingLayer, "setHidden:", a3);
}

- (void)_setVKNavigationPuckMarker:(id)a3
{
  VKNavigationPuck *v5;
  VKNavigationPuck **p_navigationPuckMarker;
  void *v7;
  VKNavigationPuck *v8;

  v5 = (VKNavigationPuck *)a3;
  p_navigationPuckMarker = &self->_navigationPuckMarker;
  if (self->_navigationPuckMarker != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_navigationPuckMarker, a3);
    -[MKAnnotationView annotation](self, "annotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKNavigationPuck setAnnotation:](*p_navigationPuckMarker, "setAnnotation:", v7);

    -[VKNavigationPuck setAnimatingToCoordinate:](*p_navigationPuckMarker, "setAnimatingToCoordinate:", -[MKAnnotationView _isAnimatingToCoordinate](self, "_isAnimatingToCoordinate"));
    -[MKAnnotationView _presentationCoordinate](self, "_presentationCoordinate");
    -[MKAnnotationView _presentationCoordinate](self, "_presentationCoordinate");
    VKLocationCoordinate2DMake();
    -[VKNavigationPuck setPresentationCoordinate:](*p_navigationPuckMarker, "setPresentationCoordinate:");
    -[MKAnnotationView _presentationCourse](self, "_presentationCourse");
    -[VKNavigationPuck setPresentationCourse:](*p_navigationPuckMarker, "setPresentationCourse:");
    -[VKNavigationPuck setTracking:](*p_navigationPuckMarker, "setTracking:", -[MKAnnotationView _isTracking](self, "_isTracking"));
    v5 = v8;
  }

}

- (void)_setTracking:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setTracking:](&v5, sel__setTracking_);
  -[VKNavigationPuck setTracking:](self->_navigationPuckMarker, "setTracking:", v3);
}

- (BOOL)_tracking
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKPuckAnnotationView;
  return -[MKAnnotationView _isTracking](&v3, sel__isTracking);
}

- (void)_setPresentationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  double v6;
  double v7;
  VKNavigationPuck *navigationPuckMarker;
  objc_super v9;

  longitude = a3.longitude;
  latitude = a3.latitude;
  -[MKAnnotationView _presentationCoordinate](self, "_presentationCoordinate");
  if (vabdd_f64(latitude, v7) >= 0.00000000999999994 || vabdd_f64(longitude, v6) >= 0.00000000999999994)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKPuckAnnotationView;
    -[MKAnnotationView _setPresentationCoordinate:](&v9, sel__setPresentationCoordinate_, latitude, longitude);
    navigationPuckMarker = self->_navigationPuckMarker;
    VKLocationCoordinate2DMake();
    -[VKNavigationPuck setPresentationCoordinate:](navigationPuckMarker, "setPresentationCoordinate:");
  }
}

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_MKPuckAnnotationView _setAnimatingToCoordinate:](self, "_setAnimatingToCoordinate:");
  -[VKNavigationPuck setAnimatingToCoordinate:](self->_navigationPuckMarker, "setAnimatingToCoordinate:", v3);
}

- (void)_setAnimatingToCoordinate:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_MKPuckAnnotationView;
  -[MKAnnotationView _setAnimatingToCoordinate:](&v5, sel__setAnimatingToCoordinate_);
  -[VKNavigationPuck setAnimatingToCoordinate:](self->_navigationPuckMarker, "setAnimatingToCoordinate:", v3);
}

- (void)_setPresentationCourse:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  -[MKAnnotationView _presentationCourse](self, "_presentationCourse");
  v6 = a3 - v5;
  -[MKAnnotationView _presentationCourse](self, "_presentationCourse");
  v8 = a3 - v7;
  if (v6 < 0.0)
    v8 = -v8;
  if (v8 >= 2.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MKPuckAnnotationView;
    -[MKAnnotationView _setPresentationCourse:](&v9, sel__setPresentationCourse_, a3);
    -[_MKPuckAnnotationView _updateInnerCourseRotation](self, "_updateInnerCourseRotation");
  }
}

- (CGSize)collisionSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[MKAnnotationView _collisionFrame](self, "_collisionFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (int64_t)zoomDirection
{
  return self->_zoomDirection;
}

- (void)setZoomDirection:(int64_t)a3
{
  self->_zoomDirection = a3;
}

- (BOOL)allowsPulse
{
  return self->_allowsPulse;
}

- (BOOL)canShowHeadingIndicator
{
  return self->_canShowHeadingIndicator;
}

- (BOOL)shouldDisplayHeading
{
  return self->_shouldDisplayHeading;
}

- (double)heading
{
  return self->_heading;
}

- (double)headingAccuracy
{
  return self->_headingAccuracy;
}

- (BOOL)allowsAccuracyRing
{
  return self->_allowsAccuracyRing;
}

- (double)maxRadiusToShowAccuracyRing
{
  return self->_maxRadiusToShowAccuracyRing;
}

- (double)_accuracyRingStrokeOpacityThreshold
{
  return self->_accuracyRingStrokeOpacityThreshold;
}

- (BOOL)isOverrideStale
{
  return self->_overrideIsStale;
}

- (void)setOverrideIsStale:(BOOL)a3
{
  self->_overrideIsStale = a3;
}

- (BOOL)isEffectsEnabled
{
  return self->_effectsEnabled;
}

- (double)presentationCourse
{
  return self->_presentationCourse;
}

- (void)setPresentationCourse:(double)a3
{
  self->_presentationCourse = a3;
}

- (double)locationAccuracy
{
  return self->_locationAccuracy;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (double)accuracyRingAlpha
{
  return self->_accuracyRingAlpha;
}

- (double)_minimumAccuracyRadius
{
  return self->_minimumAccuracyRadius;
}

- (BOOL)_shouldShowDynamicLocationAnimations
{
  return self->_shouldShowDynamicLocationAnimations;
}

- (int64_t)headingIndicatorStyle
{
  return self->_headingIndicatorStyle;
}

- (BOOL)shouldInnerPulse
{
  return self->_shouldInnerPulse;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (UIColor)glyphTintColor
{
  return self->_glyphTintColor;
}

- (UIImage)innerImageMask
{
  return self->_innerImageMask;
}

- (BOOL)rotateInnerImageToMatchCourse
{
  return self->_rotateInnerImageToMatchCourse;
}

- (BOOL)_forceHeadingUp
{
  return self->_forceHeadingUp;
}

- (BOOL)_shouldHidePuckWhenAccuracyVisible
{
  return self->_shouldHidePuckWhenAccuracyVisible;
}

- (BOOL)isAnimatingPresentationAccuracy
{
  return self->_animatingPresentationAccuracy;
}

- (BOOL)_displaysPuckAsAccuracy
{
  return self->_displaysPuckAsAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_minUncertaintyConfigListener, 0);
  objc_storeStrong(&self->_shelbyvilleConfigListener, 0);
  objc_storeStrong(&self->_faux3DPuckConfigListener, 0);
  objc_storeStrong(&self->_newPuckConfigListener, 0);
  objc_storeStrong(&self->_minAccuracyConfigListener, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_headingLayer, 0);
  objc_storeStrong((id *)&self->_accuracyLayer, 0);
  objc_storeStrong((id *)&self->_pulseLayer, 0);
  objc_storeStrong((id *)&self->_navigationPuckMarker, 0);
  objc_storeStrong((id *)&self->_headingContainerLayer, 0);
  objc_storeStrong((id *)&self->_accuracyContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleLayer, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMaskRings, 0);
  objc_storeStrong((id *)&self->_faux3DHighlightMask, 0);
  objc_storeStrong((id *)&self->_faux3DBaseBottomLayer, 0);
  objc_storeStrong((id *)&self->_faux3DFaceLayer, 0);
  objc_storeStrong((id *)&self->_puckTransitionLayer, 0);
  objc_storeStrong((id *)&self->_puckTransitionContainer, 0);
  objc_storeStrong((id *)&self->_baseLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_puckContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerImageMask, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphTintColor, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_puckLayer, 0);
}

@end
