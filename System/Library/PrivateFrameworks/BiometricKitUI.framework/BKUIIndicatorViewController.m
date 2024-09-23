@implementation BKUIIndicatorViewController

- (BKUIIndicatorViewController)init
{
  BKUIIndicatorViewController *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)BKUIIndicatorViewController;
  v2 = -[BKUIIndicatorViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v3 = (void *)getLAUIPhysicalButtonViewClass_softClass;
    v15 = getLAUIPhysicalButtonViewClass_softClass;
    if (!getLAUIPhysicalButtonViewClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getLAUIPhysicalButtonViewClass_block_invoke;
      v11[3] = &unk_1EA27FEE8;
      v11[4] = &v12;
      __getLAUIPhysicalButtonViewClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v12, 8);
    v5 = objc_msgSend([v4 alloc], "initWithStyle:", 1);
    physicalButtonView = v2->_physicalButtonView;
    v2->_physicalButtonView = (LAUIPhysicalButtonView *)v5;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SET_UP_MESA"), &stru_1EA281248, CFSTR("BiometricKitUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUIPhysicalButtonView setInstruction:](v2->_physicalButtonView, "setInstruction:", v8);

    -[LAUIPhysicalButtonView setAnimationStyle:](v2->_physicalButtonView, "setAnimationStyle:", 2);
    v2->_shouldShow = 1;
  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKUIIndicatorViewController;
  -[BKUIIndicatorViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKUIIndicatorViewController;
  -[BKUIIndicatorViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[BKUIIndicatorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[BKUIIndicatorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAnimating:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateFrame");

    -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__BKUIIndicatorViewController_viewDidLayoutSubviews__block_invoke;
  v6[3] = &unk_1EA27FB98;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
}

void __52__BKUIIndicatorViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "physicalButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "physicalButtonView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimating:", objc_msgSend(*(id *)(a1 + 32), "shouldShow"));

  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)_updateUI
{
  void *v3;
  _QWORD block[5];

  -[BKUIIndicatorViewController physicalButtonView](self, "physicalButtonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimating:", 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BKUIIndicatorViewController__updateUI__block_invoke;
  block[3] = &unk_1EA27FB98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __40__BKUIIndicatorViewController__updateUI__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "physicalButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFrame");

  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldShow");
  objc_msgSend(*(id *)(a1 + 32), "physicalButtonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKUIIndicatorViewController;
  v7 = a4;
  -[BKUIIndicatorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__BKUIIndicatorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1EA2802E8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __82__BKUIIndicatorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateUI");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)setShouldShow:(BOOL)a3
{
  id v4;

  self->_shouldShow = a3;
  -[BKUIIndicatorViewController _updateUI](self, "_updateUI");
  -[BKUIIndicatorViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (LAUIPhysicalButtonView)physicalButtonView
{
  return self->_physicalButtonView;
}

- (void)setPhysicalButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_physicalButtonView, a3);
}

- (BOOL)shouldShow
{
  return self->_shouldShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
}

@end
