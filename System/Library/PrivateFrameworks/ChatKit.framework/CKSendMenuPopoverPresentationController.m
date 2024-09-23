@implementation CKSendMenuPopoverPresentationController

- (CKSendMenuPopoverPresentationController)initWithConfiguration:(id)a3 popoverViewController:(id)a4 presentingViewController:(id)a5
{
  id v9;
  CKSendMenuPopoverPresentationController *v10;
  CKSendMenuPopoverPresentationController *v11;
  void *v12;
  void *v13;
  CKPopoverViewLayout *v14;
  CKPopoverViewLayout *popoverLayout;
  CKPopoverViewLayoutMetrics *layoutMetricsCommunicatedToDelegate;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKSendMenuPopoverPresentationController;
  v10 = -[CKSendMenuPopoverPresentationController initWithPresentedViewController:presentingViewController:](&v21, sel_initWithPresentedViewController_presentingViewController_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newSendMenuPopoverLayoutConfiguration");

    v14 = -[CKPopoverViewLayout initWithConfiguration:]([CKPopoverViewLayout alloc], "initWithConfiguration:", v13);
    popoverLayout = v11->_popoverLayout;
    v11->_popoverLayout = v14;

    v11->_presentationState = 0;
    layoutMetricsCommunicatedToDelegate = v11->_layoutMetricsCommunicatedToDelegate;
    v11->_layoutMetricsCommunicatedToDelegate = 0;

    -[CKSendMenuPopoverPresentationController traitOverrides](v11, "traitOverrides");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNSIntegerValue:forTrait:", 3, v18);

    -[CKSendMenuPopoverPresentationController traitOverrides](v11, "traitOverrides");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHorizontalSizeClass:", 1);

  }
  return v11;
}

- (BOOL)isPresenting
{
  int64_t presentationState;

  presentationState = self->_presentationState;
  return presentationState == 2 || presentationState == 4;
}

- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem
{
  return -[CKSendMenuPopoverPresentationConfiguration anchorItem](self->_configuration, "anchorItem");
}

- (void)setAnchorItem:(id)a3
{
  -[CKSendMenuPopoverPresentationConfiguration setAnchorItem:](self->_configuration, "setAnchorItem:", a3);
}

- (UIViewController)sendMenuViewController
{
  return -[CKSendMenuPopoverPresentationConfiguration sendMenuViewController](self->_configuration, "sendMenuViewController");
}

- (void)setSendMenuViewController:(id)a3
{
  -[CKSendMenuPopoverPresentationConfiguration setSendMenuViewController:](self->_configuration, "setSendMenuViewController:", a3);
}

- (UIViewController)appCardContentViewController
{
  return -[CKSendMenuPopoverPresentationConfiguration appCardContentViewController](self->_configuration, "appCardContentViewController");
}

- (void)setAppCardContentViewController:(id)a3
{
  -[CKSendMenuPopoverPresentationConfiguration setAppCardContentViewController:](self->_configuration, "setAppCardContentViewController:", a3);
}

- (unint64_t)appCardPresentationStyle
{
  return -[CKSendMenuPopoverPresentationConfiguration appCardPresentationStyle](self->_configuration, "appCardPresentationStyle");
}

- (void)setAppCardPresentationStyle:(unint64_t)a3
{
  -[CKSendMenuPopoverPresentationConfiguration setAppCardPresentationStyle:](self->_configuration, "setAppCardPresentationStyle:", a3);
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController setDelegate:](&v3, sel_setDelegate_, a3);
}

- (CKSendMenuPopoverPresentationControllerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController delegate](&v3, sel_delegate);
  return (CKSendMenuPopoverPresentationControllerDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_didComputePopoverLayoutMetrics:(id)a3
{
  void *v4;
  CKPopoverViewLayoutMetrics *layoutMetricsCommunicatedToDelegate;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  double v23;
  double Height;
  double v25;
  double MinX;
  double v27;
  double MinY;
  double v29;
  CKPopoverViewLayoutMetrics *v30;
  CKPopoverViewLayoutMetrics *v31;
  CKPopoverViewLayoutMetrics *v32;
  CKPopoverViewLayoutMetrics *v33;
  void *v34;
  CGFloat v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v36 = a3;
  -[CKSendMenuPopoverPresentationController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    layoutMetricsCommunicatedToDelegate = self->_layoutMetricsCommunicatedToDelegate;
    if (!layoutMetricsCommunicatedToDelegate)
      goto LABEL_7;
    -[CKPopoverViewLayoutMetrics frame](layoutMetricsCommunicatedToDelegate, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v36, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v35 = v9;
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    Width = CGRectGetWidth(v37);
    v38.origin.x = v15;
    v38.origin.y = v17;
    v38.size.width = v19;
    v38.size.height = v21;
    v23 = CGRectGetWidth(v38);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(Width, v23, 0.00000999999975))
      goto LABEL_7;
    v39.origin.y = v35;
    v39.origin.x = v7;
    v39.size.width = v11;
    v39.size.height = v13;
    Height = CGRectGetHeight(v39);
    v40.origin.x = v15;
    v40.origin.y = v17;
    v40.size.width = v19;
    v40.size.height = v21;
    v25 = CGRectGetHeight(v40);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(Height, v25, 0.00000999999975))
      goto LABEL_7;
    v41.origin.y = v35;
    v41.origin.x = v7;
    v41.size.width = v11;
    v41.size.height = v13;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = v15;
    v42.origin.y = v17;
    v42.size.width = v19;
    v42.size.height = v21;
    v27 = CGRectGetMinX(v42);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(MinX, v27, 0.00000999999975))
      goto LABEL_7;
    v43.origin.y = v35;
    v43.origin.x = v7;
    v43.size.width = v11;
    v43.size.height = v13;
    MinY = CGRectGetMinY(v43);
    v44.origin.x = v15;
    v44.origin.y = v17;
    v44.size.width = v19;
    v44.size.height = v21;
    v29 = CGRectGetMinY(v44);
    if (!CKFloatApproximatelyEqualToFloatWithTolerance(MinY, v29, 0.00000999999975))
    {
LABEL_7:
      v30 = self->_layoutMetricsCommunicatedToDelegate;
      v31 = (CKPopoverViewLayoutMetrics *)v36;
      v32 = self->_layoutMetricsCommunicatedToDelegate;
      self->_layoutMetricsCommunicatedToDelegate = v31;
      v33 = v30;

      -[CKSendMenuPopoverPresentationController delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sendMenuPresentationController:didChangePopoverLayoutMetrics:", self, v33);

    }
  }

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CKSendMenuPopoverPresentationDimmingView *v20;
  CKSendMenuPopoverPresentationDimmingView *dimmingView;
  uint64_t v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD aBlock[5];
  objc_super v29;

  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutSubviewsEnabled:", 1);

  v29.receiver = self;
  v29.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController presentationTransitionWillBegin](&v29, sel_presentationTransitionWillBegin);
  -[CKSendMenuPopoverPresentationController sendMenuViewController](self, "sendMenuViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[CKSendMenuPopoverPresentationController _sendMenuViewControllerPresentationTransitionWillBegin](self, "_sendMenuViewControllerPresentationTransitionWillBegin");
  else
    -[CKSendMenuPopoverPresentationController _appCardContentViewControllerPresentationTransitionWillBegin](self, "_appCardContentViewControllerPresentationTransitionWillBegin");
  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anchorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "convertRect:fromView:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CKSendMenuPopoverPresentationController presentedViewController](self, "presentedViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  v20 = objc_alloc_init(CKSendMenuPopoverPresentationDimmingView);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v20;

  -[CKSendMenuPopoverPresentationDimmingView setDelegate:](self->_dimmingView, "setDelegate:", self);
  objc_msgSend(v7, "addSubview:", self->_dimmingView);
  objc_msgSend(v7, "bounds");
  -[CKSendMenuPopoverPresentationDimmingView setFrame:](self->_dimmingView, "setFrame:");
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v23 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v18, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v18, "transitionCoordinator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    v26[1] = 3221225472;
    v26[2] = __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v26[3] = &unk_1E274FAD0;
    v27 = v23;
    objc_msgSend(v25, "animateAlongsideTransition:completion:", v26, 0);

  }
  else
  {
    v23[2](v23);
  }

}

