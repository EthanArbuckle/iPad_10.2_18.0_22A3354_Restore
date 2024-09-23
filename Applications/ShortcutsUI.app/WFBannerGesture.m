@implementation WFBannerGesture

- (id)gestureSettings
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "gestureSettings"));

  return v3;
}

- (WFBannerGesture)initWithView:(id)a3
{
  id v5;
  WFBannerGesture *v6;
  id v7;
  WFBannerGesture *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFBannerGesture;
  v6 = -[WFBannerGesture init](&v10, "init");
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v6, "handlePanGesture:");
    objc_msgSend(v5, "addGestureRecognizer:", v7);
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = v6;

  }
  return v6;
}

- (void)setEmbeddedScrollView:(id)a3
{
  UIScrollView **p_embeddedScrollView;
  id v5;
  id v6;

  p_embeddedScrollView = &self->_embeddedScrollView;
  v5 = a3;
  objc_storeWeak((id *)p_embeddedScrollView, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "panGestureRecognizer"));

  objc_msgSend(v6, "addTarget:action:", self, "handlePanGesture:");
}

- (void)handlePanGesture:(id)a3
{
  char *v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (char *)objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == (char *)2)
    {
      -[WFBannerGesture continueTrackingWithGestureRecognizer:](self, "continueTrackingWithGestureRecognizer:", v7);
    }
    else
    {
      v5 = v4 == (char *)1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[WFBannerGesture beginTrackingWithGestureRecognizer:](self, "beginTrackingWithGestureRecognizer:", v7);
    }
  }
  else
  {
    -[WFBannerGesture endTrackingWithGestureRecognizer:](self, "endTrackingWithGestureRecognizer:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)beginTrackingWithGestureRecognizer:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  char v7;
  id v8;

  _UIUpdateRequestActivate(&unk_100025698, 2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
  objc_msgSend(v4, "contentOffset");
  -[WFBannerGesture setInitialScrollOffset:](self, "setInitialScrollOffset:", v5);

  -[WFBannerGesture setScrollViewGestureState:](self, "setScrollViewGestureState:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "bannerGestureDidBegin");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
    objc_msgSend(v8, "bannerGestureDidBegin");

  }
}

- (void)continueTrackingWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned __int8 v44;
  double v45;
  void *v46;
  char v47;
  void *v48;
  _QWORD v49[6];
  _QWORD v50[10];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  objc_msgSend(v4, "translationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[WFBannerGesture excessTranslationForBoundedScrollViewWithInputTranslation:](self, "excessTranslationForBoundedScrollViewWithInputTranslation:", v11);
  v13 = v12;
  -[WFBannerGesture effectiveScaleForTranslation:](self, "effectiveScaleForTranslation:");
  v15 = v14;
  v17 = v16;
  -[WFBannerGesture rubberBandedTranslationForTranslation:](self, "rubberBandedTranslationForTranslation:", v13);
  v19 = v18;
  if ((objc_msgSend(v5, "testUnregisteredVelocityEdgeCase") & 1) != 0)
    goto LABEL_22;
  _UIUpdateRequestActivate(&unk_100025698, 2, v20);
  v21 = 0.0;
  if (objc_msgSend(v5, "horizontalTrackingEnabled"))
  {
    if (v13 < 0.0
      || v13 > 0.0
      || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView")),
          v23 = sub_100006DC8(v22),
          v22,
          !v23))
    {
      objc_msgSend(v5, "horizontalTrackingFriction");
      v21 = v9 * (1.0 - v24);
    }
  }
  objc_msgSend(v5, "trackingDampingRatio");
  v26 = v25;
  objc_msgSend(v5, "trackingResponse");
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100007A40;
  v50[3] = &unk_1000349D8;
  v50[4] = self;
  v50[5] = v19;
  v50[6] = v15;
  v50[7] = v17;
  *(double *)&v50[8] = v21;
  v27 = 0.0;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v50, 0, v26, v28, 0.0, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, "blurTopLimit");
  if (v13 >= v29)
  {
    if ((objc_msgSend(v5, "squeezeEnabled") & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v5, "blurBottomLimit");
    if (v13 <= v35)
      goto LABEL_13;
    objc_msgSend(v5, "poofBlurRadius");
    v37 = v36;
    objc_msgSend(v5, "blurBottomLimit");
    v33 = v37 * (v13 - v38);
    v34 = 1000.0;
  }
  else
  {
    objc_msgSend(v5, "poofBlurRadius");
    v31 = v30;
    objc_msgSend(v5, "blurTopLimit");
    v33 = v31 * (fabs(v13) - fabs(v32));
    v34 = 2400.0;
  }
  v27 = v33 / v34;
LABEL_13:
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
  if (objc_msgSend(v39, "blurFilterEnabled")
    && (objc_msgSend(v5, "trackingBlurEnabled") & 1) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layer"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius")));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if ((v44 & 1) == 0)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100007AE4;
      v49[3] = &unk_100034AA0;
      v49[4] = self;
      *(double *)&v49[5] = v27;
      +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v49, 0, 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0);
    }
  }
  else
  {

  }
  v45 = fmax(v13 * 0.005 + 1.0, 0.0);
  if (v13 >= 0.0)
    v45 = 1.0;
  -[WFBannerGesture setDimmingLayerAlpha:response:](self, "setDimmingLayerAlpha:response:", v45, 0.4);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
  v47 = objc_opt_respondsToSelector(v46, "bannerGestureDidContinue");

  if ((v47 & 1) != 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
    objc_msgSend(v48, "bannerGestureDidContinue");

  }
