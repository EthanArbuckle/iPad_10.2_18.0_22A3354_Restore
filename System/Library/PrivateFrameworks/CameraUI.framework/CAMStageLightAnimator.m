@implementation CAMStageLightAnimator

- (CAMStageLightAnimator)initWithGradientLayer:(id)a3 circleLayer:(id)a4
{
  id v7;
  id v8;
  CAMStageLightAnimator *v9;
  CAMStageLightAnimator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMStageLightAnimator;
  v9 = -[CAMStageLightAnimator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gradientLayer, a3);
    objc_storeStrong((id *)&v10->_circleLayer, a4);
  }

  return v10;
}

- (void)setCircleBaseFrame:(CGRect)a3
{
  -[CAMStageLightAnimator setCircleBaseFrame:animated:](self, "setCircleBaseFrame:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setCircleBaseFrame:(CGRect)a3 animated:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _OWORD v20[2];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_circleBaseFrame))
  {
    self->_circleBaseFrame.origin.x = x;
    self->_circleBaseFrame.origin.y = y;
    self->_circleBaseFrame.size.width = width;
    self->_circleBaseFrame.size.height = height;
    v10 = -[CAMStageLightAnimator state](self, "state");
    v11 = v10;
    if (!v10 || v10 == 2)
    {
      -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", v10);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[CAMStageLightAnimator _gradientGeometryForState:](self, "_gradientGeometryForState:", v11);
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
      if (v11 != 0 && a4)
        v18 = 0.5;
      else
        v18 = 0.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v22;
      v20[1] = v23;
      v21 = v24;
      -[CAMStageLightAnimator _animateGradientToProperties:duration:timing:](self, "_animateGradientToProperties:duration:timing:", v20, v19, v18);
      -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v19, 0, v13, v15, v17, v18);
      -[CAMStageLightAnimator _animateCircleColorWithDuration:timing:](self, "_animateCircleColorWithDuration:timing:", v19, v18);

    }
    else if (v10 == 1)
    {
      -[CAMStageLightAnimator _animateAppearing](self, "_animateAppearing");
    }
  }
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;

  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 0uLL:
        -[CAMStageLightAnimator _animateHidden](self, "_animateHidden");
        return;
      case 2uLL:
        if (state)
        {
          if (!-[CAMStageLightAnimator _isAppearing](self, "_isAppearing"))
            -[CAMStageLightAnimator _animateBounceIfNeeded](self, "_animateBounceIfNeeded");
          return;
        }
        break;
      case 1uLL:
        if (state)
        {
          -[CAMStageLightAnimator _animateSearchingIfNeededFromState:](self, "_animateSearchingIfNeededFromState:");
          return;
        }
        break;
      default:
        return;
    }
    -[CAMStageLightAnimator _animateAppearing](self, "_animateAppearing");
  }
}

- (void)_animateAppearing
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  _OWORD v11[2];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  -[CAMStageLightAnimator _setAppearingAnimationCount:](self, "_setAppearingAnimationCount:", -[CAMStageLightAnimator _appearingAnimationCount](self, "_appearingAnimationCount") + 1);
  -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", 1);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CAMStageLightAnimator _gradientGeometryForState:](self, "_gradientGeometryForState:", 1);
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v13;
  v11[1] = v14;
  v12 = v15;
  -[CAMStageLightAnimator _animateGradientToProperties:duration:timing:](self, "_animateGradientToProperties:duration:timing:", v11, v9, 0.5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__CAMStageLightAnimator__animateAppearing__block_invoke;
  v10[3] = &unk_1EA328A68;
  v10[4] = self;
  -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v9, v10, v4, v6, v8, 0.5);

}

uint64_t __42__CAMStageLightAnimator__animateAppearing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishAppearing");
}

- (void)_didFinishAppearing
{
  unint64_t v3;

  -[CAMStageLightAnimator _setAppearingAnimationCount:](self, "_setAppearingAnimationCount:", -[CAMStageLightAnimator _appearingAnimationCount](self, "_appearingAnimationCount") - 1);
  v3 = -[CAMStageLightAnimator state](self, "state");
  if (v3 == 2)
  {
    -[CAMStageLightAnimator _animateBounceIfNeeded](self, "_animateBounceIfNeeded");
  }
  else if (v3 == 1)
  {
    -[CAMStageLightAnimator _animateSearchingIfNeededFromState:](self, "_animateSearchingIfNeededFromState:", 0);
  }
}

