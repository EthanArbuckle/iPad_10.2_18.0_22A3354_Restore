@implementation DMCEnrollmentInstallAppButtonView

- (DMCEnrollmentInstallAppButtonView)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  DMCEnrollmentInstallAppButtonView *v15;
  uint64_t v16;
  id completionHandler;
  uint64_t v18;
  ASCLockupView *lockupView;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DMCEnrollmentInstallAppButtonView;
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v15 = -[DMCEnrollmentInstallAppButtonView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x24BDBF090], v12, v13, v14);
  if (v15)
  {
    v16 = MEMORY[0x2199F7854](v10);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = (id)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE04480]), "initWithFrame:", v11, v12, v13, v14);
    lockupView = v15->_lockupView;
    v15->_lockupView = (ASCLockupView *)v18;

    -[ASCLockupView setSize:](v15->_lockupView, "setSize:", *MEMORY[0x24BE04438]);
    -[ASCLockupView setGroup:](v15->_lockupView, "setGroup:", v9);
    -[ASCLockupView setRequest:](v15->_lockupView, "setRequest:", v8);
    -[ASCLockupView setDelegate:](v15->_lockupView, "setDelegate:", v15);
    -[DMCEnrollmentInstallAppButtonView addSubview:](v15, "addSubview:", v15->_lockupView);
  }

  return v15;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentInstallAppButtonView;
  -[DMCEnrollmentInstallAppButtonView layoutSubviews](&v15, sel_layoutSubviews);
  -[DMCEnrollmentInstallAppButtonView lockupView](self, "lockupView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentInstallAppButtonView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, 1.79769313e308);
  v6 = v5;
  v8 = v7;

  if ((objc_msgSend(MEMORY[0x24BE2A818], "isPad") & 1) != 0)
  {
    -[DMCEnrollmentInstallAppButtonView bounds](self, "bounds");
    v9 = (CGRectGetWidth(v16) + -360.0) * 0.5;
    -[DMCEnrollmentInstallAppButtonView lockupView](self, "lockupView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 360.0;
    v13 = v9;
  }
  else
  {
    -[DMCEnrollmentInstallAppButtonView lockupView](self, "lockupView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v13 = 0.0;
    v12 = v6;
  }
  objc_msgSend(v10, "setFrame:", v13, 0.0, v12, v8);

  -[DMCEnrollmentInstallAppButtonView lockupView](self, "lockupView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  -[DMCEnrollmentInstallAppButtonView preferredHeight](self, "preferredHeight", a3.width, a3.height);
  if (v5 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", CFSTR(" "), 0);
    objc_msgSend(v6, "intrinsicContentSize");
    v8 = v7;
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", CFSTR(" "), 0);
    objc_msgSend(v9, "intrinsicContentSize");
    -[DMCEnrollmentInstallAppButtonView setPreferredHeight:](self, "setPreferredHeight:", v8 + v10 + 3.0);

  }
  -[DMCEnrollmentInstallAppButtonView preferredHeight](self, "preferredHeight");
  v12 = v11;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (BOOL)lockupViewShouldSupportDSIDLessInstalls:(id)a3
{
  return 1;
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  void (**v7)(void);
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE043D0]) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE043E0]))
  {
    objc_msgSend(v8, "setHidden:", 1);
    -[DMCEnrollmentInstallAppButtonView completionHandler](self, "completionHandler");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(double)a3
{
  self->_preferredHeight = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