void __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActive:", 1);

}

uint64_t __74__CKSendMenuPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_appCardContentViewControllerPresentationTransitionWillBegin
{
  void *v3;
  CKPopoverViewLayout *popoverLayout;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  -[CKSendMenuPopoverPresentationController popoverLayout](self, "popoverLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __103__CKSendMenuPopoverPresentationController__appCardContentViewControllerPresentationTransitionWillBegin__block_invoke;
  v29[3] = &unk_1E274A208;
  v29[4] = self;
  objc_msgSend(v3, "updateProperties:", v29);

  popoverLayout = self->_popoverLayout;
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKPopoverViewLayout newLayoutMetricsWithCoordinateSpace:](popoverLayout, "newLayoutMetricsWithCoordinateSpace:", v5);

  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  -[CKSendMenuPopoverPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredContentSize:", v8, v10);

  objc_msgSend(v6, "frame");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "frame");
  v17 = v16;
  v19 = v18;
  -[CKSendMenuPopoverPresentationController appCardContentViewController](self, "appCardContentViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredContentSize:", v17, v19);

  -[CKSendMenuPopoverPresentationController appCardContentViewController](self, "appCardContentViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[CKSendMenuPopoverPresentationController appCardContentViewController](self, "appCardContentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAutoresizingMask:", 0);

  -[CKSendMenuPopoverPresentationController appCardContentViewController](self, "appCardContentViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, v13, v15);

  -[CKSendMenuPopoverPresentationController popoverViewController](self, "popoverViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", 0.0, 0.0, v13, v15);

  self->_presentationState = 4;
}

void __103__CKSendMenuPopoverPresentationController__appCardContentViewControllerPresentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "appCardPresentationStyle");
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_18E7CAA30[v2];
  objc_msgSend(*(id *)(a1 + 32), "popoverLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_anchorViewCenterInContainer");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "popoverLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAnchorCenter:", v6, v8);

  objc_msgSend(*(id *)(a1 + 32), "anchorItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorRect");
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 32), "popoverLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAnchorSize:", v12, v14);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v17 = v16;
  v19 = v18;
  objc_msgSend(*(id *)(a1 + 32), "popoverLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContainerSize:", v17, v19);

}

- (void)_sendMenuViewControllerPresentationTransitionWillBegin
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  -[CKSendMenuPopoverPresentationController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMenuViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  -[CKSendMenuPopoverPresentationController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredContentSize:", v6, v8);

  self->_presentationState = 1;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CKSendMenuPopoverPresentationDimmingView *dimmingView;
  objc_super v7;

  v3 = a3;
  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSubviewsEnabled:", 1);

  v7.receiver = self;
  v7.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController presentationTransitionDidEnd:](&v7, sel_presentationTransitionDidEnd_, v3);
  if (v3)
  {
    self->_presentationState = 2;
  }
  else
  {
    self->_presentationState = 0;
    -[CKSendMenuPopoverPresentationDimmingView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  objc_super v12;

  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutSubviewsEnabled:", 0);

  v12.receiver = self;
  v12.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController dismissalTransitionWillBegin](&v12, sel_dismissalTransitionWillBegin);
  self->_presentationState = 3;
  -[CKSendMenuPopoverPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[CKSendMenuPopoverPresentationController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMenuPresentationControllerWillDismiss:", self);

  if (v5)
  {
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v9[3] = &unk_1E274FAD0;
    v10 = v7;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", v9, 0);

  }
  else
  {
    v7[2](v7);
  }

}

void __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setActive:", 0);

}

uint64_t __71__CKSendMenuPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  CKSendMenuPopoverPresentationDimmingView *dimmingView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController dismissalTransitionDidEnd:](&v12, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    self->_presentationState = 0;
    -[CKSendMenuPopoverPresentationDimmingView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
    dimmingView = self->_dimmingView;
    self->_dimmingView = 0;

  }
  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anchorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendMenuView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v11[0] = *MEMORY[0x1E0C9BAA8];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v9, "setTransform:", v11);

}

