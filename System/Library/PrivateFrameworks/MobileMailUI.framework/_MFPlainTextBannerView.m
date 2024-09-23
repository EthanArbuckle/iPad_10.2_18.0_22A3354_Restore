@implementation _MFPlainTextBannerView

- (_MFPlainTextBannerView)initWithFrame:(CGRect)a3
{
  _MFPlainTextBannerView *v3;
  _MFPlainTextBannerView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MFPlainTextBannerView;
  v3 = -[MFHasMoreContentBannerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFSuggestionBannerView banner](v3, "banner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WAS_DOWNLOADED_AS_PLAIN"), &stru_1E9A04480, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    -[_MFPlainTextBannerView actionStringIsDownloading:](v4, "actionStringIsDownloading:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActionTitle:", v8);

    objc_msgSend(v5, "setActionButtonType:", 1);
    -[MFSuggestionBannerView setBanner:](v4, "setBanner:", v5);

  }
  return v4;
}

- (id)actionStringIsDownloading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("DOWNLOADING_FULL_MESSAGE");
  else
    v6 = CFSTR("DOWNLOAD_FULL_MESSAGE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E9A04480, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
