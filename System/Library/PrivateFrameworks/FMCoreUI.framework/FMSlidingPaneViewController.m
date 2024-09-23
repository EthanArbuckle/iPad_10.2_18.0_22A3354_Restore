@implementation FMSlidingPaneViewController

- (FMSlidingPaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FMSlidingPaneViewController *v4;
  FMSlidingPaneViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMSlidingPaneViewController;
  v4 = -[FMViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[FMSlidingPaneViewController commonConfiguration](v4, "commonConfiguration");
  return v5;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMSlidingPaneViewController;
  -[FMViewController awakeFromNib](&v3, sel_awakeFromNib);
  -[FMSlidingPaneViewController commonConfiguration](self, "commonConfiguration");
}

- (void)commonConfiguration
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *MEMORY[0x24BDF7718];
  v4 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v6 = *(double *)(MEMORY[0x24BDF7718] + 24);
  -[FMSlidingPaneViewController setPaneInsets:](self, "setPaneInsets:", *MEMORY[0x24BDF7718], v4, v5, v6);
  -[FMSlidingPaneViewController setPaneContentInsets:](self, "setPaneContentInsets:", v3, v4, v5, v6);
  -[FMSlidingPaneViewController setAnimationDuration:](self, "setAnimationDuration:", 0.200000003);
  -[FMSlidingPaneViewController setAnimationSpringDamping:](self, "setAnimationSpringDamping:", 1.0);
  -[FMSlidingPaneViewController setAnimationInitialVelocity:](self, "setAnimationInitialVelocity:", 0.0);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FMSlidingPaneViewController setActionFutures:](self, "setActionFutures:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMSlidingPaneViewController;
  -[FMViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[FMSlidingPaneViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
}

- (id)traitCollectionForChildViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMSlidingPaneViewController;
  -[FMSlidingPaneViewController traitCollection](&v19, sel_traitCollection);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paneViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v4)
    {
      -[FMSlidingPaneViewController paneState](self, "paneState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "edge");

      switch(v11)
      {
        case 1:
        case 4:
          objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithVerticalSizeClass:", 1);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x24BDF6F30];
          v21[0] = v5;
          v21[1] = v12;
          v14 = (void *)MEMORY[0x24BDBCE30];
          v15 = v21;
          goto LABEL_6;
        case 2:
        case 8:
          objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithHorizontalSizeClass:", 1);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x24BDF6F30];
          v20[0] = v5;
          v20[1] = v12;
          v14 = (void *)MEMORY[0x24BDBCE30];
          v15 = v20;
LABEL_6:
          objc_msgSend(v14, "arrayWithObjects:count:", v15, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "traitCollectionWithTraitsFromCollections:", v16);
          v17 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v17;
          break;
        default:
          LogCategory_Unspecified();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[FMSlidingPaneViewController traitCollectionForChildViewController:].cold.1(self, v12);
          break;
      }

    }
  }

  return v5;
}

- (UIView)paneView
{
  void *v2;
  void *v3;

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIViewController)paneViewController
{
  void *v2;
  void *v3;

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIVisualEffect)paneVisualEffect
{
  UIVisualEffect *paneVisualEffect;
  UIVisualEffect *v4;
  UIVisualEffect *v5;

  paneVisualEffect = self->_paneVisualEffect;
  if (!paneVisualEffect)
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 0);
    v4 = (UIVisualEffect *)objc_claimAutoreleasedReturnValue();
    v5 = self->_paneVisualEffect;
    self->_paneVisualEffect = v4;

    paneVisualEffect = self->_paneVisualEffect;
  }
  return paneVisualEffect;
}

- (void)setPaneVisualEffect:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_storeStrong((id *)&self->_paneVisualEffect, a3);
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visualEffectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v14);
    objc_msgSend(v7, "frame");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(v8, "setAutoresizingMask:", objc_msgSend(v7, "autoresizingMask"));
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVisualEffectView:", v8);

    objc_msgSend(v7, "removeFromSuperview");
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "paneView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8);

    -[FMSlidingPaneViewController paneState](self, "paneState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paneView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendSubviewToBack:", v8);

  }
}

- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  SlidingPaneViewState *v19;
  uint64_t v20;
  SlidingPaneViewState *v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[4];
  SlidingPaneViewState *v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  id location;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v7 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  LogCategory_FMSlidingPaneViewController();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v10;
    v39 = 2048;
    v40 = a4;
    v41 = 1024;
    v42 = v7;
    _os_log_impl(&dword_20DBDA000, v13, OS_LOG_TYPE_DEFAULT, "presentPaneViewController: %@ fromEdge:%ld animated:%d completed:", buf, 0x1Cu);
  }

  objc_msgSend(v10, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[FMSlidingPaneViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isToolbarHidden");

    if ((v17 & 1) == 0)
    {
      -[FMSlidingPaneViewController setDidHideToolbar:](self, "setDidHideToolbar:", 1);
      -[FMSlidingPaneViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setToolbarHidden:animated:", 1, v7);

    }
  }
  v19 = -[SlidingPaneViewState initWithViewController:edge:]([SlidingPaneViewState alloc], "initWithViewController:edge:", v10, a4);
  v20 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke;
  v30[3] = &unk_24C8371C0;
  objc_copyWeak(&v34, &location);
  v21 = v19;
  v31 = v21;
  v22 = v12;
  v32 = v22;
  v23 = v11;
  v33 = v23;
  v35 = v7;
  v24 = (void (**)(_QWORD))MEMORY[0x212BB0C68](v30);
  -[FMSlidingPaneViewController currentFuture](self, "currentFuture");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    LogCategory_FMSlidingPaneViewController();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBDA000, v26, OS_LOG_TYPE_DEFAULT, "Deferring presenting until previous action is complete", buf, 2u);
    }

    v28[0] = v20;
    v28[1] = 3221225472;
    v28[2] = __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke_78;
    v28[3] = &unk_24C8371E8;
    v29 = v24;
    v27 = (id)objc_msgSend(v25, "addCompletionBlock:", v28);

  }
  else
  {
    v24[2](v24);
  }

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