- (BOOL)_isAppearing
{
  return -[CAMStageLightAnimator _appearingAnimationCount](self, "_appearingAnimationCount") != 0;
}

- (void)_animateSearchingIfNeededFromState:(unint64_t)a3
{
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  void *v26;
  _OWORD v27[2];
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  if (!-[CAMStageLightAnimator _isAppearing](self, "_isAppearing"))
  {
    v5 = a3 == 2;
    if (a3 == 2)
      v6 = 2;
    else
      v6 = 1;
    if (v5)
      v7 = 1;
    else
      v7 = 2;
    -[CAMStageLightAnimator _circleLineWidth](self, "_circleLineWidth");
    v9 = v8;
    -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", v6);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", v7);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v36 = 0;
    v34 = 0u;
    v35 = 0u;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v11 - v9, v11 - v9, v13, v15);
    v33 = 0;
    v31 = 0u;
    v32 = 0u;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v17 - v9, v17 - v9, v19, v21);
    LODWORD(v22) = 0.5;
    LODWORD(v23) = 0;
    LODWORD(v24) = 0.5;
    LODWORD(v25) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v34;
    v29[1] = v35;
    v30 = v36;
    v27[0] = v31;
    v27[1] = v32;
    v28 = v33;
    -[CAMStageLightAnimator _animateGradientFromProperties:toProperties:duration:timing:repeats:](self, "_animateGradientFromProperties:toProperties:duration:timing:repeats:", v29, v27, v26, 1, 0.75);
    -[CAMStageLightAnimator _animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:](self, "_animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:", v26, 1, 0, v11, v13, v15, v17, v19, v21, 0.75);
    -[CAMStageLightAnimator _animateCircleColorWithDuration:timing:](self, "_animateCircleColorWithDuration:timing:", v26, 0.75);

  }
}

- (void)_animateBounceIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _OWORD v24[5];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[10];

  v28[9] = *MEMORY[0x1E0C80C00];
  if (!-[CAMStageLightAnimator _isAppearing](self, "_isAppearing"))
  {
    v27 = 0;
    v26 = 0u;
    v25 = 0u;
    memset(v24, 0, sizeof(v24));
    -[CAMStageLightAnimator _currentCircleGeometry](self, "_currentCircleGeometry");
    v28[0] = v3;
    v28[1] = v4;
    v28[2] = v5;
    -[CAMStageLightAnimator _currentGradientProperties](self, "_currentGradientProperties");
    -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", 2);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CAMStageLightAnimator _gradientGeometryForState:](self, "_gradientGeometryForState:", 2);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
    v25 = v21;
    v26 = v22;
    v27 = v23;
    *(double *)&v28[6] = v7;
    v28[7] = v9;
    v28[8] = v11;
    -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:", v13 + 8.0, v15 + 8.0, v17, v19);
    *(_OWORD *)((char *)&v24[2] + 8) = v21;
    *(_OWORD *)((char *)&v24[3] + 8) = v22;
    *((_QWORD *)&v24[4] + 1) = v23;
    *(double *)&v28[3] = v7 + 8.0;
    v28[4] = v9;
    v28[5] = v11;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMStageLightAnimator _animateGradientProperties:count:duration:timing:repeats:](self, "_animateGradientProperties:count:duration:timing:repeats:", v24, 3, v20, 0, 0.3);
    -[CAMStageLightAnimator _animateCircleGeometry:count:duration:timing:repeats:completion:](self, "_animateCircleGeometry:count:duration:timing:repeats:completion:", v28, 3, v20, 0, 0, 0.3);
    -[CAMStageLightAnimator _animateCircleColorWithDuration:timing:](self, "_animateCircleColorWithDuration:timing:", v20, 0.3);

  }
}

