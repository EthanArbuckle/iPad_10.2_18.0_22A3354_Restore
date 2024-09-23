@implementation BKUIPearlPillView

- (BKUIPearlPillView)init
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlPillView;
  v2 = -[BKUIPearlPillView init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    v4 = (void *)*((_QWORD *)v2 + 60);
    *((_QWORD *)v2 + 60) = v3;

    objc_msgSend(v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSublayer:", *((_QWORD *)v2 + 60));

    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v2, sel_displayTick);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v2 + 59);
    *((_QWORD *)v2 + 59) = v6;

    v8 = (void *)*((_QWORD *)v2 + 59);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    -[CADisplayLink bkui_enableHighFrameRate](*((_QWORD *)v2 + 59));
    *((_QWORD *)v2 + 52) = 0;
    *((_QWORD *)v2 + 77) = 0;
  }
  return (BKUIPearlPillView *)v2;
}

- (void)displayTick
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  double v26;
  double v27;
  double v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void (**v45)(_QWORD);
  CGPath *v46;
  id v47;

  -[BKUIPearlPillView stateAnimationStart](self, "stateAnimationStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[BKUIPearlPillView radiusAnimationStart](self, "radiusAnimationStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  -[BKUIPearlPillView stateAnimationStart](self, "stateAnimationStart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillView stateAnimationStart](self, "stateAnimationStart");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    -[BKUIPearlPillView stateAnimationDuration](self, "stateAnimationDuration");
    if (v11 <= 0.0
      || (-[BKUIPearlPillView stateAnimationDuration](self, "stateAnimationDuration"), v13 = v10 / v12, v10 / v12 >= 1.0))
    {
      -[BKUIPearlPillView setStateAnimationStart:](self, "setStateAnimationStart:", 0);
      v13 = 1.0;
    }
    -[BKUIPearlPillView startArc](self, "startArc");
    v15 = v14;
    -[BKUIPearlPillView targetArc](self, "targetArc");
    v17 = v16;
    -[BKUIPearlPillView startArc](self, "startArc");
    -[BKUIPearlPillView setArc:](self, "setArc:", v15 + (v17 - v18) * v13);
    -[BKUIPearlPillView startHeight](self, "startHeight");
    v20 = v19;
    -[BKUIPearlPillView targetHeight](self, "targetHeight");
    v22 = v21;
    -[BKUIPearlPillView startHeight](self, "startHeight");
    -[BKUIPearlPillView setHeight:](self, "setHeight:", v20 + (v22 - v23) * v13);
    -[BKUIPearlPillView startCornerRadius](self, "startCornerRadius");
    v25 = v24;
    -[BKUIPearlPillView targetCornerRadius](self, "targetCornerRadius");
    v27 = v26;
    -[BKUIPearlPillView startCornerRadius](self, "startCornerRadius");
    -[BKUIPearlPillView setCornerRadius:](self, "setCornerRadius:", v25 + (v27 - v28) * v13);
    if (v13 == 1.0)
    {
      -[BKUIPearlPillView stateAnimationCompletion](self, "stateAnimationCompletion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[BKUIPearlPillView stateAnimationCompletion](self, "stateAnimationCompletion");
        v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPillView setStateAnimationCompletion:](self, "setStateAnimationCompletion:", 0);
        v30[2](v30, 1);

      }
    }
  }
  -[BKUIPearlPillView radiusAnimationStart](self, "radiusAnimationStart");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillView radiusAnimationStart](self, "radiusAnimationStart");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", v33);
    v35 = v34;

    -[BKUIPearlPillView radiusAnimationDuration](self, "radiusAnimationDuration");
    if (v36 <= 0.0
      || (-[BKUIPearlPillView radiusAnimationDuration](self, "radiusAnimationDuration"),
          v38 = v35 / v37,
          v35 / v37 >= 1.0))
    {
      -[BKUIPearlPillView setRadiusAnimationStart:](self, "setRadiusAnimationStart:", 0);
      v38 = 1.0;
    }
    -[BKUIPearlPillView startRadius](self, "startRadius");
    v40 = v39;
    -[BKUIPearlPillView targetRadius](self, "targetRadius");
    v42 = v41;
    -[BKUIPearlPillView startRadius](self, "startRadius");
    -[BKUIPearlPillView setRadius:](self, "setRadius:", v40 + (v42 - v43) * v38);
    if (v38 == 1.0)
    {
      -[BKUIPearlPillView radiusAnimationCompletion](self, "radiusAnimationCompletion");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        -[BKUIPearlPillView radiusAnimationCompletion](self, "radiusAnimationCompletion");
        v45 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPillView setRadiusAnimationCompletion:](self, "setRadiusAnimationCompletion:", 0);
        v45[2](v45);

      }
    }
  }
  if (v4)
  {
    v46 = -[BKUIPearlPillView pillPath](self, "pillPath");
    -[BKUIPearlPillView shapeLayer](self, "shapeLayer");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setPath:", v46);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CGPath *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKUIPearlPillView;
  -[BKUIPearlPillView layoutSubviews](&v14, sel_layoutSubviews);
  -[BKUIPearlPillView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BKUIPearlPillView shapeLayer](self, "shapeLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = -[BKUIPearlPillView pillPath](self, "pillPath");
  -[BKUIPearlPillView shapeLayer](self, "shapeLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPath:", v12);

}

- (CGPath)pillPath
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  double sinval;
  double cosval;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __double2 v29;
  double v30;
  double v31;
  double v32;
  id v33;
  CGPath *v34;

  -[BKUIPearlPillView arc](self, "arc");
  v4 = v3 * 0.5 + 1.57079633;
  -[BKUIPearlPillView arc](self, "arc");
  v6 = 1.57079633 - v5 * 0.5;
  -[BKUIPearlPillView center](self, "center");
  v8 = v7;
  v10 = v9;
  -[BKUIPearlPillView height](self, "height");
  v12 = v11;
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  *(float *)&v13 = v12 + v13 * -2.0;
  v14 = fmaxf(*(float *)&v13, 0.0);
  v15 = (void *)objc_opt_new();
  -[BKUIPearlPillView arc](self, "arc");
  v17 = v16;
  -[BKUIPearlPillView radius](self, "radius");
  if (v17 <= 0.0)
    objc_msgSend(v15, "moveToPoint:", v8, v10 + v18);
  else
    objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v8, v10, v18, v4, v6);
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 2);
  objc_msgSend(v15, "currentPoint");
  v20 = v19;
  v21 = __sincos_stret(v6);
  sinval = v21.__sinval;
  cosval = v21.__cosval;
  objc_msgSend(v15, "currentPoint");
  objc_msgSend(v15, "addLineToPoint:", v20 + v14 * v21.__cosval, v24 + v14 * v21.__sinval);
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 8);
  -[BKUIPearlPillView arc](self, "arc");
  if (v25 > 0.0)
  {
    -[BKUIPearlPillView radius](self, "radius");
    v27 = v26;
    -[BKUIPearlPillView height](self, "height");
    objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v27 + v28, v6, v4);
    v29 = __sincos_stret(v4);
    sinval = v29.__sinval;
    cosval = v29.__cosval;
  }
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 4);
  objc_msgSend(v15, "currentPoint");
  v31 = v30 - v14 * cosval;
  objc_msgSend(v15, "currentPoint");
  objc_msgSend(v15, "addLineToPoint:", v31, v32 - v14 * sinval);
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 1);
  objc_msgSend(v15, "closePath");
  v33 = objc_retainAutorelease(v15);
  v34 = (CGPath *)objc_msgSend(v33, "CGPath");

  return v34;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  -[BKUIPearlPillView setState:animated:completion:failure:](self, "setState:animated:completion:failure:", a3, a4, 0, 0);
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5 failure:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45[5];
  BOOL v46;
  id location;
  _QWORD aBlock[4];
  id v49;
  id v50;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  self->_state = a3;
  -[BKUIPearlPillView height](self, "height");
  v13 = v12;
  -[BKUIPearlPillView arc](self, "arc");
  v15 = v14;
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  v17 = v16;
  if (a3 == 5 || a3 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v20 = objc_msgSend(objc_retainAutorelease(v18), "CGColor");
  -[BKUIPearlPillView shapeLayer](self, "shapeLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFillColor:", v20);

  if (v7)
    v22 = 0.3;
  else
    v22 = 0.0;
  v23 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke;
  aBlock[3] = &unk_1EA27FF68;
  v24 = v10;
  v49 = v24;
  v25 = v11;
  v50 = v25;
  v26 = _Block_copy(aBlock);
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      -[BKUIPearlPillView pillCompletedHeight](self, "pillCompletedHeight");
      goto LABEL_12;
    case 2uLL:
      -[BKUIPearlPillView pillInitialHeight](self, "pillInitialHeight");
LABEL_12:
      v13 = v27;
      -[BKUIPearlPillView pillCornerRadius](self, "pillCornerRadius");
      v17 = v30;
      v15 = 0;
      break;
    case 4uLL:
    case 5uLL:
      -[BKUIPearlPillView ringHeight](self, "ringHeight");
      v13 = v28;
      -[BKUIPearlPillView ringArcLength](self, "ringArcLength");
      v15 = v29;
      v17 = 0;
      break;
    default:
      break;
  }
  -[BKUIPearlPillView setTargetHeight:](self, "setTargetHeight:", *(double *)&v13);
  -[BKUIPearlPillView setTargetArc:](self, "setTargetArc:", *(double *)&v15);
  -[BKUIPearlPillView setTargetCornerRadius:](self, "setTargetCornerRadius:", *(double *)&v17);
  -[BKUIPearlPillView targetHeight](self, "targetHeight");
  v32 = v31;
  -[BKUIPearlPillView height](self, "height");
  if (v32 == v33
    || (-[BKUIPearlPillView targetArc](self, "targetArc"), v35 = v34, -[BKUIPearlPillView arc](self, "arc"), v35 == v36)
    || !v7)
  {
    v41 = _Block_copy(v26);
  }
  else
  {
    -[BKUIPearlPillView targetHeight](self, "targetHeight");
    v38 = v37;
    -[BKUIPearlPillView height](self, "height");
    v40 = v38 > v39;
    v22 = v22 * 0.5;
    if (v38 <= v39)
    {
      -[BKUIPearlPillView arc](self, "arc");
      -[BKUIPearlPillView setTargetArc:](self, "setTargetArc:");
      -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
      -[BKUIPearlPillView setTargetCornerRadius:](self, "setTargetCornerRadius:");
    }
    else
    {
      -[BKUIPearlPillView height](self, "height");
      -[BKUIPearlPillView setTargetHeight:](self, "setTargetHeight:");
    }
    objc_initWeak(&location, self);
    v42[0] = v23;
    v42[1] = 3221225472;
    v42[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_2;
    v42[3] = &unk_1EA27FFB8;
    objc_copyWeak(v45, &location);
    v43 = v25;
    v46 = v40;
    v45[1] = v13;
    v45[2] = v15;
    v45[3] = v17;
    v45[4] = *(id *)&v22;
    v44 = v26;
    v41 = _Block_copy(v42);

    objc_destroyWeak(v45);
    objc_destroyWeak(&location);
  }
  -[BKUIPearlPillView startAnimationWithDuration:completion:](self, "startAnimationWithDuration:completion:", v41, v22);

}