- (id)presentedView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController presentedView](&v3, sel_presentedView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  _BOOL4 v4;
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
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKSendMenuPopoverPresentationController;
  -[CKSendMenuPopoverPresentationController containerViewWillLayoutSubviews](&v17, sel_containerViewWillLayoutSubviews);
  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKSendMenuPopoverPresentationController isPresenting](self, "isPresenting");
  -[CKSendMenuPopoverPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  if (v4)
  {
    -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

    -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutIfNeeded");

  }
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  -[CKSendMenuPopoverPresentationDimmingView setFrame:](self->_dimmingView, "setFrame:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKSendMenuPopoverPresentationController;
  v7 = a4;
  -[CKSendMenuPopoverPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CKSendMenuPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E274B4D0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

void __94__CKSendMenuPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  CKPopoverViewLayout *popoverLayout;
  id v5;
  CKPopoverViewLayout *v6;
  void *v7;
  id v8;
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
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CKSendMenuPopoverPresentationController *v25;
  id v26;
  CGRect result;

  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  popoverLayout = self->_popoverLayout;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __78__CKSendMenuPopoverPresentationController_frameOfPresentedViewInContainerView__block_invoke;
  v24 = &unk_1E274A108;
  v25 = self;
  v26 = v3;
  v5 = v3;
  -[CKPopoverViewLayout updateProperties:](popoverLayout, "updateProperties:", &v21);
  v6 = self->_popoverLayout;
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView", v21, v22, v23, v24, v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKPopoverViewLayout newLayoutMetricsWithCoordinateSpace:](v6, "newLayoutMetricsWithCoordinateSpace:", v7);

  -[CKSendMenuPopoverPresentationController _didComputePopoverLayoutMetrics:](self, "_didComputePopoverLayoutMetrics:", v8);
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

void __78__CKSendMenuPopoverPresentationController_frameOfPresentedViewInContainerView__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setPreferredContentSize:");

  objc_msgSend(*(id *)(a1 + 32), "_anchorViewCenterInContainer");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAnchorCenter:");
  objc_msgSend(*(id *)(a1 + 40), "anchorRect");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAnchorSize:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setContainerSize:", v5, v6);

}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)sendMenuPopoverPresentationDimmingViewDidReceiveTap:(id)a3
{
  id v4;

  -[CKSendMenuPopoverPresentationController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendMenuPresentationControllerWantsToBeDismissed:", self);

}

- (void)presentCardWithContentViewController:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CKPopoverViewLayout *popoverLayout;
  void *v15;
  id v16;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MinX;
  double v22;
  double MinY;
  CGFloat v24;
  void *v25;
  double v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  CKSendMenuPopoverPresentationController *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  _QWORD v41[6];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v8 = a3;
  v9 = a5;
  -[CKSendMenuPopoverPresentationController popoverView](self, "popoverView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLayoutSubviewsEnabled:", 0);

  self->_presentationState = 4;
  -[CKSendMenuPopoverPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPopoverPresentationController popoverLayout](self, "popoverLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke;
  v41[3] = &unk_1E274C9C0;
  v41[4] = self;
  v41[5] = a4;
  objc_msgSend(v12, "updateProperties:", v41);

  popoverLayout = self->_popoverLayout;
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CKPopoverViewLayout newLayoutMetricsWithCoordinateSpace:](popoverLayout, "newLayoutMetricsWithCoordinateSpace:", v15);

  -[CKSendMenuPopoverPresentationController _didComputePopoverLayoutMetrics:](self, "_didComputePopoverLayoutMetrics:", v16);
  objc_msgSend(v16, "frame");
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  MinX = CGRectGetMinX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v22 = MinX + CGRectGetWidth(v43) * 0.5;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MinY = CGRectGetMinY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v24 = CGRectGetHeight(v45);
  v25 = (void *)MEMORY[0x1E0CEABB0];
  v26 = MinY + v24 * 0.5;
  v33[0] = v13;
  v33[1] = 3221225472;
  v33[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_2;
  v33[3] = &unk_1E274FAF8;
  v34 = v11;
  v35 = v8;
  v37 = 0;
  v38 = 0;
  v39 = width;
  v40 = height;
  v36 = self;
  v27 = v8;
  v28 = v11;
  objc_msgSend(v25, "performWithoutAnimation:", v33);
  objc_msgSend(v28, "animationForTransitioningToAppContainerViewControllerWithFinalBounds:finalCenter:", 0.0, 0.0, width, height, v22, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  v31[1] = 3221225472;
  v31[2] = __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_3;
  v31[3] = &unk_1E274C2E0;
  v31[4] = self;
  v32 = v9;
  v30 = v9;
  objc_msgSend(v29, "setCompletion:", v31);
  objc_msgSend(v29, "startAnimation");

}

void __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 > 2)
    v2 = 0;
  else
    v2 = qword_18E7CAA30[v1];
  objc_msgSend(*(id *)(a1 + 32), "popoverLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", v2);

}

void __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "setAppContainerViewController:", *(_QWORD *)(a1 + 40));
  v2 = *(double *)(a1 + 56);
  v3 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBounds:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 48), "popoverView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMenuView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "center");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 40), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCenter:", v10, v12);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 40), "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 0.0);

}

