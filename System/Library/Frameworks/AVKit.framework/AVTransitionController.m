@implementation AVTransitionController

- (AVPresentationContext)presentationContext
{
  return -[AVPresentationController context](self->_presentationController, "context");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setInteractionView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_interactionView, obj);
    -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransitionController addTransitionDriver:toView:](self, "addTransitionDriver:toView:", v5, obj);

  }
}

- (void)setInteractiveGestureTracker:(id)a3
{
  AVTransitionDriver *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTransitionDriver *interactiveGestureTracker;
  void *v13;
  AVTransitionDriver *v14;

  v5 = (AVTransitionDriver *)a3;
  if (self->_interactiveGestureTracker != v5)
  {
    v14 = v5;
    -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeInteraction:", v9);

      -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentTransitioningViewGestureRecognizer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransitionDriver setContentTransitioningViewGestureRecognizer:](v14, "setContentTransitioningViewGestureRecognizer:", v11);

    }
    objc_storeStrong((id *)&self->_interactiveGestureTracker, a3);
    interactiveGestureTracker = self->_interactiveGestureTracker;
    -[AVTransitionController interactionView](self, "interactionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransitionController addTransitionDriver:toView:](self, "addTransitionDriver:toView:", interactiveGestureTracker, v13);

    v5 = v14;
  }

}

- (AVTransitionDriver)interactiveGestureTracker
{
  return self->_interactiveGestureTracker;
}

- (void)addTransitionDriver:(id)a3 toView:(id)a4
{
  id v6;

  if (a3)
  {
    if (a4)
    {
      v6 = a3;
      objc_msgSend(a4, "addInteraction:", v6);
      objc_msgSend(v6, "setTransitionDriverDelegate:", self);

    }
  }
}

- (UIView)interactionView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_interactionView);
}

- (AVDisplayLink)displayLink
{
  AVDisplayLink *displayLink;
  AVDisplayLink *v4;
  AVDisplayLink *v5;

  displayLink = self->_displayLink;
  if (!displayLink)
  {
    v4 = objc_alloc_init(AVDisplayLink);
    v5 = self->_displayLink;
    self->_displayLink = v4;

    displayLink = self->_displayLink;
  }
  return displayLink;
}

- (void)beginFullScreenPresentationOfViewController:(id)a3 fromView:(id)a4 isInteractive:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t i;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[AVTransitionController setSourceViewForNextPresentation:](self, "setSourceViewForNextPresentation:", v10);
  objc_msgSend(v9, "setTransitioningDelegate:", self);
  if (v10
    && (objc_msgSend(MEMORY[0x1E0DC3F20], "_viewControllerForFullScreenPresentationFromView:", v10),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
  }
  else
  {
    v14 = (id *)MEMORY[0x1E0DC4730];
    if ((objc_msgSend((id)*MEMORY[0x1E0DC4730], "supportsMultipleScenes") & 1) != 0)
    {
      v13 = 0;
    }
    else
    {

      objc_msgSend(*v14, "avkit_possibleWindowForControllingOverallAppearance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rootViewController");
      for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
      {
        v13 = (void *)i;

        objc_msgSend(v13, "presentedViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (!v10)
          break;
        v19 = v13;
        objc_msgSend(v13, "presentedViewController");
      }
    }
  }
  if (v9)
  {
    v15 = (void *)objc_msgSend(v11, "copy");

    objc_msgSend(v13, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      _AVLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_impl(&dword_1AC4B1000, v17, OS_LOG_TYPE_DEFAULT, "Source view controller is transitioning. Will continue fullscreen presentation once complete. %@", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __104__AVTransitionController_beginFullScreenPresentationOfViewController_fromView_isInteractive_completion___block_invoke;
      v21[3] = &unk_1E5BB40F0;
      v21[4] = self;
      v22 = v9;
      v23 = v13;
      v24 = v15;
      objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v21);

    }
    else
    {
      -[AVTransitionController _present:fromViewController:animated:completion:](self, "_present:fromViewController:animated:completion:", v9, v13, 1, v15);
    }

  }
  else
  {
    _AVLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "Cannot present view controller without a view controller from which to present.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    v15 = v11;
  }

}

- (void)beginFullScreenDismissalOfViewController:(id)a3 animated:(BOOL)a4 isInteractive:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v7 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)objc_msgSend(a6, "copy");
  objc_msgSend(v9, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    _AVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_ERROR, "Tried to dismiss a view controller without a presenting view controller. This is hard.", buf, 2u);
    }

  }
  -[AVTransitionController presentationContext](self, "presentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    _AVLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "Source view controller is transitioning. Will continue fullscreen dismissal once complete. %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101__AVTransitionController_beginFullScreenDismissalOfViewController_animated_isInteractive_completion___block_invoke;
    v17[3] = &unk_1E5BB4118;
    v17[4] = self;
    v18 = v9;
    v19 = v14;
    v21 = v7;
    v20 = v10;
    objc_msgSend(v15, "animateAlongsideTransition:completion:", 0, v17);

  }
  else
  {
    -[AVTransitionController _dismiss:fromViewController:animated:completion:](self, "_dismiss:fromViewController:animated:completion:", v9, v14, v7, v10);
  }

}