LABEL_22:

}

- (void)endTrackingWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  uint64_t v22;
  double v23;
  void *v24;
  id v25;
  _QWORD *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  dispatch_time_t v34;
  void *v35;
  unsigned int v36;
  void *v37;
  dispatch_time_t v38;
  void *v39;
  char v40;
  void *v41;
  double v42;
  double v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[4];
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  WFBannerGesture *v50;
  uint64_t v51;
  double v52;
  _QWORD v53[4];
  id v54;
  WFBannerGesture *v55;
  double v56;
  uint64_t v57;
  double v58;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  objc_msgSend(v4, "translationInView:", v7);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
  objc_msgSend(v4, "velocityInView:", v11);
  v13 = v12;
  v15 = v14;

  -[WFBannerGesture excessTranslationForBoundedScrollViewWithInputTranslation:](self, "excessTranslationForBoundedScrollViewWithInputTranslation:", v9);
  v17 = v16;
  -[WFBannerGesture rubberBandedTranslationForTranslation:](self, "rubberBandedTranslationForTranslation:");
  v19 = v18;
  _UIUpdateRequestDeactivate(&unk_100025698, 2);
  if ((objc_msgSend(v5, "testUnregisteredVelocityEdgeCase") & 1) != 0
    || v15 > 0.0 && v9 < 100.0
    || (v20 = 0, v15 < 0.0) && v9 > -100.0)
  {
    v20 = 1;
  }
  v21 = fabs(v15);
  if (v21 < 80.0)
    goto LABEL_8;
  v23 = v19 + v15 / 1000.0 * UIScrollViewDecelerationRateNormal / (1.0 - UIScrollViewDecelerationRateNormal);
  if ((objc_msgSend(v5, "squeezeEnabled") || v19 <= 0.0 || v23 <= 150.0) && (v19 >= 0.0 || v23 >= -150.0))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[WFBannerPrototypeSettings sharedSettings](WFBannerPrototypeSettings, "sharedSettings"));
    if (!objc_msgSend(v24, "blurFilterEnabled")
      || ((objc_msgSend(v5, "squeezeEnabled") & 1) != 0 || (objc_msgSend(v5, "blurTopLimit"), v17 >= v42))
      && (objc_msgSend(v5, "blurBottomLimit"), v17 <= v43))
    {
      v22 = 0;
      goto LABEL_15;
    }

    if (v21 >= 20.0)
    {
LABEL_8:
      v22 = 0;
      goto LABEL_16;
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
  objc_msgSend(v24, "setBounces:", 0);
  v22 = 1;
LABEL_15:

LABEL_16:
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100006FFC;
  v53[3] = &unk_100034828;
  v25 = v5;
  v56 = v19;
  v57 = v13;
  v58 = v15;
  v54 = v25;
  v55 = self;
  v26 = objc_retainBlock(v53);
  if ((_DWORD)v22)
  {
    if (v20)
      objc_msgSend(v25, "phase1_impulse_unregisteredVelocity");
    else
      objc_msgSend(v25, "phase1_impulse");
    v29 = v27;
    objc_msgSend(v25, "phase1_response");
    v31 = v30;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000071C4;
    v48[3] = &unk_100034850;
    v51 = v13;
    v52 = v15;
    v32 = v25;
    v49 = v32;
    v50 = self;
    v28 = 0.0;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v48, 0, 1.0, v31, 0.0, 0.0, 0.0, 0.0, v29);
    objc_msgSend(v32, "phase1_phaseDuration");
    v34 = dispatch_time(0, (uint64_t)(v33 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000728C;
    block[3] = &unk_100034EE8;
    v47 = v26;
    dispatch_after(v34, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100007298;
    v45[3] = &unk_100034BE8;
    v45[4] = self;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v45, 0, 0.86, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0);
    v28 = 1.0;
  }
  -[WFBannerGesture setDimmingLayerAlpha:response:](self, "setDimmingLayerAlpha:response:", v28, 0.55);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  v36 = objc_msgSend(v35, "squeezeEnabled");

  if (v17 > 0.0 && v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
    objc_msgSend(v37, "setBounces:", 0);

    v38 = dispatch_time(0, 100000000);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100007324;
    v44[3] = &unk_100034BE8;
    v44[4] = self;
    dispatch_after(v38, (dispatch_queue_t)&_dispatch_main_q, v44);
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
  v40 = objc_opt_respondsToSelector(v39, "bannerGestureDidEndWithDismissal:");

  if ((v40 & 1) != 0)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture delegate](self, "delegate"));
    objc_msgSend(v41, "bannerGestureDidEndWithDismissal:", v22);

  }
}

