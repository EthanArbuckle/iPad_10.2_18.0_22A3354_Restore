@implementation HKTabBarController

- (HKTabBarController)init
{
  HKTabBarController *v2;
  HKTabBarController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKTabBarController;
  v2 = -[HKTabBarController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HKTabBarController setDelegate:](v2, "setDelegate:", v2);
  return v3;
}

- (HKTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  HKTabBarController *v4;
  HKTabBarController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKTabBarController;
  v4 = -[HKTabBarController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKTabBarController setDelegate:](v4, "setDelegate:", v4);
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKTabBarController;
  -[HKTabBarController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[HKTabBarController selectedViewController](self, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTabBarController setPreviousViewController:](self, "setPreviousViewController:", v4);

}

- (void)setTabBarControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;

  v4 = a3;
  -[HKTabBarController tabBar](self, "tabBar", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTabBarController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "frame");
  if ((((v11 < v19) ^ v4) & 1) == 0)
  {
    v20 = v17;
    v21 = v18;
    v22 = v19;
    v25 = v16;
    if (v4)
      v23 = v15;
    else
      v23 = -v15;
    v24 = (void *)MEMORY[0x1E0DC3F10];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __55__HKTabBarController_setTabBarControlsHidden_animated___block_invoke;
    v26[3] = &unk_1E9C452E0;
    v27 = v6;
    v29 = v9;
    v30 = v11;
    v31 = v13;
    v32 = v15;
    v33 = v23;
    v28 = v7;
    v34 = v25;
    v35 = v20;
    v36 = v21;
    v37 = v22;
    objc_msgSend(v24, "animateWithDuration:animations:", v26, 0.3);

  }
}

uint64_t __55__HKTabBarController_setTabBarControlsHidden_animated___block_invoke(uint64_t a1)
{
  void *v2;
  CGRect v4;

  v2 = *(void **)(a1 + 32);
  v4 = CGRectOffset(*(CGRect *)(a1 + 48), 0.0, *(CGFloat *)(a1 + 80));
  objc_msgSend(v2, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112) + *(double *)(a1 + 80));
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HKTabBarController selectedViewController](self, "selectedViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");
  else
    v5 = 2;

  return v5;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  char v12;
  id v13;

  v13 = a4;
  -[HKTabBarController previousViewController](self, "previousViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1F0248E60);

  if (v6)
  {
    -[HKTabBarController previousViewController](self, "previousViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v13)
    {

    }
    else
    {
      -[HKTabBarController previousViewController](self, "previousViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[HKTabBarController previousViewController](self, "previousViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didChangeToAnotherTab");

        goto LABEL_10;
      }
    }
    -[HKTabBarController previousViewController](self, "previousViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 == v13)
    {
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
        objc_msgSend(v13, "didTapTabBarIcon");
    }
    else
    {

    }
  }
LABEL_10:
  -[HKTabBarController setPreviousViewController:](self, "setPreviousViewController:", v13);

}

- (UIViewController)previousViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_previousViewController);
}

- (void)setPreviousViewController:(id)a3
{
  objc_storeWeak((id *)&self->_previousViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousViewController);
}

@end
