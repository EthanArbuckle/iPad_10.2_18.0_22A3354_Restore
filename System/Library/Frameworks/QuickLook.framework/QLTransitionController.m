@implementation QLTransitionController

- (void)setUpWithTransitionContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
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
  QLTransitionContext *v27;
  void *v28;
  void *v29;
  void *v30;
  QLTransitionContext *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  UIView *v36;
  UIView *transitionBackgroundView;
  void *v38;
  void *v39;
  UIView *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UINavigationController *v52;
  UINavigationController *disabledNavigationController;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id startTransitionBlock;
  void *v60;
  void *v61;
  int isKindOfClass;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  id v71;
  _QWORD aBlock[4];
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  QLTransitionController *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v71 = a3;
  v6 = a4;
  v7 = (NSObject **)MEMORY[0x24BE7BF48];
  v8 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v77 = self;
    v78 = 2112;
    v79 = v71;
    _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_INFO, "QLTransitionController (%@) is being setup (%@). #AppearanceTransition", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTransitionController setSetupDate:](self, "setSetupDate:", v9);

  -[QLTransitionController setTransitionContext:](self, "setTransitionContext:", v71);
  if (_os_feature_enabled_impl())
  {
    -[QLTransitionController previewController](self, "previewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateStatusBarAnimated:", 0);

    -[QLTransitionController previewController](self, "previewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutIfNeeded");

  }
  -[QLTransitionController previewController](self, "previewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    if (-[QLTransitionController showing](self, "showing"))
      v16 = 1;
    else
      v16 = 3;
    -[QLTransitionController previewController](self, "previewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTransitionController previewController](self, "previewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "previewController:willTransitionToState:", v19, v16);

  }
  -[QLTransitionController transitionContext](self, "transitionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTransitionController transitionContext](self, "transitionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTransitionController transitionContext](self, "transitionContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[QLTransitionController showing](self, "showing"))
  {
    objc_msgSend(v21, "addSubview:", v23);
    objc_msgSend(v23, "setHidden:", 1);
  }
  else
  {
    -[QLTransitionController previewController](self, "previewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "insertSubview:below:", v23, v26);

  }
  -[QLTransitionController _view:applyFrameFromTransitionContextAsFinalFrame:isToView:](self, "_view:applyFrameFromTransitionContextAsFinalFrame:isToView:", v70, 0, 0);
  -[QLTransitionController _view:applyFrameFromTransitionContextAsFinalFrame:isToView:](self, "_view:applyFrameFromTransitionContextAsFinalFrame:isToView:", v23, 1, 1);
  v27 = [QLTransitionContext alloc];
  -[QLTransitionController previewController](self, "previewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTransitionController transitionContext](self, "transitionContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[QLTransitionContext initWithQLPreviewController:containerView:toViewController:](v27, "initWithQLPreviewController:containerView:toViewController:", v28, v21, v30);
  -[QLTransitionController setQuickLookTransitionContext:](self, "setQuickLookTransitionContext:", v31);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTransitionController previewController](self, "previewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackgroundColor:", v32);

  v35 = objc_alloc(MEMORY[0x24BEBDB00]);
  objc_msgSend(v21, "bounds");
  v36 = (UIView *)objc_msgSend(v35, "initWithFrame:");
  transitionBackgroundView = self->_transitionBackgroundView;
  self->_transitionBackgroundView = v36;

  -[QLTransitionController previewController](self, "previewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_preferredBackgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_transitionBackgroundView, "setBackgroundColor:", v39);

  v40 = self->_transitionBackgroundView;
  -[QLTransitionController previewController](self, "previewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertSubview:below:", v40, v42);

  -[QLTransitionController previewController](self, "previewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "presentationMode") == 1;

  if (v44)
  {
    -[QLTransitionController previewController](self, "previewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "fullScreen"))
    {
      v46 = -[QLTransitionController showing](self, "showing");

      if (v46)
      {
LABEL_20:
        -[QLTransitionController previewController](self, "previewController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "internalNavigationController");
        v52 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
        disabledNavigationController = self->_disabledNavigationController;
        self->_disabledNavigationController = v52;

        -[UINavigationController view](self->_disabledNavigationController, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setUserInteractionEnabled:", 0);

        goto LABEL_21;
      }
      -[QLTransitionController previewController](self, "previewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "navigationController");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "navigationBar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setAlpha:", 0.01);

      -[QLTransitionController previewController](self, "previewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "toolbarController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setOriginalToolbarAlpha:", 0.0);

    }
    goto LABEL_20;
  }
LABEL_21:
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[QLTransitionController previewController](self, "previewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "updateStatusBarAnimated:", 1);

  }
  -[QLTransitionController updateTransitionWithProgress:](self, "updateTransitionWithProgress:", 0.0);
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke;
  aBlock[3] = &unk_24C725320;
  objc_copyWeak(&v75, (id *)buf);
  v56 = v6;
  v74 = v56;
  v57 = v23;
  v73 = v57;
  v58 = _Block_copy(aBlock);
  startTransitionBlock = self->_startTransitionBlock;
  self->_startTransitionBlock = v58;

  -[QLTransitionController previewController](self, "previewController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "currentAnimator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (((-[QLTransitionController showing](self, "showing") | isKindOfClass) & 1) == 0)
    -[QLTransitionController _prepareTimedForcedDismissal](self, "_prepareTimedForcedDismissal");
  -[QLTransitionController previewController](self, "previewController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "previewCollection");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "isAvailable");

  if (v65)
  {
    -[QLTransitionController previewController](self, "previewController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "previewCollection");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isRemote");

    if (v68)
    {
      -[QLTransitionController quickLookTransitionContext](self, "quickLookTransitionContext");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "prepareContextToSend");

    }
    QLRunInBackgroundThread();
  }
  else
  {
    -[QLTransitionController _performStartBlockIfNeeded](self, "_performStartBlockIfNeeded");
  }

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)buf);

}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;

  objc_copyWeak(&v4, a1 + 6);
  v3 = a1[5];
  v2 = a1[4];
  QLRunInMainThread();

  objc_destroyWeak(&v4);
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  int v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setTransitionState:", 1);

  v4 = (void *)MEMORY[0x24BEBDB00];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_3;
  v17[3] = &unk_24C725230;
  objc_copyWeak(&v18, v2);
  objc_msgSend(v4, "animateWithDuration:animations:", v17, 0.2);
  v5 = objc_loadWeakRetained(v2);
  v6 = objc_msgSend(v5, "showing");

  if (v6)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "updateTransitionWithProgress:", 0.0);

  }
  v8 = (NSObject **)MEMORY[0x24BE7BF48];
  v9 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = objc_loadWeakRetained(v2);
    *(_DWORD *)buf = 138412290;
    v20 = v11;
    _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_INFO, "QLTransitionController (%@) setup is done, calling handler to perform transition. #AppearanceTransition", buf, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(void))(v12 + 16))();
  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "quickLookTransitionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", 1);

  v16 = objc_loadWeakRetained(v2);
  LODWORD(v13) = objc_msgSend(v16, "showing");

  if ((_DWORD)v13)
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_destroyWeak(&v18);
}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "previewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsStatusBarAppearanceUpdate");

}

