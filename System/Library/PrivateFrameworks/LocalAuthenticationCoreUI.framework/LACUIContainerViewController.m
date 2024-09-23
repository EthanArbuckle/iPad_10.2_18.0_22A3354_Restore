@implementation LACUIContainerViewController

- (LACUIContainerViewController)init
{
  LACUIContainerViewController *v2;
  LACUIContainerViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACUIContainerViewController;
  v2 = -[LACUIContainerViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[LACUIContainerViewController _setup](v2, "_setup");
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[LACUIContainerViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[LACUIContainerViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[LACUIContainerViewController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[LACUIContainerViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)LACUIContainerViewController;
    -[LACUIContainerViewController navigationItem](&v9, sel_navigationItem);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACUIContainerViewController;
  -[LACUIContainerViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[LACUIContainerViewController delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[LACUIContainerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[LACUIContainerViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerViewControllerViewDidDisappear:", self);

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_preferredContentSizeDidChangeForChildViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACUIContainerViewController;
  v4 = a3;
  -[LACUIContainerViewController _preferredContentSizeDidChangeForChildViewController:](&v9, sel__preferredContentSizeDidChangeForChildViewController_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[LACUIContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)presentViewController:(id)a3 transitionStyle:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__LACUIContainerViewController_presentViewController_transitionStyle___block_invoke;
  v9[3] = &unk_2510F8220;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[LACUIContainerViewController _performWithoutAnimations:](self, "_performWithoutAnimations:", v9);
  -[LACUIContainerViewController currentViewController](self, "currentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController _transitionFromVC:toVC:transitionStyle:](self, "_transitionFromVC:toVC:transitionStyle:", v7, v8, a4);

  -[LACUIContainerViewController setCurrentViewController:](self, "setCurrentViewController:", v8);
}

uint64_t __70__LACUIContainerViewController_presentViewController_transitionStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 968));
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;

  obj = (id)objc_opt_new();
  -[LACUIContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", obj);

  objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(obj, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(obj, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(obj, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(obj, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIContainerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  objc_storeWeak((id *)&self->_containerView, obj);
}

- (void)_transitionFromVC:(id)a3 toVC:(id)a4 transitionStyle:(int64_t)a5
{
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  UIView **v13;
  id v14;
  CGFloat v15;
  id v16;
  double v17;
  double v18;
  UIView **p_containerView;
  id WeakRetained;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  CGAffineTransform v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;

  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x24BDBD8B8];
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v39.c = v11;
  *(_OWORD *)&v39.tx = v12;
  *(_OWORD *)&v38.a = v10;
  *(_OWORD *)&v38.c = v11;
  *(_OWORD *)&v38.tx = v12;
  *(_OWORD *)&v39.a = v10;
  if (a5 == 2)
  {
    p_containerView = &self->_containerView;
    *(_OWORD *)&v30.a = v10;
    *(_OWORD *)&v30.c = v11;
    *(_OWORD *)&v30.tx = v12;
    WeakRetained = objc_loadWeakRetained((id *)p_containerView);
    objc_msgSend(WeakRetained, "bounds");
    v37 = v30;
    CGAffineTransformTranslate(&v39, &v37, -v21, 0.0);

    v16 = objc_loadWeakRetained((id *)p_containerView);
    objc_msgSend(v16, "bounds");
    v18 = v22;
  }
  else
  {
    if (a5 != 1)
      goto LABEL_6;
    v13 = &self->_containerView;
    *(_OWORD *)&v30.a = v10;
    *(_OWORD *)&v30.c = v11;
    *(_OWORD *)&v30.tx = v12;
    v14 = objc_loadWeakRetained((id *)v13);
    objc_msgSend(v14, "bounds");
    v37 = v30;
    CGAffineTransformTranslate(&v39, &v37, v15, 0.0);

    v16 = objc_loadWeakRetained((id *)v13);
    objc_msgSend(v16, "bounds");
    v18 = -v17;
  }
  v37 = v30;
  CGAffineTransformTranslate(&v38, &v37, v18, 0.0);

LABEL_6:
  if (a5)
    v23 = 0.3;
  else
    v23 = 0.0;
  objc_msgSend(v8, "willMoveToParentViewController:", 0, *(_OWORD *)&v30.a, *(_OWORD *)&v30.c, *(_OWORD *)&v30.tx);
  objc_msgSend(v9, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v39;
  objc_msgSend(v24, "setTransform:", &v37);

  v25 = (void *)MEMORY[0x24BEBDB00];
  v26 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke;
  v33[3] = &unk_2510F83A0;
  v27 = v8;
  v36 = v38;
  v34 = v27;
  v35 = v9;
  v31[0] = v26;
  v31[1] = 3221225472;
  v31[2] = __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke_2;
  v31[3] = &unk_2510F83C8;
  v32 = v27;
  v28 = v27;
  v29 = v9;
  objc_msgSend(v25, "animateWithDuration:animations:completion:", v33, v31, v23);

}

void __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setTransform:", &v6);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6 = *MEMORY[0x24BDBD8B8];
  v7 = v5;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v4, "setTransform:", &v6);

}

uint64_t __71__LACUIContainerViewController__transitionFromVC_toVC_transitionStyle___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
}

- (void)_performWithoutAnimations:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);
  uint64_t v5;

  v3 = (void *)MEMORY[0x24BDE57D8];
  v4 = (void (**)(_QWORD))a3;
  v5 = objc_msgSend(v3, "disableActions");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v4[2](v4);

  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v5);
}

- (UIViewController)currentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_currentViewController);
}

- (void)setCurrentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_currentViewController, a3);
}

- (LACUIContainerViewControllerDelegate)delegate
{
  return (LACUIContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_currentViewController);
  objc_destroyWeak((id *)&self->_containerView);
}

@end
