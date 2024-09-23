@implementation AVPresentationController

- (AVPresentationController)initWithPresentationController:(id)a3 presentedViewController:(id)a4 presentingViewController:(id)a5 withConfiguration:(id)a6
{
  id v9;
  id v10;
  id v11;
  AVPresentationController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  AVPresentationContext *v16;
  AVPresentationContext *context;
  AVObservationController *v18;
  AVObservationController *observationController;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVPresentationController;
  v12 = -[AVPresentationController init](&v21, sel_init);
  _AVLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[AVPresentationController initWithPresentationController:presentedViewController:presentingViewController:wit"
          "hConfiguration:]";
    v24 = 1024;
    v25 = 51;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  if (v12)
  {
    objc_storeWeak((id *)&v12->_presentationController, v9);
    objc_msgSend(v10, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v12->_presentedPresentationContainerView, v15);

    }
    else
    {
      objc_storeWeak((id *)&v12->_presentedPresentationContainerView, 0);
    }

    v16 = -[AVPresentationContext initWithPresentationController:configuration:]([AVPresentationContext alloc], "initWithPresentationController:configuration:", v12, v11);
    context = v12->_context;
    v12->_context = v16;

    v18 = -[AVObservationController initWithOwner:]([AVObservationController alloc], "initWithOwner:", v12);
    observationController = v12->_observationController;
    v12->_observationController = v18;

    -[AVPresentationController _observeSceneDidBecomeActiveForRestoringRotatability](v12, "_observeSceneDidBecomeActiveForRestoringRotatability");
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[AVObservationController stopAllObservation](self->_observationController, "stopAllObservation");
  -[AVPresentationController presentationWindowForDisablingAutorotation](self, "presentationWindowForDisablingAutorotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDisablingInterfaceAutorotation");

  _AVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[AVPresentationController presentationWindowForDisablingAutorotation](self, "presentationWindowForDisablingAutorotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v9 = "-[AVPresentationController dealloc]";
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling autorotation for window: %p", buf, 0x16u);

  }
  -[AVPresentationController setPresentationWindowForDisablingAutorotation:](self, "setPresentationWindowForDisablingAutorotation:", 0);
  _AVLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AVPresentationController dealloc]";
    v10 = 1024;
    LODWORD(v11) = 72;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  v7.receiver = self;
  v7.super_class = (Class)AVPresentationController;
  -[AVPresentationController dealloc](&v7, sel_dealloc);
}

- (BOOL)shouldRemovePresentersView
{
  void *v2;
  BOOL v3;

  -[AVPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "modalPresentationStyle") == 0;

  return v3;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)dismissing
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  v3 = objc_msgSend(WeakRetained, "dismissing");

  return v3;
}

- (BOOL)presenting
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  v3 = objc_msgSend(WeakRetained, "presenting");

  return v3;
}

- (BOOL)presented
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  v3 = objc_msgSend(WeakRetained, "presented");

  return v3;
}

