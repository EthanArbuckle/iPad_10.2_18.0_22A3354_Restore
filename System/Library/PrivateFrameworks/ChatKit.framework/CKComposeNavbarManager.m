@implementation CKComposeNavbarManager

- (id)initForBusinessChat:(BOOL)a3
{
  _BOOL8 v3;
  CKComposeNavbarManager *v4;
  CKComposeNavbarManagerContentView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKComposeNavbarManager;
  v4 = -[CKComposeNavbarManager init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(CKComposeNavbarManagerContentView);
    -[CKComposeNavbarManagerContentView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[CKComposeNavbarManager setComposeContentView:](v4, "setComposeContentView:", v5);
    -[CKComposeNavbarManager _setupDefaultNavbarCanvasViewControllerForBusinessChat:](v4, "_setupDefaultNavbarCanvasViewControllerForBusinessChat:", v3);
    -[CKComposeNavbarManager defaultNavbarCanvasViewController](v4, "defaultNavbarCanvasViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setEnforceLeftItemViewsAlignmentToCenter:", 1);
    -[CKComposeNavbarManagerContentView setCanvasView:](v5, "setCanvasView:", v7);
    -[CKComposeNavbarManagerContentView addSubview:](v5, "addSubview:", v7);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKComposeNavbarManager customStatusBackgroundView](self, "customStatusBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)CKComposeNavbarManager;
  -[CKComposeNavbarManager dealloc](&v4, sel_dealloc);
}

- (void)updateContentsForConversation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateContentsForConversation:", v4);

}

- (void)updateTitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTitle:animated:", v6, v4);

}

- (UIButton)cancelButton
{
  void *v2;
  void *v3;

  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (void)setCanvasViewControllerDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)_setupDefaultNavbarCanvasViewControllerForBusinessChat:(BOOL)a3
{
  __objc2_class **v4;
  id v5;

  v4 = off_1E2732EB8;
  if (!a3)
    v4 = off_1E2732EC0;
  v5 = objc_alloc_init(*v4);
  -[CKComposeNavbarManager setDefaultNavbarCanvasViewController:](self, "setDefaultNavbarCanvasViewController:", v5);

}

- (void)_setupAvatarNavBarViewControllerWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CKNavbarCanvasViewController *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[CKNavbarCanvasViewController initWithConversation:navigationController:]([CKNavbarCanvasViewController alloc], "initWithConversation:navigationController:", v6, 0);

  -[CKNavbarCanvasViewController setCanShowBackButtonView:](v7, "setCanShowBackButtonView:", v4);
  -[CKComposeNavbarManager setAvatarNavbarCanvasViewController:](self, "setAvatarNavbarCanvasViewController:", v7);

}

