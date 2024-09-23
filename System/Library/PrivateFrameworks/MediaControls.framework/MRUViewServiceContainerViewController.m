@implementation MRUViewServiceContainerViewController

- (MRUViewServiceContainerViewController)init
{
  MRUViewServiceContainerViewController *v2;
  MRUViewServiceRoutingViewController *v3;
  MRUViewServiceRoutingViewController *routingViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUViewServiceContainerViewController;
  v2 = -[MRUViewServiceContainerViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MRUViewServiceRoutingViewController);
    routingViewController = v2->_routingViewController;
    v2->_routingViewController = v3;

    -[MRUViewServiceRoutingViewController setDelegate:](v2->_routingViewController, "setDelegate:", v2);
    -[MRUViewServiceRoutingViewController setTransitioningDelegate:](v2->_routingViewController, "setTransitioningDelegate:", v2);
    -[MRUViewServiceRoutingViewController setModalPresentationStyle:](v2->_routingViewController, "setModalPresentationStyle:", 4);
  }
  return v2;
}

- (void)viewDidLoad
{
  id v3;
  UIView *v4;
  UIView *sourceView;
  void *v6;
  void *v7;
  MTMaterialView *v8;
  MTMaterialView *materialView;
  void *v10;
  MRUVisualStylingProvider *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MRUViewServiceContainerViewController;
  -[MRUViewServiceContainerViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[MPMediaControlsConfiguration sourceRect](self->_configuration, "sourceRect");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  sourceView = self->_sourceView;
  self->_sourceView = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_sourceView, "setBackgroundColor:", v6);

  -[MRUViewServiceContainerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_sourceView);

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 4, 0, 0.0);
  v8 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  materialView = self->_materialView;
  self->_materialView = v8;

  -[MTMaterialView setUserInteractionEnabled:](self->_materialView, "setUserInteractionEnabled:", 0);
  -[MTMaterialView visualStylingProviderForCategory:](self->_materialView, "visualStylingProviderForCategory:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v10);
  -[MRUViewServiceRoutingViewController setStylingProvider:](self->_routingViewController, "setStylingProvider:", v11);

  -[MRUViewServiceContainerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_materialView);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUViewServiceContainerViewController;
  -[MRUViewServiceContainerViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[MPMediaControlsConfiguration sourceRect](self->_configuration, "sourceRect");
  -[UIView setFrame:](self->_sourceView, "setFrame:");
  -[MRUViewServiceContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  void *v4;

  if (!-[MRUViewServiceContainerViewController shouldUsePopoverAnchor](self, "shouldUsePopoverAnchor"))
    return 1;
  v3 = (void *)MEMORY[0x1E0CB34D0];
  -[MPMediaControlsConfiguration presentingAppBundleID](self->_configuration, "presentingAppBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "mru_isSpringBoardBundleIdentifier:", v4);

  return (char)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_configuration, a3);
  v5 = a3;
  -[MRUViewServiceRoutingViewController setConfiguration:](self->_routingViewController, "setConfiguration:", v5);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  MRUPopoverPresentationController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a4;
  v8 = a3;
  v9 = -[MRUPopoverPresentationController initWithPresentedViewController:presentingViewController:]([MRUPopoverPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  if (-[MRUViewServiceContainerViewController shouldUsePopoverAnchor](self, "shouldUsePopoverAnchor"))
    -[MRUPopoverPresentationController setSourceView:](v9, "setSourceView:", self->_sourceView);
  CCUIExpandedModuleContinuousCornerRadius();
  -[MRUPopoverPresentationController _setCornerRadius:](v9, "_setCornerRadius:");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v12 = 15;
  else
    v12 = 3;
  -[MRUPopoverPresentationController setPermittedArrowDirections:](v9, "setPermittedArrowDirections:", v12);
  -[MRUPopoverPresentationController setDelegate:](v9, "setDelegate:", self);
  return v9;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  MRUViewServiceRoutingViewController *routingViewController;
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  routingViewController = self->_routingViewController;
  v5 = a3;
  -[MRUViewServiceRoutingViewController view](routingViewController, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v9, "sizeThatFits:", v7, v8);
  objc_msgSend(v5, "setPopoverContentSize:");

}

- (void)presentationControllerWillDismiss:(id)a3
{
  -[MRUViewServiceContainerViewController updateMaterialForPresenting:](self, "updateMaterialForPresenting:", 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[MRUViewServiceContainerViewController dismissalBlock](self, "dismissalBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRUViewServiceContainerViewController dismissalBlock](self, "dismissalBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    -[MRUViewServiceContainerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_routingViewController, a4, 0);
  }
  else
  {
    -[MRUViewServiceContainerViewController dismissalBlock](self, "dismissalBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUViewServiceContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v4, v7);

  }
  -[MRUViewServiceContainerViewController updateMaterialForPresenting:](self, "updateMaterialForPresenting:", v5);
}

- (void)viewServiceRoutingViewControllerDidChangeSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  MRUViewServiceContainerViewController *v13;

  v4 = a3;
  -[MRUViewServiceContainerViewController routingViewController](self, "routingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidChangeSize___block_invoke_2;
    v11[3] = &unk_1E581AFC8;
    v12 = v4;
    v13 = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", &__block_literal_global_43, v11);

  }
  else
  {
    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUViewServiceContainerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "sizeThatFits:", v9, v10);
    objc_msgSend(v4, "setPreferredContentSize:");

  }
}

void __87__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidChangeSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");

}

- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3
{
  id v4;

  -[MRUViewServiceContainerViewController dismissalBlock](self, "dismissalBlock", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUViewServiceContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v4);

}

- (void)viewServiceRoutingViewControllerDidDismiss:(id)a3 withCustomRowTapped:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidDismiss_withCustomRowTapped___block_invoke;
  v9[3] = &unk_1E5818C18;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[MRUViewServiceContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __104__MRUViewServiceContainerViewController_viewServiceRoutingViewControllerDidDismiss_withCustomRowTapped___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "customRowTappedBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (BOOL)shouldUsePopoverAnchor
{
  void *v3;
  double v4;
  CGFloat v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  char v31;
  CGFloat Width;
  double MaxY;
  CGFloat rect1;
  CGFloat rect1_8;
  CGFloat rect1_16;
  CGFloat MinX;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  -[MRUViewServiceContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIView frame](self->_sourceView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  MinX = CGRectGetMinX(v39);
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  rect1_16 = CGRectGetMinY(v40);
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  rect1_8 = CGRectGetWidth(v41);
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  rect1 = CGRectGetMinX(v42);
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  MaxY = CGRectGetMaxY(v43);
  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  Width = CGRectGetWidth(v44);
  -[MRUViewServiceContainerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "windowScene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "screen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "displayIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isExternal");

  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  if (CGRectIsEmpty(v45))
  {
    v26 = 1;
  }
  else
  {
    v46.origin.x = v5;
    v46.origin.y = v7;
    v46.size.width = v9;
    v46.size.height = v11;
    v49.origin.x = v13;
    v49.origin.y = v15;
    v49.size.width = v17;
    v49.size.height = v19;
    v26 = !CGRectContainsRect(v46, v49);
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  v47.origin.x = MinX;
  v47.size.width = rect1_8;
  v47.origin.y = rect1_16;
  v47.size.height = 200.0;
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  if (!CGRectContainsRect(v47, v50))
  {
    v48.size.width = Width;
    v48.origin.y = MaxY - 200.0;
    v48.origin.x = rect1;
    v48.size.height = 200.0;
    v51.origin.x = v13;
    v51.origin.y = v15;
    v51.size.width = v17;
    v51.size.height = v19;
    v29 = CGRectContainsRect(v48, v51);
    if (!v26)
      goto LABEL_6;
LABEL_11:
    v31 = 0;
    goto LABEL_12;
  }
  v29 = 1;
  if (v26)
    goto LABEL_11;
LABEL_6:
  v30 = (v28 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v29;
  v31 = v30 & ~v25;
LABEL_12:

  return v31;
}

- (void)updateMaterialForPresenting:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  if (!-[MRUViewServiceContainerViewController shouldUsePopoverAnchor](self, "shouldUsePopoverAnchor"))
  {
    -[MRUViewServiceContainerViewController routingViewController](self, "routingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __69__MRUViewServiceContainerViewController_updateMaterialForPresenting___block_invoke;
      v8[3] = &unk_1E58199B0;
      v8[4] = self;
      v9 = v3;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", v8, 0);
    }
    else
    {
      v7 = 0.0;
      if (v3)
        v7 = 1.0;
      -[MTMaterialView setWeighting:](self->_materialView, "setWeighting:", v7);
    }

  }
}

uint64_t __69__MRUViewServiceContainerViewController_updateMaterialForPresenting___block_invoke(uint64_t a1)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setWeighting:", v2);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

- (MPMediaControlsConfiguration)configuration
{
  return self->_configuration;
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (id)customRowTappedBlock
{
  return self->_customRowTappedBlock;
}

- (void)setCustomRowTappedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (MRUViewServiceRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_routingViewController, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong(&self->_customRowTappedBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
