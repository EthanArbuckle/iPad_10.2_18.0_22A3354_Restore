@implementation MFLoadFailedProxyContentBannerView

- (MFLoadFailedProxyContentBannerView)initWithFrame:(CGRect)a3 failureReason:(int64_t)a4
{
  MFLoadFailedProxyContentBannerView *v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)MFLoadFailedProxyContentBannerView;
  v5 = -[MFSuggestionBannerView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = CFSTR("FAILED_TO_PROXY_REMOTE_CONTENT_NETWORK_INCOMPATIBLE");
    v7 = CFSTR("FAILED_TO_PROXY_REMOTE_CONTENT_OTHER");
    if (a4)
      v7 = 0;
    if (a4 != 1)
      v6 = v7;
    v8 = a4 == 2;
    if (a4 == 2)
      v9 = CFSTR("FAILED_TO_PROXY_REMOTE_CONTENT_VPN");
    else
      v9 = v6;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_1E9A04480, CFSTR("Main"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0D19F08]);
    objc_msgSend(v12, "setTitle:", v11);
    objc_msgSend(v12, "setActionButtonType:", 1);
    if (v8)
    {
      objc_msgSend(v12, "setActionTitle:", 0);
      v13 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LOAD_FAILED_PROXY_CONTENT"), &stru_1E9A04480, CFSTR("Main"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActionTitle:", v15);

      v13 = 0;
    }
    objc_msgSend(v12, "setAccessoryType:", v13);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v16 = (void *)MEMORY[0x1E0D19F18];
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke;
    v24[3] = &unk_1E9A031B0;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v16, "actionWithTitle:handler:", &stru_1E9A04480, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryAction:", v18);

    v19 = (void *)MEMORY[0x1E0D19F18];
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke_2;
    v22[3] = &unk_1E9A031B0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v19, "actionWithTitle:handler:", &stru_1E9A04480, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDismissAction:", v20);

    -[MFSuggestionBannerView setBanner:](v5, "setBanner:", v12);
    objc_msgSend(v12, "reload");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryAction");

}

void __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAction");

}

- (void)primaryAction
{
  id v3;

  -[MFLoadFailedProxyContentBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadFailedProxyContentBannerDidTriggerLoad:", self);

}

- (void)dismissAction
{
  id v3;

  -[MFLoadFailedProxyContentBannerView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadFailedProxyContentBannerWasDismissed:", self);

}

- (MFLoadFailedProxyContentBannerViewDelegate)delegate
{
  return (MFLoadFailedProxyContentBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
