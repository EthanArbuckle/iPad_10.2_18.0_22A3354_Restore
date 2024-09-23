@implementation MFHasMoreContentBannerView

+ (id)bannerWithFrame:(CGRect)a3 isPlainText:(BOOL)a4 remainingBytes:(unint64_t)a5
{
  _MFPlainTextBannerView *v5;

  if (a4)
    v5 = -[_MFPlainTextBannerView initWithFrame:]([_MFPlainTextBannerView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  else
    v5 = -[_MFPartiallyDownloadedBannerView initWithFrame:remainingBytes:]([_MFPartiallyDownloadedBannerView alloc], "initWithFrame:remainingBytes:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v5;
}

- (MFHasMoreContentBannerView)initWithFrame:(CGRect)a3
{
  MFHasMoreContentBannerView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFHasMoreContentBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setAccessoryType:", 0);
    objc_msgSend(v4, "setActionButtonType:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v5 = (void *)MEMORY[0x1E0D19F18];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __44__MFHasMoreContentBannerView_initWithFrame___block_invoke;
    v11 = &unk_1E9A031B0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "actionWithTitle:handler:", &stru_1E9A04480, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrimaryAction:", v6, v8, v9, v10, v11);

    -[MFSuggestionBannerView setBanner:](v3, "setBanner:", v4);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v3;
}

void __44__MFHasMoreContentBannerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "primaryAction");

}

- (NSString)titleString
{
  -[MFHasMoreContentBannerView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFHasMoreContentBannerView titleString]", "MFHasMoreContentBannerView.m", 77, "0");
}

- (id)actionStringIsDownloading:(BOOL)a3
{
  -[MFHasMoreContentBannerView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFHasMoreContentBannerView actionStringIsDownloading:]", "MFHasMoreContentBannerView.m", 81, "0");
}

- (void)primaryAction
{
  -[MFHasMoreContentBannerView _titleControlTapped:](self, "_titleControlTapped:", self);
}

- (void)_titleControlTapped:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__MFHasMoreContentBannerView__titleControlTapped___block_invoke;
  v6[3] = &unk_1E9A02D88;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.35);
  -[MFSuggestionBannerView banner](self, "banner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[MFHasMoreContentBannerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTapHasMoreContentBannerView:", self);

}

void __50__MFHasMoreContentBannerView__titleControlTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "banner");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "actionStringIsDownloading:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActionTitle:", v2);

  objc_msgSend(v4, "setActionButtonType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setBanner:", v4);
  objc_msgSend(*(id *)(a1 + 32), "banner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintAdjustmentMode:", 2);

}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MFSuggestionBannerView banner](self, "banner");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFHasMoreContentBannerView actionStringIsDownloading:](self, "actionStringIsDownloading:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActionTitle:", v3);

  objc_msgSend(v6, "setActionButtonType:", 1);
  -[MFSuggestionBannerView setBanner:](self, "setBanner:", v6);
  -[MFSuggestionBannerView banner](self, "banner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintAdjustmentMode:", 0);

  -[MFSuggestionBannerView banner](self, "banner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

}

- (void)requestLoad
{
  -[MFHasMoreContentBannerView _titleControlTapped:](self, "_titleControlTapped:", 0);
}

- (MFHasMoreContentBannerViewDelegate)delegate
{
  return (MFHasMoreContentBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