void __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_7(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BE7BF48];
  v3 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_INFO, "QLTransitionController (%@) is notifying preview collection about transition #AppearanceTransition", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "previewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "quickLookTransitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v8, "showing");
  v10 = *(unsigned __int8 *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_8;
  v11[3] = &unk_24C724B00;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "startTransitionWithSourceViewProvider:transitionController:presenting:useInteractiveTransition:completionHandler:", v7, v8, v9, v10, v11);

}

uint64_t __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_8()
{
  return QLRunInMainThread();
}

uint64_t __71__QLTransitionController_setUpWithTransitionContext_completionHandler___block_invoke_2_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performStartBlockIfNeeded");
}

- (void)_prepareTimedForcedDismissal
{
  __assert_rtn("-[QLTransitionController _prepareTimedForcedDismissal]", "QLTransitionController.m", 193, "!self.showing && !useInteractiveTransition");
}

void __54__QLTransitionController__prepareTimedForcedDismissal__block_invoke(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __54__QLTransitionController__prepareTimedForcedDismissal__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      v6 = objc_loadWeakRetained(v1);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Forced dismissal of QLPreviewController after timeout with animator: %@ #PreviewController", (uint8_t *)&v8, 0xCu);

    }
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "_performForcedDismissal");

  }
}

- (void)_performStartBlockIfNeeded
{
  void (**startTransitionBlock)(id, SEL);
  id v4;

  startTransitionBlock = (void (**)(id, SEL))self->_startTransitionBlock;
  if (startTransitionBlock)
  {
    startTransitionBlock[2](startTransitionBlock, a2);
    v4 = self->_startTransitionBlock;
    self->_startTransitionBlock = 0;

  }
}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "QLTransitionController is completing transition. didComplete:%@ #AppearanceTransition", (uint8_t *)&v9, 0xCu);

  }
  -[QLTransitionController _completeOverlayTransition:](self, "_completeOverlayTransition:", v3);
  -[QLTransitionController _completeBackgroundTransition:](self, "_completeBackgroundTransition:", v3);
}