- (void)_animateHidden
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
  void *v13;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[CAMStageLightAnimator _gradientGeometryForState:](self, "_gradientGeometryForState:", 0);
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  -[CAMStageLightAnimator _gradientPropertiesForGeometry:](self, "_gradientPropertiesForGeometry:");
  LODWORD(v9) = *(_DWORD *)"fff?";
  LODWORD(v10) = 0.75;
  LODWORD(v11) = 0;
  LODWORD(v12) = 0.75;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v16;
  v14[1] = v17;
  v15 = v18;
  -[CAMStageLightAnimator _animateGradientToProperties:duration:timing:](self, "_animateGradientToProperties:duration:timing:", v14, v13, 0.5);
  -[CAMStageLightAnimator _animateCircleToGeometry:duration:timing:completion:](self, "_animateCircleToGeometry:duration:timing:completion:", v13, 0, v4, v6, v8, 0.5);
  -[CAMStageLightAnimator _animateCircleColorWithDuration:timing:](self, "_animateCircleColorWithDuration:timing:", v13, 0.5);

}

- ($9C403407A5B624E1CD2E2AFE16A3B680)_gradientGeometryForState:(SEL)a3
{
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  $9C403407A5B624E1CD2E2AFE16A3B680 *result;
  CGRect v16;

  -[CAMStageLightAnimator _circleGeometryForState:](self, "_circleGeometryForState:");
  -[CAMStageLightAnimator gradientLayer](self, "gradientLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  result = ($9C403407A5B624E1CD2E2AFE16A3B680 *)-[CAMStageLightAnimator _circleLineWidth](self, "_circleLineWidth");
  if (a4 - 1 >= 2 && !a4)
  {
    v16.origin.x = v8;
    v16.origin.y = v10;
    v16.size.width = v12;
    v16.size.height = v14;
    CGRectGetMaxY(v16);
    return ($9C403407A5B624E1CD2E2AFE16A3B680 *)UIDistanceBetweenPoints();
  }
  return result;
}

- ($C12B4627ED62839D2AEBF862580BED8F)_circleGeometryForState:(SEL)a3
{
  -[CAMStageLightAnimator circleBaseFrame](self, "circleBaseFrame");
  -[CAMStageLightAnimator _circleLineWidth](self, "_circleLineWidth");
  return ($C12B4627ED62839D2AEBF862580BED8F *)UIRectGetCenter();
}

- (double)_circleLineWidth
{
  return 2.66666667;
}

- ($DD7213A072135978BB9F7CBA3523336B)_gradientPropertiesForGeometry:(SEL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  $DD7213A072135978BB9F7CBA3523336B *result;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  -[CAMStageLightAnimator gradientLayer](self, "gradientLayer", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  retstr->var0.x = v9 / v15;
  retstr->var0.y = v8 / v17;
  retstr->var1.x = v9 / v15 + v10 / v15;
  retstr->var1.y = v8 / v17 + v10 / v17;
  retstr->var2 = fmin(v11 / v10, 0.99);
  return result;
}

- ($C12B4627ED62839D2AEBF862580BED8F)_currentCircleGeometry
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  $C12B4627ED62839D2AEBF862580BED8F *result;

  -[CAMStageLightAnimator circleLayer](self, "circleLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[CAMStageLightAnimator circleLayer](self, "circleLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  CGPathGetBoundingBox((CGPathRef)objc_msgSend(v8, "path"));
  UIRectGetCenter();

  return result;
}

- ($DD7213A072135978BB9F7CBA3523336B)_currentGradientProperties
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  $DD7213A072135978BB9F7CBA3523336B *result;
  id v16;

  -[CAMStageLightAnimator gradientLayer](self, "gradientLayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = v16;
  v6 = v5;

  objc_msgSend(v6, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v10 = 0.99;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

  }
  retstr->var2 = 0.0;
  retstr->var0 = 0u;
  retstr->var1 = 0u;
  objc_msgSend(v6, "startPoint");
  retstr->var0.x = v11;
  retstr->var0.y = v12;
  objc_msgSend(v6, "endPoint");
  retstr->var1.x = v13;
  retstr->var1.y = v14;
  retstr->var2 = v10;

  return result;
}

- (void)_animateGradientToProperties:(id *)a3 duration:(double)a4 timing:(id)a5
{
  id v8;
  CGPoint var1;
  _OWORD v10[2];
  double var2;
  _OWORD v12[2];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v8 = a5;
  -[CAMStageLightAnimator _currentGradientProperties](self, "_currentGradientProperties");
  v12[0] = v14;
  v12[1] = v15;
  v13 = v16;
  var1 = a3->var1;
  v10[0] = a3->var0;
  v10[1] = var1;
  var2 = a3->var2;
  -[CAMStageLightAnimator _animateGradientFromProperties:toProperties:duration:timing:repeats:](self, "_animateGradientFromProperties:toProperties:duration:timing:repeats:", v12, v10, v8, 0, a4);

}

- (void)_animateGradientFromProperties:(id *)a3 toProperties:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7
{
  CGPoint var1;
  CGPoint v8;
  _OWORD v9[2];
  double var2;
  CGPoint var0;
  CGPoint v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  v9[0] = a3->var0;
  v9[1] = var1;
  v8 = a4->var1;
  var0 = a4->var0;
  var2 = a3->var2;
  v12 = v8;
  v13 = a4->var2;
  -[CAMStageLightAnimator _animateGradientProperties:count:duration:timing:repeats:](self, "_animateGradientProperties:count:duration:timing:repeats:", v9, 2, a6, a7, a5);
}

- (void)_animateGradientProperties:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7
{
  void *v10;
  void *v11;
  void *v12;
  CGPoint *p_var1;
  double x;
  double y;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _BOOL4 v36;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];

  v36 = a7;
  v44[3] = *MEMORY[0x1E0C80C00];
  v38 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    p_var1 = &a3->var1;
    do
    {
      x = p_var1->x;
      y = p_var1->y;
      v16 = p_var1[1].x;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", p_var1[-1].x, p_var1[-1].y);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);

      v44[0] = &unk_1EA3B0BE0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v19;
      v44[2] = &unk_1EA3B0BF8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
      v20 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v21);

      v11 = v20;
      p_var1 = (CGPoint *)((char *)p_var1 + 40);
      --a4;
    }
    while (a4);
  }
  -[CAMStageLightAnimator gradientLayer](self, "gradientLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > 0.0)
  {
    if (v36)
      v23 = INFINITY;
    else
      v23 = 0.0;
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("locations"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTimingFunction:", v38);
    objc_msgSend(v24, "setDuration:", a5);
    objc_msgSend(v24, "setValues:", v12);
    *(float *)&v25 = v23;
    objc_msgSend(v24, "setRepeatCount:", v25);
    objc_msgSend(v24, "setAutoreverses:", v36);
    objc_msgSend(v22, "addAnimation:forKey:", v24, CFSTR("visibleLocations"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("endPoint"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTimingFunction:", v38);
    objc_msgSend(v26, "setDuration:", a5);
    objc_msgSend(v26, "setValues:", v11);
    *(float *)&v27 = v23;
    objc_msgSend(v26, "setRepeatCount:", v27);
    objc_msgSend(v26, "setAutoreverses:", v36);
    objc_msgSend(v22, "addAnimation:forKey:", v26, CFSTR("visibleEndPoint"));
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("startPoint"));
    v28 = v11;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimingFunction:", v38);
    objc_msgSend(v29, "setDuration:", a5);
    objc_msgSend(v29, "setValues:", v10);
    *(float *)&v30 = v23;
    objc_msgSend(v29, "setRepeatCount:", v30);
    objc_msgSend(v29, "setAutoreverses:", v36);
    objc_msgSend(v22, "addAnimation:forKey:", v29, CFSTR("visibleStartPoint"));

    v11 = v28;
  }
  v31 = (void *)MEMORY[0x1E0DC3F10];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __82__CAMStageLightAnimator__animateGradientProperties_count_duration_timing_repeats___block_invoke;
  v39[3] = &unk_1EA3290F0;
  v40 = v22;
  v41 = v10;
  v42 = v11;
  v43 = v12;
  v32 = v12;
  v33 = v11;
  v34 = v10;
  v35 = v22;
  objc_msgSend(v31, "performWithoutAnimation:", v39);

}

void __82__CAMStageLightAnimator__animateGradientProperties_count_duration_timing_repeats___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[5], "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGPointValue");
  objc_msgSend(a1[4], "setStartPoint:");

  objc_msgSend(a1[6], "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGPointValue");
  objc_msgSend(a1[4], "setEndPoint:");

  objc_msgSend(a1[7], "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setLocations:", v4);

}

- (void)_animateCircleToGeometry:(id *)a3 duration:(double)a4 timing:(id)a5 completion:(id)a6
{
  id v8;
  $C12B4627ED62839D2AEBF862580BED8F *v9;

  v8 = a5;
  v9 = a3;
  -[CAMStageLightAnimator _currentCircleGeometry](self, "_currentCircleGeometry");
  -[CAMStageLightAnimator _animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:](self, "_animateCircleFromGeometry:toGeometry:duration:timing:repeats:completion:", v9, 0, v8);

}

- (void)_animateCircleFromGeometry:(id *)a3 toGeometry:(id *)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  -[CAMStageLightAnimator _animateCircleGeometry:count:duration:timing:repeats:completion:](self, "_animateCircleGeometry:count:duration:timing:repeats:completion:", &v14, 2, a3, a4, a6, v13);
}

