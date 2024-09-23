@implementation QLItemAggregatedViewController

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  QLItemAggregatedViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v36;
  void *v37;
  void *v38;
  QLItemViewController **p_currentPreviewViewController;
  QLItemViewController *currentPreviewViewController;
  QLItemViewController *v41;
  uint64_t v42;
  QLItemViewController *v43;
  id v44;
  void (**v45)(_QWORD);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  void (**v53)(_QWORD);
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  QLItemViewController *v57;
  _QWORD aBlock[4];
  QLItemViewController *v59;
  QLItemAggregatedViewController *v60;
  id v61;
  _OWORD v62[3];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  _QWORD v69[3];

  v4 = a4;
  v69[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "parentViewController");
  v8 = (QLItemAggregatedViewController *)objc_claimAutoreleasedReturnValue();

  if (v8 != self)
  {
    objc_msgSend(v7, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "willMoveToParentViewController:", 0);
      objc_msgSend(v7, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      objc_msgSend(v7, "removeFromParentViewController");
    }
    objc_msgSend(v7, "willMoveToParentViewController:", self);
    -[QLItemAggregatedViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[QLItemAggregatedViewController addChildViewController:](self, "addChildViewController:", v7);
    objc_msgSend(v7, "didMoveToParentViewController:", self);
    if (self->_isVisible || self->_isAppearing)
      objc_msgSend(v7, "previewWillAppear:", self->_currentPreviewViewController != 0);
    -[QLItemAggregatedViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "transform");
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
      v63 = 0u;
    }
    objc_msgSend(v7, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v63;
    v62[1] = v64;
    v62[2] = v65;
    objc_msgSend(v15, "setTransform:", v62);

    -[QLItemAggregatedViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v7, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    objc_msgSend(v7, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[QLItemAggregatedViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD1628];
    v68 = CFSTR("preview");
    objc_msgSend(v7, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[preview]|"), 0, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addConstraints:", v31);

    -[QLItemAggregatedViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDD1628];
    v66 = CFSTR("preview");
    objc_msgSend(v7, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[preview]|"), 0, 0, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addConstraints:", v36);

    -[QLItemAggregatedViewController delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v37);

    -[QLItemViewController presentingDelegate](self, "presentingDelegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPresentingDelegate:", v38);

    p_currentPreviewViewController = &self->_currentPreviewViewController;
    currentPreviewViewController = self->_currentPreviewViewController;
    if (currentPreviewViewController)
    {
      v41 = currentPreviewViewController;
      -[QLItemViewController previewWillDisappear:](v41, "previewWillDisappear:", 0);
      v42 = MEMORY[0x24BDAC760];
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke;
      aBlock[3] = &unk_24C724728;
      v43 = v41;
      v59 = v43;
      v60 = self;
      v44 = v7;
      v61 = v44;
      v45 = (void (**)(_QWORD))_Block_copy(aBlock);
      objc_msgSend(v44, "view");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v4)
      {
        objc_msgSend(v46, "setAlpha:", 0.0);

        v48 = (void *)MEMORY[0x24BEBDB00];
        v56[0] = v42;
        v56[1] = 3221225472;
        v56[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_2;
        v56[3] = &unk_24C724B00;
        v57 = v43;
        objc_msgSend(v48, "animateWithDuration:delay:options:animations:completion:", 0x10000, v56, 0, 0.5, 0.1);
        v49 = (void *)MEMORY[0x24BEBDB00];
        v54[0] = v42;
        v54[1] = 3221225472;
        v54[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_3;
        v54[3] = &unk_24C724B00;
        v55 = v44;
        v52[0] = v42;
        v52[1] = 3221225472;
        v52[2] = __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_4;
        v52[3] = &unk_24C725600;
        v53 = v45;
        objc_msgSend(v49, "animateWithDuration:animations:completion:", v54, v52, 0.5);

      }
      else
      {
        objc_msgSend(v46, "setAlpha:", 1.0);

        v45[2](v45);
      }

    }
    else if (self->_isVisible)
    {
      objc_msgSend(v7, "previewDidAppear:", 1);
      self->_isAppearing = 0;
    }
    objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
    -[QLItemAggregatedViewController delegate](self, "delegate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController setDelegate:](*p_currentPreviewViewController, "setDelegate:", v50);

    -[QLItemViewController setAppearance:](*p_currentPreviewViewController, "setAppearance:", self->_appearance);
    -[QLItemViewController previewBecameFullScreen:animated:](*p_currentPreviewViewController, "previewBecameFullScreen:animated:", self->_fullScreen, 0);
    -[QLItemAggregatedViewController delegate](self, "delegate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "previewItemViewControllerDidChangeCurrentPreviewController:", self);

  }
}

uint64_t __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  result = objc_msgSend(*(id *)(a1 + 32), "previewDidDisappear:", 1);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1104))
  {
    result = objc_msgSend(*(id *)(a1 + 48), "previewDidAppear:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1105) = 0;
  }
  return result;
}

void __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __83__QLItemAggregatedViewController_showPreviewViewController_animatingWithCrossfade___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showPreviewViewController:(id)a3
{
  -[QLItemAggregatedViewController showPreviewViewController:animatingWithCrossfade:](self, "showPreviewViewController:animatingWithCrossfade:", a3, 1);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  objc_storeStrong((id *)&self->_appearance, a3);
  v7 = a3;
  -[QLItemViewController setAppearance:animated:](self->_currentPreviewViewController, "setAppearance:animated:", v7, v4);

}

- (id)appearance
{
  return self->_appearance;
}

- (void)setDelegate:(id)a3
{
  QLPreviewItemViewControllerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  -[QLItemViewController setDelegate:](self->_currentPreviewViewController, "setDelegate:", v5);

}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject **v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  QLItemAggregatedViewController *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewWillAppear:](&v7, sel_previewWillAppear_);
  if (self->_isVisible)
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEBUG, "previewWillAppear was called when the controller was already visible (after previewDidAppear) (%@) #AggregatedViewController", buf, 0xCu);
    }
  }
  self->_isAppearing = 1;
  -[QLItemViewController previewWillAppear:](self->_currentPreviewViewController, "previewWillAppear:", v3);
}