uint64_t __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained
    && a2
    && (objc_msgSend(WeakRetained, "stateAnimationStart"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v5, "setTargetHeight:", *(double *)(a1 + 56));
    }
    else
    {
      objc_msgSend(v5, "setTargetArc:", *(double *)(a1 + 64));
      objc_msgSend(v5, "setTargetCornerRadius:", *(double *)(a1 + 72));
    }
    v8 = *(double *)(a1 + 80);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_3;
    v9[3] = &unk_1EA27FF90;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "startAnimationWithDuration:completion:", v9, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 animationDelay:(double)a5 completion:(id)a6 failure:(id)a7
{
  _BOOL8 v9;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  BKUIPearlPillView *v25;
  void (**v26)(_QWORD);
  void (**v27)(_QWORD);
  unint64_t v28;
  unint64_t v29;
  BOOL v30;

  v9 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = (void (**)(_QWORD))a7;
  if (-[BKUIPearlPillView state](self, "state") == a3)
  {
    if (v12)
      v12[2](v12);
  }
  else
  {
    v14 = -[BKUIPearlPillView state](self, "state");
    if (a5 <= 0.0)
    {
      -[BKUIPearlPillView setState:animated:completion:failure:](self, "setState:animated:completion:failure:", a3, v9, v12, v13);
    }
    else
    {
      v15 = v14;
      -[BKUIPearlPillView stateDelayTimer](self, "stateDelayTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if (v13)
          v13[2](v13);
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0C99E88];
        v21 = MEMORY[0x1E0C809B0];
        v22 = 3221225472;
        v23 = __73__BKUIPearlPillView_setState_animated_animationDelay_completion_failure___block_invoke;
        v24 = &unk_1EA27FFE0;
        v25 = self;
        v28 = v15;
        v29 = a3;
        v30 = v9;
        v26 = v12;
        v27 = v13;
        objc_msgSend(v17, "timerWithTimeInterval:repeats:block:", 0, &v21, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPillView setStateDelayTimer:](self, "setStateDelayTimer:", v18, v21, v22, v23, v24, v25);

        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUIPearlPillView stateDelayTimer](self, "stateDelayTimer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addTimer:forMode:", v20, *MEMORY[0x1E0C99860]);

      }
    }
  }

}

