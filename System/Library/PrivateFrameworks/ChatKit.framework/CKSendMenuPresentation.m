@implementation CKSendMenuPresentation

- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 sendMenuViewController:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKSendMenuPresentation *v15;
  CKSendMenuPresentation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKSendMenuPresentation;
  v15 = -[CKSendMenuPresentation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_overlayPresentationContext, a3);
    objc_storeStrong((id *)&v16->_presentingViewController, a4);
    objc_storeStrong((id *)&v16->_sendMenuViewController, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    v16->_presentationState = 0;
  }

  return v16;
}

- (CKSendMenuPresentation)initWithOverlayPresentationContext:(id)a3 presentingViewController:(id)a4 appCardContentViewController:(id)a5 appCardPresentationStyle:(unint64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKSendMenuPresentation *v17;
  CKSendMenuPresentation *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CKSendMenuPresentation;
  v17 = -[CKSendMenuPresentation init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_overlayPresentationContext, a3);
    objc_storeStrong((id *)&v18->_presentingViewController, a4);
    objc_storeStrong((id *)&v18->_appCardContentViewController, a5);
    v18->_appCardPresentationStyle = a6;
    objc_storeWeak((id *)&v18->_delegate, v16);
    v18->_presentationState = 0;
  }

  return v18;
}

- (int64_t)presentationStyle
{
  return -[CKSceneOverlayPresentationContext presentationStyle](self->_overlayPresentationContext, "presentationStyle");
}

- (void)beginPresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CKSendMenuPresentation *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (self->_presentationState)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    self->_presentationState = 1;
    -[CKSendMenuPresentation presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__CKSendMenuPresentation_beginPresentationWithCompletion___block_invoke;
    v14 = &unk_1E274C2E0;
    v15 = self;
    v16 = v5;
    v8 = _Block_copy(&v11);
    -[CKSendMenuPresentation overlayPresentationContext](self, "overlayPresentationContext", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "presentationStyle");

    if (v10)
    {
      if (v10 == 1)
        -[CKSendMenuPresentation _beginPopoverPresentationWithCompletion:](self, "_beginPopoverPresentationWithCompletion:", v8);
    }
    else
    {
      -[CKSendMenuPresentation _beginFullscreenPresentationWithCompletion:](self, "_beginFullscreenPresentationWithCompletion:", v8);
    }

  }
}

