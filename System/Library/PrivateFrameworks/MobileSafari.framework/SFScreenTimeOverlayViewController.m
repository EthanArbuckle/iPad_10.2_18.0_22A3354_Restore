@implementation SFScreenTimeOverlayViewController

- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  STBlockingViewController *blockingViewController;
  void *v10;
  id v11;
  STBlockingViewController *v12;
  STBlockingViewController *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double Width;
  uint64_t v29;
  STBlockingViewController *v30;
  _Unwind_Exception *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  CGRect v43;

  v5 = a5;
  v8 = a3;
  blockingViewController = self->_blockingViewController;
  if (!blockingViewController)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v10 = (void *)getSTBlockingViewControllerClass_softClass;
    v42 = getSTBlockingViewControllerClass_softClass;
    if (!getSTBlockingViewControllerClass_softClass)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = (uint64_t)__getSTBlockingViewControllerClass_block_invoke;
      v37 = &unk_1E21E3330;
      v38 = &v39;
      __getSTBlockingViewControllerClass_block_invoke((uint64_t)&v34);
      v10 = (void *)v40[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v39, 8);
    v12 = (STBlockingViewController *)objc_msgSend(v11, "newTranslucentBlockingViewController");
    v13 = self->_blockingViewController;
    self->_blockingViewController = v12;

    -[STBlockingViewController view](self->_blockingViewController, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = (uint64_t)&v34;
    v36 = 0x2020000000;
    v16 = (_QWORD *)getSTBlockingViewDidHideNotificationSymbolLoc_ptr;
    v37 = (void *)getSTBlockingViewDidHideNotificationSymbolLoc_ptr;
    if (!getSTBlockingViewDidHideNotificationSymbolLoc_ptr)
    {
      v17 = (void *)ScreenTimeUILibrary();
      v16 = dlsym(v17, "STBlockingViewDidHideNotification");
      *(_QWORD *)(v35 + 24) = v16;
      getSTBlockingViewDidHideNotificationSymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&v34, 8);
    if (!v16)
    {
      v32 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:].cold.1();
      _Block_object_dispose(&v39, 8);
      _Unwind_Resume(v32);
    }
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__blockingViewDidHide_, *v16, self->_blockingViewController);

    blockingViewController = self->_blockingViewController;
  }
  -[STBlockingViewController updateAppearanceUsingPolicy:forWebpageURL:](blockingViewController, "updateAppearanceUsingPolicy:forWebpageURL:", a4, v8);
  -[SFScreenTimeOverlayViewController childViewControllers](self, "childViewControllers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", self->_blockingViewController);

  if ((v19 & 1) == 0)
  {
    -[STBlockingViewController beginAppearanceTransition:animated:](self->_blockingViewController, "beginAppearanceTransition:animated:", 1, v5);
    -[SFScreenTimeOverlayViewController addChildViewController:](self, "addChildViewController:", self->_blockingViewController);
    -[SFScreenTimeOverlayViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlockingViewController view](self->_blockingViewController, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v20);
    _NSDictionaryOfVariableBindings(CFSTR("blockingView"), v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[blockingView]|"), 0, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[blockingView]|"), 0, 0, v21);
    v23 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v26);

    -[STBlockingViewController didMoveToParentViewController:](self->_blockingViewController, "didMoveToParentViewController:", self);
    -[STBlockingViewController endAppearanceTransition](self->_blockingViewController, "endAppearanceTransition");
    -[STBlockingViewController showWithAnimation:completionHandler:](self->_blockingViewController, "showWithAnimation:completionHandler:", v5, 0);

    v8 = v23;
  }
  -[STBlockingViewController view](self->_blockingViewController, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  Width = CGRectGetWidth(v43);
  v29 = _SFSizeClassForWidth(Width);

  -[SFScreenTimeOverlayViewController _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:](self, "_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:", v29);
  v30 = self->_blockingViewController;

  return v30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width;
  objc_super v6;

  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SFScreenTimeOverlayViewController;
  -[SFScreenTimeOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[SFScreenTimeOverlayViewController _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:](self, "_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:", _SFSizeClassForWidth(width));
}

- (void)_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:(int64_t)a3
{
  STBlockingViewController *blockingViewController;
  double additionalVerticalSafeAreaMargin;
  double v6;
  double v7;

  blockingViewController = self->_blockingViewController;
  if (blockingViewController)
  {
    additionalVerticalSafeAreaMargin = self->_additionalVerticalSafeAreaMargin;
    v6 = additionalVerticalSafeAreaMargin + 46.0;
    if (a3 == 1)
      v7 = additionalVerticalSafeAreaMargin + 46.0;
    else
      v7 = additionalVerticalSafeAreaMargin + 94.0;
    if (a3 != 1)
      v6 = 0.0;
    -[STBlockingViewController setAdditionalSafeAreaInsets:](blockingViewController, "setAdditionalSafeAreaInsets:", v7, 0.0, v6, 0.0);
  }
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  id v4;
  STBlockingViewController *blockingViewController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[STBlockingViewController beginAppearanceTransition:animated:](self->_blockingViewController, "beginAppearanceTransition:animated:", 0, 1);
  -[STBlockingViewController willMoveToParentViewController:](self->_blockingViewController, "willMoveToParentViewController:", 0);
  blockingViewController = self->_blockingViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__SFScreenTimeOverlayViewController_hideBlockingViewControllerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E21E25E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[STBlockingViewController hideWithAnimation:completionHandler:](blockingViewController, "hideWithAnimation:completionHandler:", 1, v7);

}

uint64_t __85__SFScreenTimeOverlayViewController_hideBlockingViewControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "removeFromParentViewController");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "endAppearanceTransition");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAdditionalVerticalSafeAreaMargin:(double)a3
{
  void *v4;
  double Width;
  uint64_t v6;
  CGRect v7;

  if (self->_additionalVerticalSafeAreaMargin != a3)
  {
    self->_additionalVerticalSafeAreaMargin = a3;
    -[STBlockingViewController view](self->_blockingViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    Width = CGRectGetWidth(v7);
    v6 = _SFSizeClassForWidth(Width);

    -[SFScreenTimeOverlayViewController _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:](self, "_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:", v6);
  }
}

- (void)_blockingViewDidHide:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "screenTimeOverlayViewController:didFinishDismissingBlockingViewController:", self, v5);

  }
}

- (SFScreenTimeOverlayViewControllerDelegate)delegate
{
  return (SFScreenTimeOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)additionalVerticalSafeAreaMargin
{
  return self->_additionalVerticalSafeAreaMargin;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blockingViewController, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (uint64_t)showBlockingViewControllerForURL:withPolicy:animated:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getSTBlockingViewControllerClass_block_invoke_cold_1(v0);
}

@end