uint64_t __73__BKUIPearlPillView_setState_animated_animationDelay_completion_failure___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setStateDelayTimer:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == *(_QWORD *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "setState:animated:completion:failure:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setRadius:(double)a3 animationDuration:(double)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a5;
  -[BKUIPearlPillView radius](self, "radius");
  -[BKUIPearlPillView setStartRadius:](self, "setStartRadius:");
  -[BKUIPearlPillView setTargetRadius:](self, "setTargetRadius:", a3);
  if (a4 == 0.0)
  {
    -[BKUIPearlPillView setRadiusAnimationDuration:](self, "setRadiusAnimationDuration:", 0.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillView setRadiusAnimationStart:](self, "setRadiusAnimationStart:", v8);

    -[BKUIPearlPillView displayTick](self, "displayTick");
    if (v10)
      v10[2]();
  }
  else
  {
    -[BKUIPearlPillView setRadiusAnimationCompletion:](self, "setRadiusAnimationCompletion:", v10);
    -[BKUIPearlPillView setRadiusAnimationDuration:](self, "setRadiusAnimationDuration:", a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUIPearlPillView setRadiusAnimationStart:](self, "setRadiusAnimationStart:", v9);

  }
}

- (void)startAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v6 = a4;
  -[BKUIPearlPillView stateAnimationCompletion](self, "stateAnimationCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BKUIPearlPillView stateAnimationCompletion](self, "stateAnimationCompletion");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0);

    -[BKUIPearlPillView setStateAnimationCompletion:](self, "setStateAnimationCompletion:", 0);
  }
  -[BKUIPearlPillView height](self, "height");
  -[BKUIPearlPillView setStartHeight:](self, "setStartHeight:");
  -[BKUIPearlPillView arc](self, "arc");
  -[BKUIPearlPillView setStartArc:](self, "setStartArc:");
  -[BKUIPearlPillView cornerRadius](self, "cornerRadius");
  -[BKUIPearlPillView setStartCornerRadius:](self, "setStartCornerRadius:");
  -[BKUIPearlPillView setStateAnimationDuration:](self, "setStateAnimationDuration:", a3);
  -[BKUIPearlPillView setStateAnimationCompletion:](self, "setStateAnimationCompletion:", v6);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUIPearlPillView setStateAnimationStart:](self, "setStateAnimationStart:", v9);

}