- (void)tearDownTransition:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  NSObject *v7;
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
  UINavigationController *disabledNavigationController;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  BOOL v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  -[QLTransitionController setTransitionState:](self, "setTransitionState:", 2);
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl(&dword_20D4F5000, v7, OS_LOG_TYPE_INFO, "QLTransitionController is tearing down transition. didComplete:%@ #AppearanceTransition", buf, 0xCu);

  }
  -[QLTransitionController _performStartBlockIfNeeded](self, "_performStartBlockIfNeeded");
  -[QLTransitionController previewController](self, "previewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateStatusBarAnimated:", 1);

  -[QLTransitionController transitionContext](self, "transitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTransitionController transitionContext](self, "transitionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTransitionController previewController](self, "previewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  -[QLTransitionController quickLookTransitionContext](self, "quickLookTransitionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sourceView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 0);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  -[QLTransitionController previewController](self, "previewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_updateBackgroundColor");

  -[UIView removeFromSuperview](self->_transitionBackgroundView, "removeFromSuperview");
  if (v3)
  {
    -[QLTransitionController _view:applyFrameFromTransitionContextAsFinalFrame:isToView:](self, "_view:applyFrameFromTransitionContextAsFinalFrame:isToView:", v13, 1, 0);
    -[QLTransitionController _view:applyFrameFromTransitionContextAsFinalFrame:isToView:](self, "_view:applyFrameFromTransitionContextAsFinalFrame:isToView:", v11, 1, 1);
  }
  -[UINavigationController view](self->_disabledNavigationController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", 1);

  disabledNavigationController = self->_disabledNavigationController;
  self->_disabledNavigationController = 0;

  -[QLTransitionController previewController](self, "previewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "previewCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isRemote");

  if (v22)
  {
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __45__QLTransitionController_tearDownTransition___block_invoke;
    v36 = &unk_24C724CF8;
    v37 = v14;
    v38 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], &v33);
    v23 = v37;
  }
  else
  {
    v24 = *v5;
    if (!*v5)
    {
      QLSInitLogging();
      v24 = *v5;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4F5000, v24, OS_LOG_TYPE_INFO, "About to tearDownTransition with non-remote previewCollection #AppearanceTransition", buf, 2u);
    }
    objc_msgSend(v14, "previewCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tearDownTransition:", v3);
  }

  -[QLTransitionController transitionContext](self, "transitionContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "completeTransition:", v3);

  -[QLTransitionController previewController](self, "previewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    if (-[QLTransitionController showing](self, "showing"))
      v29 = 1;
    else
      v29 = 3;
    -[QLTransitionController previewController](self, "previewController", v33, v34, v35, v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTransitionController previewController](self, "previewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "previewController:didTransitionToState:", v32, v29);

  }
}

void __45__QLTransitionController_tearDownTransition___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = (NSObject **)MEMORY[0x24BE7BF48];
  v3 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_INFO, "About to tearDownTransition with remote previewCollection #AppearanceTransition", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "previewCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tearDownTransition:", *(unsigned __int8 *)(a1 + 40));

}

- (UIViewController)presenterViewController
{
  UIViewControllerContextTransitioning **p_transitionContext;
  void *WeakRetained;
  id v4;
  id v5;
  uint64_t v6;

  p_transitionContext = &self->_transitionContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_transitionContext);
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)p_transitionContext);
      objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
      v6 = objc_claimAutoreleasedReturnValue();

      WeakRetained = (void *)v6;
    }
  }
  return (UIViewController *)WeakRetained;
}