uint64_t __58__CKSendMenuPresentation_beginPresentationWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentationState:", 2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_beginPopoverPresentationWithCompletion:(id)a3
{
  CKSceneOverlayPresentationContext *overlayPresentationContext;
  id v5;
  CKSendMenuPopoverTransitioningDelegate *v6;
  CKSendMenuPopoverViewController *v7;
  void *v8;
  CKSendMenuViewController *sendMenuViewController;
  CKSendMenuViewController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CKSendMenuPopoverPresentationControllerAnchorItem *v25;
  CKSendMenuPopoverPresentationControllerAnchorItem *v26;
  void *v27;
  id v28;

  overlayPresentationContext = self->_overlayPresentationContext;
  v5 = a3;
  -[CKSceneOverlayPresentationContext anchorView](overlayPresentationContext, "anchorView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(CKSendMenuPopoverTransitioningDelegate);
  -[CKSendMenuPresentation setSendMenuTransitioningDelegate:](self, "setSendMenuTransitioningDelegate:", v6);

  v7 = objc_alloc_init(CKSendMenuPopoverViewController);
  -[CKSendMenuPresentation setPopoverRootViewController:](self, "setPopoverRootViewController:", v7);

  -[CKSendMenuPresentation popoverRootViewController](self, "popoverRootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  sendMenuViewController = self->_sendMenuViewController;
  if (sendMenuViewController)
  {
    v10 = sendMenuViewController;
    -[CKSendMenuViewController updatePreferredContentSize](v10, "updatePreferredContentSize");
    -[CKSendMenuViewController preferredContentSize](v10, "preferredContentSize");
    v12 = v11;
    v14 = v13;

    -[CKSendMenuPresentation sendMenuViewController](self, "sendMenuViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[CKSendMenuPresentation sendMenuViewController](self, "sendMenuViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 0);

    -[CKSendMenuPresentation sendMenuViewController](self, "sendMenuViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v12, v14);

    -[CKSendMenuPresentation popoverRootViewController](self, "popoverRootViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v12, v14);

  }
  else
  {
    -[CKSceneOverlayPresentationContext willPresentAppCard](self->_overlayPresentationContext, "willPresentAppCard");
  }
  -[CKSendMenuPresentation sendMenuTransitioningDelegate](self, "sendMenuTransitioningDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPopoverViewController setTransitioningDelegate:](self->_popoverRootViewController, "setTransitioningDelegate:", v23);

  -[CKSendMenuPopoverViewController setModalPresentationStyle:](self->_popoverRootViewController, "setModalPresentationStyle:", 4);
  -[CKSendMenuPopoverViewController presentationController](self->_popoverRootViewController, "presentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [CKSendMenuPopoverPresentationControllerAnchorItem alloc];
  objc_msgSend(v28, "bounds");
  v26 = -[CKSendMenuPopoverPresentationControllerAnchorItem initWithView:rect:](v25, "initWithView:rect:", v28);
  objc_msgSend(v24, "setAnchorItem:", v26);

  objc_msgSend(v24, "setDelegate:", self);
  objc_msgSend(v24, "setSendMenuViewController:", self->_sendMenuViewController);
  objc_msgSend(v24, "setAppCardContentViewController:", self->_appCardContentViewController);
  if (self->_appCardContentViewController)
    objc_msgSend(v24, "setAppCardPresentationStyle:", self->_appCardPresentationStyle);
  -[CKSendMenuPresentation presentingViewController](self, "presentingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", self->_popoverRootViewController, 1, v5);

}

- (void)rePresentSendMenu
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Ignoring request to re-present send menu that has already been fully dismissed. The view is (probably) no longer in the view hierarchy.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_beginFullscreenPresentationWithCompletion:(id)a3
{
  CKSendMenuPresentationDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);

  p_delegate = &self->_delegate;
  v20 = (void (**)(void))a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "requestShowKeyboardSnapshotForSendMenu");

  self->_hasRequestedKeyboardSnapshot = 1;
  -[UIViewController view](self->_presentingViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CKSendMenuViewController view](self->_sendMenuViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[UIViewController view](self->_presentingViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuViewController view](self->_sendMenuViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v20[2]();
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t presentationState;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;
  _BYTE location[24];
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_overlayPresentationContext)
  {
    if ((unint64_t)(self->_presentationState - 1) >= 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          presentationState = self->_presentationState;
          *(_DWORD *)location = 134217984;
          *(_QWORD *)&location[4] = presentationState;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Ignoring request to dismiss the send menu because the presentation state currently is: %li.", location, 0xCu);
        }

      }
    }
    else
    {
      self->_presentationState = 3;
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, self);
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __53__CKSendMenuPresentation_dismissAnimated_completion___block_invoke;
      v15 = &unk_1E2755AD8;
      objc_copyWeak(&v17, (id *)location);
      v16 = v6;
      v7 = _Block_copy(&v12);
      -[CKSendMenuPresentation overlayPresentationContext](self, "overlayPresentationContext", v12, v13, v14, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "presentationStyle");

      if (v9)
      {
        if (v9 == 1)
          -[CKSendMenuPresentation _dismissPopoverPresentationAnimated:completion:](self, "_dismissPopoverPresentationAnimated:completion:", v4, v7);
      }
      else
      {
        -[CKSendMenuPresentation _dismissFullscreenPresentationAnimated:completion:](self, "_dismissFullscreenPresentationAnimated:completion:", v4, v7);
      }

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)location);
    }
  }

}

uint64_t __53__CKSendMenuPresentation_dismissAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  if ((_DWORD)a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setPresentationState:", 4);
    objc_msgSend(WeakRetained, "_delegateDidDismissSendMenu");
    objc_msgSend(WeakRetained, "setOverlayPresentationContext:", 0);
    objc_msgSend(WeakRetained, "setSendMenuViewController:", 0);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)__dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  CKSendMenuPopoverViewController *popoverRootViewController;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  popoverRootViewController = self->_popoverRootViewController;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CKSendMenuPresentation___dismissPopoverPresentationAnimated_completion___block_invoke;
  v9[3] = &unk_1E274DA38;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[CKSendMenuPopoverViewController dismissViewControllerAnimated:completion:](popoverRootViewController, "dismissViewControllerAnimated:completion:", v4, v9);

}

