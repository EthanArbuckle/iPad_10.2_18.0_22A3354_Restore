@implementation UIViewController(FMFModal)

- (void)fmf_presentModalViewController:()FMFModal
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(a1, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:");

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v7, "setTag:", 1111);
  objc_msgSend(a1, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_msgSend(a1, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v4, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v12, v16, v14, v16);

  objc_msgSend(a1, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  objc_msgSend(a1, "addChildViewController:", v4);
  v20 = (void *)MEMORY[0x24BDF6F90];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __61__UIViewController_FMFModal__fmf_presentModalViewController___block_invoke;
  v22[3] = &unk_24C877D90;
  v22[4] = a1;
  v23 = v4;
  v21 = v4;
  objc_msgSend(v20, "animateWithDuration:animations:", v22, 0.3);

}

- (void)fmf_dismissModalViewController:()FMFModal
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DD58000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: fmf_dismissModalViewController", buf, 2u);
  }

  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  v6 = (void *)MEMORY[0x24BDF6F90];
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke;
  v11[3] = &unk_24C877D90;
  v12 = v4;
  v13 = a1;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __61__UIViewController_FMFModal__fmf_dismissModalViewController___block_invoke_2;
  v9[3] = &unk_24C877FC8;
  v9[4] = a1;
  v10 = v12;
  v8 = v12;
  objc_msgSend(v6, "animateWithDuration:animations:completion:", v11, v9, 0.3);

}

- (id)fmf_dimmingViewForViewController:()FMFModal
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWithTag:", 1111);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fmf_afterPresentAnimation:()FMFModal
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(a1, "fmf_dimmingViewForViewController:", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.5);
  objc_msgSend(v4, "didMoveToParentViewController:", a1);

}

- (void)fmf_afterDismissAnimation:()FMFModal
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "fmf_dimmingViewForViewController:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");
  objc_msgSend(v4, "removeFromParentViewController");
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeFromSuperview");
}

@end