- (void)previewIsAppearingWithProgress:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewIsAppearingWithProgress:](&v5, sel_previewIsAppearingWithProgress_);
  -[QLItemViewController previewIsAppearingWithProgress:](self->_currentPreviewViewController, "previewIsAppearingWithProgress:", a3);
}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  QLItemViewController *currentPreviewViewController;
  objc_super v7;

  v3 = a3;
  -[QLItemAggregatedViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentPreviewViewController = self->_currentPreviewViewController;
  -[QLItemViewController edgePanGestureWidth](currentPreviewViewController, "edgePanGestureWidth");
  objc_msgSend(v5, "previewItemViewController:wantsToSetRemoteEdgePanGestureWidth:", currentPreviewViewController);

  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewDidAppear:](&v7, sel_previewDidAppear_, v3);
  self->_isVisible = 1;
  self->_isAppearing = 0;
  -[QLItemViewController previewDidAppear:](self->_currentPreviewViewController, "previewDidAppear:", v3);
}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewWillDisappear:](&v5, sel_previewWillDisappear_);
  -[QLItemViewController previewWillDisappear:](self->_currentPreviewViewController, "previewWillDisappear:", v3);
}

- (void)previewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  self->_isAppearing = 0;
  if (self->_isVisible)
  {
    v3 = a3;
    self->_isVisible = 0;
    v5.receiver = self;
    v5.super_class = (Class)QLItemAggregatedViewController;
    -[QLItemViewController previewDidDisappear:](&v5, sel_previewDidDisappear_);
    -[QLItemViewController previewDidDisappear:](self->_currentPreviewViewController, "previewDidDisappear:", v3);
  }
}

- (void)previewWillFinishAppearing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewWillFinishAppearing](&v3, sel_previewWillFinishAppearing);
  -[QLItemViewController previewWillFinishAppearing](self->_currentPreviewViewController, "previewWillFinishAppearing");
}

- (void)previewBecameFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  self->_fullScreen = a3;
  -[QLItemViewController previewBecameFullScreen:animated:](self->_currentPreviewViewController, "previewBecameFullScreen:animated:");
  v7.receiver = self;
  v7.super_class = (Class)QLItemAggregatedViewController;
  -[QLItemViewController previewBecameFullScreen:animated:](&v7, sel_previewBecameFullScreen_animated_, v5, v4);
}

- (void)hostApplicationDidBecomeActive
{
  -[QLItemViewController hostApplicationDidBecomeActive](self->_currentPreviewViewController, "hostApplicationDidBecomeActive");
}

- (void)hostSceneWillDeactivate
{
  -[QLItemViewController hostSceneWillDeactivate](self->_currentPreviewViewController, "hostSceneWillDeactivate");
}