uint64_t __74__CKSendMenuPresentation___dismissPopoverPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setSendMenuViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPopoverRootViewController:", 0);
}

- (void)_dismissPopoverPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v6 = a4;
  v8 = v6;
  if (a3)
  {
    -[CKSendMenuPresentation __dismissPopoverPresentationAnimated:completion:](self, "__dismissPopoverPresentationAnimated:completion:", 1, v6, v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CEABB8];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__CKSendMenuPresentation__dismissPopoverPresentationAnimated_completion___block_invoke;
    v10[3] = &unk_1E2755B00;
    v10[4] = self;
    v12 = 0;
    v11 = v6;
    objc_msgSend(v7, "_performWithoutDeferringTransitions:", v10, v8);

  }
}

uint64_t __73__CKSendMenuPresentation__dismissPopoverPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__dismissPopoverPresentationAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_dismissFullscreenPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if (v4)
  {
    -[CKSendMenuPresentation sendMenuViewController](self, "sendMenuViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performFullScreenDismissAnimationWithCompletion:", v8);

    v7 = v6;
  }
  else
  {
    -[CKSendMenuPresentation removeSendMenuFromViewHierarchy](self, "removeSendMenuFromViewHierarchy");
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
    v7 = v8;
  }

}

- (void)removeSendMenuFromViewHierarchy
{
  void *v3;
  void *v4;

  -[CKSendMenuPresentation requestDismissKeyboardSnapshotForSendMenuIfNeeded](self, "requestDismissKeyboardSnapshotForSendMenuIfNeeded");
  -[CKSendMenuPresentation sendMenuViewController](self, "sendMenuViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[CKSendMenuViewController setSendMenuViewControllerDelegate:](self->_sendMenuViewController, "setSendMenuViewControllerDelegate:", 0);
}

- (void)requestDismissKeyboardSnapshotForSendMenuIfNeeded
{
  id WeakRetained;

  if (self->_hasRequestedKeyboardSnapshot)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "requestDismissKeyboardSnapshotForSendMenu");

    self->_hasRequestedKeyboardSnapshot = 0;
  }
}

- (void)layout
{
  void *v3;
  uint64_t v4;

  -[CKSendMenuPresentation overlayPresentationContext](self, "overlayPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationStyle");

  if (!v4)
    -[CKSendMenuPresentation _layoutFullScreenSendMenuView](self, "_layoutFullScreenSendMenuView");
  -[CKSendMenuPresentation informSendMenuOfAnchorViewPositionChangeIfNecessary](self, "informSendMenuOfAnchorViewPositionChangeIfNecessary");
}

- (void)informSendMenuOfAnchorViewPositionChangeIfNecessary
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
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  id v20;
  CGRect v21;

  -[CKSceneOverlayPresentationContext anchorView](self->_overlayPresentationContext, "anchorView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v20, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v21.origin.x = v13;
  v21.origin.y = v15;
  v21.size.width = v17;
  v21.size.height = v19;
  if (!CGRectEqualToRect(self->_lastAnchorViewRectInWindow, v21))
  {
    self->_lastAnchorViewRectInWindow.origin.x = v13;
    self->_lastAnchorViewRectInWindow.origin.y = v15;
    self->_lastAnchorViewRectInWindow.size.width = v17;
    self->_lastAnchorViewRectInWindow.size.height = v19;
    -[CKSendMenuPopoverViewController anchorViewDidMove](self->_popoverRootViewController, "anchorViewDidMove");
    -[CKSendMenuViewController anchorViewDidMove](self->_sendMenuViewController, "anchorViewDidMove");
  }

}

- (void)_layoutFullScreenSendMenuView
{
  void *v3;
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
  id v14;

  -[CKSendMenuPresentation presentingViewController](self, "presentingViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKSendMenuViewController view](self->_sendMenuViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)_delegateDidDismissSendMenu
{
  void *v3;
  id v4;

  -[CKSceneOverlayPresentationContext didDismissSendMenuPresentation](self->_overlayPresentationContext, "didDismissSendMenuPresentation");
  -[CKSendMenuPresentation delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPresentation overlayPresentationContext](self, "overlayPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissSendMenu:usingPresentationContext:", self, v3);

}

- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  CKSceneOverlayPresentationContext *overlayPresentationContext;
  id v9;
  id v10;
  id v11;

  overlayPresentationContext = self->_overlayPresentationContext;
  v9 = a5;
  v10 = a3;
  -[CKSceneOverlayPresentationContext willPresentAppCard](overlayPresentationContext, "willPresentAppCard");
  -[CKSendMenuPopoverViewController presentationController](self->_popoverRootViewController, "presentationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentCardWithContentViewController:style:completion:", v10, a4, v9);

}

- (void)enforceSendMenuOrderingInWindowSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CKSendMenuPresentation overlayPresentationContext](self, "overlayPresentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationStyle");

  if (!v4)
  {
    -[UIViewController view](self->_presentingViewController, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuViewController view](self->_sendMenuViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bringSubviewToFront:", v6);

  }
}

