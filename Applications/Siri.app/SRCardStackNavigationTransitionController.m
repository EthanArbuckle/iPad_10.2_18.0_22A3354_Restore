@implementation SRCardStackNavigationTransitionController

- (SRCardStackNavigationTransitionController)initWithCompactResultViewController:(id)a3
{
  id v5;
  SRCardStackNavigationTransitionController *v6;
  SRCardStackNavigationTransitionController *v7;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRCardStackNavigationTransitionController;
  v6 = -[SRCardStackNavigationTransitionController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_compactResultViewController, a3);
    v8 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", v7, "_panGestureRecognizerDidPan:");
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = v8;

  }
  return v7;
}

- (void)configureWithNavigationController:(id)a3
{
  id v4;

  v4 = a3;
  -[SRCardStackNavigationTransitionController _setNavigationController:](self, "_setNavigationController:", v4);
  objc_msgSend(v4, "setNavigationBarHidden:", 1);

}

- (id)interactionControllerForAnimationController:(id)a3
{
  SRCardStackNavigationTransitionController *v4;

  if (-[SRCardStackNavigationTransitionController _isGesturing](self, "_isGesturing", a3))
    v4 = self;
  else
    v4 = 0;
  return v4;
}

- (void)_animateTransitionForOperation:(int64_t)a3 context:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 == 1)
  {
    v7 = v6;
    -[SRCardStackNavigationTransitionController _recursivelyAnimateNextMultiPopKeyframe:outOfTotalKeyframes:transitionContext:](self, "_recursivelyAnimateNextMultiPopKeyframe:outOfTotalKeyframes:transitionContext:", 0, -[SRCardStackNavigationTransitionController _expectedPopCountForTransitionContext:](self, "_expectedPopCountForTransitionContext:", v6), v6);
    goto LABEL_5;
  }
  if (!a3)
  {
    v7 = v6;
    -[SRCardStackNavigationTransitionController _animatePushTransition:](self, "_animatePushTransition:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (void)animateTransition:(id)a3
{
  id v4;
  int64_t v5;
  SRCardStackNavigationTransitionController *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[SRCardStackNavigationTransitionController operation](self, "operation");
  if (v5 == 2)
  {
    v6 = self;
    v7 = 1;
LABEL_8:
    -[SRCardStackNavigationTransitionController _animateTransitionForOperation:context:](v6, "_animateTransitionForOperation:context:", v7, v4);
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    v6 = self;
    v7 = 0;
    goto LABEL_8;
  }
  if (!v5 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
    sub_1000A0380();
LABEL_9:

}

- (double)_transitionDurationForOperation:(int64_t)a3 context:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (a3 != 1)
    return 0.5;
  v6 = -[SRCardStackNavigationTransitionController _expectedPopCountForTransitionContext:](self, "_expectedPopCountForTransitionContext:", a4, v4, v5);
  return 0.5 / (double)v6 + (double)(v6 - 1) * 0.05;
}

- (double)transitionDuration:(id)a3
{
  double v3;
  id v5;
  int64_t v6;
  SRCardStackNavigationTransitionController *v7;
  uint64_t v8;
  double v9;

  v5 = a3;
  v6 = -[SRCardStackNavigationTransitionController operation](self, "operation");
  switch(v6)
  {
    case 2:
      v7 = self;
      v8 = 1;
LABEL_8:
      -[SRCardStackNavigationTransitionController _transitionDurationForOperation:context:](v7, "_transitionDurationForOperation:context:", v8, v5);
      v3 = v9;
      break;
    case 1:
      v7 = self;
      v8 = 0;
      goto LABEL_8;
    case 0:
      v3 = 0.0;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT))
        sub_1000A03EC();
      break;
  }

  return v3;
}

