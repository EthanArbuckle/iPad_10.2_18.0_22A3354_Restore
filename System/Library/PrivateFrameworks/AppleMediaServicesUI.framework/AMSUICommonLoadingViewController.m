@implementation AMSUICommonLoadingViewController

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonLoadingViewController;
  -[AMSUICommonViewController loadView](&v5, sel_loadView);
  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_setBackgroundColor:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonLoadingViewController;
  -[AMSUICommonLoadingViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AMSUICommonLoadingViewController _setup](self, "_setup");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonLoadingViewController;
  -[AMSUICommonLoadingViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUICommonLoadingViewController loadingView](self, "loadingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonLoadingViewController;
  -[AMSUICommonLoadingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[AMSUICommonLoadingViewController loadingView](self, "loadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)_setup
{
  AMSUILoadingView *v3;
  AMSUILoadingView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD block[4];
  id v19;
  id v20;

  v3 = [AMSUILoadingView alloc];
  v4 = -[AMSUILoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AMSUICommonLoadingViewController setLoadingView:](self, "setLoadingView:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "ams_defaultPlatformBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonLoadingViewController loadingView](self, "loadingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[AMSUICommonLoadingViewController loadingView](self, "loadingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startAnimating");

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC9B8];
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__AMSUICommonLoadingViewController__setup__block_invoke;
  v15[3] = &unk_24CB4F800;
  objc_copyWeak(&v16, &location);
  v10 = v15;
  AMSLogKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 1500000000);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke;
  block[3] = &unk_24CB4F3C0;
  v19 = v11;
  v20 = v10;
  v13 = v11;
  v14 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __42__AMSUICommonLoadingViewController__setup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__AMSUICommonLoadingViewController__setup__block_invoke_2;
  v5[3] = &unk_24CB4F0E8;
  v5[4] = WeakRetained;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.5, 0.0);

}

void __42__AMSUICommonLoadingViewController__setup__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (AMSUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