- (void)ensurePresentationControllerWithPresentingViewController:(id)a3 presentedViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AVPresentationController *v10;
  void *v11;
  AVPresentationController *v12;
  void *v13;
  AVPresentationController *presentationController;
  id v15;

  if (!self->_presentationController)
  {
    v6 = a4;
    v7 = a3;
    -[AVTransitionController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transitionController:configurationForPresentedViewController:presentingViewController:", self, v6, v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[AVTransitionController sourceViewForNextPresentation](self, "sourceViewForNextPresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [AVPresentationController alloc];
    objc_msgSend(v6, "presentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AVPresentationController initWithPresentationController:presentedViewController:presentingViewController:withConfiguration:](v10, "initWithPresentationController:presentedViewController:presentingViewController:withConfiguration:", v11, v6, v7, v15);

    -[AVPresentationController context](v12, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v9);

    -[AVTransitionController setSourceViewForNextPresentation:](self, "setSourceViewForNextPresentation:", 0);
    presentationController = self->_presentationController;
    self->_presentationController = v12;

  }
}

- (BOOL)transitionDriver:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a3, "isEnabled"))
  {
    -[AVTransitionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "transitionController:gestureRecognizer:shouldReceiveTouch:", self, v8, v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)transitionDriver:(id)a3 shouldDriveTransitionInteractionOfType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if ((unint64_t)(a4 - 2) >= 2)
  {
    if (a4 == 1 && !-[AVTransitionController state](self, "state"))
    {
      -[AVTransitionController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "transitionControllerCanBeginInteractivePresentationTransition:", self);
LABEL_10:

      goto LABEL_11;
    }
  }
  else if (!-[AVTransitionController state](self, "state"))
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "canBeInteractivelyDismissed"))
    {
      -[AVTransitionController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "transitionControllerCanBeginInteractiveDismissalTransition:", self);

    }
    else
    {
      v9 = 0;
    }
    goto LABEL_10;
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)transitionDriver:(id)a3 didBeginTrackingTransitionInteraction:(int64_t)a4 readyToProceedHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v14;
  __int16 v15;

  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  -[AVTransitionController setTouchGravity:](self, "setTouchGravity:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (!-[AVTransitionController state](self, "state"))
  {
    v10 = objc_msgSend(v7, "transitionInteraction");
    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1)
      {
        _AVLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_3;
        v15 = 0;
        v12 = "Unexpected gesture kind.";
        v13 = (uint8_t *)&v15;
LABEL_13:
        _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, v12, v13, 2u);
        goto LABEL_3;
      }
      -[AVTransitionController setState:](self, "setState:", 1);
      -[AVTransitionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionControllerBeginInteractivePresentationTransition:", self);
    }
    else
    {
      -[AVTransitionController setState:](self, "setState:", 1);
      -[AVTransitionController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionControllerBeginInteractiveDismissalTransition:", self);
    }

    -[AVTransitionController setTransitionDidBeginHandler:](self, "setTransitionDidBeginHandler:", v8);
    goto LABEL_9;
  }
  _AVLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v14 = 0;
    v12 = "Unexpected transitioning state.";
    v13 = (uint8_t *)&v14;
    goto LABEL_13;
  }
LABEL_3:

  v8[2](v8);
LABEL_9:

}