- (BOOL)dismissed
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  v3 = objc_msgSend(WeakRetained, "dismissed");

  return v3;
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;

  if (-[AVPresentationController presented](self, "presented"))
  {
    -[AVPresentationController containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[AVPresentationController presentedView](self, "presentedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    -[AVPresentationController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[AVPresentationController context](self, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backgroundView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

    -[AVPresentationController containerView](self, "containerView");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[AVPresentationController context](self, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "touchBlockingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);

  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  objc_msgSend(WeakRetained, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIViewController)presentedViewController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  objc_msgSend(WeakRetained, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIView)containerView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  objc_msgSend(WeakRetained, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)presentedView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  objc_msgSend(WeakRetained, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AVPresentationContainerView)presentedPresentationContainerView
{
  return (AVPresentationContainerView *)objc_loadWeakRetained((id *)&self->_presentedPresentationContainerView);
}

- (void)presentationTransitionWillBegin
{
  NSObject *v3;
  AVPresentationContextTransition *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  int v75;
  const char *v76;
  __int16 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v75 = 136315394;
    v76 = "-[AVPresentationController presentationTransitionWillBegin]";
    v77 = 1024;
    v78 = 157;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v75, 0x12u);
  }

  v4 = objc_alloc_init(AVPresentationContextTransition);
  -[AVPresentationController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingTransition:", v4);

  -[AVPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInteractive");
  -[AVPresentationController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWasInitiallyInteractive:", v8);

  -[AVPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();
  -[AVPresentationController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentingTransition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHasAVKitAnimator:", v8 & 1);

  -[AVPresentationController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "autorotates") & 1) != 0)
  {
    v17 = (void *)*MEMORY[0x1E0DC4730];
    -[AVPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "_supportedInterfaceOrientationsForWindow:", v19);
  }
  else
  {
    -[AVPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 1 << objc_msgSend(v19, "_windowInterfaceOrientation");
  }

  -[AVPresentationController presentingViewController](self, "presentingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "shouldAutorotate") & 1) != 0)
  {
    -[AVPresentationController presentingViewController](self, "presentingViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "supportedInterfaceOrientations");
  }
  else
  {
    -[AVPresentationController containerView](self, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 1 << objc_msgSend(v24, "_windowInterfaceOrientation");

  }
  -[AVPresentationController context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "presentingTransition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPresenterSupportedOrientations:", v23 & v20);

  -[AVPresentationController context](self, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentedViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_setIgnoreAppSupportedOrientations:", 1);

  -[AVPresentationController context](self, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentationWindow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "windowScene");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "interfaceOrientation");
  -[AVPresentationController context](self, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentingTransition");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setInitialInterfaceOrientation:", v32);

  -[AVPresentationController context](self, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "presentationWindow");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "interfaceOrientation");
  -[AVPresentationController context](self, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "presentingTransition");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFinalInterfaceOrientation:", v37);

  -[AVPresentationController context](self, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "presentingTransition");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = objc_msgSend(v41, "hasAVKitAnimator");

  if ((_DWORD)v37)
  {
    -[AVPresentationController presentedView](self, "presentedView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAutoresizingMask:", 0);

    -[AVPresentationController containerView](self, "containerView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[AVPresentationController presentedView](self, "presentedView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    -[AVPresentationController containerView](self, "containerView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v61 = v60;
    -[AVPresentationController context](self, "context");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "backgroundView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setFrame:", v55, v57, v59, v61);

    -[AVPresentationController containerView](self, "containerView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bounds");
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v72 = v71;
    -[AVPresentationController context](self, "context");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "touchBlockingView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFrame:", v66, v68, v70, v72);

  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    *(_DWORD *)buf = 136315650;
    v13 = "-[AVPresentationController presentationTransitionDidEnd:]";
    v15 = "completed";
    v14 = 2080;
    if (v3)
      v6 = "YES";
    v16 = 2080;
    v17 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  -[AVPresentationController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasAVKitAnimator");

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__AVPresentationController_presentationTransitionDidEnd___block_invoke;
    v10[3] = &unk_1E5BB2E68;
    v10[4] = self;
    v11 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
  }
}

- (void)_ensureOrientation:(int64_t)a3 enablingMixedOrientations:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
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
  AVFullScreenViewController *v55;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rotatableSecondWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v11);

    -[AVPresentationController context](self, "context");
    v55 = (AVFullScreenViewController *)objc_claimAutoreleasedReturnValue();
    -[AVFullScreenViewController avFullScreenViewController](v55, "avFullScreenViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attachContentView");
LABEL_10:

    goto LABEL_11;
  }
  -[AVPresentationController context](self, "context", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "allowsSecondWindowPresentations"))
  {
LABEL_7:

LABEL_8:
    -[AVPresentationController context](self, "context");
    v55 = (AVFullScreenViewController *)objc_claimAutoreleasedReturnValue();
    -[AVFullScreenViewController setWasInitiallyPresentedWithoutSecondWindow:](v55, "setWasInitiallyPresentedWithoutSecondWindow:", 1);
LABEL_11:

    return;
  }
  -[AVPresentationController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "wasInitiallyPresentedWithoutSecondWindow") & 1) != 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  -[AVPresentationController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPresentationController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "avkit_supportsAutorotationForInterfaceOrientationMask:", objc_msgSend(v10, "supportedInterfaceOrientations")) & 1) != 0)
  {

    goto LABEL_6;
  }
  -[AVPresentationController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentationWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "avkit_canAttemptSecondWindowForRotability");

  if ((v17 & 1) == 0)
    goto LABEL_8;
  -[AVPresentationController context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "avFullScreenViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[AVPresentationController context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rotatableSecondWindow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 1);

    v22 = objc_alloc(MEMORY[0x1E0DC3F98]);
    -[AVPresentationController containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "windowScene");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v22, "initWithWindowScene:", v25);
    -[AVPresentationController context](self, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRotatableSecondWindow:", v26);

    -[AVPresentationController context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentationWindow");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "windowLevel");
    v31 = v30 + 1.0;

    if (v31 >= *MEMORY[0x1E0DC5640])
      v31 = *MEMORY[0x1E0DC5640];
    -[AVPresentationController context](self, "context");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "rotatableSecondWindow");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWindowLevel:", v31);

    v55 = objc_alloc_init(AVFullScreenViewController);
    -[AVPresentationController context](self, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "rotatableSecondWindow");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRootViewController:", v55);

    -[AVPresentationController context](self, "context");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "avFullScreenViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationController context](self, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "rotatableWindowViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSourceFullScreenViewController:", v37);

    -[AVPresentationController context](self, "context");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "avFullScreenViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationController context](self, "context");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "rotatableWindowViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDelegate:", v42);

    -[AVPresentationController context](self, "context");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "rotatableWindowViewController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationController context](self, "context");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "avFullScreenViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAssociatedFullScreenViewController:", v46);

    -[AVPresentationController context](self, "context");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "rotatableSecondWindow");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "rootViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_setIgnoreAppSupportedOrientations:", 1);

    -[AVPresentationController context](self, "context");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "rotatableSecondWindow");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setHidden:", 0);

    -[AVPresentationController context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rotatableWindowViewController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "attachContentView");

    goto LABEL_10;
  }
}

