@implementation CFXEffectBrowserContentPresenterViewController

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[CFXEffectBrowserContentPresenterViewController setView:](self, "setView:", v3);

}

- (void)configureEffectBrowserContentPresentationForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double Width;
  double Height;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  -[CFXEffectBrowserContentPresenterViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16)
  {
    -[CFXEffectBrowserContentPresenterViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v8, v10, v12, v14);

  }
  else
  {
    v36.origin.x = v8;
    v36.origin.y = v10;
    v36.size.width = v12;
    v36.size.height = v14;
    Width = CGRectGetWidth(v36);
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    Height = CGRectGetHeight(v37);
    switch(a3)
    {
      case 1:
        v20 = 0.0;
        break;
      case 3:
        v20 = 1.57079633;
        break;
      case 4:
        v20 = -1.57079633;
        break;
      default:
        v20 = 3.14159265;
        if (a3 != 2)
          v20 = 0.0;
        break;
    }
    CGAffineTransformMakeRotation(&v35, -v20);
    -[CFXEffectBrowserContentPresenterViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v35;
    objc_msgSend(v21, "setTransform:", &v34);

    if (Width >= Height)
      v22 = Height;
    else
      v22 = Width;
    if (Width < Height)
      Width = Height;
    -[CFXEffectBrowserContentPresenterViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBounds:", 0.0, 0.0, v22, Width);

    objc_msgSend(v5, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    objc_msgSend(v5, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", a3, 0.0, 0.0, v22, Width, v25, v26, v27, v28);
    v30 = v29;
    v32 = v31;
    -[CFXEffectBrowserContentPresenterViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCenter:", v30, v32);

  }
}

- (CGSize)expandedAppViewControllerSizeForEffectBrowserViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CFXEffectBrowserContentPresenterViewController CFX_alwaysExpandedAppHeight](self, "CFX_alwaysExpandedAppHeight", a3);
  v4 = v3;
  v5 = 375.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)CFX_alwaysExpandedAppHeight
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
  double Width;
  double Height;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  +[JFXOrientationMonitor keyWindow](JFXOrientationMonitor, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  Height = CGRectGetHeight(v24);
  if (Width < Height)
    Width = Height;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v14 = CGRectGetWidth(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v15 = CGRectGetHeight(v26);
  if (v14 >= v15)
    v16 = v15;
  else
    v16 = v14;
  -[CFXEffectBrowserContentPresenterViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effectBrowserViewController:screenTopBarHeightForWindowBounds:orientation:", self, 4, 0.0, 0.0, Width, v16);
  v19 = v18;

  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = Width;
  v27.size.height = v16;
  v20 = CGRectGetHeight(v27);
  v21 = 112.0;
  if (v19 > 0.0)
    v21 = v19 + 36.0;
  return v20 - v21;
}

- (id)CFX_constraintsForAlwaysExpandedAppView:(id)a3 containerView:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 36.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -36.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 375.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CFXEffectBrowserContentPresenterViewController CFX_alwaysExpandedAppHeight](self, "CFX_alwaysExpandedAppHeight");
  v17 = v16;
  objc_msgSend(v7, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToConstant:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  v22[1] = v13;
  v22[2] = v15;
  v22[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)effectBrowserViewController:(id)a3 presentExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  -[CFXEffectBrowserContentPresenterViewController addChildViewController:](self, "addChildViewController:", v9);
  -[CFXEffectBrowserContentPresenterViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v9, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0.0;
  objc_msgSend(v13, "setAlpha:", 0.0);

  objc_msgSend(v9, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserContentPresenterViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectBrowserContentPresenterViewController CFX_constraintsForAlwaysExpandedAppView:containerView:](self, "CFX_constraintsForAlwaysExpandedAppView:containerView:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
  objc_msgSend(v9, "didMoveToParentViewController:", self);
  v19 = !v7;
  v20 = (void *)MEMORY[0x24BDF6FA8];
  if (!v19)
    v14 = 0.4;
  v25 = v10;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke;
  v26[3] = &unk_24EE57B60;
  v27 = v9;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke_2;
  v24[3] = &unk_24EE587E0;
  v21 = v10;
  v22 = v9;
  v23 = (id)objc_msgSend(v20, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 0, v26, v24, v14, 0.0);

}

void __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_presentExpandedAppViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)effectBrowserViewController:(id)a3 dismissExpandedAppViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v7 = a5;
  v8 = a4;
  v9 = a6;
  if (v7)
    v10 = 0.4;
  else
    v10 = 0.0;
  v11 = (void *)MEMORY[0x24BDF6FA8];
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke;
  v19[3] = &unk_24EE57B60;
  v20 = v8;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke_2;
  v16[3] = &unk_24EE58808;
  v17 = v20;
  v18 = v9;
  v13 = v9;
  v14 = v20;
  v15 = (id)objc_msgSend(v11, "runningPropertyAnimatorWithDuration:delay:options:animations:completion:", 0, v19, v16, v10, 0.0);

}

void __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __131__CFXEffectBrowserContentPresenterViewController_effectBrowserViewController_dismissExpandedAppViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "jfxRemoveFromParentViewController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (CFXEffectBrowserContentPresenterViewControllerDelegate)delegate
{
  return (CFXEffectBrowserContentPresenterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
