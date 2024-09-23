@implementation SUUIOverlayContainerViewController

- (SUUIOverlayContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIOverlayContainerViewController *v4;
  SUUIOverlayContainerViewController *v5;
  NSMutableArray *v6;
  NSMutableArray *viewControllers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIOverlayContainerViewController;
  v4 = -[SUUIOverlayContainerViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIControl removeGestureRecognizer:](self->_backstopView, "removeGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer removeTarget:action:](self->_tapGestureRecognizer, "removeTarget:action:", self, 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIOverlayContainerViewController;
  -[SUUIOverlayContainerViewController dealloc](&v3, sel_dealloc);
}

- (UIControl)backstopControl
{
  UIControl *backstopView;
  SUUIOverlayContainerView *v4;
  UIControl *v5;
  UIControl *v6;
  void *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *tapGestureRecognizer;

  backstopView = self->_backstopView;
  if (!backstopView)
  {
    v4 = objc_alloc_init(SUUIOverlayContainerView);
    v5 = self->_backstopView;
    self->_backstopView = &v4->super;

    v6 = self->_backstopView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIControl setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIControl addTarget:action:forControlEvents:](self->_backstopView, "addTarget:action:forControlEvents:", self, sel__frameAction_, 4096);
    v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__tapAction_);
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v8;

    -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
    -[UIControl addGestureRecognizer:](self->_backstopView, "addGestureRecognizer:", self->_tapGestureRecognizer);
    backstopView = self->_backstopView;
  }
  return backstopView;
}

- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  UIControl *backstopView;
  void *v9;
  void *v10;
  SUUIScalingFlipView *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  v6 = a4;
  objc_msgSend(a3, "flipSourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  backstopView = self->_backstopView;
  objc_msgSend(v7, "frame");
  -[UIControl convertRect:fromView:](backstopView, "convertRect:fromView:", 0);
  objc_msgSend(v7, "setFrame:");
  -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_selectedViewControllerIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAdjustingViewsForDismiss = 1;
  v11 = -[SUUIScalingFlipView initWithFrontView:backView:]([SUUIScalingFlipView alloc], "initWithFrontView:backView:", v10, v7);
  -[UIControl addSubview:](self->_backstopView, "addSubview:", v11);
  -[SUUIScalingFlipView setDirection:](v11, "setDirection:", 1);
  -[SUUIScalingFlipView setDuration:](v11, "setDuration:", 0.449999988);
  v12 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke;
  v16[3] = &unk_2511F47C0;
  v16[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v16, 0.449999988);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke_2;
  v14[3] = &unk_2511FA0B0;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  -[SUUIScalingFlipView performFlipWithCompletionBlock:](v11, "performFlipWithCompletionBlock:", v14);
  self->_isAdjustingViewsForDismiss = 0;

}

void __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

uint64_t __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "_removeChildren");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissWithFadeTransitionCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  v8 = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke;
  v9[3] = &unk_2511F47C0;
  v9[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke_2;
  v7[3] = &unk_2511F49A8;
  v6 = v4;
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v9, v7, 0.449999988);

}

void __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1008);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "view", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAlpha:", 0.0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  -[SUUIOverlayContainerViewController popViewControllerAnimated:completion:](self, "popViewControllerAnimated:completion:", a3, 0);
}

- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  int64_t selectedViewControllerIndex;
  BOOL v9;
  int64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];

  v6 = a4;
  v7 = v6;
  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  v9 = selectedViewControllerIndex < 1;
  v10 = selectedViewControllerIndex - 1;
  if (!v9)
  {
    self->_selectedViewControllerIndex = v10;
    if (a3)
    {
      ++self->_popViewControllerCount;
      v11 = (void *)MEMORY[0x24BEBDB00];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke;
      v20[3] = &unk_2511F47C0;
      v20[4] = self;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke_2;
      v18[3] = &unk_2511F8420;
      v18[4] = self;
      v19 = v6;
      objc_msgSend(v11, "animateWithDuration:animations:completion:", v20, v18, 0.349999994);

    }
    else
    {
      -[SUUIOverlayContainerViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      -[SUUIOverlayContainerViewController traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v17, v14, v16);

      -[SUUIOverlayContainerViewController _popViewControllers](self, "_popViewControllers");
    }
  }

}

void __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);

}

