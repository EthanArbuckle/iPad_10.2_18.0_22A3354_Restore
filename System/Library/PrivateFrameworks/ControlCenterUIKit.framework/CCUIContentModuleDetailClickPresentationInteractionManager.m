@implementation CCUIContentModuleDetailClickPresentationInteractionManager

- (CCUIContentModuleDetailClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CCUIContentModuleDetailClickPresentationInteractionManager *v9;
  CCUIContentModuleDetailClickPresentationInteractionManager *v10;
  uint64_t v11;
  _UIClickPresentationInteraction *clickPresentationInteraction;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CCUIContentModuleDetailClickPresentationInteractionManager;
  v9 = -[CCUIContentModuleDetailClickPresentationInteractionManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4088]), "initWithDelegate:", v10);
    clickPresentationInteraction = v10->_clickPresentationInteraction;
    v10->_clickPresentationInteraction = (_UIClickPresentationInteraction *)v11;

    -[CCUIContentModuleDetailClickPresentationInteractionManager setDelegate:](v10, "setDelegate:", v8);
  }

  return v10;
}

- (void)presentViewController
{
  -[_UIClickPresentationInteraction present](self->_clickPresentationInteraction, "present");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v7;
  }

}

- (void)setViewForInteraction:(id)a3
{
  UIView *v5;
  UIView *viewForInteraction;
  UIView *v7;

  v5 = (UIView *)a3;
  viewForInteraction = self->_viewForInteraction;
  if (viewForInteraction != v5)
  {
    v7 = v5;
    -[UIView removeInteraction:](viewForInteraction, "removeInteraction:", self->_clickPresentationInteraction);
    objc_storeStrong((id *)&self->_viewForInteraction, a3);
    -[UIView addInteraction:](self->_viewForInteraction, "addInteraction:", self->_clickPresentationInteraction);
    v5 = v7;
  }

}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  CCUIContentModuleDetailClickPresentationInteractionManager *v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 2) == 0)
    return 1;
  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:", v4);

  return (char)v4;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD block[5];

  v4 = a3;
  v5 = (*(_BYTE *)&self->_delegateFlags & 4) == 0
    || !self->_authenticated
    && (block[0] = MEMORY[0x1E0C809B0],
        block[1] = 3221225472,
        block[2] = __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke,
        block[3] = &unk_1E8E20590,
        block[4] = self,
        dispatch_async(MEMORY[0x1E0C80D38], block),
        (*(_BYTE *)&self->_delegateFlags & 4) == 0)
    || self->_authenticated;

  return v5;
}

void __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, int);
  void *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2;
  v7 = &unk_1E8E207F8;
  v8 = v3;
  objc_msgSend(WeakRetained, "contentModuleDetailClickPresentationInteractionController:requestsAuthenticationForPresentationWithCompletionHandler:");

}

uint64_t __104__CCUIContentModuleDetailClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (a2)
    return objc_msgSend(v3, "present");
  objc_msgSend(v3, "cancelInteraction");
  return objc_msgSend(*(id *)(a1 + 32), "clickPresentationInteractionEnded:wasCancelled:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1);
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  CCUIContentModuleDetailTransitioningDelegate *v10;
  void *v11;
  CCUIContentModuleDetailTransitioningDelegate *v12;
  CCUIContentModuleDetailTransitioningDelegate *detailTransitioningDelegate;
  UIPresentationController *v14;
  UIPresentationController *presentationController;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  CCUIContentModuleDetailClickPresentationTransition *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  CCUIContentModuleDetailClickPresentationTransition *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  UIView *v35;
  UIView *v36;
  CCUIContentModuleDetailClickPresentationTransition *v38;

  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(WeakRetained, "presentedViewControllerForContentModuleDetailClickPresentationInteractionController:", self), v9 = (void *)objc_claimAutoreleasedReturnValue(), WeakRetained, v9))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView cancelTouchTracking](self->_viewForInteraction, "cancelTouchTracking");
    v10 = [CCUIContentModuleDetailTransitioningDelegate alloc];
    objc_msgSend(v7, "parentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CCUIContentModuleDetailTransitioningDelegate initWithAnchoringViewController:](v10, "initWithAnchoringViewController:", v11);
    detailTransitioningDelegate = self->_detailTransitioningDelegate;
    self->_detailTransitioningDelegate = v12;

    -[CCUIContentModuleDetailTransitioningDelegate presentationControllerForPresentedViewController:presentingViewController:sourceViewController:](self->_detailTransitioningDelegate, "presentationControllerForPresentedViewController:presentingViewController:sourceViewController:", v9, v7, v7);
    v14 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();
    presentationController = self->_presentationController;
    self->_presentationController = v14;

    -[CCUIContentModuleDetailTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:](self->_detailTransitioningDelegate, "animationControllerForPresentedController:presentingController:sourceController:", v9, v7, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    v18 = v16;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    v21 = v19;

    v22 = -[CCUIContentModuleDetailClickPresentationTransition initWithPresentedViewController:animationController:]([CCUIContentModuleDetailClickPresentationTransition alloc], "initWithPresentedViewController:animationController:", v9, v21);
    -[CCUIContentModuleDetailTransitioningDelegate animationControllerForDismissedController:](self->_detailTransitioningDelegate, "animationControllerForDismissedController:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    v25 = v23;
    v38 = v22;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    v28 = -[CCUIContentModuleDetailClickPresentationTransition initWithPresentedViewController:animationController:]([CCUIContentModuleDetailClickPresentationTransition alloc], "initWithPresentedViewController:animationController:", v9, v27);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4080]), "initWithPresentedViewController:presentationController:", v9, self->_presentationController);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "userInterfaceIdiom");
    -[UIViewController bs_presentationContextDefiningViewController](self->_presentingViewController, "bs_presentationContextDefiningViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v30)
    {
      objc_msgSend(v32, "superview");
      v34 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v34;
    }

    objc_msgSend(v20, "setCustomContainerView:", v33);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "viewForTouchContinuation");
      v35 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = self->_viewForInteraction;
    }
    v36 = v35;
    objc_msgSend(v20, "setCustomViewForTouchContinuation:", v35);
    objc_msgSend(v20, "setAppearanceTransition:", v38);
    objc_msgSend(v20, "setDisappearanceTransition:", v28);

  }
  else
  {
    objc_msgSend(v6, "cancelInteraction");
    v9 = 0;
    v20 = 0;
  }

  return v20;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  _BOOL8 v4;
  CCUIContentModuleDetailTransitioningDelegate *detailTransitioningDelegate;
  UIPresentationController *presentationController;
  id WeakRetained;

  v4 = a4;
  detailTransitioningDelegate = self->_detailTransitioningDelegate;
  self->_detailTransitioningDelegate = 0;

  presentationController = self->_presentationController;
  self->_presentationController = 0;

  self->_authenticated = 0;
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentModuleDetailClickPresentationInteractionControllerInteractionEnded:wasCancelled:", self, v4);

  }
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  void *v4;

  if (self->_viewForInteraction)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self->_viewForInteraction);
  else
    v4 = 0;
  return v4;
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  return 2;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (CCUIContentModuleDetailClickPresentationInteractionManagerDelegate)delegate
{
  return (CCUIContentModuleDetailClickPresentationInteractionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)viewForInteraction
{
  return self->_viewForInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_detailTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
}

@end