- (void)transitionDriverDidContinueInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  CAMediaTimingFunction *v31;
  CAMediaTimingFunction *easeInFunction;
  CAMediaTimingFunction *v33;
  CAMediaTimingFunction *easeOutFunction;
  double v35;
  double v36;
  void *v37;
  double v38;
  float v39;
  double v40;
  void *v41;
  double v42;
  float v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  float v51;
  double v52;
  float v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  CGFloat height;
  CGFloat width;
  double v95;
  double v96;
  CGAffineTransform v97;
  CGRect v98;
  CGRect v99;

  v4 = a3;
  if (-[AVTransitionController state](self, "state") != 2)
    goto LABEL_31;
  -[AVPresentationController context](self->_presentationController, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "translationInWindow");
  v95 = v7;
  v96 = v8;
  objc_msgSend(v4, "rotation");
  v10 = v9;
  v11 = objc_msgSend(v4, "transitionInteraction");
  v12 = 0.5;
  v13 = 1.125;
  if (v11 == 3)
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transitionContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;

    -[AVTransitionController presentationContext](self, "presentationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transitionContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "containerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;

    -[AVTransitionController presentationContext](self, "presentationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dismissingTransition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isRotated"))
      v21 = v26;

    v15 = v96 / v21;
    v14 = 1.0 - v96 / v21;
    goto LABEL_11;
  }
  if (v11 == 2)
  {
    objc_msgSend(v4, "pinchScale");
    v15 = 1.0 - v29;
  }
  else
  {
    v14 = 1.0;
    v15 = 1.0;
    if (v11 != 1)
      goto LABEL_11;
    objc_msgSend(v4, "pinchScale");
    v15 = v16 + -1.0;
  }
  objc_msgSend(v4, "pinchScale");
  v14 = v30;
  v13 = 3.5;
  v12 = 0.2;
LABEL_11:
  if (!self->_easeOutFunction || !self->_easeInFunction)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v31 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    easeInFunction = self->_easeInFunction;
    self->_easeInFunction = v31;

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v33 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    easeOutFunction = self->_easeOutFunction;
    self->_easeOutFunction = v33;

  }
  v35 = 1.0;
  if (v14 <= 1.0)
  {
    if (v14 < 1.0)
    {
      -[AVTransitionController easeInFunction](self, "easeInFunction");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = fmax(v14, 0.0);
      *(float *)&v42 = v42;
      objc_msgSend(v41, "_solveForInput:", v42);
      v44 = v43;

      v35 = v12 + v44 * (1.0 - v12);
    }
  }
  else
  {
    v36 = v13 - v12;
    -[AVTransitionController easeInFunction](self, "easeInFunction");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = fmin(fmax((v14 + -1.0) / (v13 - v12), 0.0), 1.0);
    *(float *)&v38 = v38;
    objc_msgSend(v37, "_solveForInput:", v38);
    v40 = v39;

    v35 = v40 * v36 + 1.0;
  }
  v45 = fmax(v15, 0.0);
  if (v6)
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "currentTransition");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "isRotated"))
      v48 = 3.14159265;
    else
      v48 = 9.42477796;

  }
  else
  {
    v48 = 9.42477796;
  }
  v49 = fmin(v45, 0.5);
  -[AVTransitionController easeOutFunction](self, "easeOutFunction");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v10 / v48;
  *(float *)&v52 = fabsf(v51);
  objc_msgSend(v50, "_solveForInput:", v52);
  if (v10 >= 0.0)
    v54 = v53 * 1.57079633;
  else
    v54 = -(v53 * 1.57079633);

  -[AVTransitionController presentationContext](self, "presentationContext");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "presentationWindow");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[AVTransitionController presentationContext](self, "presentationContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "currentTransition");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
    objc_msgSend(v66, "rotationTransform");
  else
    memset(&v97, 0, sizeof(v97));
  v98.origin.x = v58;
  v98.origin.y = v60;
  v98.size.width = v62;
  v98.size.height = v64;
  v99 = CGRectApplyAffineTransform(v98, &v97);
  height = v99.size.height;
  width = v99.size.width;

  objc_msgSend(v4, "locationInWindow");
  v69 = v68;
  v71 = v70;
  UIRectGetCenter();
  v73 = v69 - v72;
  v75 = v71 - v74;
  v76.f64[0] = v95;
  v76.f64[1] = v96;
  v77.f64[0] = width;
  v77.f64[1] = height;
  v78 = vdivq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v76), (int8x16_t)vnegq_f64(v76), (int8x16_t)v76), v77);
  __asm { FMOV            V1.2D, #1.0 }
  self->_touchGravity = (CGPoint)vminnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v78, (float64x2_t)self->_touchGravity), (int8x16_t)v78, (int8x16_t)self->_touchGravity), _Q1);
  -[AVTransitionController touchGravity](self, "touchGravity");
  v85 = 1.0 - v84;
  -[AVTransitionController touchGravity](self, "touchGravity");
  v87 = v73 * v86 + v85 * v95;
  -[AVTransitionController touchGravity](self, "touchGravity");
  v89 = 1.0 - v88;
  -[AVTransitionController touchGravity](self, "touchGravity");
  v91 = v75 * v90 + v89 * v96;
  -[AVTransitionController activeTransition](self, "activeTransition");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "updateWithPercentComplete:scale:translation:rotation:", v49, v35, v87, v91, v54);