void __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setPaneState:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "paneState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(WeakRetained, "_crossDissolveOldPaneState:newPaneState:animated:completion:", v2, v3, 1, *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(WeakRetained, "_presentPaneState:animated:interactive:completion:", v3, *(unsigned __int8 *)(a1 + 64), 0, *(_QWORD *)(a1 + 48));

}

uint64_t __86__FMSlidingPaneViewController_presentPaneViewController_fromEdge_animated_completion___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentPaneViewController:(id)a3 fromEdge:(unint64_t)a4 withPercent:(double)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char v23;
  SlidingPaneViewState *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  int v50;
  id v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_FMSlidingPaneViewController();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v50 = 138412802;
    v51 = v10;
    v52 = 2048;
    v53 = a4;
    v54 = 2048;
    v55 = a5;
    _os_log_impl(&dword_20DBDA000, v13, OS_LOG_TYPE_DEFAULT, "presentPaneViewController: %@ fromEdge:%ld withPercent:%f completion:", (uint8_t *)&v50, 0x20u);
  }

  objc_msgSend(v10, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController navigationController](self, "navigationController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[FMSlidingPaneViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isToolbarHidden");

    if ((v18 & 1) == 0)
    {
      -[FMSlidingPaneViewController setDidHideToolbar:](self, "setDidHideToolbar:", 1);
      -[FMSlidingPaneViewController navigationController](self, "navigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setToolbarHidden:animated:", 1, 1);

    }
  }
  -[FMSlidingPaneViewController currentFuture](self, "currentFuture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    LogCategory_FMSlidingPaneViewController();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FMSlidingPaneViewController presentPaneViewController:fromEdge:withPercent:completion:].cold.2();

  }
  objc_msgSend(v12, "paneViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqual:", v10);

  if ((v23 & 1) == 0)
  {
    v24 = -[SlidingPaneViewState initWithViewController:edge:]([SlidingPaneViewState alloc], "initWithViewController:edge:", v10, a4);
    -[FMSlidingPaneViewController setPaneState:](self, "setPaneState:", v24);

    -[FMSlidingPaneViewController paneState](self, "paneState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[FMSlidingPaneViewController _crossDissolveOldPaneState:newPaneState:animated:completion:](self, "_crossDissolveOldPaneState:newPaneState:animated:completion:", v12, v25, 0, v11);
    else
      -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:](self, "_presentPaneState:animated:interactive:completion:", v25, 0, 1, v11);

  }
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController _preferredSizeForPaneState:](self, "_preferredSizeForPaneState:", v26);
  v28 = v27;
  v30 = v29;

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "edge");

  switch(v32)
  {
    case 1:
      v33 = -((v30 + 2.0) * (1.0 - a5));
      goto LABEL_21;
    case 2:
      v33 = -((v28 + 2.0) * (1.0 - a5));
      goto LABEL_23;
    case 4:
      v33 = (1.0 - a5) * (v30 + 2.0);
LABEL_21:
      -[FMSlidingPaneViewController paneState](self, "paneState");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject paneVerticalPositionConstraint](v34, "paneVerticalPositionConstraint");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 8:
      v33 = (1.0 - a5) * (v28 + 2.0);
LABEL_23:
      -[FMSlidingPaneViewController paneState](self, "paneState");
      v34 = objc_claimAutoreleasedReturnValue();
      -[NSObject paneHorizontalPositionConstraint](v34, "paneHorizontalPositionConstraint");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v36 = v35;
      objc_msgSend(v35, "setConstant:", v33);

      break;
    default:
      LogCategory_Unspecified();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController traitCollectionForChildViewController:].cold.1(self, v34);
      break;
  }

  if (a5 >= 1.0)
  {
    -[FMSlidingPaneViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = v38;
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "paneView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v43 = v39 - v42;
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "paneView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bounds");
    v47 = v46;

    -[FMSlidingPaneViewController paneState](self, "paneState");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "paneViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController didPresentPane:inRect:animated:](self, "didPresentPane:inRect:animated:", v49, 0, 0.0, v43, v47, v30);

    if (v11)
      v11[2](v11);
  }

}