- (void)layout
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[6];
  _OWORD v20[3];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _navigationController](self, "_navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:](self, "_fromPlatteredCardViewGivenFromViewController:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9), v16, v17, v18));
        v20[0] = v18;
        v20[1] = v17;
        v20[2] = v16;
        objc_msgSend(v10, "setTransform:", v20);
        objc_msgSend(v10, "setNeedsLayout");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));

  v13 = objc_msgSend(objc_alloc((Class)SRUIFMutableStack), "initWithArray:", v12);
  v14 = objc_alloc_init((Class)SRUIFMutableStack);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popTopObject"));
  if (v15)
    objc_msgSend(v14, "pushObject:", v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005F6EC;
  v19[3] = &unk_100123D98;
  v19[4] = v14;
  v19[5] = self;
  objc_msgSend(v13, "popObjectsUsingBlock:", v19);

}

- (SiriSharedUICompactResultView)_compactResultView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController compactResultViewController](self, "compactResultViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "compactResultView"));

  return (SiriSharedUICompactResultView *)v3;
}

- (void)_performPushTransitionFromViewController:(id)a3 andView:(id)a4 toViewController:(id)a5 andView:(id)a6 inContainerView:(id)a7 recentViewControllers:(id)a8 transitionDuration:(double)a9 animated:(BOOL)a10 transitionCompletion:(id)a11 completion:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  SRCardStackNavigationTransitionContext *v46;
  void *v47;
  SRCardStackNavigationTransitionContext *v48;
  id v49;
  _QWORD *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  _QWORD block[5];
  _QWORD v59[4];
  SRCardStackNavigationTransitionContext *v60;
  id v61;
  id v62;
  BOOL v63;
  id location[2];

  v19 = a3;
  v55 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v57 = a11;
  v24 = a12;
  v53 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _backgroundPlatteredCardViewForOperation:recentViewControllers:](self, "_backgroundPlatteredCardViewForOperation:recentViewControllers:", 0, v23));
  v56 = v19;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:](self, "_fromPlatteredCardViewGivenFromViewController:", v19));
  v54 = v20;
  v27 = objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:](self, "_toPlatteredCardViewGivenToViewController:", v20));
  objc_msgSend(v22, "bounds");
  objc_msgSend(v21, "setFrame:");
  v52 = v21;
  objc_msgSend(v22, "addSubview:", v21);
  objc_msgSend(v26, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "superview"));
  objc_msgSend(v22, "convertRect:fromView:", v36, v29, v31, v33, v35);
  -[SRCardStackNavigationTransitionController _setFromPlatteredCardViewOriginalFrame:](self, "_setFromPlatteredCardViewOriginalFrame:");

  if (v25)
  {
    objc_msgSend(v25, "frame");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "superview"));
    objc_msgSend(v22, "convertRect:fromView:", v45, v38, v40, v42, v44);
    -[SRCardStackNavigationTransitionController _setBackgroundEmptyPlatterViewOriginalFrame:](self, "_setBackgroundEmptyPlatterViewOriginalFrame:");

  }
  v46 = -[SRCardStackNavigationTransitionContext initWithCompletion:]([SRCardStackNavigationTransitionContext alloc], "initWithCompletion:", v57);
  -[SRCardStackNavigationTransitionContext setPercentComplete:](v46, "setPercentComplete:", 1.0);
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardView:](v46, "setBackgroundPlatteredCardView:", v25);
  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame](self, "_backgroundEmptyPlatterViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardViewOriginalFrame:](v46, "setBackgroundPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionController _fromPlatteredCardViewOriginalFrame](self, "_fromPlatteredCardViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardViewOriginalFrame:](v46, "setFromPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardView:](v46, "setFromPlatteredCardView:", v26);
  v47 = (void *)v27;
  -[SRCardStackNavigationTransitionContext setToPlatteredCardView:](v46, "setToPlatteredCardView:", v27);
  -[SRCardStackNavigationTransitionContext setContainerView:](v46, "setContainerView:", v22);
  -[SRCardStackNavigationTransitionContext setTransitionDuration:](v46, "setTransitionDuration:", a9);
  objc_initWeak(location, self);
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10005FBB0;
  v59[3] = &unk_100123DC0;
  objc_copyWeak(&v62, location);
  v48 = v46;
  v60 = v48;
  v63 = a10;
  v49 = v24;
  v61 = v49;
  v50 = objc_retainBlock(v59);
  v51 = v50;
  if (a10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005FBF0;
    block[3] = &unk_100122E20;
    block[4] = v50;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    ((void (*)(_QWORD *))v50[2])(v50);
  }

  objc_destroyWeak(&v62);
  objc_destroyWeak(location);

}