LABEL_31:
}

- (void)transitionDriverDidCancelInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v21;
  uint64_t v22;
  void *v23;

  -[AVTransitionController presentationContext](self, "presentationContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isDismissing"))
    goto LABEL_12;
  -[AVTransitionController presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissingTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isRotated"))
    goto LABEL_10;
  -[AVTransitionController presentationContext](self, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "wasInitiallyInteractive"))
  {
LABEL_9:

LABEL_10:
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  -[AVTransitionController presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentationWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v23, "interfaceOrientation");
  -[AVTransitionController presentationContext](self, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dismissingTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != objc_msgSend(v12, "finalInterfaceOrientation"))
  {

    goto LABEL_9;
  }
  -[AVTransitionController presentationContext](self, "presentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationWindow");
  v21 = v8;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowScene");
  v20 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "activationState");

  if (!v22)
  {
LABEL_13:
    -[AVTransitionController _cancelTransition](self, "_cancelTransition");
    return;
  }
  -[AVTransitionController presentationContext](self, "presentationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rotatableSecondWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "avFullScreenViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_15;
    -[AVTransitionController presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissingTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWasCancelledWithInactiveScene:", 1);
    goto LABEL_11;
  }

LABEL_15:
  -[AVTransitionController _finishTransition](self, "_finishTransition");
}

- (void)_cancelTransition
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[AVTransitionController state](self, "state"))
  {
    if (-[AVTransitionController state](self, "state") != 2 && -[AVTransitionController state](self, "state") != 1)
    {
      _AVLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412546;
        v7 = v5;
        v8 = 2048;
        v9 = -[AVTransitionController state](self, "state");
        _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "%@ called with an invalid state %ld", (uint8_t *)&v6, 0x16u);

      }
    }
    -[AVTransitionController setState:](self, "setState:", 3);
    -[AVTransitionController activeTransition](self, "activeTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelInteractiveTransition");

  }
}