uint64_t __97__CKSendMenuPopoverPresentationController_presentCardWithContentViewController_style_completion___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "popoverView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLayoutSubviewsEnabled:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)anchorViewDidMove
{
  CKPopoverViewLayout *popoverLayout;
  void *v4;
  _QWORD v5[5];

  popoverLayout = self->_popoverLayout;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__CKSendMenuPopoverPresentationController_anchorViewDidMove__block_invoke;
  v5[3] = &unk_1E274A208;
  v5[4] = self;
  -[CKPopoverViewLayout updateProperties:](popoverLayout, "updateProperties:", v5);
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

uint64_t __60__CKSendMenuPopoverPresentationController_anchorViewDidMove__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_anchorViewCenterInContainer");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setAnchorCenter:");
}

- (CGPoint)_anchorViewCenterInContainer
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  -[CKSendMenuPopoverPresentationController anchorItem](self, "anchorItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "anchorView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v11, v7, v9);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)newPopoverLayoutMetrics
{
  CKPopoverViewLayout *popoverLayout;
  void *v3;
  id v4;

  popoverLayout = self->_popoverLayout;
  -[CKSendMenuPopoverPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKPopoverViewLayout newLayoutMetricsWithCoordinateSpace:](popoverLayout, "newLayoutMetricsWithCoordinateSpace:", v3);

  return v4;
}

- (CKPopoverViewLayout)popoverLayout
{
  return self->_popoverLayout;
}

- (void)setPopoverLayout:(id)a3
{
  objc_storeStrong((id *)&self->_popoverLayout, a3);
}

- (CKSendMenuPopoverPresentationDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (UITapGestureRecognizer)dismissGestureRecognizer
{
  return self->_dismissGestureRecognizer;
}

- (void)setDismissGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, a3);
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (CKPopoverViewLayoutMetrics)layoutMetricsCommunicatedToDelegate
{
  return self->_layoutMetricsCommunicatedToDelegate;
}

- (void)setLayoutMetricsCommunicatedToDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMetricsCommunicatedToDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMetricsCommunicatedToDelegate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_popoverLayout, 0);
}

@end
