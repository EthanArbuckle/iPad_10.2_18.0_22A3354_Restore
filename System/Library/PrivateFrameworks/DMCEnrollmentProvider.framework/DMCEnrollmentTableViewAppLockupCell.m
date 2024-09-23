@implementation DMCEnrollmentTableViewAppLockupCell

- (DMCEnrollmentTableViewAppLockupCell)initWithLockupRequest:(id)a3 lockupViewGroup:(id)a4 presentingViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  DMCEnrollmentTableViewAppLockupCell *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  ASCLockupView *lockupView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)DMCEnrollmentTableViewAppLockupCell;
  v13 = -[DMCEnrollmentTableViewAppLockupCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, 0, v12);

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewAppLockupCell setBackgroundColor:](v13, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentTableViewAppLockupCell contentView](v13, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[DMCEnrollmentTableViewAppLockupCell contentView](v13, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCornerRadius:", 15.0);

    -[DMCEnrollmentTableViewAppLockupCell contentView](v13, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMasksToBounds:", 1);

    -[DMCEnrollmentTableViewAppLockupCell setSelectionStyle:](v13, "setSelectionStyle:", 0);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    v21 = objc_alloc(MEMORY[0x24BE04480]);
    v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    lockupView = v13->_lockupView;
    v13->_lockupView = (ASCLockupView *)v22;

    -[ASCLockupView setSize:](v13->_lockupView, "setSize:", *MEMORY[0x24BE04440]);
    -[ASCLockupView setShowsPlaceholderContent:](v13->_lockupView, "setShowsPlaceholderContent:", 1);
    -[ASCLockupView setGroup:](v13->_lockupView, "setGroup:", v9);
    -[ASCLockupView setRequest:](v13->_lockupView, "setRequest:", v8);
    -[ASCLockupView setDelegate:](v13->_lockupView, "setDelegate:", v13);
    objc_msgSend(MEMORY[0x24BE04468], "viewInAppStoreOfferForLockupView:", v13->_lockupView);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView lockup](v13->_lockupView, "lockup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lockupWithOffer:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupView setLockup:](v13->_lockupView, "setLockup:", v26);

    -[DMCEnrollmentTableViewAppLockupCell contentView](v13, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v13->_lockupView);

  }
  return v13;
}

- (void)layoutSubviews
{
  double Width;
  CGFloat v4;
  void *v5;
  void *v6;
  CGFloat v7;
  void *v8;
  CGFloat v9;
  void *v10;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v12.receiver = self;
  v12.super_class = (Class)DMCEnrollmentTableViewAppLockupCell;
  -[DMCEnrollmentTableViewAppLockupCell layoutSubviews](&v12, sel_layoutSubviews);
  -[DMCEnrollmentTableViewAppLockupCell bounds](self, "bounds");
  -[DMCEnrollmentTableViewAppLockupCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v13), 0.0, 0.0);
  -[DMCEnrollmentTableViewAppLockupCell bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[DMCEnrollmentTableViewAppLockupCell bounds](self, "bounds");
  v4 = CGRectGetHeight(v15) + -20.0;
  -[DMCEnrollmentTableViewAppLockupCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", 0.0, 10.0, Width, v4);

  -[DMCEnrollmentTableViewAppLockupCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = CGRectGetWidth(v16) + -30.0;
  -[DMCEnrollmentTableViewAppLockupCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = CGRectGetHeight(v17) + -30.0;
  -[DMCEnrollmentTableViewAppLockupCell lockupView](self, "lockupView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 15.0, 15.0, v7, v9);

  -[DMCEnrollmentTableViewAppLockupCell lockupView](self, "lockupView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 18);

}

- (double)cellHeight
{
  void *v3;
  double Width;
  void *v5;
  double v6;
  double v7;
  CGRect v9;

  -[DMCEnrollmentTableViewAppLockupCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v9);

  -[DMCEnrollmentTableViewAppLockupCell lockupView](self, "lockupView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  v7 = v6;

  return v7 + 30.0 + 20.0;
}

- (double)estimatedCellHeight
{
  return 112.0;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (NSNumber)iTunesItemID
{
  return self->_iTunesItemID;
}

- (void)setITunesItemID:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesItemID, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_iTunesItemID, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