- (void)transitionDriverDidFinishInteraction:(id)a3
{
  id v4;
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
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  double height;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  BOOL v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;

  v4 = a3;
  switch(objc_msgSend(v4, "transitionInteraction"))
  {
    case 0:
      goto LABEL_37;
    case 1:
      objc_msgSend(v4, "pinchScale");
      if (v5 > 1.05)
      {
        objc_msgSend(v4, "pinchVelocity");
        if (v6 > 0.0)
          goto LABEL_38;
      }
      objc_msgSend(v4, "pinchVelocity");
      if (v7 > 1.5)
        goto LABEL_38;
      goto LABEL_37;
    case 2:
      objc_msgSend(v4, "pinchScale");
      if (v8 < 0.95)
      {
        objc_msgSend(v4, "pinchVelocity");
        if (v9 < 0.0)
          goto LABEL_38;
      }
      objc_msgSend(v4, "pinchVelocity");
      if (v10 < -2.5)
        goto LABEL_38;
      goto LABEL_37;
    case 3:
      objc_msgSend(v4, "locationInWindow");
      v12 = v11;
      objc_msgSend(v4, "velocityInWindow");
      v42 = v13;
      v15 = v14;
      objc_msgSend(v4, "translationInWindow");
      v17 = v16;
      v18 = v12 - v16;
      -[AVTransitionController presentationContext](self, "presentationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentationWindow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[AVTransitionController presentationContext](self, "presentationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentTransition");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
        objc_msgSend(v30, "rotationTransform");
      else
        memset(&v43, 0, sizeof(v43));
      v44.origin.x = v22;
      v44.origin.y = v24;
      v44.size.width = v26;
      v44.size.height = v28;
      v45 = CGRectApplyAffineTransform(v44, &v43);
      height = v45.size.height;

      if (height <= 0.0)
        v33 = 1.0;
      else
        v33 = v18 / height;
      objc_msgSend(v4, "angleOfVelocityInWindow");
      v35 = v34;
      v36 = objc_msgSend(v4, "lastNonZeroVelocityWasDownward");
      v37 = -v35;
      if (v35 >= 0.0)
        v37 = v35;
      if (v37 >= v33 * 70.0 + (1.0 - v33) * 80.0 || v15 <= 0.0)
      {
        v38 = v15 != *(double *)(MEMORY[0x1E0C9D538] + 8) || v42 != *MEMORY[0x1E0C9D538];
        if (!v36)
          goto LABEL_37;
      }
      else
      {
        v38 = 0;
        if (!v36)
        {
LABEL_37:
          -[AVTransitionController _cancelTransition](self, "_cancelTransition");
          goto LABEL_39;
        }
      }
      if (v38)
        goto LABEL_37;
      v39 = fmax(height - v18, 0.0);
      v40 = 32.0;
      if (v17 < 0.0)
        v40 = 32.0 - v17;
      v41 = 44.0;
      if (v17 < 0.0)
        v41 = 44.0 - v17;
      if (v40 >= v39)
        v39 = v40;
      if (v39 >= v41)
        v39 = v41;
      if (v17 < v39 && v12 + v15 * 0.001 * 0.995 / 0.005 - v18 < 96.0)
        goto LABEL_37;
LABEL_38:
      -[AVTransitionController _finishTransition](self, "_finishTransition");
LABEL_39:

      return;
    default:
      goto LABEL_39;
  }
}

- (void)_finishTransition
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[AVTransitionController state](self, "state") != 2 && -[AVTransitionController state](self, "state") != 1)
  {
    _AVLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      _AVMethodProem(self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2048;
      v11 = -[AVTransitionController state](self, "state");
      _os_log_error_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_ERROR, "%@ called with an invalid state %ld", buf, 0x16u);

    }
  }
  -[AVTransitionController activeTransition](self, "activeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AVTransitionController setState:](self, "setState:", 5);
    -[AVTransitionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__AVTransitionController__finishTransition__block_invoke;
    v7[3] = &unk_1E5BB4CA0;
    v7[4] = self;
    objc_msgSend(v5, "transitionController:prepareForFinishingInteractiveTransition:", self, v7);

  }
  else
  {
    -[AVTransitionController setState:](self, "setState:", 4);
  }
}

- (BOOL)wantsInteractiveStart
{
  int64_t v2;
  NSObject *v3;
  const char *v4;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = -[AVTransitionController state](self, "state");
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    v6 = 136315650;
    v7 = "-[AVTransitionController wantsInteractiveStart]";
    v9 = "wantsInteractiveStart";
    v8 = 2080;
    if (v2 == 1)
      v4 = "YES";
    v10 = 2080;
    v11 = v4;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
  }

  return v2 == 1;
}