- (QLPreviewController)previewController
{
  UIViewControllerContextTransitioning **p_transitionContext;
  void *WeakRetained;
  id v4;
  id v5;
  uint64_t v6;

  p_transitionContext = &self->_transitionContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_transitionContext);
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = objc_loadWeakRetained((id *)p_transitionContext);
      objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
      v6 = objc_claimAutoreleasedReturnValue();

      WeakRetained = (void *)v6;
    }
  }
  return (QLPreviewController *)WeakRetained;
}

- (void)_performTransition
{
  void *v3;
  id WeakRetained;
  _QWORD v5[5];
  _QWORD v6[5];

  if (!-[QLTransitionController hasPerformedTransition](self, "hasPerformedTransition"))
  {
    -[QLTransitionController setHasPerformedTransition:](self, "setHasPerformedTransition:", 1);
    v3 = (void *)MEMORY[0x24BEBDB00];
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
    -[QLTransitionController transitionDuration:](self, "transitionDuration:", WeakRetained);
    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__QLTransitionController__performTransition__block_invoke;
    v6[3] = &unk_24C724B00;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __44__QLTransitionController__performTransition__block_invoke_2;
    v5[3] = &unk_24C724B28;
    objc_msgSend(v3, "animateWithDuration:animations:completion:", v6, v5);

  }
}

uint64_t __44__QLTransitionController__performTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTransitionWithProgress:", 1.0);
}

uint64_t __44__QLTransitionController__performTransition__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "tearDownTransition:", 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_storeWeak((id *)&self->_transitionContext, v4);
  objc_initWeak(&location, self);
  -[QLTransitionController previewController](self, "previewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__QLTransitionController_animateTransition___block_invoke;
  v6[3] = &unk_24C725348;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "waitForPreviewCollectionWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __44__QLTransitionController_animateTransition___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__QLTransitionController_animateTransition___block_invoke_2;
  v5[3] = &unk_24C725230;
  objc_copyWeak(&v6, v2);
  objc_msgSend(WeakRetained, "setUpWithTransitionContext:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
}

void __44__QLTransitionController_animateTransition___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performTransition");

}

- (void)updateTransitionWithProgress:(double)a3
{
  QLRunInMainThread();
}

uint64_t __55__QLTransitionController_updateTransitionWithProgress___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateOverlayTransitionWithProgress:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundTransitionWithProgress:", *(double *)(a1 + 40));
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  self->_duration = a4;
  QLRunInMainThread();
}

uint64_t __58__QLTransitionController_completeTransition_withDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", *(unsigned __int8 *)(a1 + 40));
}

