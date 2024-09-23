@implementation SFClipLinkBanner

+ (void)getClipLinkBannerForClipLink:(id)a3 openActionHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__SFClipLinkBanner_getClipLinkBannerForClipLink_openActionHandler_completionHandler___block_invoke;
  v13[3] = &unk_1E21E52A0;
  v14 = v7;
  v15 = v9;
  v16 = v8;
  v10 = v8;
  v11 = v9;
  v12 = v7;
  objc_msgSend(v12, "getClipAttributesWithCompletionHandler:", v13);

}

void __85__SFClipLinkBanner_getClipLinkBannerForClipLink_openActionHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "clipName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    v4 = -[SFClipLinkBanner _initWithClipLink:openActionHandler:]([SFClipLinkBanner alloc], "_initWithClipLink:openActionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)_initWithClipLink:(id)a3 openActionHandler:(id)a4
{
  id v7;
  id v8;
  SFClipLinkBanner *v9;
  id *p_isa;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFClipLinkBanner;
  v9 = -[SFLinkBanner init](&v19, sel_init);
  p_isa = (id *)&v9->super.super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clipLink, a3);
    objc_msgSend(p_isa, "setOpenActionHandler:", v8);
    objc_msgSend(v7, "clipName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(v7, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

    objc_msgSend(p_isa[77], "actionCaption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setMessageLabelText:", v15);

    objc_msgSend(v7, "actionTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setOpenButtonTitle:", v16);

    v17 = p_isa;
  }

  return p_isa;
}

- (id)overlayProvider
{
  SFOverlayProvider *overlayProvider;
  SFOverlayProvider *v4;
  void *v5;
  void *v6;
  SFOverlayProvider *v7;
  SFOverlayProvider *v8;
  SFOverlayProvider *v9;

  if (-[SFClipLink siteRequestsShowCard](self->_clipLink, "siteRequestsShowCard")
    || +[SFOverlayProvider alwaysShowOverlayForDebug](SFOverlayProvider, "alwaysShowOverlayForDebug"))
  {
    overlayProvider = self->_overlayProvider;
    if (!overlayProvider)
    {
      v4 = [SFOverlayProvider alloc];
      -[SFClipLink url](self->_clipLink, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFClipLink bundleIdentifier](self->_clipLink, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SFOverlayProvider initWithURL:bundleIdentifier:](v4, "initWithURL:bundleIdentifier:", v5, v6);
      v8 = self->_overlayProvider;
      self->_overlayProvider = v7;

      overlayProvider = self->_overlayProvider;
    }
    v9 = overlayProvider;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (SFAppSuggestionBannerDelegate)delegate
{
  return (SFAppSuggestionBannerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SFClipLink)clipLink
{
  return self->_clipLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipLink, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_overlayProvider, 0);
}

@end