- (void)_animatePushTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextFromViewKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:](self, "_toPlatteredCardViewGivenToViewController:", v7));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10005FE7C;
  v29[3] = &unk_100123C00;
  v10 = v4;
  v30 = v10;
  v19 = objc_retainBlock(v29);
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005FE88;
  v21[3] = &unk_100123DE8;
  objc_copyWeak(&v27, &location);
  v11 = v9;
  v22 = v11;
  v12 = v10;
  v23 = v12;
  v13 = v5;
  v24 = v13;
  v14 = v6;
  v25 = v14;
  v15 = v8;
  v26 = v15;
  v16 = objc_retainBlock(v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  -[SRCardStackNavigationTransitionController transitionDuration:](self, "transitionDuration:", v12);
  LOBYTE(v18) = 1;
  -[SRCardStackNavigationTransitionController _performPushTransitionFromViewController:andView:toViewController:andView:inContainerView:recentViewControllers:transitionDuration:animated:transitionCompletion:completion:](self, "_performPushTransitionFromViewController:andView:toViewController:andView:inContainerView:recentViewControllers:transitionDuration:animated:transitionCompletion:completion:", v20, v14, v7, v15, v13, v17, v18, v19, v16);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

- (void)_recursivelyAnimateNextMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12[3];
  id location;

  v8 = a5;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100060084;
  v10[3] = &unk_100123E10;
  v12[1] = (id)a3;
  v12[2] = (id)a4;
  objc_copyWeak(v12, &location);
  v9 = v8;
  v11 = v9;
  -[SRCardStackNavigationTransitionController _animateMultiPopKeyframe:outOfTotalKeyframes:transitionContext:completion:](self, "_animateMultiPopKeyframe:outOfTotalKeyframes:transitionContext:completion:", a3, a4, v9, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

- (void)_animateMultiPopKeyframe:(unint64_t)a3 outOfTotalKeyframes:(unint64_t)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  v13 = (char *)objc_msgSend(v12, "count");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v13 - 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", v13 - 2));
  -[SRCardStackNavigationTransitionController transitionDuration:](self, "transitionDuration:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _popTransitionContextGivenOriginalContext:revealedViewController:poppedViewController:duration:](self, "_popTransitionContextGivenOriginalContext:revealedViewController:poppedViewController:duration:", v10, v15, v14));
  v17 = a4 - 1 == a3;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006027C;
  v19[3] = &unk_100123E38;
  v22 = v17;
  objc_copyWeak(&v21, &location);
  v18 = v11;
  v20 = v18;
  -[SRCardStackNavigationTransitionController _animateOnePopTransition:originalContext:andComplete:completion:](self, "_animateOnePopTransition:originalContext:andComplete:completion:", v16, v10, v17, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (id)_popTransitionContextGivenOriginalContext:(id)a3 revealedViewController:(id)a4 poppedViewController:(id)a5 duration:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  SRCardStackNavigationTransitionContext *v27;
  id v28;
  SRCardStackNavigationTransitionContext *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  CGRect v34;
  CGRect v35;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containerView"));
  objc_msgSend(v13, "setClipsToBounds:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _fromPlatteredCardViewGivenFromViewController:](self, "_fromPlatteredCardViewGivenFromViewController:", v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _toPlatteredCardViewGivenToViewController:](self, "_toPlatteredCardViewGivenToViewController:", v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _backgroundPlatteredCardViewForOperation:recentViewControllers:](self, "_backgroundPlatteredCardViewForOperation:recentViewControllers:", 1, v16));

  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame](self, "_backgroundEmptyPlatterViewOriginalFrame");
  v35.origin.x = CGRectZero.origin.x;
  v35.origin.y = CGRectZero.origin.y;
  v35.size.width = CGRectZero.size.width;
  v35.size.height = CGRectZero.size.height;
  if (CGRectEqualToRect(v34, v35))
  {
    objc_msgSend(v14, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
    objc_msgSend(v13, "convertRect:fromView:", v26, v19, v21, v23, v25);
    -[SRCardStackNavigationTransitionController _setBackgroundEmptyPlatterViewOriginalFrame:](self, "_setBackgroundEmptyPlatterViewOriginalFrame:");

  }
  v27 = [SRCardStackNavigationTransitionContext alloc];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100060540;
  v32[3] = &unk_100123C00;
  v33 = v10;
  v28 = v10;
  v29 = -[SRCardStackNavigationTransitionContext initWithCompletion:](v27, "initWithCompletion:", v32);
  -[SRCardStackNavigationTransitionContext setPercentComplete:](v29, "setPercentComplete:", 0.0);
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardView:](v29, "setBackgroundPlatteredCardView:", v17);
  -[SRCardStackNavigationTransitionController _backgroundEmptyPlatterViewOriginalFrame](self, "_backgroundEmptyPlatterViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setBackgroundPlatteredCardViewOriginalFrame:](v29, "setBackgroundPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionController _fromPlatteredCardViewOriginalFrame](self, "_fromPlatteredCardViewOriginalFrame");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardViewOriginalFrame:](v29, "setFromPlatteredCardViewOriginalFrame:");
  -[SRCardStackNavigationTransitionContext setFromPlatteredCardView:](v29, "setFromPlatteredCardView:", v14);
  -[SRCardStackNavigationTransitionContext setToPlatteredCardView:](v29, "setToPlatteredCardView:", v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "containerView"));
  -[SRCardStackNavigationTransitionContext setContainerView:](v29, "setContainerView:", v30);

  -[SRCardStackNavigationTransitionContext setTransitionDuration:](v29, "setTransitionDuration:", a6);
  return v29;
}

- (void)_animateOnePopTransition:(id)a3 originalContext:(id)a4 andComplete:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100060684;
  v16[3] = &unk_100123E60;
  v13 = v10;
  v17 = v13;
  objc_copyWeak(&v20, &location);
  v21 = a5;
  v14 = v11;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  -[SRCardStackNavigationTransitionController _transitionWithContext:animated:completion:](self, "_transitionWithContext:animated:completion:", v13, 1, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_transitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[4];
  id v39;
  id v40;
  id location;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backgroundPlatteredCardView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fromPlatteredCardView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toPlatteredCardView"));
  v59 = 0u;
  v60 = 0u;
  v58 = 0u;
  -[SRCardStackNavigationTransitionController _prepareFromPlatteredCardViewForTransitionWithContext:](self, "_prepareFromPlatteredCardViewForTransitionWithContext:", v8);
  -[SRCardStackNavigationTransitionController _prepareToPlatteredCardViewForTransitionInContext:](self, "_prepareToPlatteredCardViewForTransitionInContext:", v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SRCardStackNavigationTransitionController _prepareBackgroundEmptyPlatteredViewForTransitionInContext:](self, "_prepareBackgroundEmptyPlatteredViewForTransitionInContext:", v8);
  v35 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100060B60;
  v42[3] = &unk_100123E88;
  v28 = v11;
  v43 = v28;
  v47 = v58;
  v48 = v59;
  v49 = v60;
  v29 = v12;
  v44 = v29;
  v50 = v14;
  v51 = v16;
  v52 = v18;
  v53 = v20;
  v30 = v8;
  v45 = v30;
  v31 = v10;
  v46 = v31;
  v54 = v35;
  v55 = v23;
  v56 = v25;
  v57 = v27;
  v32 = objc_retainBlock(v42);
  objc_initWeak(&location, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100060BD4;
  v38[3] = &unk_100123EB0;
  v33 = v9;
  v39 = v33;
  objc_copyWeak(&v40, &location);
  v34 = objc_retainBlock(v38);
  if (v6)
  {
    objc_msgSend(v30, "transitionDuration");
    v36[4] = v34;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100060C7C;
    v37[3] = &unk_100122E20;
    v37[4] = v32;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100060C88;
    v36[3] = &unk_100122688;
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v37, v36);
  }
  else
  {
    ((void (*)(_QWORD *))v32[2])(v32);
    ((void (*)(_QWORD *, uint64_t))v34[2])(v34, 1);
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

}

- (id)_safelyExtractSnippetPlatterViewControllerFromViewController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "contentPlatterViewController") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPlatterViewController"));
  else
    v4 = 0;

  return v4;
}