uint64_t __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_popViewControllers");
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 984);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)replaceViewController:(id)a3 withViewController:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_viewControllers, "indexOfObjectIdenticalTo:", v12);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(v12, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v10, "setFrame:");
    -[SUUIOverlayContainerViewController addChildViewController:](self, "addChildViewController:", v6);
    objc_msgSend(v9, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_msgSend(v9, "removeFromSuperview");
    objc_msgSend(v12, "removeFromParentViewController");
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_viewControllers, "replaceObjectAtIndex:withObject:", v8, v6);

  }
}

- (void)showViewController:(id)a3 withCompletionBlock:(id)a4
{
  NSMutableArray *viewControllers;
  id v7;
  id v8;

  viewControllers = self->_viewControllers;
  v7 = a4;
  v8 = a3;
  if (-[NSMutableArray count](viewControllers, "count"))
    -[SUUIOverlayContainerViewController _slideInViewController:withCompletionBlock:](self, "_slideInViewController:withCompletionBlock:", v8, v7);
  else
    -[SUUIOverlayContainerViewController _fadeInViewController:withCompletionBlock:](self, "_fadeInViewController:withCompletionBlock:", v8, v7);

}

- (void)showViewControllers:(id)a3
{
  id v4;
  UIControl *backstopView;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  backstopView = self->_backstopView;
  -[SUUIOverlayContainerViewController dimmingViewColor](self, "dimmingViewColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIControl setBackgroundColor:](backstopView, "setBackgroundColor:", v6);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        -[SUUIOverlayContainerViewController _pushViewController:](self, "_pushViewController:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11++), (_QWORD)v18);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  -[SUUIOverlayContainerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  -[SUUIOverlayContainerViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v17, v14, v16);

}

- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIControl *backstopView;
  SUUIScalingFlipView *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 45);
  -[SUUIOverlayContainerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v10);
  objc_msgSend(v11, "setFrame:");

  objc_msgSend(v9, "flipSourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  backstopView = self->_backstopView;
  objc_msgSend(v13, "frame");
  -[UIControl convertRect:fromView:](backstopView, "convertRect:fromView:", 0);
  objc_msgSend(v13, "setFrame:");
  v15 = -[SUUIScalingFlipView initWithFrontView:backView:]([SUUIScalingFlipView alloc], "initWithFrontView:backView:", v13, v11);
  -[SUUIScalingFlipView setDuration:](v15, "setDuration:", 0.449999988);
  -[UIControl addSubview:](self->_backstopView, "addSubview:", v15);
  -[SUUIOverlayContainerViewController addChildViewController:](self, "addChildViewController:", v10);
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v10);

  self->_selectedViewControllerIndex = -[NSMutableArray count](self->_viewControllers, "count") - 1;
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke;
  v22[3] = &unk_2511F47C0;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v22, 0.449999988);
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke_2;
  v19[3] = &unk_2511FA0D8;
  v19[4] = self;
  v20 = v11;
  v21 = v8;
  v17 = v8;
  v18 = v11;
  -[SUUIScalingFlipView performFlipWithCompletionBlock:](v15, "performFlipWithCompletionBlock:", v19);

}

void __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[121];
  objc_msgSend(v1, "dimmingViewColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_positionViewControllersForSize:traitCollection:", v10, v7, v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addSubview:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "removeFromSuperview");

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSArray)viewControllers
{
  int64_t selectedViewControllerIndex;
  unint64_t v4;
  unint64_t v5;
  NSMutableArray *v6;

  if (self->_popViewControllerCount)
  {
    selectedViewControllerIndex = self->_selectedViewControllerIndex;
    v4 = -[NSMutableArray count](self->_viewControllers, "count");
    if (selectedViewControllerIndex + 1 < v4)
      v5 = selectedViewControllerIndex + 1;
    else
      v5 = v4;
    -[NSMutableArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v5);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_viewControllers;
  }
  return (NSArray *)v6;
}

- (void)loadView
{
  id v3;

  -[SUUIOverlayContainerViewController backstopControl](self, "backstopControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController setView:](self, "setView:", v3);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return !self->_isAdjustingViewsForDismiss;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];
  CGSize v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__SUUIOverlayContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_2511FA100;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, &__block_literal_global_32);
}