- (void)hostApplicationDidEnterBackground:(id)a3
{
  -[QLItemViewController hostApplicationDidEnterBackground:](self->_currentPreviewViewController, "hostApplicationDidEnterBackground:", a3);
}

- (void)prepareForActionSheetPresentation
{
  -[QLItemViewController prepareForActionSheetPresentation](self->_currentPreviewViewController, "prepareForActionSheetPresentation");
}

- (void)actionSheetDidDismiss
{
  -[QLItemViewController actionSheetDidDismiss](self->_currentPreviewViewController, "actionSheetDidDismiss");
}

- (void)documentMenuActionWillBegin
{
  -[QLItemViewController documentMenuActionWillBegin](self->_currentPreviewViewController, "documentMenuActionWillBegin");
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  -[QLItemViewController hostViewControllerBackgroundColorChanged:](self->_currentPreviewViewController, "hostViewControllerBackgroundColorChanged:", a3);
}

- (BOOL)canEnterFullScreen
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController canEnterFullScreen](currentPreviewViewController, "canEnterFullScreen");
  return (char)currentPreviewViewController;
}

- (id)accessoryView
{
  return -[QLItemViewController accessoryView](self->_currentPreviewViewController, "accessoryView");
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  return -[QLItemViewController toolbarButtonsForTraitCollection:](self->_currentPreviewViewController, "toolbarButtonsForTraitCollection:", a3);
}

- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3
{
  return -[QLItemViewController excludedToolbarButtonIdentifiersForTraitCollection:](self->_currentPreviewViewController, "excludedToolbarButtonIdentifiersForTraitCollection:", a3);
}

- (id)registeredKeyCommands
{
  return -[QLItemViewController registeredKeyCommands](self->_currentPreviewViewController, "registeredKeyCommands");
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  -[QLItemViewController handlePerformedKeyCommandIfNeeded:](self->_currentPreviewViewController, "handlePerformedKeyCommandIfNeeded:", a3);
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  objc_super v5;

  if (self->_currentPreviewViewController)
    return -[QLItemViewController shouldAcceptTouch:ofGestureRecognizer:](self->_currentPreviewViewController, "shouldAcceptTouch:ofGestureRecognizer:", a3, a4);
  v5.receiver = self;
  v5.super_class = (Class)QLItemAggregatedViewController;
  return -[QLItemViewController shouldAcceptTouch:ofGestureRecognizer:](&v5, sel_shouldAcceptTouch_ofGestureRecognizer_, a3, a4);
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  return -[QLItemViewController shouldRecognizeGestureRecognizer:](self->_currentPreviewViewController, "shouldRecognizeGestureRecognizer:", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return -[QLItemViewController gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](self->_currentPreviewViewController, "gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", a3, a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return -[QLItemViewController gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](self->_currentPreviewViewController, "gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:", a3, a4);
}

- (id)safeAreaLayoutGuide
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[QLItemAggregatedViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "parentViewController");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)QLItemAggregatedViewController;
    -[QLItemAggregatedViewController safeAreaLayoutGuide](&v10, sel_safeAreaLayoutGuide);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)canSwipeToDismiss
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController canSwipeToDismiss](currentPreviewViewController, "canSwipeToDismiss");
  return (char)currentPreviewViewController;
}

- (BOOL)canToggleFullScreen
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController canToggleFullScreen](currentPreviewViewController, "canToggleFullScreen");
  return (char)currentPreviewViewController;
}

- (BOOL)canClickToToggleFullscreen
{
  objc_super v3;

  if (self->_currentPreviewViewController)
    return -[QLItemViewController canClickToToggleFullscreen](self->_currentPreviewViewController, "canClickToToggleFullscreen");
  v3.receiver = self;
  v3.super_class = (Class)QLItemAggregatedViewController;
  return -[QLItemViewController canClickToToggleFullscreen](&v3, sel_canClickToToggleFullscreen);
}

- (BOOL)canPinchToDismiss
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController canPinchToDismiss](currentPreviewViewController, "canPinchToDismiss");
  return (char)currentPreviewViewController;
}

- (BOOL)canShowToolBar
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  return !currentPreviewViewController
      || -[QLItemViewController canShowToolBar](currentPreviewViewController, "canShowToolBar");
}

- (BOOL)canShowNavBar
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  return !currentPreviewViewController
      || -[QLItemViewController canShowNavBar](currentPreviewViewController, "canShowNavBar");
}

- (BOOL)canBeLocked
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController canBeLocked](currentPreviewViewController, "canBeLocked");
  return (char)currentPreviewViewController;
}