- (void)startInteractiveTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  AVTransition *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  AVTransitionController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
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
  NSObject *v29;
  char *v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[AVTransitionController startInteractiveTransition:]";
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  -[AVTransitionController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransitionContext:", v4);

  v7 = -[AVTransition initWithTransitionContext:]([AVTransition alloc], "initWithTransitionContext:", v4);
  -[AVTransitionController setActiveTransition:](self, "setActiveTransition:", v7);

  -[AVTransitionController activeTransition](self, "activeTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransitionController presentationContext](self, "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentationContext:", v9);

  -[AVTransitionController activeTransition](self, "activeTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[AVTransitionController activeTransition](self, "activeTransition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startInteractiveTransition");

  switch(-[AVTransitionController state](self, "state"))
  {
    case 0:
      goto LABEL_12;
    case 1:
      if (objc_msgSend(v4, "isInteractive"))
      {
        -[AVTransitionController setState:](self, "setState:", 2);
        -[AVTransitionController _fireDidBeginHandlerIfNeeded](self, "_fireDidBeginHandlerIfNeeded");
      }
      else
      {
        -[AVTransitionController _fireDidBeginHandlerIfNeeded](self, "_fireDidBeginHandlerIfNeeded");
LABEL_12:
        v14 = self;
        v15 = 5;
LABEL_13:
        -[AVTransitionController setState:](v14, "setState:", v15);
      }
      break;
    case 2:
    case 5:
      _AVLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v13;
        _os_log_error_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_ERROR, "%@: Unexpected transition state.", buf, 0xCu);

      }
      goto LABEL_10;
    case 3:
      -[AVTransitionController _fireDidBeginHandlerIfNeeded](self, "_fireDidBeginHandlerIfNeeded");
      v14 = self;
      v15 = 3;
      goto LABEL_13;
    case 4:
      -[AVTransitionController _fireDidBeginHandlerIfNeeded](self, "_fireDidBeginHandlerIfNeeded");
      -[AVTransitionController delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __53__AVTransitionController_startInteractiveTransition___block_invoke;
      v31[3] = &unk_1E5BB4CA0;
      v31[4] = self;
      -[NSObject transitionController:prepareForFinishingInteractiveTransition:](v12, "transitionController:prepareForFinishingInteractiveTransition:", self, v31);
LABEL_10:

      break;
    default:
      break;
  }
  -[AVPresentationController context](self->_presentationController, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "transitionType");

  if (v17)
  {
    if (v17 == 2)
    {
      -[AVTransitionController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPresentationController context](self->_presentationController, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "presentedViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transitionController:targetViewForDismissingViewController:", self, v23);
      v18 = objc_claimAutoreleasedReturnValue();

      -[AVTransitionController presentationContext](self, "presentationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setSourceView:", v18);

      -[AVTransitionController presentationContext](self, "presentationContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransitionController interactiveGestureTracker](self, "interactiveGestureTracker");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAllowsPausingWhenTransitionCompletes:", objc_msgSend(v26, "transitionInteraction") != 2);

      -[AVTransitionController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPresentationController context](self->_presentationController, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentedViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "transitionController:willBeginDismissingViewController:", self, v27);

    }
    else
    {
      if (v17 != 1)
        goto LABEL_23;
      -[AVTransitionController delegate](self, "delegate");
      v18 = objc_claimAutoreleasedReturnValue();
      -[AVPresentationController context](self->_presentationController, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentedViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject transitionController:willBeginPresentingViewController:](v18, "transitionController:willBeginPresentingViewController:", self, v20);
    }

  }
  else
  {
    _AVLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v18, OS_LOG_TYPE_ERROR, "Unexpected", buf, 2u);
    }
  }

LABEL_23:
  -[AVTransitionController activeTransition](self, "activeTransition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addRunAlongsideAnimationsIfNeeded");

  switch(-[AVTransitionController state](self, "state"))
  {
    case 0:
    case 1:
      _AVLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v30 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v30;
        _os_log_error_impl(&dword_1AC4B1000, v29, OS_LOG_TYPE_ERROR, "%@: Unexpected transition state.", buf, 0xCu);

      }
      goto LABEL_29;
    case 2:
      -[AVTransitionController activeTransition](self, "activeTransition");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject pauseInteractiveTransition](v29, "pauseInteractiveTransition");
      goto LABEL_29;
    case 3:
      -[AVTransitionController activeTransition](self, "activeTransition");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject cancelInteractiveTransition](v29, "cancelInteractiveTransition");
      goto LABEL_29;
    case 5:
      -[AVTransitionController activeTransition](self, "activeTransition");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject finishInteractiveTransition](v29, "finishInteractiveTransition");
LABEL_29:

      break;
    default:
      break;
  }

}

- (void)_ensurePresentationControllerWithTransitionContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0DC55B8];
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransitionController ensurePresentationControllerWithPresentingViewController:presentedViewController:](self, "ensurePresentationControllerWithPresentingViewController:presentedViewController:", v8, v6);
  -[AVPresentationController context](self->_presentationController, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransitionContext:", v5);

}

