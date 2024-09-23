@implementation _MFPartiallyDownloadedBannerView

- (id)_messageStringForBytes:(uint64_t)a1 isDownloading:(uint64_t)a2 hasError:
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    _EFLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (_MFPartiallyDownloadedBannerView)initWithFrame:(CGRect)a3 remainingBytes:(unint64_t)a4
{
  _MFPartiallyDownloadedBannerView *v5;
  _MFPartiallyDownloadedBannerView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_MFPartiallyDownloadedBannerView;
  v5 = -[MFHasMoreContentBannerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_remainingBytes = a4;
    -[MFSuggestionBannerView banner](v5, "banner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MESSAGE_PARTIALLY_DOWNLOADED"), &stru_1E9A04480, CFSTR("Main"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    -[_MFPartiallyDownloadedBannerView actionStringIsDownloading:](v6, "actionStringIsDownloading:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActionTitle:", v10);

    objc_msgSend(v7, "setActionButtonType:", 1);
    -[MFSuggestionBannerView setBanner:](v6, "setBanner:", v7);

  }
  return v6;
}

- (id)actionStringIsDownloading:(BOOL)a3
{
  uint64_t v4;

  v4 = -[_MFPartiallyDownloadedBannerView remainingBytes](self, "remainingBytes");
  -[_MFPartiallyDownloadedBannerView hasError](self, "hasError");
  return -[_MFPartiallyDownloadedBannerView _messageStringForBytes:isDownloading:hasError:]((uint64_t)self, v4);
}

- (void)updateBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  -[_MFPartiallyDownloadedBannerView setRemainingBytes:](self, "setRemainingBytes:", a3);
  -[_MFPartiallyDownloadedBannerView setHasError:](self, "setHasError:", v6 != 0);
  v7.receiver = self;
  v7.super_class = (Class)_MFPartiallyDownloadedBannerView;
  -[MFHasMoreContentBannerView updateBannerWithRemainingBytes:error:](&v7, sel_updateBannerWithRemainingBytes_error_, a3, v6);

}

- (unint64_t)remainingBytes
{
  return self->_remainingBytes;
}

- (void)setRemainingBytes:(unint64_t)a3
{
  self->_remainingBytes = a3;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

@end