- (double)ringArcLength
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;

  -[BKUIPearlPillView numberOfPills](self, "numberOfPills");
  v3 = 6.28318531 / v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v3 + 0.5 / v5;

  return v6;
}

- (void)setState:(unint64_t)a3
{
  -[BKUIPearlPillView setState:animated:](self, "setState:animated:", a3, 0);
}

- (BOOL)isCompleted
{
  return -[BKUIPearlPillView state](self, "state") == 3;
}

- (double)pillInitialHeight
{
  return 13.0;
}

- (double)pillMaxLength
{
  double result;

  objc_msgSend((id)objc_opt_class(), "pillMaxLength");
  return result;
}

- (void)tearDownPillView
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKUIPearlPillView;
  -[BKUIPearlPillView dealloc](&v2, sel_dealloc);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)ringHeight
{
  return self->_ringHeight;
}

- (void)setRingHeight:(double)a3
{
  self->_ringHeight = a3;
}

- (double)numberOfPills
{
  return self->_numberOfPills;
}

- (void)setNumberOfPills:(double)a3
{
  self->_numberOfPills = a3;
}

- (void)setPillInitialHeight:(double)a3
{
  self->_pillInitialHeight = a3;
}

- (double)pillCompletedHeight
{
  return self->_pillCompletedHeight;
}

