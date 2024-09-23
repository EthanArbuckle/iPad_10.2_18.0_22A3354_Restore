@implementation NTKAnalogHandsView

- (id)initForDevice:(id)a3
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogHandsView;
  v3 = -[CLKUIAnalogHandsView initForDevice:](&v7, sel_initForDevice_, a3);
  if (v3)
  {
    +[NTKTimeOffsetManager sharedManager](NTKTimeOffsetManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeOffset");
    v3[66] = v5;

  }
  return v3;
}

+ (Class)handViewClass
{
  return (Class)objc_opt_class();
}

- (id)displayTime
{
  return +[NTKDate faceDate](NTKDate, "faceDate");
}

- (void)_enumerateSecondHandViewsWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  objc_super v5;

  v4 = (void (**)(_QWORD))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  -[CLKUIAnalogHandsView _enumerateSecondHandViewsWithBlock:](&v5, sel__enumerateSecondHandViewsWithBlock_, v4);
  if (self->_secondHandViewAlt)
    v4[2](v4);

}

- (void)_enumerateMinuteHandViewsWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  objc_super v5;

  v4 = (void (**)(_QWORD))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  -[CLKUIAnalogHandsView _enumerateMinuteHandViewsWithBlock:](&v5, sel__enumerateMinuteHandViewsWithBlock_, v4);
  if (self->_minuteHandViewAlt)
    v4[2](v4);

}

- (void)_enumerateHourHandViewsWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  objc_super v5;

  v4 = (void (**)(_QWORD))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  -[CLKUIAnalogHandsView _enumerateHourHandViewsWithBlock:](&v5, sel__enumerateHourHandViewsWithBlock_, v4);
  if (self->_hourHandViewAlt)
    v4[2](v4);

}

- (BOOL)_canRunTimeAnimation
{
  objc_super v3;

  if (self->_overrideDate)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogHandsView;
  return -[CLKUIAnalogHandsView _canRunTimeAnimation](&v3, sel__canRunTimeAnimation);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7;
  NSDate *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v34;
  void *v35;

  v7 = a3;
  v8 = self->_overrideDate;
  if ((CLKEqualObjects() & 1) == 0)
  {
    -[CLKUIAnalogHandsView _stopTimeAnimation](self, "_stopTimeAnimation");
    -[NTKAnalogHandsView displayTime](self, "displayTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      v11 = v7;
    }
    else
    {
      objc_msgSend(v9, "dateByAddingTimeInterval:", a4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    -[CLKUIAnalogHandsView calendar](self, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CLKHourMinuteSecondAnglesForTime();

    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setZRotation:", 0.0);

    -[NTKAnalogHandsView hourHandViewAlt](self, "hourHandViewAlt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZRotation:", 0.0);

    -[NTKAnalogHandsView minuteHandViewAlt](self, "minuteHandViewAlt");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZRotation:", 0.0);

    -[NTKAnalogHandsView secondHandViewAlt](self, "secondHandViewAlt");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setZRotation:", 0.0);

    -[CLKUIAnalogHandsView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[CLKUIAnalogHandsView delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overrideZRotation:forHandView:", v22, 0.0);

      -[NTKAnalogHandsView hourHandViewAlt](self, "hourHandViewAlt");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[CLKUIAnalogHandsView delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKAnalogHandsView hourHandViewAlt](self, "hourHandViewAlt");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "overrideZRotation:forHandView:", v25, 0.0);

      }
      -[CLKUIAnalogHandsView delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "overrideZRotation:forHandView:", v27, 0.0);

      -[NTKAnalogHandsView minuteHandViewAlt](self, "minuteHandViewAlt");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[CLKUIAnalogHandsView delegate](self, "delegate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKAnalogHandsView minuteHandViewAlt](self, "minuteHandViewAlt");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "overrideZRotation:forHandView:", v30, 0.0);

      }
      -[CLKUIAnalogHandsView delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "overrideZRotation:forHandView:", v32, 0.0);

      -[NTKAnalogHandsView secondHandViewAlt](self, "secondHandViewAlt");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[CLKUIAnalogHandsView delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKAnalogHandsView secondHandViewAlt](self, "secondHandViewAlt");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "overrideZRotation:forHandView:", v35, 0.0);

      }
    }
    if (!v7)
      -[CLKUIAnalogHandsView _startNewTimeAnimation](self, "_startNewTimeAnimation");

  }
}

- (void)setTimeOffset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_timeOffset = a3;
    -[CLKUIAnalogHandsView _startNewTimeAnimation](self, "_startNewTimeAnimation");
  }
}