- (void)dismissalTransitionWillBegin
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[AVPresentationController dismissalTransitionWillBegin]";
    v35 = 1024;
    v36 = 249;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  -[AVPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[AVPresentationController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);

  -[AVPresentationController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[AVPresentationController context](self, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "touchBlockingView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  -[AVPresentationController _prepareDismissingTransitionContext](self, "_prepareDismissingTransitionContext");
  -[AVPresentationController context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dismissingTransition");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v27, "hasAVKitAnimator");

  if ((_DWORD)v25)
  {
    -[AVPresentationController context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentedPresentationContainerView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "willBeginAdjustingOrientation");

    -[AVPresentationController context](self, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "dismissingTransition");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationController _ensureOrientation:enablingMixedOrientations:](self, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v31, "finalInterfaceOrientation"), 0);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __56__AVPresentationController_dismissalTransitionWillBegin__block_invoke;
    v32[3] = &unk_1E5BB4CA0;
    v32[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v32);
  }
}

- (void)_prepareDismissingTransitionContext
{
  AVPresentationContextTransition *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;

  v3 = objc_alloc_init(AVPresentationContextTransition);
  -[AVPresentationController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissingTransition:", v3);

  -[AVPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInteractive");
  -[AVPresentationController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissingTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWasInitiallyInteractive:", v7);

  -[AVPresentationController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitioningDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();
  -[AVPresentationController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissingTransition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHasAVKitAnimator:", v7 & 1);

  -[AVPresentationController containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "autorotates") & 1) != 0)
  {
    v16 = (void *)*MEMORY[0x1E0DC4730];
    -[AVPresentationController containerView](self, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "_supportedInterfaceOrientationsForWindow:", v18);
  }
  else
  {
    -[AVPresentationController containerView](self, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 1 << objc_msgSend(v18, "_windowInterfaceOrientation");
  }

  -[AVPresentationController presentingViewController](self, "presentingViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "shouldAutorotate"))
  {

LABEL_8:
    -[AVPresentationController presentingViewController](self, "presentingViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "supportedInterfaceOrientations");
    goto LABEL_9;
  }
  -[AVPresentationController presentingViewController](self, "presentingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "supportedInterfaceOrientations");
  -[AVPresentationController containerView](self, "containerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (1 << objc_msgSend(v24, "_windowInterfaceOrientation")) & (unint64_t)~v22;

  if (v25)
    goto LABEL_8;
  -[AVPresentationController containerView](self, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 1 << objc_msgSend(v27, "_windowInterfaceOrientation");

LABEL_9:
  v29 = v28 & v19;
  -[AVPresentationController context](self, "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dismissingTransition");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPresenterSupportedOrientations:", v29);

  -[AVPresentationController context](self, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "presentationWindow");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "windowScene");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "interfaceOrientation");
  -[AVPresentationController context](self, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dismissingTransition");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setInitialInterfaceOrientation:", v35);

  -[AVPresentationController context](self, "context");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "presentationWindow");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "interfaceOrientation");
  -[AVPresentationController context](self, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dismissingTransition");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setFinalInterfaceOrientation:", v39);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  _QWORD v24[5];
  BOOL v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[AVPresentationController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissingTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "wasCancelledWithInactiveScene"))
  {
    -[AVPresentationController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "activationState") != 0;

  }
  else
  {
    v12 = 0;
  }

  _AVLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    *(_DWORD *)buf = 136315650;
    v27 = "-[AVPresentationController dismissalTransitionDidEnd:]";
    v29 = "completed";
    v28 = 2080;
    if (v3)
      v14 = "YES";
    v30 = 2080;
    v31 = v14;
    _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  -[AVPresentationController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dismissingTransition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasAVKitAnimator");

  if (v17)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__AVPresentationController_dismissalTransitionDidEnd___block_invoke;
    v24[3] = &unk_1E5BB2E68;
    v24[4] = self;
    v25 = v3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v24);
  }
  else if (!v3)
  {
    -[AVPresentationController context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDismissingTransition:", 0);

  }
  if (v12)
  {
    -[AVPresentationController presentationWindowForDisablingAutorotation](self, "presentationWindowForDisablingAutorotation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[AVPresentationController context](self, "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "presentationWindow");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVPresentationController setPresentationWindowForDisablingAutorotation:](self, "setPresentationWindowForDisablingAutorotation:", v21);

      _AVLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[AVPresentationController presentationWindowForDisablingAutorotation](self, "presentationWindowForDisablingAutorotation");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v27 = "-[AVPresentationController dismissalTransitionDidEnd:]";
        v28 = 2048;
        v29 = v23;
        _os_log_impl(&dword_1AC4B1000, v22, OS_LOG_TYPE_DEFAULT, "%s Disabling autorotation for window: %p", buf, 0x16u);

      }
    }
  }
}

- (void)_observeSceneDidBecomeActiveForRestoringRotatability
{
  id v2;

  -[AVPresentationController observationController](self, "observationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startObservingNotificationForName:object:notificationCenter:observationHandler:", *MEMORY[0x1E0DC5308], 0, 0, &__block_literal_global_9402);

}

- (AVPresentationContext)context
{
  return self->_context;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (UIWindow)presentationWindowForDisablingAutorotation
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_presentationWindowForDisablingAutorotation);
}

- (void)setPresentationWindowForDisablingAutorotation:(id)a3
{
  objc_storeWeak((id *)&self->_presentationWindowForDisablingAutorotation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationWindowForDisablingAutorotation);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_presentedPresentationContainerView);
  objc_destroyWeak((id *)&self->_presentationController);
}