- (void)setDimmingLayerAlpha:(double)a3 response:(double)a4
{
  void *v7;
  _QWORD v8[6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture dimmingView](self, "dimmingView"));

  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006F28;
    v8[3] = &unk_100034AA0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:retargetImpulse:animations:completion:", 1, v8, 0, 1.0, a4, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
}

- (double)excessTranslationForBoundedScrollViewWithInputTranslation:(double)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  double v25;
  _QWORD *v26;
  double v28;
  double v29;
  _QWORD v30[5];
  char v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
  v7 = sub_100006DC8(v6);

  if (!v7)
    goto LABEL_18;
  -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
  objc_msgSend(v10, "contentSize");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture embeddedScrollView](self, "embeddedScrollView"));
  objc_msgSend(v13, "frame");
  v15 = v12 - v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
  v17 = UIRoundToViewScale(v16, v15);

  if (-[WFBannerGesture scrollViewGestureState](self, "scrollViewGestureState"))
    goto LABEL_10;
  objc_msgSend(v5, "scrollDismissalActivationLeniency");
  v19 = v18;
  -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
  if (v20 <= 0.0)
  {
    -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
    if (a3 > 0.0 && v28 >= -v19)
    {
      -[WFBannerGesture setScrollViewGestureState:](self, "setScrollViewGestureState:", 3);
      -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
      if (v29 != 0.0)
        goto LABEL_22;
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
  if (v21 < v17 || (-[WFBannerGesture initialScrollOffset](self, "initialScrollOffset"), a3 >= 0.0) || v22 > v17 + v19)
  {
    -[WFBannerGesture setScrollViewGestureState:](self, "setScrollViewGestureState:", 1);
    goto LABEL_10;
  }
  -[WFBannerGesture setScrollViewGestureState:](self, "setScrollViewGestureState:", 2);
  -[WFBannerGesture initialScrollOffset](self, "initialScrollOffset");
  if (v23 == v17)
    goto LABEL_10;
LABEL_22:
  v24 = 1;
LABEL_11:
  v25 = v9 - a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100006E28;
  v30[3] = &unk_1000348A0;
  v31 = v24;
  v30[4] = self;
  v26 = objc_retainBlock(v30);
  if ((id)-[WFBannerGesture scrollViewGestureState](self, "scrollViewGestureState") == (id)3 && v25 < 0.0)
  {
    ((void (*)(_QWORD *, CGFloat, CGFloat))v26[2])(v26, CGPointZero.x, CGPointZero.y);
    a3 = -v25;
  }
  else
  {
    a3 = 0.0;
    if ((id)-[WFBannerGesture scrollViewGestureState](self, "scrollViewGestureState") == (id)2 && v25 > v17)
    {
      ((void (*)(_QWORD *, double, double))v26[2])(v26, 0.0, v17);
      a3 = v17 - v25;
    }
  }

LABEL_18:
  return a3;
}

- (double)rubberBandedTranslationForTranslation:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  if (objc_msgSend(v4, "rubberBandingEnabled"))
  {
    objc_msgSend(v4, "bottomLimit");
    if (v5 >= a3)
    {
      objc_msgSend(v4, "topLimit");
      if (v12 > a3)
      {
        objc_msgSend(v4, "topLimit");
        v14 = v13;
        objc_msgSend(v4, "topLimit");
        v16 = vabdd_f64(a3, v15);
        v17 = objc_msgSend(v4, "topRubberBandRange");
        a3 = v14 - BSUIConstrainValueWithRubberBand(v17, v16, v18);
      }
    }
    else
    {
      objc_msgSend(v4, "bottomLimit");
      v7 = v6;
      objc_msgSend(v4, "bottomLimit");
      v9 = a3 - v8;
      v10 = objc_msgSend(v4, "bottomRubberBandRange");
      a3 = v7 + BSUIConstrainValueWithRubberBand(v10, v9, v11);
    }
  }

  return a3;
}

