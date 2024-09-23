@implementation CKSendMenuPopoverAnimationController

- (CKSendMenuPopoverPresentationControllerAnchorItem)anchorItem
{
  void *v2;
  void *v3;

  -[CKSendMenuPopoverAnimationController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKSendMenuPopoverPresentationControllerAnchorItem *)v3;
}

- (CKSendMenuPopoverAnimationController)initWithConfiguration:(id)a3 presenting:(BOOL)a4
{
  id v7;
  CKSendMenuPopoverAnimationController *v8;
  CKSendMenuPopoverAnimationController *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKSendMenuPopoverAnimationController;
  v8 = -[CKSendMenuPopoverAnimationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a4;
    objc_storeStrong((id *)&v8->_configuration, a3);
  }

  return v9;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
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
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CKSendMenuPopoverAnimationController *v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
  {
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPopoverAnimationController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3010000000;
    v30 = 0;
    v31 = 0;
    v29[3] = &unk_18E8EEE6F;
    objc_msgSend(v9, "preferredContentSize");
    v30 = v10;
    v31 = v11;
    v12 = MEMORY[0x1E0C809B0];
    v13 = (void *)MEMORY[0x1E0CEABB0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke;
    v23[3] = &unk_1E274BE10;
    v28 = v29;
    v14 = v6;
    v24 = v14;
    v15 = v7;
    v25 = v15;
    v26 = self;
    v16 = v5;
    v27 = v16;
    objc_msgSend(v13, "performWithoutAnimation:", v23);
    -[CKSendMenuPopoverAnimationController configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMenuViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v14, "setSendMenuViewController:", v9);
    else
      objc_msgSend(v14, "setAppContainerViewController:", v9);
    v20 = (void *)MEMORY[0x1E0CEABB0];
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke_2;
    v21[3] = &unk_1E274A208;
    v19 = v15;
    v22 = v19;
    objc_msgSend(v20, "performWithoutAnimation:", v21);
    -[CKSendMenuPopoverAnimationController animatePresentTransitionUsingContext:containerView:popoverViewController:](self, "animatePresentTransitionUsingContext:containerView:popoverViewController:", v4, v16, v14);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CKSendMenuPopoverAnimationController animateDismissTransitionUsingContext:containerView:popoverViewController:](self, "animateDismissTransitionUsingContext:containerView:popoverViewController:", v4, v5, v14);
  }

}

void __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v3 = *(double *)(v2 + 32);
  if (v3 <= 300.0 || (v4 = *(double *)(v2 + 40), v4 <= 300.0))
  {
    *(int64x2_t *)(v2 + 32) = vdupq_n_s64(0x4072C00000000000uLL);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v3 = *(double *)(v5 + 32);
    v4 = *(double *)(v5 + 40);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 40), "blurBackgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "backdropView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "blurContentsView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, v3, v4);

  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anchorItem");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "anchorView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "anchorRect");
  objc_msgSend(v15, "convertRect:toView:", *(_QWORD *)(a1 + 56));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(*(id *)(a1 + 56), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", v17, v19, v21, v23);

}

void __58__CKSendMenuPopoverAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  objc_msgSend(*(id *)(a1 + 32), "prepareForPresentation");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "blurBackgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "backdropView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(*(id *)(a1 + 32), "blurContentsView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

}

- (void)animatePresentTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MinX;
  double v13;
  double MinY;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v6 = a3;
  v7 = a5;
  objc_msgSend(v6, "finalFrameForViewController:", v7);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  MinX = CGRectGetMinX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = MinX + CGRectGetWidth(v20) * 0.5;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinY = CGRectGetMinY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  objc_msgSend(v7, "animationForPresentingInitialViewControllerWithFinalBounds:finalCenter:", 0.0, 0.0, width, height, v13, MinY + CGRectGetHeight(v22) * 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __113__CKSendMenuPopoverAnimationController_animatePresentTransitionUsingContext_containerView_popoverViewController___block_invoke;
  v17[3] = &unk_1E274A208;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "setCompletion:", v17);
  objc_msgSend(v15, "startAnimation");

}

uint64_t __113__CKSendMenuPopoverAnimationController_animatePresentTransitionUsingContext_containerView_popoverViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (void)animateDismissTransitionUsingContext:(id)a3 containerView:(id)a4 popoverViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MinX;
  double Width;
  double MinY;
  double Height;
  void *v25;
  void *v26;
  char isKindOfClass;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[CKSendMenuPopoverAnimationController anchorItem](self, "anchorItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anchorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anchorRect");
  objc_msgSend(v10, "convertRect:fromView:", v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  MinX = CGRectGetMinX(v35);
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  Width = CGRectGetWidth(v36);
  v37.origin.x = v14;
  v37.origin.y = v16;
  v37.size.width = v18;
  v37.size.height = v20;
  MinY = CGRectGetMinY(v37);
  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v18;
  v38.size.height = v20;
  Height = CGRectGetHeight(v38);
  -[CKSendMenuPopoverAnimationController configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMenuViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v28 = 1.0;
  if ((isKindOfClass & 1) != 0)
  {
    -[CKSendMenuPopoverAnimationController configuration](self, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sendMenuViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v29) = objc_msgSend(v30, "isPresentingAudioRecordingQuickSend");
    if ((_DWORD)v29)
      v28 = 0.0;
    else
      v28 = 1.0;
  }
  objc_msgSend(v9, "animationForDismissingWithFinalBounds:finalCenter:finalAlpha:", 0.0, 0.0, v18, v20, MinX + Width * 0.5, MinY + Height * 0.5, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __113__CKSendMenuPopoverAnimationController_animateDismissTransitionUsingContext_containerView_popoverViewController___block_invoke;
  v33[3] = &unk_1E274A208;
  v34 = v8;
  v32 = v8;
  objc_msgSend(v31, "setCompletion:", v33);
  objc_msgSend(v31, "startAnimation");

}

uint64_t __113__CKSendMenuPopoverAnimationController_animateDismissTransitionUsingContext_containerView_popoverViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (CKSendMenuPopoverPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
