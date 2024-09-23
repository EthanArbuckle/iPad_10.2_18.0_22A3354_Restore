@implementation MFHideMyEmailBannerView

- (MFHideMyEmailBannerView)initWithFrame:(CGRect)a3
{
  MFHideMyEmailBannerView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)MFHideMyEmailBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D19F08]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E9A04480, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HME_BANNER_DESCRIPTION"), &stru_1E9A04480, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSubtitle:", v8);

    objc_msgSend(v4, "setAccessoryType:", 1);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_1E9A04480, CFSTR("Main"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActionTitle:", v10);

    objc_msgSend(v4, "setActionButtonType:", 0);
    objc_msgSend(MEMORY[0x1E0D804E8], "acui_specifierIconForAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v26[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImages:", v13);

    }
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v14 = (void *)MEMORY[0x1E0D19F18];
    v15 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41__MFHideMyEmailBannerView_initWithFrame___block_invoke;
    v22[3] = &unk_1E9A031B0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v14, "actionWithTitle:handler:", &stru_1E9A04480, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryAction:", v16);

    v17 = (void *)MEMORY[0x1E0D19F18];
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_2;
    v20[3] = &unk_1E9A031B0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v17, "actionWithTitle:handler:", &stru_1E9A04480, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDismissAction:", v18);

    -[MFSuggestionBannerView setBanner:](v3, "setBanner:", v4);
    objc_msgSend(v4, "reload");
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __41__MFHideMyEmailBannerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryAction");

}

void __41__MFHideMyEmailBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAction");

}

- (void)primaryAction
{
  id v3;

  -[MFHideMyEmailBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTapHideMyEmailBannerView:", self);

}

- (void)dismissAction
{
  id v3;

  -[MFHideMyEmailBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didDismissHideMyEmailBannerView:", self);

}

- (MFHideMyEmailBannerViewDelegate)delegate
{
  return (MFHideMyEmailBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