- (void)_setHandsAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shadowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", a3);

  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shadowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", a3);

  -[CLKUIAnalogHandsView secondHandView](self, "secondHandView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shadowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", a3);

}

- (void)_setAltHandsAlpha:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[CLKUIHandView setAlpha:](self->_hourHandViewAlt, "setAlpha:");
  -[CLKUIHandView setAlpha:](self->_minuteHandViewAlt, "setAlpha:", a3);
  -[CLKUIHandView setAlpha:](self->_secondHandViewAlt, "setAlpha:", a3);
  -[CLKUIHandView shadowView](self->_hourHandViewAlt, "shadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[CLKUIHandView shadowView](self->_minuteHandViewAlt, "shadowView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[CLKUIHandView shadowView](self->_secondHandViewAlt, "shadowView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

}

- (void)_installAltViewsHour:(id)a3 minute:(id)a4 second:(id)a5
{
  id v9;
  id v10;
  NTKHandView **p_secondHandViewAlt;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_hourHandViewAlt, a3);
  objc_storeStrong((id *)&self->_minuteHandViewAlt, a4);
  p_secondHandViewAlt = &self->_secondHandViewAlt;
  objc_storeStrong((id *)&self->_secondHandViewAlt, a5);
  -[NTKAnalogHandsView addSubview:](self, "addSubview:", self->_hourHandViewAlt);
  -[CLKUIHandView setNeedsLayout](self->_hourHandViewAlt, "setNeedsLayout");
  -[NTKAnalogHandsView addSubview:](self, "addSubview:", self->_minuteHandViewAlt);
  -[CLKUIHandView setNeedsLayout](self->_minuteHandViewAlt, "setNeedsLayout");
  -[NTKAnalogHandsView addSubview:](self, "addSubview:", self->_secondHandViewAlt);
  -[CLKUIHandView setNeedsLayout](self->_secondHandViewAlt, "setNeedsLayout");
  if (-[CLKUIAnalogHandsView useDirectionalShadows](self, "useDirectionalShadows"))
  {
    -[CLKUIAnalogHandsView directionalShadowContainerView](self, "directionalShadowContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIHandView shadowView](self->_hourHandViewAlt, "shadowView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[CLKUIAnalogHandsView directionalShadowContainerView](self, "directionalShadowContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIHandView shadowView](self->_minuteHandViewAlt, "shadowView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

    -[CLKUIAnalogHandsView directionalShadowContainerView](self, "directionalShadowContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIHandView shadowView](*p_secondHandViewAlt, "shadowView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

  }
}

- (void)applySecondHandColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  v4 = a3;
  -[CLKUIAnalogHandsView applySecondHandColor:](&v5, sel_applySecondHandColor_, v4);
  -[NTKHandView setColor:](self->_secondHandViewAlt, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void)applyHourMinuteHandsTransitionFraction:(double)a3 fromStrokeColor:(id)a4 fromFillColor:(id)a5 toStrokeColor:(id)a6 toFillColor:(id)a7
{
  double v13;
  BOOL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CALayer *minuteHandTransitionBodyLayer;
  CALayer *hourHandTransitionBodyLayer;
  CALayer *minuteHandTransitionPegLayer;
  double v36;
  double v37;
  CALayer *v38;
  CALayer *minuteHandTransitionStemLayer;
  CALayer *hourHandTransitionStemLayer;
  CALayer *v41;
  id v42;
  CALayer *v43;
  id v44;
  CALayer *v45;
  id v46;
  CALayer *v47;
  id v48;
  CALayer *v49;
  id v50;
  CALayer *v51;
  id v52;
  CALayer *v53;
  id v54;
  CALayer *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  CATransform3D v64;
  CATransform3D v65;
  CATransform3D v66;
  CATransform3D v67;
  CATransform3D v68;

  v14 = fabs(a3) < 0.00000011920929;
  v13 = fabs(a3 + -1.0);
  v14 = v14 || v13 < 0.00000011920929;
  if (v14)
  {
    v15 = a7;
    v16 = a6;
    v17 = a5;
    v18 = a4;
    -[NTKAnalogHandsView _removeHourMinuteHandsTransitionLayers](self, "_removeHourMinuteHandsTransitionLayers");
  }
  else
  {
    v19 = a7;
    v20 = a6;
    v21 = a5;
    v22 = a4;
    -[NTKAnalogHandsView _addHourMinuteHandsTransitionLayers](self, "_addHourMinuteHandsTransitionLayers");
  }
  CLKCompressFraction();
  v24 = v23;
  CLKCompressFraction();
  v26 = v25;
  CLKCompressFraction();
  *(float *)&v26 = v26;
  LODWORD(v27) = LODWORD(v26);
  -[CALayer setOpacity:](self->_hourHandTransitionBodyLayer, "setOpacity:", v27);
  LODWORD(v28) = LODWORD(v26);
  -[CALayer setOpacity:](self->_minuteHandTransitionBodyLayer, "setOpacity:", v28);
  LODWORD(v29) = LODWORD(v26);
  -[CALayer setOpacity:](self->_minuteHandTransitionPegLayer, "setOpacity:", v29);
  LODWORD(v30) = LODWORD(v26);
  -[CALayer setOpacity:](self->_hourHandTransitionStemLayer, "setOpacity:", v30);
  LODWORD(v31) = LODWORD(v26);
  -[CALayer setOpacity:](self->_minuteHandTransitionStemLayer, "setOpacity:", v31);
  memset(&v68, 0, sizeof(v68));
  CLKInterpolateBetweenFloatsClipped();
  CATransform3DMakeScale(&v68, v24, v32, 1.0);
  minuteHandTransitionBodyLayer = self->_minuteHandTransitionBodyLayer;
  v67 = v68;
  -[CALayer setTransform:](minuteHandTransitionBodyLayer, "setTransform:", &v67);
  hourHandTransitionBodyLayer = self->_hourHandTransitionBodyLayer;
  v67 = v68;
  -[CALayer setTransform:](hourHandTransitionBodyLayer, "setTransform:", &v67);
  minuteHandTransitionPegLayer = self->_minuteHandTransitionPegLayer;
  CATransform3DMakeScale(&v66, v24, v24, 1.0);
  -[CALayer setTransform:](minuteHandTransitionPegLayer, "setTransform:", &v66);
  CLKInterpolateBetweenFloatsClipped();
  v37 = v36;
  -[CALayer setBorderWidth:](self->_minuteHandTransitionBodyLayer, "setBorderWidth:");
  -[CALayer setBorderWidth:](self->_hourHandTransitionBodyLayer, "setBorderWidth:", v37);
  v38 = self->_minuteHandTransitionPegLayer;
  CLKInterpolateBetweenFloatsClipped();
  -[CALayer setBorderWidth:](v38, "setBorderWidth:");
  minuteHandTransitionStemLayer = self->_minuteHandTransitionStemLayer;
  CATransform3DMakeScale(&v65, v24, 1.0, 1.0);
  -[CALayer setTransform:](minuteHandTransitionStemLayer, "setTransform:", &v65);
  hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  CATransform3DMakeScale(&v64, v24, 1.0, 1.0);
  -[CALayer setTransform:](hourHandTransitionStemLayer, "setTransform:", &v64);
  v41 = self->_minuteHandTransitionBodyLayer;
  v42 = objc_retainAutorelease(a6);
  -[CALayer setBorderColor:](v41, "setBorderColor:", objc_msgSend(v42, "CGColor"));
  v43 = self->_minuteHandTransitionPegLayer;
  v44 = objc_retainAutorelease(v42);
  -[CALayer setBorderColor:](v43, "setBorderColor:", objc_msgSend(v44, "CGColor"));
  v45 = self->_minuteHandTransitionStemLayer;
  v46 = objc_retainAutorelease(v44);
  -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", objc_msgSend(v46, "CGColor"));
  v47 = self->_minuteHandTransitionBodyLayer;
  v48 = objc_retainAutorelease(a7);
  -[CALayer setBackgroundColor:](v47, "setBackgroundColor:", objc_msgSend(v48, "CGColor"));
  v49 = self->_minuteHandTransitionPegLayer;
  v50 = objc_retainAutorelease(v48);
  -[CALayer setBackgroundColor:](v49, "setBackgroundColor:", objc_msgSend(v50, "CGColor"));
  v51 = self->_hourHandTransitionBodyLayer;
  v52 = objc_retainAutorelease(v46);
  -[CALayer setBorderColor:](v51, "setBorderColor:", objc_msgSend(v52, "CGColor"));
  v53 = self->_hourHandTransitionStemLayer;
  v54 = objc_retainAutorelease(v52);
  -[CALayer setBackgroundColor:](v53, "setBackgroundColor:", objc_msgSend(v54, "CGColor"));
  v55 = self->_hourHandTransitionBodyLayer;
  v56 = objc_retainAutorelease(v50);
  -[CALayer setBackgroundColor:](v55, "setBackgroundColor:", objc_msgSend(v56, "CGColor"));
  if (a3 > 0.6)
    v57 = v56;
  else
    v57 = a5;
  if (a3 > 0.6)
    v58 = v54;
  else
    v58 = a4;
  v59 = v58;
  v60 = v57;
  -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setColor:", v59);

  -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setColor:", v59);

  -[CLKUIAnalogHandsView setInlayColor:](self, "setInlayColor:", v60);
}

- (void)_removeHourMinuteHandsTransitionLayers
{
  -[CALayer removeFromSuperlayer](self->_minuteHandTransitionBodyLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_minuteHandTransitionStemLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_minuteHandTransitionPegLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_hourHandTransitionBodyLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_hourHandTransitionStemLayer, "removeFromSuperlayer");
}

- (void)_addHourMinuteHandsTransitionLayers
{
  void *v3;
  CALayer *v4;
  CALayer *minuteHandTransitionPegLayer;
  CALayer *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CALayer *v11;
  void *v12;
  CALayer *v13;
  double v14;
  CALayer *v15;
  CALayer *minuteHandTransitionBodyLayer;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CALayer *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CALayer *v34;
  CALayer *minuteHandTransitionStemLayer;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CALayer *v43;
  void *v44;
  void *v45;
  CALayer *v46;
  CALayer *hourHandTransitionBodyLayer;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CALayer *v56;
  void *v57;
  CALayer *hourHandTransitionStemLayer;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CALayer *v65;
  CALayer *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  CALayer *v71;
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
  id v93;

  -[CLKUIAnalogHandsView minuteHandConfiguration](self, "minuteHandConfiguration");
  v93 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKUIAnalogHandsView hourHandConfiguration](self, "hourHandConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_minuteHandTransitionPegLayer)
  {
    v4 = (CALayer *)objc_opt_new();
    minuteHandTransitionPegLayer = self->_minuteHandTransitionPegLayer;
    self->_minuteHandTransitionPegLayer = v4;

    v6 = self->_minuteHandTransitionPegLayer;
    -[CLKUIAnalogHandsView minuteHandDot](self, "minuteHandDot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    -[CALayer setPosition:](v6, "setPosition:");

    objc_msgSend(v93, "pegRadius");
    v9 = v8;
    objc_msgSend(v93, "pegStrokeWidth");
    -[CALayer setBounds:](self->_minuteHandTransitionPegLayer, "setBounds:", 0.0, 0.0, v9 + v10 + v9 + v10, v9 + v10 + v9 + v10);
    v11 = self->_minuteHandTransitionPegLayer;
    _disabledLayerActions();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v11, "setActions:", v12);

    v13 = self->_minuteHandTransitionPegLayer;
    -[CALayer bounds](v13, "bounds");
    -[CALayer setCornerRadius:](v13, "setCornerRadius:", v14 * 0.5);
  }
  if (!self->_minuteHandTransitionBodyLayer)
  {
    v15 = (CALayer *)objc_opt_new();
    minuteHandTransitionBodyLayer = self->_minuteHandTransitionBodyLayer;
    self->_minuteHandTransitionBodyLayer = v15;

    v17 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v93, "handWidth");
    v20 = v19;
    objc_msgSend(v93, "handLength");
    -[CALayer setBounds:](self->_minuteHandTransitionBodyLayer, "setBounds:", v17, v18, v20, v21);
    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23 * 0.5;
    objc_msgSend(v93, "handLength");
    -[CALayer setPosition:](self->_minuteHandTransitionBodyLayer, "setPosition:", v24, v25 * 0.5);
    v26 = self->_minuteHandTransitionBodyLayer;
    _disabledLayerActions();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v26, "setActions:", v27);

    -[CALayer setCornerRadius:](self->_minuteHandTransitionBodyLayer, "setCornerRadius:", v20 * 0.5);
  }
  if (!self->_minuteHandTransitionStemLayer)
  {
    v28 = *MEMORY[0x1E0C9D538];
    v29 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v93, "armWidth");
    v31 = v30;
    objc_msgSend(v93, "armLength");
    v33 = v32;
    v34 = (CALayer *)objc_opt_new();
    minuteHandTransitionStemLayer = self->_minuteHandTransitionStemLayer;
    self->_minuteHandTransitionStemLayer = v34;

    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v38 = v37 * 0.5;
    objc_msgSend(v93, "handLength");
    v40 = v39;
    objc_msgSend(v93, "armLength");
    v42 = v40 + v41 * 0.5;
    -[CALayer setBounds:](self->_minuteHandTransitionStemLayer, "setBounds:", v28, v29, v31, v33);
    -[CALayer setPosition:](self->_minuteHandTransitionStemLayer, "setPosition:", v38, v42);
    v43 = self->_minuteHandTransitionStemLayer;
    _disabledLayerActions();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v43, "setActions:", v44);

  }
  if (!self->_hourHandTransitionBodyLayer)
  {
    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (CALayer *)objc_opt_new();
    hourHandTransitionBodyLayer = self->_hourHandTransitionBodyLayer;
    self->_hourHandTransitionBodyLayer = v46;

    v48 = *MEMORY[0x1E0C9D538];
    v49 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v3, "handWidth");
    v51 = v50;
    objc_msgSend(v3, "handLength");
    -[CALayer setBounds:](self->_hourHandTransitionBodyLayer, "setBounds:", v48, v49, v51, v52);
    objc_msgSend(v45, "bounds");
    v54 = v53 * 0.5;
    objc_msgSend(v3, "handLength");
    -[CALayer setPosition:](self->_hourHandTransitionBodyLayer, "setPosition:", v54, v55 * 0.5);
    v56 = self->_hourHandTransitionBodyLayer;
    _disabledLayerActions();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v56, "setActions:", v57);

    -[CALayer setCornerRadius:](self->_hourHandTransitionBodyLayer, "setCornerRadius:", v51 * 0.5);
  }
  hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  if (!hourHandTransitionStemLayer)
  {
    v59 = *MEMORY[0x1E0C9D538];
    v60 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v3, "armWidth");
    v62 = v61;
    objc_msgSend(v3, "armLength");
    v64 = v63;
    v65 = (CALayer *)objc_opt_new();
    v66 = self->_hourHandTransitionStemLayer;
    self->_hourHandTransitionStemLayer = v65;

    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setBounds:](self->_hourHandTransitionStemLayer, "setBounds:", v59, v60, v62, v64);
    objc_msgSend(v67, "bounds");
    v69 = v68 * 0.5;
    objc_msgSend(v67, "bounds");
    -[CALayer setPosition:](self->_hourHandTransitionStemLayer, "setPosition:", v69, v70 * 0.5);
    v71 = self->_hourHandTransitionStemLayer;
    _disabledLayerActions();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALayer setActions:](v71, "setActions:", v72);

    hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  }
  -[CALayer superlayer](hourHandTransitionStemLayer, "superlayer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
  {
    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "transitionContainerView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addSublayer:", self->_hourHandTransitionStemLayer);

  }
  -[CALayer superlayer](self->_hourHandTransitionBodyLayer, "superlayer");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
  {
    -[CLKUIAnalogHandsView hourHandView](self, "hourHandView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "transitionContainerView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addSublayer:", self->_hourHandTransitionBodyLayer);

  }
  -[CALayer superlayer](self->_minuteHandTransitionStemLayer, "superlayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v81)
  {
    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "transitionContainerView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addSublayer:", self->_minuteHandTransitionStemLayer);

  }
  -[CALayer superlayer](self->_minuteHandTransitionPegLayer, "superlayer");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v85)
  {
    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "transitionContainerView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addSublayer:", self->_minuteHandTransitionPegLayer);

  }
  -[CALayer superlayer](self->_minuteHandTransitionBodyLayer, "superlayer");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v89)
  {
    -[CLKUIAnalogHandsView minuteHandView](self, "minuteHandView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "transitionContainerView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "layer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addSublayer:", self->_minuteHandTransitionBodyLayer);

  }
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (void)setDataMode:(int64_t)a3
{
  self->_dataMode = a3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (NTKHandView)hourHandViewAlt
{
  return self->_hourHandViewAlt;
}

- (void)setHourHandViewAlt:(id)a3
{
  objc_storeStrong((id *)&self->_hourHandViewAlt, a3);
}

- (NTKHandView)minuteHandViewAlt
{
  return self->_minuteHandViewAlt;
}

- (void)setMinuteHandViewAlt:(id)a3
{
  objc_storeStrong((id *)&self->_minuteHandViewAlt, a3);
}

- (NTKHandView)secondHandViewAlt
{
  return self->_secondHandViewAlt;
}

- (void)setSecondHandViewAlt:(id)a3
{
  objc_storeStrong((id *)&self->_secondHandViewAlt, a3);
}

- (BOOL)shouldShowSecondsHandInAlwaysOn
{
  return self->_shouldShowSecondsHandInAlwaysOn;
}

- (void)setShouldShowSecondsHandInAlwaysOn:(BOOL)a3
{
  self->_shouldShowSecondsHandInAlwaysOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondHandViewAlt, 0);
  objc_storeStrong((id *)&self->_minuteHandViewAlt, 0);
  objc_storeStrong((id *)&self->_hourHandViewAlt, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_hourHandTransitionStemLayer, 0);
  objc_storeStrong((id *)&self->_hourHandTransitionBodyLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionPegLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionStemLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionBodyLayer, 0);
}

@end