- (id)_backgroundPlatteredCardViewForOperation:(int64_t)a3 recentViewControllers:(id)a4
{
  _BOOL4 v6;
  id v7;
  char *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3 == 0;
  v7 = a4;
  v8 = (char *)objc_msgSend(v7, "count");
  if (a3 == 1)
    v9 = 3;
  else
    v9 = 2 * v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _compactResultView](self, "_compactResultView"));
  if ((unint64_t)v8 >= v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", &v8[-v9]));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:](self, "_safelyExtractSnippetPlatterViewControllerFromViewController:", v12));

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentPlatterView"));
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v10;
    v11 = v16;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)_expectedPopCountForTransitionContext:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  char *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _recentViewControllers](self, "_recentViewControllers"));
  v6 = (unint64_t)objc_msgSend(v5, "indexOfObject:", v4);
  v7 = (char *)objc_msgSend(v5, "count") + ~v6;

  return (unint64_t)v7;
}

- (id)_fromPlatteredCardViewGivenFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _compactResultView](self, "_compactResultView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:](self, "_safelyExtractSnippetPlatterViewControllerFromViewController:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentPlatterView"));
  v8 = v7;
  if (!v7)
    v7 = v5;
  v9 = v7;

  return v9;
}

- (id)_toPlatteredCardViewGivenToViewController:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _safelyExtractSnippetPlatterViewControllerFromViewController:](self, "_safelyExtractSnippetPlatterViewControllerFromViewController:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPlatterView"));

  return v4;
}