- (void)dismissPaneViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  id location;
  uint8_t buf[4];
  _BOOL4 v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_initWeak(&location, self);
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v22 = v4;
    _os_log_impl(&dword_20DBDA000, v7, OS_LOG_TYPE_DEFAULT, "dismissPaneViewControllerAnimated:%d completion:", buf, 8u);
  }

  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke;
  v16[3] = &unk_24C837210;
  objc_copyWeak(&v18, &location);
  v9 = v6;
  v16[4] = self;
  v17 = v9;
  v19 = v4;
  v10 = (void (**)(_QWORD))MEMORY[0x212BB0C68](v16);
  -[FMSlidingPaneViewController currentFuture](self, "currentFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    LogCategory_FMSlidingPaneViewController();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DBDA000, v12, OS_LOG_TYPE_DEFAULT, "Deferring dismissing until previous action is complete", buf, 2u);
    }

    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke_80;
    v14[3] = &unk_24C8371E8;
    v15 = v10;
    v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v14);

  }
  else
  {
    v10[2](v10);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "paneState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "paneState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "paneViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "paneState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_dismissPaneState:animated:completion:", v5, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

      if (objc_msgSend(WeakRetained, "didHideToolbar"))
      {
        objc_msgSend(WeakRetained, "navigationController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setToolbarHidden:animated:", 0, *(unsigned __int8 *)(a1 + 56));

        objc_msgSend(WeakRetained, "setDidHideToolbar:", 0);
      }
      objc_msgSend(WeakRetained, "setPaneState:", 0);
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

}

uint64_t __76__FMSlidingPaneViewController_dismissPaneViewControllerAnimated_completion___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setPresentingConstraintConstant:(double)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "edge");

  switch(v6)
  {
    case 1:
      a3 = -a3;
      goto LABEL_3;
    case 2:
      a3 = -a3;
      goto LABEL_5;
    case 4:
LABEL_3:
      -[FMSlidingPaneViewController paneState](self, "paneState");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject paneVerticalPositionConstraint](v7, "paneVerticalPositionConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
LABEL_5:
      -[FMSlidingPaneViewController paneState](self, "paneState");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject paneHorizontalPositionConstraint](v7, "paneHorizontalPositionConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = v8;
      objc_msgSend(v8, "setConstant:", a3);

      break;
    default:
      LogCategory_Unspecified();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController traitCollectionForChildViewController:].cold.1(self, v7);
      break;
  }

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paneView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

- (void)willPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;
  CGRect v22;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  -[FMSlidingPaneViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LogCategory_FMSlidingPaneViewController();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      NSStringFromCGRect(v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v11;
      v17 = 2112;
      v18 = v14;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_20DBDA000, v13, OS_LOG_TYPE_DEFAULT, "Calling willPresentPane: %@ inRect: %@ animated:%d", (uint8_t *)&v15, 0x1Cu);

    }
    objc_msgSend(v12, "slidingPaneViewController:willPresentPane:inRect:animated:", self, v11, v5, x, y, width, height);
  }

}

- (void)didPresentPane:(id)a3 inRect:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;
  CGRect v22;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  -[FMSlidingPaneViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LogCategory_FMSlidingPaneViewController();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      NSStringFromCGRect(v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v11;
      v17 = 2112;
      v18 = v14;
      v19 = 1024;
      v20 = v5;
      _os_log_impl(&dword_20DBDA000, v13, OS_LOG_TYPE_DEFAULT, "Calling didPresentPane: %@ inRect: %@ animated:%d", (uint8_t *)&v15, 0x1Cu);

    }
    objc_msgSend(v12, "slidingPaneViewController:didPresentPane:inRect:animated:", self, v11, v5, x, y, width, height);
  }

}

- (void)willDismissPane:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FMSlidingPaneViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LogCategory_FMSlidingPaneViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_20DBDA000, v8, OS_LOG_TYPE_DEFAULT, "Calling willDismissPane: %@ animated:%d", (uint8_t *)&v9, 0x12u);
    }

    objc_msgSend(v7, "slidingPaneViewController:willDismissPane:animated:", self, v6, v4);
  }

}

- (void)didDismissPane:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FMSlidingPaneViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LogCategory_FMSlidingPaneViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_20DBDA000, v8, OS_LOG_TYPE_DEFAULT, "Calling didDismissPane: %@ animated:%d", (uint8_t *)&v9, 0x12u);
    }

    objc_msgSend(v7, "slidingPaneViewController:didDismissPane:animated:", self, v6, v4);
  }

}

- (void)paneSizeChanged:(CGRect)a3 forViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  -[FMSlidingPaneViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LogCategory_FMSlidingPaneViewController();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      NSStringFromCGRect(v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_20DBDA000, v11, OS_LOG_TYPE_DEFAULT, "Calling paneSizeChanged: %@ forViewController: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(v10, "slidingPaneViewController:paneSizeChanged:forViewController:", self, v9, x, y, width, height);
  }

}

- (void)dismiss:(id)a3
{
  -[FMSlidingPaneViewController dismissPaneViewControllerAnimated:completion:](self, "dismissPaneViewControllerAnimated:completion:", 1, 0);
}

- (void)_paneFrameChanged:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FMSlidingPaneViewController paneState](self, "paneState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldNotifyOfPaneSizeChanges");

  if (v9)
  {
    -[FMSlidingPaneViewController paneState](self, "paneState");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "paneViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController paneSizeChanged:forViewController:](self, "paneSizeChanged:forViewController:", v10, x, y, width, height);

  }
}