void __80__AVPresentationController__observeSceneDidBecomeActiveForRestoringRotatability__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v11)
  {
    _AVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "presentationWindowForDisablingAutorotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315394;
      v20 = "-[AVPresentationController _observeSceneDidBecomeActiveForRestoringRotatability]_block_invoke";
      v21 = 2048;
      v22 = v13;
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Enabling autorotation for window: %p", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(v5, "setPresentationWindowForDisablingAutorotation:", 0);
    objc_msgSend(v5, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentationWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v16, "interfaceOrientation"), 1);

    objc_msgSend(v5, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
}

void __54__AVPresentationController_dismissalTransitionDidEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _OWORD v61[3];

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedPresentationContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willBeginAdjustingOrientation");

  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v61[0] = *MEMORY[0x1E0C9BAA8];
  v61[1] = v5;
  v61[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v61);

  if (!*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldRemovePresentersView"))
    {
      objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewIfLoaded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isDescendantOfView:", v8);

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
        {
          v12 = (void *)i;

          objc_msgSend(v12, "superview");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "containerView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12 || v13 == v14)
            break;
          v10 = v12;
          objc_msgSend(v12, "superview");
        }
        objc_msgSend(v12, "removeFromSuperview");

      }
    }
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dismissingTransition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v17, "initialInterfaceOrientation"), 1);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "presentedView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "backgroundView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bounds");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "touchBlockingView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setFrame:", v41, v43, v45, v47);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "rotatableWindowViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      objc_msgSend(v51, "avkit_setNeedsUpdatePreferencesIfNeeded");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "presentedViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "avkit_setNeedsUpdatePreferencesIfNeeded");

    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setDismissingTransition:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "presentedPresentationContainerView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "didStopTransition");

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "rotatableSecondWindow");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setRotatableSecondWindow:", 0);

  }
}

void __56__AVPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rotatableSecondWindow");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_isInAWindow");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setViewDelegateContentOverlayInsetsAreClean:", 0);

    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentationWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentationWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutIfNeeded");

LABEL_4:
  }
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "backgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "touchBlockingView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v27, v29, v31, v33);

}

void __57__AVPresentationController_presentationTransitionDidEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
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
  void *v17;
  void *v18;
  void *v19;
  double v20;
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
  _OWORD v43[3];

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v43[0] = *MEMORY[0x1E0C9BAA8];
  v43[1] = v4;
  v43[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v43);

  if (*(_BYTE *)(a1 + 40))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_ensureOrientation:enablingMixedOrientations:", objc_msgSend(v7, "finalInterfaceOrientation"), 1);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentedView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "backgroundView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", v21, v23, v25, v27);

    objc_msgSend(*(id *)(a1 + 32), "containerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "touchBlockingView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v32, v34, v36, v38);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "presentedPresentationContainerView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "didStopTransition");

}

@end