- (double)transitionDuration:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  double v12;
  void *v13;
  void *v14;
  double v15;

  v5 = a3;
  -[AVTransitionController _ensurePresentationControllerWithTransitionContext:](self, "_ensurePresentationControllerWithTransitionContext:", v5);
  if (-[AVPresentationController presented](self->_presentationController, "presented")
    || -[AVPresentationController presenting](self->_presentationController, "presenting"))
  {
    -[AVPresentationController presentationTransitionWillBegin](self->_presentationController, "presentationTransitionWillBegin");
  }
  else if (-[AVPresentationController dismissed](self->_presentationController, "dismissed")
         || -[AVPresentationController dismissing](self->_presentationController, "dismissing"))
  {
    -[AVPresentationController dismissalTransitionWillBegin](self->_presentationController, "dismissalTransitionWillBegin");
  }
  -[AVTransitionController presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "activationState");
  v10 = v9;
  if (v9 == 2 || v9 == -1)
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "avkit_isHostedInAnotherProcess") ^ 1;
  }
  else
  {
    v11 = 0;
  }
  if (v10 == 2 || v10 == -1)
  {

  }
  v12 = 0.0;
  if (((objc_msgSend(v5, "isAnimated") ^ 1 | v11) & 1) == 0)
  {
    -[AVTransitionController presentationContext](self, "presentationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionDuration");
    v12 = v15;

  }
  return v12;
}

- (void)animationEnded:(BOOL)a3
{
  _BOOL8 v3;
  AVPresentationController *presentationController;
  void *v6;
  AVTransitionDriver *interactiveGestureTracker;
  AVInteractiveTransitionGestureTracker *v8;
  AVInteractiveTransitionGestureTracker *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVTransitionController *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[AVPresentationController presented](self->_presentationController, "presented")
    || -[AVPresentationController presenting](self->_presentationController, "presenting"))
  {
    -[AVPresentationController presentationTransitionDidEnd:](self->_presentationController, "presentationTransitionDidEnd:", v3);
  }
  else if (-[AVPresentationController dismissed](self->_presentationController, "dismissed")
         || -[AVPresentationController dismissing](self->_presentationController, "dismissing"))
  {
    -[AVPresentationController dismissalTransitionDidEnd:](self->_presentationController, "dismissalTransitionDidEnd:", v3);
    presentationController = self->_presentationController;
    self->_presentationController = 0;

  }
  -[AVTransitionController setActiveTransition:](self, "setActiveTransition:", 0);
  -[AVTransitionController displayLink](self, "displayLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[AVTransitionController setState:](self, "setState:", 0);
  interactiveGestureTracker = self->_interactiveGestureTracker;
  if (interactiveGestureTracker)
    v8 = interactiveGestureTracker;
  else
    v8 = objc_alloc_init(AVInteractiveTransitionGestureTracker);
  v9 = v8;
  -[AVTransitionController setInteractiveGestureTracker:](self, "setInteractiveGestureTracker:", v8);
  _AVLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[AVTransitionController animationEnded:]";
    v13 = 1024;
    v14 = 666;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s %d %p", (uint8_t *)&v11, 0x1Cu);
  }

}

- (id)transitionBackgroundViewBackgroundColor:(id)a3
{
  void *v4;
  void *v5;

  -[AVTransitionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionControllerBackgroundViewBackgroundColor:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transitionPresentedViewBackgroundColor:(id)a3
{
  void *v4;
  void *v5;

  -[AVTransitionController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionControllerPresentedViewBackgroundColor:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)transitionWillComplete:(id)a3 success:(BOOL)a4 continueBlock:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[AVTransitionController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionController:transitionWillComplete:continueBlock:", self, v5, v7);

}

- (void)_dismiss:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "transitionCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    _AVLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_ERROR, "Attempted to dismiss from source view controller that is transitioning.", buf, 2u);
    }

  }
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v7, 0);
  objc_msgSend(v12, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__AVTransitionController__dismiss_fromViewController_animated_completion___block_invoke;
  v17[3] = &unk_1E5BB4140;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "animateAlongsideTransition:completion:", 0, v17);

  -[AVTransitionController _startObservingAnimatorProgress](self, "_startObservingAnimatorProgress");
}