- (void)_animateCircleGeometry:(id *)a3 count:(unint64_t)a4 duration:(double)a5 timing:(id)a6 repeats:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  void *v16;
  CGFloat *p_y;
  const CGPath *v18;
  void *v19;
  float v20;
  CAMAnimationDelegate *v21;
  void *v22;
  double v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  CGRect v27;

  v9 = a7;
  v14 = a6;
  v15 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    p_y = &a3->var1.y;
    do
    {
      p_y += 3;
      UIRectCenteredAboutPointScale();
      v18 = CGPathCreateWithEllipseInRect(v27, 0);
      objc_msgSend(v16, "addObject:", v18);
      CGPathRelease(v18);
      --a4;
    }
    while (a4);
  }
  -[CAMStageLightAnimator circleLayer](self, "circleLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > 0.0)
  {
    if (v9)
      v20 = INFINITY;
    else
      v20 = 0.0;
    v21 = objc_alloc_init(CAMAnimationDelegate);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __89__CAMStageLightAnimator__animateCircleGeometry_count_duration_timing_repeats_completion___block_invoke;
    v25[3] = &unk_1EA32A6A8;
    v26 = v15;
    -[CAMAnimationDelegate setCompletion:](v21, "setCompletion:", v25);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("path"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTimingFunction:", v14);
    objc_msgSend(v22, "setDuration:", a5);
    objc_msgSend(v22, "setValues:", v16);
    *(float *)&v23 = v20;
    objc_msgSend(v22, "setRepeatCount:", v23);
    objc_msgSend(v22, "setAutoreverses:", v9);
    objc_msgSend(v22, "setDelegate:", v21);
    objc_msgSend(v19, "addAnimation:forKey:", v22, CFSTR("circlePaths"));

  }
  objc_msgSend(v16, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", v24);

}

uint64_t __89__CAMStageLightAnimator__animateCircleGeometry_count_duration_timing_repeats_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateCircleColorWithDuration:(double)a3 timing:(id)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a4;
  -[CAMStageLightAnimator circleLayer](self, "circleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CAMStageLightAnimator state](self, "state");
  if (v7 >= 2)
  {
    if (v7 != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    CAMYellowColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "CGColor");

LABEL_7:
  if (a3 > 0.0)
  {
    objc_msgSend(v6, "presentationLayer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v6;
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("fillColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFromValue:", objc_msgSend(v14, "fillColor"));
    objc_msgSend(v15, "setToValue:", v10);
    objc_msgSend(v15, "setDuration:", a3);
    objc_msgSend(v15, "setTimingFunction:", v16);
    objc_msgSend(v6, "addAnimation:forKey:", v15, CFSTR("activeFillColor"));

  }
  objc_msgSend(v6, "setFillColor:", v10);

}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (unint64_t)state
{
  return self->_state;
}

- (CGRect)circleBaseFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_circleBaseFrame.origin.x;
  y = self->_circleBaseFrame.origin.y;
  width = self->_circleBaseFrame.size.width;
  height = self->_circleBaseFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)_appearingAnimationCount
{
  return self->__appearingAnimationCount;
}

- (void)_setAppearingAnimationCount:(unint64_t)a3
{
  self->__appearingAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