- (void)commitTransitionAnimationWithConversation:(id)a3 shouldShowBackButtonView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  void *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  UIView *v40;
  UIView *customStatusBackgroundView;
  UIView *v42;
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
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id *v60;
  id *v61;
  id *v62;
  id *v63;
  id v64;
  UIView *v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  id v69;
  id v70;
  UIView *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[2];
  _QWORD v76[4];
  UIView *v77;
  id v78[2];
  _QWORD v79[4];
  id v80;
  _QWORD v81[2];
  _QWORD v82[4];
  UIView *v83;
  id v84[3];

  v4 = a4;
  v6 = a3;
  -[CKComposeNavbarManager _setupAvatarNavBarViewControllerWithConversation:shouldShowBackButtonView:](self, "_setupAvatarNavBarViewControllerWithConversation:shouldShowBackButtonView:", v6, v4);
  -[CKComposeNavbarManager avatarNavbarCanvasViewController](self, "avatarNavbarCanvasViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v9);

  -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKComposeNavbarManager avatarNavbarCanvasViewController](self, "avatarNavbarCanvasViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKComposeNavbarManager composeContentView](self, "composeContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCanvasView:", v13);

  if (objc_msgSend(v6, "isBusinessConversation"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryBrandColorForBusinessChat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v18);

    objc_msgSend(v13, "setAlpha:", 1.0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "secondaryBrandColorForBusinessChat:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v22);

    -[CKComposeNavbarManager avatarNavbarCanvasViewController](self, "avatarNavbarCanvasViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "conversationIdentityView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "theme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v72 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStyle:", objc_msgSend(v26, "navBarTextStyleForBusinessChat:", v27));

    v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "keyWindow");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    -[CKComposeNavbarManager contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v32 - v34;
    -[CKComposeNavbarManager contentView](self, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "frame");
    v38 = v37;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "statusBarFrame");
    v40 = (UIView *)objc_msgSend(v28, "initWithFrame:", v35, 0.0, v38);
    customStatusBackgroundView = self->_customStatusBackgroundView;
    self->_customStatusBackgroundView = v40;

    v42 = v40;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "theme");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chat");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "primaryBrandColorForBusinessChat:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v42, "setBackgroundColor:", v46);

    v11 = v72;
    -[UIView setAlpha:](v42, "setAlpha:", 0.0);
    -[UIView setAccessibilityIgnoresInvertColors:](v42, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "keyWindow");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v42);

    -[CKComposeNavbarManager avatarNavbarCanvasViewController](self, "avatarNavbarCanvasViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "updateTitle:animated:", &stru_1E276D870, 0);

    -[CKComposeNavbarManager defaultNavbarCanvasViewController](self, "defaultNavbarCanvasViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "updateTitle:animated:", &stru_1E276D870, 0);

  }
  else
  {
    v42 = 0;
  }
  -[CKComposeNavbarManager contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "insertSubview:belowSubview:", v13, v11);

  -[CKComposeNavbarManager contentView](self, "contentView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  objc_msgSend(v13, "setFrame:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sendAnimationDuration");
  v55 = v54 * 0.5;

  if (objc_msgSend(v6, "isBusinessConversation"))
  {
    objc_msgSend(v13, "leftItemView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAlpha:", 0.0);

    objc_msgSend(v13, "rightItemView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAlpha:", 0.0);

    objc_msgSend(v13, "setAlpha:", 0.0);
    v58 = (void *)MEMORY[0x1E0CEABB0];
    v59 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke;
    v82[3] = &unk_1E274A0B8;
    v60 = (id *)&v83;
    v83 = v42;
    v61 = v84;
    v84[0] = v11;
    v84[1] = self;
    v79[0] = v59;
    v79[1] = 3221225472;
    v79[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_2;
    v79[3] = &unk_1E274DD80;
    v62 = &v80;
    v63 = (id *)v81;
    v80 = v84[0];
    v81[0] = v13;
    *(double *)&v81[1] = v55;
    v64 = v13;
    v65 = v42;
    v66 = v82;
    v67 = v79;
  }
  else
  {
    objc_msgSend(v13, "setAlpha:", 0.0);
    v58 = (void *)MEMORY[0x1E0CEABB0];
    v68 = MEMORY[0x1E0C809B0];
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_4;
    v76[3] = &unk_1E274A0B8;
    v60 = (id *)&v77;
    v77 = v42;
    v61 = v78;
    v78[0] = v11;
    v78[1] = self;
    v73[0] = v68;
    v73[1] = 3221225472;
    v73[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_5;
    v73[3] = &unk_1E274DD80;
    v62 = &v74;
    v69 = v78[0];
    *(double *)&v75[1] = v55;
    v63 = (id *)v75;
    v74 = v69;
    v75[0] = v13;
    v70 = v13;
    v71 = v42;
    v66 = v76;
    v67 = v73;
  }
  objc_msgSend(v58, "animateWithDuration:animations:completion:", v66, v67, v55);

}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "leftItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "rightItemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navbarManagerIsAnimatingNavbarTransition:", *(_QWORD *)(a1 + 48));

}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(double *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_3;
  v4[3] = &unk_1E274A208;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:", v4, v3);

}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "leftItemView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "rightItemView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navbarManagerIsAnimatingNavbarTransition:", *(_QWORD *)(a1 + 48));

}

void __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(double *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_6;
  v4[3] = &unk_1E274A208;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "animateWithDuration:animations:", v4, v3);

}

uint64_t __93__CKComposeNavbarManager_commitTransitionAnimationWithConversation_shouldShowBackButtonView___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (CKComposeNavbarManagerDelegate)delegate
{
  return (CKComposeNavbarManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)customStatusBackgroundView
{
  return self->_customStatusBackgroundView;
}

- (CKComposeNavbarManagerContentView)composeContentView
{
  return self->_composeContentView;
}

- (void)setComposeContentView:(id)a3
{
  objc_storeStrong((id *)&self->_composeContentView, a3);
}

- (CKComposeNavbarCanvasViewController)defaultNavbarCanvasViewController
{
  return self->_defaultNavbarCanvasViewController;
}

- (void)setDefaultNavbarCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_defaultNavbarCanvasViewController, a3);
}

- (CKNavbarCanvasViewController)avatarNavbarCanvasViewController
{
  return self->_avatarNavbarCanvasViewController;
}

- (void)setAvatarNavbarCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarNavbarCanvasViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarNavbarCanvasViewController, 0);
  objc_storeStrong((id *)&self->_defaultNavbarCanvasViewController, 0);
  objc_storeStrong((id *)&self->_composeContentView, 0);
  objc_storeStrong((id *)&self->_customStatusBackgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