void __89__SUUIOverlayContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[SUUIOverlayContainerViewController view](self, "view", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v5 = v4;
  v7 = v6;
  -[SUUIOverlayContainerViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v8, v5, v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewController;
  -[SUUIOverlayContainerViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[SUUIOverlayContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  -[SUUIOverlayContainerViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v9, v6, v8);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  -[SUUIOverlayContainerViewController _selectedViewController](self, "_selectedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "locationInView:", self->_backstopView);
    -[SUUIOverlayContainerViewController _viewControllerForPoint:](self, "_viewControllerForPoint:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = v5 == v6;
    else
      v7 = 1;
    v8 = !v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_tapAction:(id)a3
{
  int64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(a3, "locationInView:", self->_backstopView);
  v4 = -[SUUIOverlayContainerViewController _indexOfViewControllerForPoint:](self, "_indexOfViewControllerForPoint:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 != self->_selectedViewControllerIndex)
  {
    self->_selectedViewControllerIndex = v4;
    v5[4] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__SUUIOverlayContainerViewController__tapAction___block_invoke;
    v6[3] = &unk_2511F47C0;
    v6[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__SUUIOverlayContainerViewController__tapAction___block_invoke_2;
    v5[3] = &unk_2511F4908;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v6, v5, 0.349999994);
  }
}

void __49__SUUIOverlayContainerViewController__tapAction___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);

}

uint64_t __49__SUUIOverlayContainerViewController__tapAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_popViewControllers");
}

- (void)_frameAction:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[SUUIOverlayContainerViewController view](self, "view", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v5 = v4;
  v7 = v6;
  -[SUUIOverlayContainerViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v8, v5, v7);

}

- (UIColor)dimmingViewColor
{
  void *v2;
  double v3;
  double v4;

  -[SUUIOverlayContainerViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  if (v4 <= 1024.0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "_dimmingViewColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.7);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_fadeInViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIControl bounds](self->_backstopView, "bounds");
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v7);
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setAlpha:", 0.0);
  -[SUUIOverlayContainerViewController _pushViewController:](self, "_pushViewController:", v7);

  v9 = (void *)MEMORY[0x24BEBDB00];
  v13 = v6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke;
  v14[3] = &unk_2511F46D0;
  v14[4] = self;
  v15 = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke_2;
  v12[3] = &unk_2511F49A8;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "animateWithDuration:animations:completion:", v14, v12, 0.349999994);

}

uint64_t __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[121];
  objc_msgSend(v2, "dimmingViewColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (CGRect)_centeredFrameForViewController:(id)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");

  -[SUUIOverlayContainerViewController _overlaySizeForController:atBoundsSize:](self, "_overlaySizeForController:atBoundsSize:", v7, width, height);
  v10 = v9;
  v12 = v11;

  v13 = (width - v10) * 0.5;
  v14 = floorf(v13);
  v15 = (height - v12) * 0.5;
  v16 = floorf(v15);
  v17 = v10;
  v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (int64_t)_indexOfViewControllerForPoint:(CGPoint)a3
{
  NSMutableArray *viewControllers;
  int64_t v4;
  _QWORD v6[5];
  CGPoint v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  viewControllers = self->_viewControllers;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__SUUIOverlayContainerViewController__indexOfViewControllerForPoint___block_invoke;
  v6[3] = &unk_2511FA168;
  v7 = a3;
  v6[4] = &v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __69__SUUIOverlayContainerViewController__indexOfViewControllerForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  _BOOL4 v8;
  id v9;
  CGRect v10;

  v9 = a2;
  if (objc_msgSend(v9, "isViewLoaded"))
  {
    objc_msgSend(v9, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = CGRectContainsPoint(v10, *(CGPoint *)(a1 + 40));

    if (v8)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

- (CGSize)_overlaySizeForController:(id)a3 atBoundsSize:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "frame");
    v8 = CGRectGetHeight(v15);
  }
  else
  {
    v8 = 0.0;
  }
  if (width >= 1366.0)
  {
    v10 = 784.0;
    v9 = 904.0;
  }
  else
  {
    v9 = 1045.0;
    if (width >= 1024.0 && height >= 1045.0)
    {
      v10 = 784.0;
    }
    else
    {
      v9 = 630.0;
      v10 = 630.0;
    }
  }
  v11 = v8 + v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)_overlaySpacingForSize:(CGSize)a3
{
  BOOL v3;
  double result;

  v3 = a3.width <= a3.height;
  result = 35.0;
  if (!v3)
    return 120.0;
  return result;
}

- (void)_popViewControllers
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_selectedViewControllerIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = -[NSMutableArray count](self->_viewControllers, "count");
    if (v3 > self->_selectedViewControllerIndex + 1)
    {
      v4 = v3;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", --v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeFromParentViewController");
        if (objc_msgSend(v5, "isViewLoaded"))
        {
          objc_msgSend(v5, "view");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeFromSuperview");

        }
        -[SUUIOverlayContainerViewController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "overlayContainerViewController:willPopViewController:", self, v5);
        -[NSMutableArray removeObjectAtIndex:](self->_viewControllers, "removeObjectAtIndex:", v4);

      }
      while (v4 > self->_selectedViewControllerIndex + 1);
    }
  }
}