- (void)requestLockForCurrentItem
{
  -[QLItemViewController requestLockForCurrentItem](self->_currentPreviewViewController, "requestLockForCurrentItem");
}

- (id)scrollView
{
  return -[QLItemViewController scrollView](self->_currentPreviewViewController, "scrollView");
}

- (id)parallaxView
{
  return -[QLItemViewController parallaxView](self->_currentPreviewViewController, "parallaxView");
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return -[QLItemViewController canPerformFirstTimeAppearanceActions:](self->_currentPreviewViewController, "canPerformFirstTimeAppearanceActions:", a3);
}

- (void)performFirstTimeAppearanceActions:(unint64_t)a3
{
  -[QLItemViewController performFirstTimeAppearanceActions:](self->_currentPreviewViewController, "performFirstTimeAppearanceActions:", a3);
}

- (void)notifyStateRestorationWithUserInfo:(id)a3
{
  -[QLItemViewController notifyStateRestorationWithUserInfo:](self->_currentPreviewViewController, "notifyStateRestorationWithUserInfo:", a3);
}

- (id)stateRestorationDictionary
{
  return -[QLItemViewController stateRestorationDictionary](self->_currentPreviewViewController, "stateRestorationDictionary");
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController automaticallyUpdateScrollViewContentOffset](currentPreviewViewController, "automaticallyUpdateScrollViewContentOffset");
  return (char)currentPreviewViewController;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController automaticallyUpdateScrollViewContentInset](currentPreviewViewController, "automaticallyUpdateScrollViewContentInset");
  return (char)currentPreviewViewController;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  QLItemViewController *currentPreviewViewController;

  currentPreviewViewController = self->_currentPreviewViewController;
  if (currentPreviewViewController)
    LOBYTE(currentPreviewViewController) = -[QLItemViewController automaticallyUpdateScrollViewIndicatorInset](currentPreviewViewController, "automaticallyUpdateScrollViewIndicatorInset");
  return (char)currentPreviewViewController;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  int64_t result;

  result = (int64_t)self->_currentPreviewViewController;
  if (result)
    return objc_msgSend((id)result, "preferredWhitePointAdaptivityStyle");
  return result;
}

- (id)printer
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLItemViewController printer](self->_currentPreviewViewController, "printer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[QLItemViewController preferredContentSize](self->_currentPreviewViewController, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)title
{
  return (id)-[QLItemViewController title](self->_currentPreviewViewController, "title");
}

- (id)fullscreenBackgroundColor
{
  return -[QLItemViewController fullscreenBackgroundColor](self->_currentPreviewViewController, "fullscreenBackgroundColor");
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
  -[QLItemViewController prepareForInvalidationWithCompletionHandler:](self->_currentPreviewViewController, "prepareForInvalidationWithCompletionHandler:", a3);
}

- (double)edgePanGestureWidth
{
  return 0.0;
}

- (CGRect)contentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[QLItemViewController contentFrame](self->_currentPreviewViewController, "contentFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)supportsChromeless
{
  return -[QLItemViewController supportsChromeless](self->_currentPreviewViewController, "supportsChromeless");
}

- (BOOL)navigationBarShouldBeChromeless
{
  return -[QLItemViewController navigationBarShouldBeChromeless](self->_currentPreviewViewController, "navigationBarShouldBeChromeless");
}

- (BOOL)toolbarShouldBeChromeless
{
  return -[QLItemViewController toolbarShouldBeChromeless](self->_currentPreviewViewController, "toolbarShouldBeChromeless");
}

- (id)transitioningView
{
  if (self->_currentPreviewViewController)
    -[QLItemViewController transitioningView](self->_currentPreviewViewController, "transitioningView");
  else
    -[QLItemAggregatedViewController view](self, "view");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transitionDidStart:(BOOL)a3
{
  -[QLItemViewController transitionDidStart:](self->_currentPreviewViewController, "transitionDidStart:", a3);
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  -[QLItemViewController transitionDidFinish:didComplete:](self->_currentPreviewViewController, "transitionDidFinish:didComplete:", a3, a4);
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  -[QLItemViewController transitionWillFinish:didComplete:](self->_currentPreviewViewController, "transitionWillFinish:didComplete:", a3, a4);
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](self->_currentPreviewViewController, "buttonPressedWithIdentifier:completionHandler:", a3, a4);
}

- (id)draggableView
{
  return 0;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  -[QLItemViewController savePreviewEditedCopyWithCompletionHandler:](self->_currentPreviewViewController, "savePreviewEditedCopyWithCompletionHandler:", a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (QLItemViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