- (CGSize)_normalizeSize:(CGSize)a3
{
  double v3;
  double v4;
  CGFloat height;
  CGFloat width;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  uint64_t v14;
  CGSize v15;
  CGSize result;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = ceil(a3.width);
  v4 = ceil(a3.height);
  if (a3.width != v3 || a3.height != v4)
  {
    height = a3.height;
    width = a3.width;
    LogCategory_FMSlidingPaneViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15.width = width;
      v15.height = height;
      NSStringFromCGSize(v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_20DBDA000, v8, OS_LOG_TYPE_DEFAULT, "Un-normalized size: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  v10 = v3;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_metricsFromEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", top);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("top"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", left);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("left"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", bottom);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("bottom"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", right);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("right"));

  return v7;
}

- (CGSize)_preferredSizeForPaneState:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;
  CGSize v27;
  CGSize result;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "paneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v8 = v7;

  if (v6 == 0.0 && v8 == 0.0)
  {
    objc_msgSend(v3, "paneViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1112014848;
    LODWORD(v12) = 1112014848;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8), v11, v12);
    v6 = v13;
    v8 = v14;

    if (v6 == 0.0 || v8 == 0.0)
    {
      LogCategory_Unspecified();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v27.width = v6;
        v27.height = v8;
        NSStringFromCGSize(v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "paneViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraints");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v18;
        v24 = 2112;
        v25 = v21;
        _os_log_error_impl(&dword_20DBDA000, v15, OS_LOG_TYPE_ERROR, "Bad systemLayoutSize: %@ from constraints: %@", (uint8_t *)&v22, 0x16u);

      }
    }
  }

  v16 = v6;
  v17 = v8;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_createPaneViewForState:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  ISPaneFrameView *v10;
  double v11;
  double v12;
  ISPaneFrameView *v13;
  NSObject *v14;
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
  double v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v4 = a3;
  -[FMSlidingPaneViewController _preferredSizeForPaneState:](self, "_preferredSizeForPaneState:", v4);
  v6 = v5;
  v8 = v7;
  -[FMSlidingPaneViewController _paneParentView](self, "_paneParentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "edge"))
  {
    case 1:
    case 4:
      v10 = [ISPaneFrameView alloc];
      objc_msgSend(v9, "bounds");
      v12 = v8;
      goto LABEL_4;
    case 2:
    case 8:
      v10 = [ISPaneFrameView alloc];
      objc_msgSend(v9, "bounds");
      v11 = v6;
LABEL_4:
      v13 = -[ISPaneFrameView initWithFrame:](v10, "initWithFrame:", 0.0, 0.0, v11, v12);
      objc_msgSend(v4, "setPaneView:", v13);

      objc_msgSend(v4, "paneView");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject setOwningViewController:](v14, "setOwningViewController:", self);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBackgroundColor:](v14, "setBackgroundColor:", v15);

      _NSDictionaryOfVariableBindings(CFSTR("paneView"), v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMSlidingPaneViewController paneInsets](self, "paneInsets");
      -[FMSlidingPaneViewController _metricsFromEdgeInsets:](self, "_metricsFromEdgeInsets:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("preferredWidth"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("preferredHeight"));

      objc_msgSend(v4, "paneView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v21);

      objc_msgSend(v4, "paneView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(v4, "paneViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      switch(objc_msgSend(v4, "edge"))
      {
        case 1:
          v25 = (void *)MEMORY[0x24BDD1628];
          v26 = 1.0;
          v27 = v14;
          v28 = 3;
          v29 = v9;
          v30 = 3;
          goto LABEL_12;
        case 2:
          v31 = (void *)MEMORY[0x24BDD1628];
          v32 = 1.0;
          v33 = v14;
          v34 = 1;
          v35 = v9;
          v36 = 1;
          goto LABEL_14;
        case 4:
          v25 = (void *)MEMORY[0x24BDD1628];
          v26 = 1.0;
          v27 = v14;
          v28 = 4;
          v29 = v9;
          v30 = 4;
LABEL_12:
          objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, v28, 0, v29, v30, v26, 0.0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPaneVerticalPositionConstraint:", v38);

          objc_msgSend(v4, "paneVerticalPositionConstraint");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setIdentifier:", CFSTR("paneVerticalPositionConstant"));

          objc_msgSend(v4, "paneVerticalPositionConstraint");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addConstraint:", v40);

          v41 = (void *)MEMORY[0x24BDD1628];
          v42 = CFSTR("H:|-left-[paneView]-right-|");
          goto LABEL_15;
        case 8:
          v31 = (void *)MEMORY[0x24BDD1628];
          v32 = 1.0;
          v33 = v14;
          v34 = 2;
          v35 = v9;
          v36 = 2;
LABEL_14:
          objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, v34, 0, v35, v36, v32, 0.0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPaneHorizontalPositionConstraint:", v43);

          objc_msgSend(v4, "paneHorizontalPositionConstraint");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setIdentifier:", CFSTR("paneHorizontalPositionConstraint"));

          objc_msgSend(v4, "paneHorizontalPositionConstraint");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addConstraint:", v45);

          v41 = (void *)MEMORY[0x24BDD1628];
          v42 = CFSTR("V:|-top-[paneView]-bottom-|");
LABEL_15:
          objc_msgSend(v41, "constraintsWithVisualFormat:options:metrics:views:", v42, 0, v18, v16);
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addConstraints:", v37);
          break;
        default:
          LogCategory_Unspecified();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[FMSlidingPaneViewController _createPaneViewForState:].cold.1(v4, v37);
          break;
      }

      v46 = objc_alloc(MEMORY[0x24BDF6FC8]);
      -[FMSlidingPaneViewController paneVisualEffect](self, "paneVisualEffect");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v46, "initWithEffect:", v47);
      objc_msgSend(v4, "setVisualEffectView:", v48);

      objc_msgSend(v4, "paneView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "bounds");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      objc_msgSend(v4, "visualEffectView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFrame:", v51, v53, v55, v57);

      objc_msgSend(v4, "visualEffectView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setAutoresizingMask:", 18);

      objc_msgSend(v4, "paneView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "visualEffectView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addSubview:", v61);

      objc_msgSend(v4, "paneView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "visualEffectView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sendSubviewToBack:", v63);

      objc_msgSend(v4, "paneView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "layoutIfNeeded");

      break;
    default:
      LogCategory_Unspecified();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController _createPaneViewForState:].cold.1(v4, v14);
      break;
  }

}

- (void)_createPaneContentConstraintsForState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id firstValue;

  objc_msgSend(a3, "paneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  firstValue = (id)objc_claimAutoreleasedReturnValue();

  -[FMSlidingPaneViewController _paneParentView](self, "_paneParentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("contentView"), firstValue, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController paneContentInsets](self, "paneContentInsets");
  -[FMSlidingPaneViewController _metricsFromEdgeInsets:](self, "_metricsFromEdgeInsets:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-top-[contentView]-bottom-|"), 0, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v8);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-left-[contentView]-right-|"), 0, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addConstraints:", v9);
  objc_msgSend(v5, "setNeedsUpdateConstraints");

}

- (void)_removeChildViewControllerForState:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "paneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);

  LogCategory_FMSlidingPaneViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "paneViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_20DBDA000, v5, OS_LOG_TYPE_DEFAULT, "_removeChildViewControllerForState: %@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v3, "paneViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  objc_msgSend(v3, "paneViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromParentViewController");

}

- (void)_presentPaneState:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v11;
  void (**v12)(_QWORD);
  FMSlidingPaneViewController *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  NSObject *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  void (**v82)(_QWORD);
  id v83[5];
  BOOL v84;
  _QWORD v85[4];
  id v86;
  id location;
  _BYTE v88[16];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  _BOOL4 v92;
  __int16 v93;
  _BOOL4 v94;
  uint64_t v95;

  v7 = a5;
  v8 = a4;
  v95 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (void (**)(_QWORD))a6;
  objc_initWeak(&location, self);
  v13 = self;
  v14 = -[FMSlidingPaneViewController newActionFuture](v13, "newActionFuture");
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("FMSlidingPaneViewController.m"), 571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paneState != nil"));

  }
  LogCategory_FMSlidingPaneViewController();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "paneViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v90 = v16;
    v91 = 1024;
    v92 = v8;
    v93 = 1024;
    v94 = v7;
    _os_log_impl(&dword_20DBDA000, v15, OS_LOG_TYPE_DEFAULT, "_presentPaneState: %@ animated:%d interactive:%d completion:", buf, 0x18u);

  }
  objc_msgSend(v11, "paneView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
    -[FMSlidingPaneViewController _createPaneViewForState:](v13, "_createPaneViewForState:", v11);
  -[FMSlidingPaneViewController _preferredSizeForPaneState:](v13, "_preferredSizeForPaneState:", v11);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v11, "paneView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutIfNeeded");

  LogCategory_FMSlidingPaneViewController();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "paneViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v90 = v25;
    _os_log_impl(&dword_20DBDA000, v24, OS_LOG_TYPE_DEFAULT, "addChildViewController: %@", buf, 0xCu);

  }
  objc_msgSend(v11, "paneViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController addChildViewController:](v13, "addChildViewController:", v26);

  objc_msgSend(v11, "paneView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  objc_msgSend(v11, "paneViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v29, v31, v33, v35);

  objc_msgSend(v11, "paneView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "paneViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", v40);

  -[FMSlidingPaneViewController _createPaneContentConstraintsForState:](v13, "_createPaneContentConstraintsForState:", v11);
  objc_msgSend(v11, "paneViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "didMoveToParentViewController:", v13);

  switch(objc_msgSend(v11, "edge"))
  {
    case 1:
      objc_msgSend(v11, "paneVerticalPositionConstraint");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v42, "setConstant:", 2.0 - v22);
      break;
    case 2:
      objc_msgSend(v11, "paneHorizontalPositionConstraint");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v42, "setConstant:", 2.0 - v20);
      break;
    case 4:
      objc_msgSend(v11, "paneVerticalPositionConstraint");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v42, "setConstant:", v22 + 2.0);
      break;
    case 8:
      objc_msgSend(v11, "paneHorizontalPositionConstraint");
      v42 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v42, "setConstant:", v20 + 2.0);
      break;
    default:
      LogCategory_FMSlidingPaneViewController();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:].cold.1((uint64_t)buf, objc_msgSend(v11, "edge"), v42);
      break;
  }

  objc_msgSend(v11, "paneView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "layoutIfNeeded");

  -[FMSlidingPaneViewController _preferredSizeForPaneState:](v13, "_preferredSizeForPaneState:", v11);
  v45 = v44;
  -[FMSlidingPaneViewController view](v13, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v48 = v47;
  objc_msgSend(v11, "paneView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v51 = v50;
  objc_msgSend(v11, "paneView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v54 = v53;

  objc_msgSend(v11, "paneViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v48 - v51;
  -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v13, "willPresentPane:inRect:animated:", v55, v8, 0.0, v56, *(double *)&v54, *(double *)&v45);

  objc_msgSend(v11, "setShouldNotifyOfPaneSizeChanges:", 1);
  -[FMSlidingPaneViewController view](v13, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "layoutIfNeeded");

  switch(objc_msgSend(v11, "edge"))
  {
    case 1:
      -[FMSlidingPaneViewController paneInsets](v13, "paneInsets");
      v59 = v58;
      objc_msgSend(v11, "paneVerticalPositionConstraint");
      v60 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v60, "setConstant:", v59);
      break;
    case 2:
      -[FMSlidingPaneViewController paneInsets](v13, "paneInsets");
      v62 = v61;
      objc_msgSend(v11, "paneHorizontalPositionConstraint");
      v60 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v60, "setConstant:", v62);
      break;
    case 4:
      -[FMSlidingPaneViewController paneInsets](v13, "paneInsets");
      v64 = v63;
      objc_msgSend(v11, "paneVerticalPositionConstraint");
      v60 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v60, "setConstant:", -v64);
      break;
    case 8:
      -[FMSlidingPaneViewController paneInsets](v13, "paneInsets");
      v66 = v65;
      objc_msgSend(v11, "paneHorizontalPositionConstraint");
      v60 = objc_claimAutoreleasedReturnValue();
      -[NSObject setConstant:](v60, "setConstant:", -v66);
      break;
    default:
      LogCategory_FMSlidingPaneViewController();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:].cold.1((uint64_t)v88, objc_msgSend(v11, "edge"), v60);
      break;
  }

  if (v8)
  {
    v67 = (void *)MEMORY[0x24BDF6F90];
    -[FMSlidingPaneViewController animationDuration](v13, "animationDuration");
    v69 = v68;
    -[FMSlidingPaneViewController animationSpringDamping](v13, "animationSpringDamping");
    v71 = v70;
    -[FMSlidingPaneViewController animationInitialVelocity](v13, "animationInitialVelocity");
    v73 = v72;
    v74 = -[FMSlidingPaneViewController animationOptions](v13, "animationOptions");
    v75 = MEMORY[0x24BDAC760];
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke;
    v85[3] = &unk_24C837100;
    v86 = v11;
    v80[0] = v75;
    v80[1] = 3221225472;
    v80[2] = __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke_2;
    v80[3] = &unk_24C837238;
    objc_copyWeak(v83, &location);
    v80[4] = v13;
    v81 = v14;
    v83[1] = 0;
    v83[2] = *(id *)&v56;
    v83[3] = v54;
    v83[4] = v45;
    v84 = v8;
    v82 = v12;
    objc_msgSend(v67, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v74 | 4, v85, v80, v69, 0.0, v71, v73);

    objc_destroyWeak(v83);
  }
  else
  {
    objc_msgSend(v11, "paneView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutIfNeeded");

    -[FMSlidingPaneViewController completeFuture:](v13, "completeFuture:", v14);
    if (!v7)
    {
      -[FMSlidingPaneViewController paneState](v13, "paneState");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "paneViewController");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMSlidingPaneViewController didPresentPane:inRect:animated:](v13, "didPresentPane:inRect:animated:", v78, 0, 0.0, v56, *(double *)&v54, *(double *)&v45);

      if (v12)
        v12[2](v12);
    }
  }

  objc_destroyWeak(&location);
}

