@implementation MFBlockedSenderBannerView

- (MFBlockedSenderBannerView)initWithFrame:(CGRect)a3
{
  MFBlockedSenderBannerView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MFBlockedSenderBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGE_FROM_BLOCKED_SENDER"), &stru_1E9A04480, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BLOCKED_SENDER_SETTINGS"), &stru_1E9A04480, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActionTitle:", v8);

    objc_msgSend(v4, "setAccessoryType:", 1);
    objc_msgSend(v4, "setActionButtonType:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v9 = (void *)MEMORY[0x1E0D19F18];
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__MFBlockedSenderBannerView_initWithFrame___block_invoke;
    v17[3] = &unk_1E9A031B0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "actionWithTitle:handler:", &stru_1E9A04480, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryAction:", v11);

    v12 = (void *)MEMORY[0x1E0D19F18];
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __43__MFBlockedSenderBannerView_initWithFrame___block_invoke_2;
    v15[3] = &unk_1E9A031B0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v12, "actionWithTitle:handler:", &stru_1E9A04480, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDismissAction:", v13);

    -[MFSuggestionBannerView setBanner:](v3, "setBanner:", v4);
    objc_msgSend(v4, "reload");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __43__MFBlockedSenderBannerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryAction");

}

void __43__MFBlockedSenderBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAction");

}

- (void)primaryAction
{
  id v3;

  -[MFBlockedSenderBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapBlockedSenderBannerView:", self);

}

- (void)dismissAction
{
  id v3;

  -[MFBlockedSenderBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissBlockedSenderBannerView:", self);

}

- (void)_titleControlTapped:(id)a3
{
  id v4;

  -[MFBlockedSenderBannerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapBlockedSenderBannerView:", self);

}

- (void)_bannerDismissed:(id)a3
{
  id v4;

  -[MFBlockedSenderBannerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDismissBlockedSenderBannerView:", self);

}

- (MFBlockedSenderBannerViewDelegate)delegate
{
  return (MFBlockedSenderBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