- ($9F4668F2352A2F7A80B9EC1B630AA830)_requiredVisualStateTransitions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  $9F4668F2352A2F7A80B9EC1B630AA830 result;

  -[QLTransitionController previewController](self, "previewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationMode");

  -[QLTransitionController previewController](self, "previewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "presentationMode");

  -[QLTransitionController previewController](self, "previewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fullScreen");

  -[QLTransitionController previewController](self, "previewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previousNavigationVCState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "toolBarHidden");

  -[QLTransitionController previewController](self, "previewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toolbarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isOriginalToolbarHidden");

  -[QLTransitionController previewController](self, "previewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toolbarController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isAccessoryViewHidden");

  v18 = v14 ^ 1;
  v19 = 0x10000000000;
  if (v4 == 2)
  {
    v20 = 1;
    v21 = 0x1000000;
  }
  else
  {
    if ((v8 & (v6 != 1)) == 0)
      v19 = 0;
    if (v8 & (v6 != 1) | v18 & 1)
    {
      v21 = 0;
    }
    else
    {
      v21 = 0;
      v19 = 0x10000000000;
      if (v11 | v17)
        v19 = 0;
    }
    v20 = v8;
  }
  v22 = v6 == 1;
  v23 = v20 | v18 | v11 | v17;
  v24 = 0x100000000;
  if (v23)
    v24 = 0;
  v25 = 0x10000;
  if (v20 | v11 ^ 1 | v17 & v14)
    v25 = 0;
  v26 = 256;
  if (v20 | v14 | v11 | v17)
    v26 = 0;
  v27 = v23 ^ 1u;
  v28 = 0x1000000000000;
  if (v11)
    v28 = 0;
  v29 = v22 & v8;
  if ((v22 & v8) != 0)
    v30 = v28;
  else
    v30 = 0;
  v31 = v20 == 0;
  v32 = 0x100000000000000;
  if (v31)
    v32 = 0;
  v33 = v21 | v32 | v19 | v30 | v25 | v24 | v26 | v27;
  result.var0 = v33;
  result.var1 = BYTE1(v33);
  result.var2 = BYTE2(v33);
  result.var3 = BYTE3(v33);
  result.var4 = BYTE4(v33);
  result.var5 = BYTE5(v33);
  result.var6 = BYTE6(v33);
  result.var7 = HIBYTE(v33);
  result.var8 = v29;
  return result;
}

- (void)_updateOverlayTransitionWithProgress:(double)a3
{
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  double v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v59 = 134217984;
    v60 = a3;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, "QLTransitionController is updating overlay with progress:%f #AppearanceTransition", (uint8_t *)&v59, 0xCu);
  }
  v7 = -[QLTransitionController _requiredVisualStateTransitions](self, "_requiredVisualStateTransitions");
  v8 = v7;
  v10 = v9;
  if ((v7 & 1) != 0)
  {
    if (-[QLTransitionController showing](self, "showing"))
      v11 = 1.0 - a3;
    else
      v11 = a3;
    -[QLTransitionController previewController](self, "previewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toolbarController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessoryViewAlpha:", v11);

    if ((v8 & 0x100) == 0)
    {
LABEL_7:
      if ((v8 & 0x10000) == 0)
        goto LABEL_8;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x100) == 0)
  {
    goto LABEL_7;
  }
  -[QLTransitionController previewController](self, "previewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "toolbarController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[QLTransitionController showing](self, "showing");
  v17 = 1.0 - a3;
  if (!v16)
    v17 = a3;
  objc_msgSend(v15, "setAccessoryViewHiddenProgress:", v17);

  -[QLTransitionController previewController](self, "previewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "toolbarController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateLayout");

  if ((v8 & 0x10000) == 0)
  {
LABEL_8:
    if ((v8 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_20;
  }
LABEL_17:
  -[QLTransitionController previewController](self, "previewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "toolbarController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "originalToolbar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_removeAllAnimations:", 1);

  -[QLTransitionController previewController](self, "previewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "toolbarController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[QLTransitionController showing](self, "showing");
  v26 = 1.0 - a3;
  if (!v25)
    v26 = a3;
  objc_msgSend(v24, "setHiddenProgress:", v26);

  -[QLTransitionController previewController](self, "previewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "toolbarController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateLayout");

  if ((v8 & 0x1000000) != 0)
  {
LABEL_20:
    if (-[QLTransitionController showing](self, "showing"))
      v29 = a3;
    else
      v29 = 1.0 - a3;
    -[QLTransitionController previewController](self, "previewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "toolbarController");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "setToolbarAlpha:", v29);

    -[QLTransitionController previewController](self, "previewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_msgSend(v32, "fullScreen");

    if ((v31 & 1) == 0)
    {
      if (-[QLTransitionController showing](self, "showing"))
        v33 = a3;
      else
        v33 = 1.0 - a3;
      -[QLTransitionController previewController](self, "previewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setToolbarGradientAlpha:", v33);

    }
  }
LABEL_28:
  if ((v8 & 0x10000000000) == 0)
  {
    if ((v8 & 0x1000000000000) == 0)
      goto LABEL_30;
LABEL_36:
    -[QLTransitionController previewController](self, "previewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "toolbarController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "restoreOriginalConfiguration");

    -[QLTransitionController previewController](self, "previewController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "toolbarController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "originalToolbar");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_removeAllAnimations:", 1);

    if (-[QLTransitionController showing](self, "showing"))
      v46 = 1.0 - a3;
    else
      v46 = a3;
    -[QLTransitionController previewController](self, "previewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "toolbarController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setOriginalToolbarAlpha:", v46);

    if ((v8 & 0x100000000000000) == 0)
      goto LABEL_48;
    goto LABEL_40;
  }
  -[QLTransitionController previewController](self, "previewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "toolbarController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "originalToolbar");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_removeAllAnimations:", 1);

  if (-[QLTransitionController showing](self, "showing"))
    v38 = a3;
  else
    v38 = 1.0 - a3;
  -[QLTransitionController previewController](self, "previewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "toolbarController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setOriginalToolbarAlpha:", v38);

  if ((v8 & 0x1000000000000) != 0)
    goto LABEL_36;
LABEL_30:
  if ((v8 & 0x100000000000000) == 0)
    goto LABEL_48;
LABEL_40:
  if (-[QLTransitionController showing](self, "showing"))
    v49 = a3;
  else
    v49 = 1.0 - a3;
  -[QLTransitionController previewController](self, "previewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "internalNavigationController");
  v51 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v51, "navigationBar");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAlpha:", v49);

  -[QLTransitionController previewController](self, "previewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v51) = objc_msgSend(v53, "fullScreen");

  if ((v51 & 1) == 0)
  {
    if (-[QLTransitionController showing](self, "showing"))
      v54 = a3;
    else
      v54 = 1.0 - a3;
    -[QLTransitionController previewController](self, "previewController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setNavigationBarGradientAlpha:", v54);

  }
LABEL_48:
  if ((v10 & 1) != 0)
  {
    -[QLTransitionController presenterViewController](self, "presenterViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "navigationController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "navigationBar");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setAlpha:", a3);

  }
}

- (void)_updateBackgroundTransitionWithProgress:(double)a3
{
  _BOOL4 v5;
  double v6;

  v5 = -[QLTransitionController showing](self, "showing");
  v6 = 1.0 - a3;
  if (v5)
    v6 = a3;
  -[UIView setAlpha:](self->_transitionBackgroundView, "setAlpha:", v6);
}

- (void)_completeOverlayTransition:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  id v40;

  v3 = a3;
  v5 = -[QLTransitionController _requiredVisualStateTransitions](self, "_requiredVisualStateTransitions");
  v6 = v5;
  if ((v5 & 1) != 0)
  {
    -[QLTransitionController previewController](self, "previewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toolbarController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryViewAlpha:", 1.0);

    if ((v6 & 0x100) == 0)
    {
LABEL_3:
      if ((v6 & 0x10000) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v9 = -[QLTransitionController showing](self, "showing") ^ v3;
  -[QLTransitionController previewController](self, "previewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolbarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessoryViewHidden:", v9);

  -[QLTransitionController previewController](self, "previewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toolbarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateLayout");

  if ((v6 & 0x10000) == 0)
  {
LABEL_4:
    if ((v6 & 0x1000000) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v14 = -[QLTransitionController showing](self, "showing") ^ v3;
  -[QLTransitionController previewController](self, "previewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toolbarController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v14);

  -[QLTransitionController previewController](self, "previewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toolbarController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateLayout");

  if ((v6 & 0x1000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x10000000000) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_11:
  v19 = -[QLTransitionController showing](self, "showing");
  v20 = 0.0;
  if (v3)
    v21 = 1.0;
  else
    v21 = 0.0;
  if (!v3)
    v20 = 1.0;
  if (v19)
    v22 = v21;
  else
    v22 = v20;
  -[QLTransitionController previewController](self, "previewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "toolbarController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setToolbarAlpha:", v22);

  if ((v6 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x100000000000000) == 0)
      return;
    goto LABEL_29;
  }
LABEL_20:
  -[QLTransitionController previewController](self, "previewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "toolbarController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "originalToolbar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_removeAllAnimations:", 1);

  v28 = -[QLTransitionController showing](self, "showing");
  v29 = 0.0;
  if (v3)
    v30 = 1.0;
  else
    v30 = 0.0;
  if (!v3)
    v29 = 1.0;
  if (v28)
    v31 = v30;
  else
    v31 = v29;
  -[QLTransitionController previewController](self, "previewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "toolbarController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setOriginalToolbarAlpha:", v31);

  if ((v6 & 0x100000000000000) != 0)
  {
LABEL_29:
    v34 = -[QLTransitionController showing](self, "showing");
    v35 = 0.0;
    if (v3)
      v36 = 1.0;
    else
      v36 = 0.0;
    if (!v3)
      v35 = 1.0;
    if (v34)
      v37 = v36;
    else
      v37 = v35;
    -[QLTransitionController previewController](self, "previewController");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "internalNavigationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "navigationBar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAlpha:", v37);

  }
}

- (void)_completeBackgroundTransition:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  double v6;
  double v7;

  v3 = a3;
  v5 = -[QLTransitionController showing](self, "showing");
  v6 = 0.0;
  if (v3)
    v7 = 1.0;
  else
    v7 = 0.0;
  if (!v3)
    v6 = 1.0;
  if (v5)
    v6 = v7;
  -[UIView setAlpha:](self->_transitionBackgroundView, "setAlpha:", v6);
}

- (void)_view:(id)a3 applyFrameFromTransitionContextAsFinalFrame:(BOOL)a4 isToView:(BOOL)a5
{
  _BOOL4 v5;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CGRect v22;

  v5 = a5;
  v21 = a3;
  v8 = (id *)MEMORY[0x24BEBE9B0];
  if (!v5)
    v8 = (id *)MEMORY[0x24BEBE9A0];
  v9 = *v8;
  -[QLTransitionController transitionContext](self, "transitionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTransitionController transitionContext](self, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewControllerForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_msgSend(v10, "finalFrameForViewController:", v12);
  else
    objc_msgSend(v10, "initialFrameForViewController:", v12);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;

  v22.origin.x = v17;
  v22.origin.y = v18;
  v22.size.width = v19;
  v22.size.height = v20;
  if (!CGRectEqualToRect(v22, *MEMORY[0x24BDBF090]))
    objc_msgSend(v21, "setFrame:", v17, v18, v19, v20);

}

- (BOOL)forceDismissalIfNeeded
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  NSObject **v8;
  int v10;
  QLTransitionController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[QLTransitionController showing](self, "showing"))
    goto LABEL_9;
  if (-[QLTransitionController hasPerformedTransition](self, "hasPerformedTransition"))
  {
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      v8 = (NSObject **)MEMORY[0x24BE7BF48];
      QLSInitLogging();
      v3 = *v8;
    }
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v4)
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_INFO, "QLTransitionController (%@) did not perform forced dismissal because dismissal has already been performed successfully. #AppearanceTransition", (uint8_t *)&v10, 0xCu);
LABEL_9:
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    -[QLTransitionController setupDate](self, "setupDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = v6;

    if (v7 >= -5.0)
      goto LABEL_9;
    -[QLTransitionController _performForcedDismissal](self, "_performForcedDismissal");
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_performForcedDismissal
{
  __assert_rtn("-[QLTransitionController _performForcedDismissal]", "QLTransitionController.m", 537, "!self.showing");
}

uint64_t __49__QLTransitionController__performForcedDismissal__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performStartBlockIfNeeded");
}

- (QLTransitionController)initWithCoder:(id)a3
{

  return 0;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (QLTransitionContext)quickLookTransitionContext
{
  return (QLTransitionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQuickLookTransitionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (QLCustomTransitioning)animatedController
{
  return (QLCustomTransitioning *)objc_getProperty(self, a2, 48, 1);
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return (UIViewControllerContextTransitioning *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (void)setTransitionContext:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContext, a3);
}

- (id)transitionDriver
{
  return objc_getProperty(self, a2, 64, 1);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (void)setTransitionState:(unint64_t)a3
{
  self->_transitionState = a3;
}

- (NSDate)setupDate
{
  return self->_setupDate;
}

- (void)setSetupDate:(id)a3
{
  objc_storeStrong((id *)&self->_setupDate, a3);
}

- (BOOL)hasPerformedTransition
{
  return self->_hasPerformedTransition;
}

- (void)setHasPerformedTransition:(BOOL)a3
{
  self->_hasPerformedTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupDate, 0);
  objc_storeStrong(&self->_transitionDriver, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_animatedController, 0);
  objc_storeStrong((id *)&self->_quickLookTransitionContext, 0);
  objc_storeStrong(&self->_startTransitionBlock, 0);
  objc_storeStrong((id *)&self->_disabledNavigationController, 0);
  objc_storeStrong((id *)&self->_transitionBackgroundView, 0);
}

@end