- (id)newPopoverLayoutMetrics
{
  CKSendMenuPopoverViewController *popoverRootViewController;
  void *v3;
  void *v4;

  popoverRootViewController = self->_popoverRootViewController;
  if (!popoverRootViewController)
    return 0;
  -[CKSendMenuPopoverViewController presentationController](popoverRootViewController, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (void *)objc_msgSend(v3, "newPopoverLayoutMetrics");
  else
    v4 = 0;

  return v4;
}

- (void)sendMenuPresentationControllerWantsToBeDismissed:(id)a3
{
  if (self->_presentationState == 2)
    -[CKSendMenuPresentation dismissAnimated:completion:](self, "dismissAnimated:completion:", 1, 0);
}

- (void)sendMenuPresentationControllerWillDismiss:(id)a3
{
  id WeakRetained;

  -[CKSceneOverlayPresentationContext willDismissSendMenuPresentation](self->_overlayPresentationContext, "willDismissSendMenuPresentation", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sendMenuPresentationWillDismiss:", self);

}

- (void)sendMenuPresentationController:(id)a3 didChangePopoverLayoutMetrics:(id)a4
{
  -[CKSceneOverlayPresentationContext didChangePopoverMetrics:](self->_overlayPresentationContext, "didChangePopoverMetrics:", a4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)appCardDidAppearInSendMenuPopoverViewController:(id)a3
{
  -[CKSceneOverlayPresentationContext appCardDidAppearInPopover](self->_overlayPresentationContext, "appCardDidAppearInPopover", a3);
}

- (CKSendMenuViewController)sendMenuViewController
{
  return self->_sendMenuViewController;
}

- (void)setSendMenuViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sendMenuViewController, a3);
}

- (CKSceneOverlayPresentationContext)overlayPresentationContext
{
  return self->_overlayPresentationContext;
}

- (void)setOverlayPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_overlayPresentationContext, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIViewController)appCardContentViewController
{
  return self->_appCardContentViewController;
}

- (void)setAppCardContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appCardContentViewController, a3);
}

- (unint64_t)appCardPresentationStyle
{
  return self->_appCardPresentationStyle;
}

- (void)setAppCardPresentationStyle:(unint64_t)a3
{
  self->_appCardPresentationStyle = a3;
}

- (CKSendMenuPresentationDelegate)delegate
{
  return (CKSendMenuPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (CKSendMenuPopoverTransitioningDelegate)sendMenuTransitioningDelegate
{
  return self->_sendMenuTransitioningDelegate;
}

- (void)setSendMenuTransitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_sendMenuTransitioningDelegate, a3);
}

- (CKSendMenuPopoverViewController)popoverRootViewController
{
  return self->_popoverRootViewController;
}

- (void)setPopoverRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverRootViewController, a3);
}

- (CGRect)lastAnchorViewRectInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastAnchorViewRectInWindow.origin.x;
  y = self->_lastAnchorViewRectInWindow.origin.y;
  width = self->_lastAnchorViewRectInWindow.size.width;
  height = self->_lastAnchorViewRectInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastAnchorViewRectInWindow:(CGRect)a3
{
  self->_lastAnchorViewRectInWindow = a3;
}

- (BOOL)hasRequestedKeyboardSnapshot
{
  return self->_hasRequestedKeyboardSnapshot;
}

- (void)setHasRequestedKeyboardSnapshot:(BOOL)a3
{
  self->_hasRequestedKeyboardSnapshot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverRootViewController, 0);
  objc_storeStrong((id *)&self->_sendMenuTransitioningDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appCardContentViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_overlayPresentationContext, 0);
  objc_storeStrong((id *)&self->_sendMenuViewController, 0);
}

@end