- (void)_fireDidBeginHandlerIfNeeded
{
  void *v3;
  id v4;

  -[AVTransitionController transitionDidBeginHandler](self, "transitionDidBeginHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTransitionController setTransitionDidBeginHandler:](self, "setTransitionDidBeginHandler:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)_present:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[AVTransitionController ensurePresentationControllerWithPresentingViewController:presentedViewController:](self, "ensurePresentationControllerWithPresentingViewController:presentedViewController:", v10, v12);
  objc_msgSend(v10, "transitionCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    _AVLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_ERROR, "Attempted to present from source view controller that is transitioning.", buf, 2u);
    }

  }
  objc_msgSend(v10, "presentViewController:animated:completion:", v12, v7, 0);
  objc_msgSend(v12, "transitionCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__AVTransitionController__present_fromViewController_animated_completion___block_invoke;
  v17[3] = &unk_1E5BB4140;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "animateAlongsideTransition:completion:", 0, v17);

  -[AVTransitionController _startObservingAnimatorProgress](self, "_startObservingAnimatorProgress");
}

- (void)_startObservingAnimatorProgress
{
  void *v3;
  void *v4;
  AVTransitionController *v5;
  id v6;

  -[AVTransitionController presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitioningDelegate");
  v5 = (AVTransitionController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[AVTransitionController displayLink](self, "displayLink");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDisplayLinkUpdatesForObserver:framesPerSecond:usingBlock:", self, 36, &__block_literal_global_20538);

  }
}

- (AVTransitionControllerDelegate)delegate
{
  return (AVTransitionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (AVTransition)activeTransition
{
  return self->_activeTransition;
}

- (void)setActiveTransition:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransition, a3);
}

- (AVInteractiveTransitionGestureTracker)gestureTracker
{
  return self->_gestureTracker;
}

- (UIView)sourceViewForNextPresentation
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceViewForNextPresentation);
}

- (void)setSourceViewForNextPresentation:(id)a3
{
  objc_storeWeak((id *)&self->_sourceViewForNextPresentation, a3);
}

- (id)transitionDidBeginHandler
{
  return self->_transitionDidBeginHandler;
}

- (void)setTransitionDidBeginHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CAMediaTimingFunction)easeInFunction
{
  return self->_easeInFunction;
}

- (void)setEaseInFunction:(id)a3
{
  objc_storeStrong((id *)&self->_easeInFunction, a3);
}

- (CAMediaTimingFunction)easeOutFunction
{
  return self->_easeOutFunction;
}

- (void)setEaseOutFunction:(id)a3
{
  objc_storeStrong((id *)&self->_easeOutFunction, a3);
}

- (CGPoint)touchGravity
{
  double x;
  double y;
  CGPoint result;

  x = self->_touchGravity.x;
  y = self->_touchGravity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTouchGravity:(CGPoint)a3
{
  self->_touchGravity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_easeOutFunction, 0);
  objc_storeStrong((id *)&self->_easeInFunction, 0);
  objc_storeStrong(&self->_transitionDidBeginHandler, 0);
  objc_destroyWeak((id *)&self->_sourceViewForNextPresentation);
  objc_storeStrong((id *)&self->_gestureTracker, 0);
  objc_storeStrong((id *)&self->_activeTransition, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_storeStrong((id *)&self->_interactiveGestureTracker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationController, 0);
}

void __57__AVTransitionController__startObservingAnimatorProgress__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "state") >= 2)
  {
    objc_msgSend(v5, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeTransition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transitionAnimatorProgress");
    *(float *)&v4 = v4;
    objc_msgSend(v2, "transitionController:animationProgressDidChange:", v5, v4);

  }
}

uint64_t __74__AVTransitionController__present_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

uint64_t __74__AVTransitionController__dismiss_fromViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1);
}

void __53__AVTransitionController_startInteractiveTransition___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activeTransition");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishInteractiveTransition");

}

void __43__AVTransitionController__finishTransition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activeTransition");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishInteractiveTransition");

}

uint64_t __101__AVTransitionController_beginFullScreenDismissalOfViewController_animated_isInteractive_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss:fromViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

uint64_t __104__AVTransitionController_beginFullScreenPresentationOfViewController_fromView_isInteractive_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_present:fromViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

@end