- (void)_positionViewControllersForSize:(CGSize)a3 traitCollection:(id)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int64_t selectedViewControllerIndex;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  int64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;

  height = a3.height;
  width = a3.width;
  -[SUUIOverlayContainerViewController _selectedViewController](self, "_selectedViewController", a4);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[SUUIOverlayContainerViewController _overlaySpacingForSize:](self, "_overlaySpacingForSize:", width, height);
    v47 = v7;
    -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v46, 0.0, 0.0, width, height);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v46, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    selectedViewControllerIndex = self->_selectedViewControllerIndex;
    v48 = height;
    if (selectedViewControllerIndex >= 1)
    {
      v18 = selectedViewControllerIndex + 1;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v18 - 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v19, 0.0, 0.0, width, height);
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v49.origin.x = v9;
        v49.origin.y = v11;
        v49.size.width = v13;
        v49.size.height = v15;
        v9 = CGRectGetMinX(v49) - v23 - v47;
        objc_msgSend(v19, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setFrame:", v9, v21, v23, v25);

        --v18;
        v15 = v25;
        v13 = v23;
        v11 = v21;
        height = v48;
      }
      while (v18 > 1);
    }
    v27 = -[NSMutableArray count](self->_viewControllers, "count");
    -[SUUIOverlayContainerViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v37 = self->_selectedViewControllerIndex + 1;
    if (v37 < v27)
    {
      do
      {
        -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v38, 0.0, 0.0, width, height);
        v40 = v39;
        v42 = v41;
        v44 = v43;
        v50.origin.x = v30;
        v50.origin.y = v32;
        v50.size.width = v34;
        v50.size.height = v36;
        v30 = v47 + CGRectGetMaxX(v50);
        objc_msgSend(v38, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setFrame:", v30, v40, v42, v44);

        ++v37;
        v36 = v44;
        height = v48;
        v34 = v42;
        v32 = v40;
      }
      while (v27 != v37);
    }
  }

}

- (void)_pushViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIControl *backstopView;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", 8.0);

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  -[SUUIOverlayContainerViewController addChildViewController:](self, "addChildViewController:", v4);
  backstopView = self->_backstopView;
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIControl addSubview:](backstopView, "addSubview:", v8);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:", v4);

  self->_selectedViewControllerIndex = -[NSMutableArray count](self->_viewControllers, "count") - 1;
}

- (void)_removeChildren
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_viewControllers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isViewLoaded", (_QWORD)v9))
        {
          objc_msgSend(v7, "view");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeFromSuperview");

        }
        objc_msgSend(v7, "removeFromParentViewController");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (id)_selectedViewController
{
  if (self->_selectedViewControllerIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_slideInViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  NSMutableArray *viewControllers;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  CGRect v30;

  v6 = a4;
  viewControllers = self->_viewControllers;
  v8 = a3;
  -[NSMutableArray lastObject](viewControllers, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIOverlayContainerViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v8);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SUUIOverlayContainerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  -[SUUIOverlayContainerViewController _overlaySpacingForSize:](self, "_overlaySpacingForSize:", v19, v20);
  v22 = v21;

  objc_msgSend(v9, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v24 = v22 + CGRectGetMaxX(v30);

  objc_msgSend(v10, "setFrame:", v24, v13, v15, v17);
  -[SUUIOverlayContainerViewController _pushViewController:](self, "_pushViewController:", v8);

  v25 = (void *)MEMORY[0x24BEBDB00];
  v28 = v6;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke;
  v29[3] = &unk_2511F47C0;
  v29[4] = self;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke_2;
  v27[3] = &unk_2511F49A8;
  v26 = v6;
  objc_msgSend(v25, "animateWithDuration:animations:completion:", v29, v27, 0.349999994);

}

void __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);

}

uint64_t __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_viewControllerForPoint:(CGPoint)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SUUIOverlayContainerViewController _indexOfViewControllerForPoint:](self, "_indexOfViewControllerForPoint:", a3.x, a3.y);
  if (v4 >= -[NSMutableArray count](self->_viewControllers, "count"))
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (SUUIOverlayContainerDelegate)delegate
{
  return (SUUIOverlayContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backstopView, 0);
}

@end
