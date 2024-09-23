@implementation CCUIContentModuleDetailPresentationController

- (CCUIContentModuleDetailPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 anchoringViewController:(id)a5
{
  id v9;
  CCUIContentModuleDetailPresentationController *v10;
  CCUIContentModuleDetailPresentationController *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CCUIContentModuleDetailPresentationController;
  v10 = -[CCUIContentModuleDetailPresentationController initWithPresentedViewController:presentingViewController:](&v13, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_anchoringViewController, a5);

  return v11;
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double MinY;
  double v39;
  void *v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v41.receiver = self;
  v41.super_class = (Class)CCUIContentModuleDetailPresentationController;
  -[CCUIContentModuleDetailPresentationController containerViewWillLayoutSubviews](&v41, sel_containerViewWillLayoutSubviews);
  -[UIViewController view](self->_anchoringViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleDetailPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        v6))
  {
    -[UIViewController bs_presentationContextDefiningViewController](self->_anchoringViewController, "bs_presentationContextDefiningViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", v8);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    CGRectGetMidX(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    CGRectGetMidY(v43);

  }
  else
  {
    objc_msgSend(v4, "center");
  }
  -[CCUIContentModuleDetailPresentationController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleDetailPresentationController _preferredExpandedContentWidthForViewController:](self, "_preferredExpandedContentWidthForViewController:", v13);
  -[CCUIContentModuleDetailPresentationController _preferredExpandedContentHeightForViewController:](self, "_preferredExpandedContentHeightForViewController:", v13);
  UIRectCenteredAboutPoint();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v4, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = CCUIExpandedModuleEdgeInsets();
  v32 = v23 + v31;
  v33 = v25 + v30;
  v35 = v27 - (v31 + v34);
  v37 = v29 - (v30 + v36);
  v44.origin.x = v15;
  v44.origin.y = v17;
  v44.size.width = v19;
  v44.size.height = v21;
  MinY = CGRectGetMinY(v44);
  v45.origin.x = v32;
  v45.origin.y = v33;
  v45.size.width = v35;
  v45.size.height = v37;
  v39 = CGRectGetMinY(v45);
  if (MinY < v39)
    MinY = v39;
  -[CCUIContentModuleDetailPresentationController presentedView](self, "presentedView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v15, MinY, v19, v21);
  objc_msgSend(v4, "addSubview:", v40);

}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleDetailPresentationController;
  -[CCUIContentModuleDetailPresentationController presentationTransitionWillBegin](&v5, sel_presentationTransitionWillBegin);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleBackgroundTap_);
  objc_msgSend(v3, "setDelegate:", self);
  -[CCUIContentModuleDetailPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIContentModuleDetailPresentationController;
  -[CCUIContentModuleDetailPresentationController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[CCUIContentModuleDetailPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__CCUIContentModuleDetailPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v7[3] = &unk_1E8E20590;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:", v7, 0.3);

}

uint64_t __103__CCUIContentModuleDetailPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[CCUIContentModuleDetailPresentationController presentedViewController](self, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[CCUIContentModuleDetailPresentationController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v13, "pointInside:withEvent:", 0, v9, v11);

  return v6 ^ 1;
}

- (void)_handleBackgroundTap:(id)a3
{
  id v3;

  -[CCUIContentModuleDetailPresentationController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (double)_preferredExpandedContentWidthForViewController:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "preferredExpandedContentWidth");
  else
    v4 = CCUIDefaultExpandedContentModuleWidth();
  v5 = v4;

  return v5;
}

- (double)_preferredExpandedContentHeightForViewController:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "preferredExpandedContentHeight");
    v4 = v5;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchoringViewController, 0);
}

@end