- (CGRect)_convertFrameForFromPlatteredCardView:(id)a3 toContainerView:(id)a4
{
  id v5;
  id v6;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));

  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGAffineTransform)_prepareFromPlatteredCardViewForTransitionWithContext:(SEL)a3
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  CGAffineTransform *result;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a4;
  objc_msgSend(v6, "percentComplete");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fromPlatteredCardView"));
  v10 = objc_msgSend(v6, "semanticContentAttribute");

  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  -[SRCardStackNavigationTransitionController _calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:](self, "_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:", v10, 1.0 - v8);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  -[SRCardStackNavigationTransitionController _calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:](self, "_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:", v10, v8);
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  objc_msgSend(v9, "setTransform:", v12);

  return result;
}

- (CGAffineTransform)_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:(SEL)a3 withSemanticContentAttribute:(double)a4
{
  double v8;
  __int128 v9;
  CGAffineTransform *result;
  __int128 v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeScale(retstr, a4 * -0.1 + 1.0, a4 * -0.1 + 1.0);
  v8 = -30.0;
  if (a5 == 4)
    v8 = 30.0;
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v13, &v12, v8 * a4, 0.0);
  v11 = *(_OWORD *)&v13.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v13.a;
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v13.tx;
  return result;
}

- (CGRect)_prepareToPlatteredCardViewForTransitionInContext:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
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
  double v30;
  double v31;
  double v32;
  double v33;
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
  double v44;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "percentComplete");
  v44 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toPlatteredCardView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  objc_msgSend(v3, "fromPlatteredCardViewOriginalFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v3, "semanticContentAttribute");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  objc_msgSend(v16, "convertRect:fromView:", v6, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v43 = v21;
  v23 = v22;
  objc_msgSend(v6, "bounds");
  v25 = v24;
  v27 = v26;
  v28 = v24 - v18;
  v29 = -(v24 - v18);
  objc_msgSend(v6, "safeAreaInsets");
  v31 = v20 + v23 - v30;
  objc_msgSend(v5, "sizeThatFits:", v25, v27);
  if (v32 >= v31)
    v33 = v31;
  else
    v33 = v32;
  if (v33 >= v23)
    v34 = v33;
  else
    v34 = v23;
  if (v15 == (id)4)
    v35 = v29;
  else
    v35 = v28;
  v36 = v18 + v35 * v44;
  v37 = v20 - (v34 - v23);
  if (v15 == (id)4)
    v38 = -((1.0 - v44) * v25);
  else
    v38 = (1.0 - v44) * v25;
  objc_msgSend(v5, "setFrame:", v36, v37, v43, v34);

  v39 = v18 + v38;
  v40 = v37;
  v41 = v43;
  v42 = v34;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)_prepareBackgroundEmptyPlatteredViewForTransitionInContext:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "percentComplete");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backgroundPlatteredCardView"));
  objc_msgSend(v3, "backgroundPlatteredCardViewOriginalFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  objc_msgSend(v16, "convertRect:fromView:", v15, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = objc_msgSend(v3, "semanticContentAttribute");
  v26 = -12.0;
  if (v25 != (id)4)
    v26 = 12.0;
  v27 = v18 + v26 * (1.0 - v5);
  v28 = v18 + v26 * v5;
  objc_msgSend(v6, "setFrame:", v27, v20, v22, v24);

  v29 = v28;
  v30 = v20;
  v31 = v22;
  v32 = v24;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_panGestureRecognizerDidPan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  objc_msgSend(v16, "translationInView:", v4);
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  objc_msgSend(v9, "bounds");
  v11 = v8 + v10;
  if (objc_msgSend(v4, "semanticContentAttribute") == (id)4)
    v11 = -v11;
  switch((unint64_t)objc_msgSend(v16, "state"))
  {
    case 1uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionController _navigationController](self, "_navigationController"));
      v13 = objc_msgSend(v12, "popViewControllerAnimated:", 1);

      break;
    case 2uLL:
      v14 = fmin(v6 / v11, 1.0);
      if (v14 < 0.0)
        v14 = 0.0;
      -[SRCardStackNavigationTransitionController updateInteractiveTransition:](self, "updateInteractiveTransition:", v14);
      break;
    case 3uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 0);
      objc_msgSend(v16, "velocityInView:", v4);
      if ((v6 + v15 * 0.2) / v11 <= 0.15)
      {
        -[SRCardStackNavigationTransitionController _setCancelling:](self, "_setCancelling:", 1);
        goto LABEL_12;
      }
      -[SRCardStackNavigationTransitionController finishInteractiveTransition](self, "finishInteractiveTransition");
      break;
    case 4uLL:
      -[SRCardStackNavigationTransitionController _setGesturing:](self, "_setGesturing:", 0);
