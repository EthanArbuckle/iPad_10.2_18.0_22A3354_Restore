@implementation CCUIContentModuleContainerReducedMotionTransition

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  UIView *v16;
  UIView *snapshotView;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CCUIContentModuleContainerReducedMotionTransition *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke;
  v20[3] = &unk_1E8CFD2B8;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v24 = self;
  v13 = v10;
  v14 = v9;
  v18 = v8;
  objc_msgSend(v11, "performWithoutAnimation:", v20);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "snapshotViewAfterScreenUpdates:", 0);
  v16 = (UIView *)objc_claimAutoreleasedReturnValue();
  snapshotView = self->_snapshotView;
  self->_snapshotView = v16;

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke_2;
  v19[3] = &unk_1E8CFC3D0;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v19);
  -[UIView setAlpha:](self->_snapshotView, "setAlpha:", 0.0);

}

id __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)CCUIContentModuleContainerReducedMotionTransition;
  return objc_msgSendSuper2(&v5, sel_performTransitionFromView_toView_containerView_, v1, v2, v3);
}

uint64_t __100__CCUIContentModuleContainerReducedMotionTransition_performTransitionFromView_toView_containerView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "snapshotHostWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[8];
  objc_msgSend(v5, "snapshotHostWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  objc_msgSend(v6, "setCenter:");

  v8 = *(_QWORD **)(a1 + 32);
  v9 = (void *)v8[8];
  objc_msgSend(v8, "snapshotCorrectiveTransform");
  return objc_msgSend(v9, "setTransform:", &v11);
}

- (id)customAnimator
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:curve:animations:", 0, 0, 0.2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CCUIContentModuleContainerReducedMotionTransition_customAnimator__block_invoke;
  v5[3] = &unk_1E8CFD2E0;
  v5[4] = self;
  objc_msgSend(v3, "addCompletion:", v5);
  return v3;
}

uint64_t __67__CCUIContentModuleContainerReducedMotionTransition_customAnimator__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "snapshotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setSnapshotView:", 0);
}

- (UIWindow)snapshotHostWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_snapshotHostWindow);
}

- (void)setSnapshotHostWindow:(id)a3
{
  objc_storeWeak((id *)&self->_snapshotHostWindow, a3);
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (CGAffineTransform)snapshotCorrectiveTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setSnapshotCorrectiveTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.c = v4;
  *(_OWORD *)&self->_snapshotCorrectiveTransform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_destroyWeak((id *)&self->_snapshotHostWindow);
}

@end