- (void)setPillCompletedHeight:(double)a3
{
  self->_pillCompletedHeight = a3;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (void)setPillCornerRadius:(double)a3
{
  self->_pillCornerRadius = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (NSTimer)stateDelayTimer
{
  return self->_stateDelayTimer;
}

- (void)setStateDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_stateDelayTimer, a3);
}

- (NSDate)stateAnimationStart
{
  return self->_stateAnimationStart;
}

- (void)setStateAnimationStart:(id)a3
{
  objc_storeStrong((id *)&self->_stateAnimationStart, a3);
}

- (double)stateAnimationDuration
{
  return self->_stateAnimationDuration;
}

- (void)setStateAnimationDuration:(double)a3
{
  self->_stateAnimationDuration = a3;
}

- (id)stateAnimationCompletion
{
  return self->_stateAnimationCompletion;
}

- (void)setStateAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (double)arc
{
  return self->_arc;
}

- (void)setArc:(double)a3
{
  self->_arc = a3;
}

- (double)startArc
{
  return self->_startArc;
}

- (void)setStartArc:(double)a3
{
  self->_startArc = a3;
}

- (double)targetArc
{
  return self->_targetArc;
}

- (void)setTargetArc:(double)a3
{
  self->_targetArc = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)startHeight
{
  return self->_startHeight;
}

- (void)setStartHeight:(double)a3
{
  self->_startHeight = a3;
}

- (double)targetHeight
{
  return self->_targetHeight;
}

- (void)setTargetHeight:(double)a3
{
  self->_targetHeight = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)startCornerRadius
{
  return self->_startCornerRadius;
}

- (void)setStartCornerRadius:(double)a3
{
  self->_startCornerRadius = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (NSDate)radiusAnimationStart
{
  return self->_radiusAnimationStart;
}

- (void)setRadiusAnimationStart:(id)a3
{
  objc_storeStrong((id *)&self->_radiusAnimationStart, a3);
}

- (double)radiusAnimationDuration
{
  return self->_radiusAnimationDuration;
}

- (void)setRadiusAnimationDuration:(double)a3
{
  self->_radiusAnimationDuration = a3;
}

- (id)radiusAnimationCompletion
{
  return self->_radiusAnimationCompletion;
}

- (void)setRadiusAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (double)startRadius
{
  return self->_startRadius;
}

- (void)setStartRadius:(double)a3
{
  self->_startRadius = a3;
}

- (double)targetRadius
{
  return self->_targetRadius;
}

- (void)setTargetRadius:(double)a3
{
  self->_targetRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radiusAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_radiusAnimationStart, 0);
  objc_storeStrong(&self->_stateAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_stateAnimationStart, 0);
  objc_storeStrong((id *)&self->_stateDelayTimer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