void __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "paneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "paneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exerciseAmbiguityInLayout");

  objc_msgSend(*(id *)(a1 + 32), "paneViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exerciseAmbiguityInLayout");

}

void __81__FMSlidingPaneViewController__presentPaneState_animated_interactive_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "completeFuture:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "paneState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "didPresentPane:inRect:animated:", v4, *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  if (*(_QWORD *)(a1 + 48))
  {
    LogCategory_FMSlidingPaneViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DBDA000, v5, OS_LOG_TYPE_DEFAULT, "Calling present completion block", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_dismissPaneState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  FMSlidingPaneViewController *v45;
  id v46;
  void (**v47)(_QWORD);
  id v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  id location;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  _BOOL4 v56;
  uint64_t v57;

  v6 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  objc_initWeak(&location, self);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMSlidingPaneViewController.m"), 677, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paneState != nil"));

  }
  v11 = -[FMSlidingPaneViewController newActionFuture](self, "newActionFuture");
  LogCategory_FMSlidingPaneViewController();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "paneViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = v13;
    v55 = 1024;
    v56 = v6;
    _os_log_impl(&dword_20DBDA000, v12, OS_LOG_TYPE_DEFAULT, "_dismissPaneState: %@ animated: %d completion:", buf, 0x12u);

  }
  objc_msgSend(v9, "setShouldNotifyOfPaneSizeChanges:", 0);
  LogCategory_FMSlidingPaneViewController();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "paneViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v54 = v15;
    v55 = 1024;
    v56 = v6;
    _os_log_impl(&dword_20DBDA000, v14, OS_LOG_TYPE_DEFAULT, "Calling willDismissPane: %@ animated: %d", buf, 0x12u);

  }
  objc_msgSend(v9, "paneViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController willDismissPane:animated:](self, "willDismissPane:animated:", v16, v6);

  switch(objc_msgSend(v9, "edge"))
  {
    case 1:
      objc_msgSend(v9, "paneView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v17, "bounds");
      v19 = v18;
      objc_msgSend(v9, "paneVerticalPositionConstraint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setConstant:", -(v19 + 2.0));

      break;
    case 2:
      objc_msgSend(v9, "paneView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v17, "bounds");
      v25 = v24;
      objc_msgSend(v9, "paneHorizontalPositionConstraint");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setConstant:", -(v25 + 2.0));

      break;
    case 4:
      objc_msgSend(v9, "paneView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v17, "bounds");
      v22 = v21;
      objc_msgSend(v9, "paneVerticalPositionConstraint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setConstant:", v22 + 2.0);

      break;
    case 8:
      objc_msgSend(v9, "paneView");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject bounds](v17, "bounds");
      v28 = v27;
      objc_msgSend(v9, "paneHorizontalPositionConstraint");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setConstant:", v28 + 2.0);

      break;
    default:
      LogCategory_FMSlidingPaneViewController();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FMSlidingPaneViewController _presentPaneState:animated:interactive:completion:].cold.1((uint64_t)buf, objc_msgSend(v9, "edge"), v17);
      break;
  }

  if (v6)
  {
    v30 = (void *)MEMORY[0x24BDF6F90];
    -[FMSlidingPaneViewController animationDuration](self, "animationDuration");
    v32 = v31;
    -[FMSlidingPaneViewController animationSpringDamping](self, "animationSpringDamping");
    v34 = v33;
    -[FMSlidingPaneViewController animationInitialVelocity](self, "animationInitialVelocity");
    v36 = v35;
    v37 = -[FMSlidingPaneViewController animationOptions](self, "animationOptions");
    v38 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke;
    v50[3] = &unk_24C837100;
    v39 = v9;
    v51 = v39;
    v43[0] = v38;
    v43[1] = 3221225472;
    v43[2] = __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke_2;
    v43[3] = &unk_24C837260;
    objc_copyWeak(&v48, &location);
    v44 = v39;
    v45 = self;
    v49 = v6;
    v47 = v10;
    v46 = v11;
    objc_msgSend(v30, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", v37 | 4, v50, v43, v32, 0.0, v34, v36);

    objc_destroyWeak(&v48);
  }
  else
  {
    objc_msgSend(v9, "paneView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutIfNeeded");

    -[FMSlidingPaneViewController _removeChildViewControllerForState:](self, "_removeChildViewControllerForState:", v9);
    objc_msgSend(v9, "paneViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController didDismissPane:animated:](self, "didDismissPane:animated:", v41, 0);

    if (v10)
      v10[2](v10);
    -[FMSlidingPaneViewController completeFuture:](self, "completeFuture:", v11);
  }

  objc_destroyWeak(&location);
}

void __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "paneView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "paneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exerciseAmbiguityInLayout");

  objc_msgSend(*(id *)(a1 + 32), "paneViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exerciseAmbiguityInLayout");

}

void __69__FMSlidingPaneViewController__dismissPaneState_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_removeChildViewControllerForState:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "paneViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissPane:animated:", v4, *(unsigned __int8 *)(a1 + 72));

  if (*(_QWORD *)(a1 + 56))
  {
    LogCategory_FMSlidingPaneViewController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20DBDA000, v5, OS_LOG_TYPE_DEFAULT, "Calling dismiss completionBlock", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 40), "completeFuture:", *(_QWORD *)(a1 + 48));

}