- (double)topEdgeClampedTranslationForTranslation:(double)a3 scale:(double)a4 height:(double)a5
{
  return a3 + (1.0 - a4) * a5 * -0.5;
}

- (CGPoint)effectiveScaleForTranslation:(double)a3
{
  void *v5;
  id v6;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture gestureSettings](self, "gestureSettings"));
  v6 = objc_msgSend(v5, "squeezeEnabled");
  if (a3 <= 0.0 || (_DWORD)v6 == 0)
  {
    objc_msgSend(v5, "trackingScale");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFBannerGesture view](self, "view"));
    objc_msgSend(v10, "frame");
    v12 = v11;

    if (v12 > 300.0)
      v9 = v9 + (v12 + -300.0) * v9 * -0.003;
    v14 = fabs(a3);
    v15 = BSUIConstrainValueWithRubberBand(v13, v14, 250.0) * -0.005 * v9;
    v17 = BSUIConstrainValueWithRubberBand(v16, v14, 80.0) * -0.01;
    objc_msgSend(v5, "squeeze_up");
    v19 = v17 * v18;
    v21 = v15 + 1.0;
    v23 = v15 + 1.0 + v19;
  }
  else
  {
    v20 = BSUIConstrainValueWithRubberBand(v6, fabs(a3), 250.0);
    v21 = v20 / 7500.0 + 1.0;
    objc_msgSend(v5, "trackingSqueezeFactor");
    v23 = v20 / -1000.0 * v22 + 1.0;
  }

  v24 = v21;
  v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (WFBannerGestureDelegate)delegate
{
  return (WFBannerGestureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScrollView)embeddedScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_embeddedScrollView);
}

- (UIView)dimmingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dimmingView);
}

- (void)setDimmingView:(id)a3
{
  objc_storeWeak((id *)&self->_dimmingView, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (double)initialScrollOffset
{
  return self->_initialScrollOffset;
}

- (void)setInitialScrollOffset:(double)a3
{
  self->_initialScrollOffset = a3;
}

- (unint64_t)scrollViewGestureState
{
  return self->_scrollViewGestureState;
}

- (void)setScrollViewGestureState:(unint64_t)a3
{
  self->_scrollViewGestureState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_dimmingView);
  objc_destroyWeak((id *)&self->_embeddedScrollView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