LABEL_12:
      -[SRCardStackNavigationTransitionController cancelInteractiveTransition](self, "cancelInteractiveTransition");
      break;
    default:
      break;
  }

}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriSharedUICompactResultViewController)compactResultViewController
{
  return self->_compactResultViewController;
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (BOOL)_isGesturing
{
  return self->_gesturing;
}

- (void)_setGesturing:(BOOL)a3
{
  self->_gesturing = a3;
}

- (BOOL)_isCancelling
{
  return self->_cancelling;
}

- (void)_setCancelling:(BOOL)a3
{
  self->_cancelling = a3;
}

- (UINavigationController)_navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)_setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (CGRect)_fromPlatteredCardViewOriginalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromPlatteredCardViewOriginalFrame.origin.x;
  y = self->_fromPlatteredCardViewOriginalFrame.origin.y;
  width = self->_fromPlatteredCardViewOriginalFrame.size.width;
  height = self->_fromPlatteredCardViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setFromPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_fromPlatteredCardViewOriginalFrame = a3;
}

- (CGRect)_backgroundEmptyPlatterViewOriginalFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundEmptyPlatterViewOriginalFrame.origin.x;
  y = self->_backgroundEmptyPlatterViewOriginalFrame.origin.y;
  width = self->_backgroundEmptyPlatterViewOriginalFrame.size.width;
  height = self->_backgroundEmptyPlatterViewOriginalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setBackgroundEmptyPlatterViewOriginalFrame:(CGRect)a3
{
  self->_backgroundEmptyPlatterViewOriginalFrame = a3;
}

- (NSMutableArray)_recentViewControllers
{
  return self->_recentViewControllers;
}

- (void)_setRecentViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_recentViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentViewControllers, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_compactResultViewController, 0);
}

@end