- (void)_crossDissolveOldPaneState:(id)a3 newPaneState:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  FMSlidingPaneViewController *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  void (**v67)(_QWORD);
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  BOOL v72;
  uint8_t buf[4];
  void *v74;
  uint64_t v75;

  v7 = a5;
  v75 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a6;
  v14 = self;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("FMSlidingPaneViewController.m"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldPaneState != nil"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("FMSlidingPaneViewController.m"), 748, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newPaneState != nil"));

LABEL_3:
  v15 = objc_alloc_init(MEMORY[0x24BE2FE58]);
  objc_msgSend(v12, "paneView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    -[FMSlidingPaneViewController _createPaneViewForState:](v14, "_createPaneViewForState:", v12);
  objc_msgSend(v11, "paneVerticalPositionConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constant");
  v19 = v18;
  objc_msgSend(v12, "paneVerticalPositionConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", v19);

  -[FMSlidingPaneViewController view](v14, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateConstraintsIfNeeded");

  objc_msgSend(v12, "paneView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidden:", 1);

  objc_msgSend(v12, "paneView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v12, "paneViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);

  objc_msgSend(v12, "paneView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paneViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v36);

  -[FMSlidingPaneViewController _createPaneContentConstraintsForState:](v14, "_createPaneContentConstraintsForState:", v12);
  -[FMSlidingPaneViewController view](v14, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "updateConstraintsIfNeeded");

  LogCategory_FMSlidingPaneViewController();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "paneViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v74 = v39;
    _os_log_impl(&dword_20DBDA000, v38, OS_LOG_TYPE_DEFAULT, "addChildViewController: %@", buf, 0xCu);

  }
  objc_msgSend(v12, "paneViewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMSlidingPaneViewController addChildViewController:](v14, "addChildViewController:", v40);

  objc_msgSend(v12, "paneViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "didMoveToParentViewController:", v14);

  objc_msgSend(v12, "paneView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "layoutIfNeeded");

  -[FMSlidingPaneViewController _preferredSizeForPaneState:](v14, "_preferredSizeForPaneState:", v12);
  v44 = v43;
  -[FMSlidingPaneViewController view](v14, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "frame");
  v47 = v46 - v44;
  objc_msgSend(v12, "paneView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v50 = v49;

  objc_msgSend(v11, "setShouldNotifyOfPaneSizeChanges:", 0);
  objc_msgSend(v11, "paneViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[FMSlidingPaneViewController willDismissPane:animated:](v14, "willDismissPane:animated:", v51, 1);

    objc_msgSend(v12, "paneViewController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v14, "willPresentPane:inRect:animated:", v52, 1, 0.0, v47, v50, v44);

    objc_msgSend(v12, "setShouldNotifyOfPaneSizeChanges:", 1);
    v53 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(v11, "paneView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "paneView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __91__FMSlidingPaneViewController__crossDissolveOldPaneState_newPaneState_animated_completion___block_invoke;
    v63[3] = &unk_24C837288;
    v63[4] = v14;
    v64 = v11;
    v72 = v7;
    v65 = v12;
    v68 = 0;
    v69 = v47;
    v70 = v50;
    v71 = v44;
    v66 = v15;
    v67 = v13;
    objc_msgSend(v53, "transitionFromView:toView:duration:options:completion:", v54, v55, 5243264, v63, 0.150000006);

  }
  else
  {
    -[FMSlidingPaneViewController willDismissPane:animated:](v14, "willDismissPane:animated:", v51, 0);

    objc_msgSend(v12, "paneViewController");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController willPresentPane:inRect:animated:](v14, "willPresentPane:inRect:animated:", v56, 0, 0.0, v47, v50, v44);

    objc_msgSend(v11, "paneView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 1);

    objc_msgSend(v12, "paneView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHidden:", 0);

    -[FMSlidingPaneViewController _removeChildViewControllerForState:](v14, "_removeChildViewControllerForState:", v11);
    objc_msgSend(v11, "paneViewController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController didDismissPane:animated:](v14, "didDismissPane:animated:", v59, 0);

    objc_msgSend(v12, "paneViewController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMSlidingPaneViewController didPresentPane:inRect:animated:](v14, "didPresentPane:inRect:animated:", v60, 0, 0.0, v47, v50, v44);

    -[FMSlidingPaneViewController completeFuture:](v14, "completeFuture:", v15);
    if (v13)
      v13[2](v13);
  }

}

uint64_t __91__FMSlidingPaneViewController__crossDissolveOldPaneState_newPaneState_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeChildViewControllerForState:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "paneViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDismissPane:animated:", v3, *(unsigned __int8 *)(a1 + 104));

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "paneViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPresentPane:inRect:animated:", v5, *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  objc_msgSend(*(id *)(a1 + 32), "completeFuture:", *(_QWORD *)(a1 + 56));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isPaneShowing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[FMSlidingPaneViewController paneState](self, "paneState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paneView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)newActionFuture
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE2FE58]);
  -[FMSlidingPaneViewController actionFutures](self, "actionFutures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v3);

  return v3;
}

- (FMFuture)currentFuture
{
  void *v2;
  void *v3;

  -[FMSlidingPaneViewController actionFutures](self, "actionFutures");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FMFuture *)v3;
}

- (void)completeFuture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "finishWithNoResult");
  -[FMSlidingPaneViewController actionFutures](self, "actionFutures");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (FMSlidingPaneViewControllerDelegate)delegate
{
  return (FMSlidingPaneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIEdgeInsets)paneInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paneInsets.top;
  left = self->_paneInsets.left;
  bottom = self->_paneInsets.bottom;
  right = self->_paneInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPaneInsets:(UIEdgeInsets)a3
{
  self->_paneInsets = a3;
}

- (UIEdgeInsets)paneContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paneContentInsets.top;
  left = self->_paneContentInsets.left;
  bottom = self->_paneContentInsets.bottom;
  right = self->_paneContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPaneContentInsets:(UIEdgeInsets)a3
{
  self->_paneContentInsets = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)animationSpringDamping
{
  return self->_animationSpringDamping;
}

- (void)setAnimationSpringDamping:(double)a3
{
  self->_animationSpringDamping = a3;
}

- (double)animationInitialVelocity
{
  return self->_animationInitialVelocity;
}

- (void)setAnimationInitialVelocity:(double)a3
{
  self->_animationInitialVelocity = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (SlidingPaneViewState)paneState
{
  return self->_paneState;
}

- (void)setPaneState:(id)a3
{
  objc_storeStrong((id *)&self->_paneState, a3);
}

- (BOOL)didHideToolbar
{
  return self->_didHideToolbar;
}

- (void)setDidHideToolbar:(BOOL)a3
{
  self->_didHideToolbar = a3;
}

- (NSMutableArray)actionFutures
{
  return self->_actionFutures;
}

- (void)setActionFutures:(id)a3
{
  objc_storeStrong((id *)&self->_actionFutures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionFutures, 0);
  objc_storeStrong((id *)&self->_paneState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paneVisualEffect, 0);
}

- (void)traitCollectionForChildViewController:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "paneState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(v4, v5);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_20DBDA000, a2, v6, "Unknown edge: %lu", v7);

  OUTLINED_FUNCTION_1_0();
}

- (void)presentPaneViewController:fromEdge:withPercent:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_20DBDA000, v0, v1, "Dismissing pane while previous pane is still presenting: %@", v2);
}

- (void)_createPaneViewForState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "edge");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_20DBDA000, a2, v3, "Unknown edge: %lu", v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_presentPaneState:(NSObject *)a3 animated:interactive:completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_20DBDA000, a3, (uint64_t)a3, "Unknown edge: %lu", (uint8_t *)a1);
}

@end
