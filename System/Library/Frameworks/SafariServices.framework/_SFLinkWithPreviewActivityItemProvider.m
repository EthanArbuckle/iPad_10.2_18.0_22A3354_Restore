@implementation _SFLinkWithPreviewActivityItemProvider

- (_SFLinkWithPreviewActivityItemProvider)initWithPlaceholderItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  _SFLinkWithPreviewActivityItemProvider *v6;
  _SFLinkWithPreviewActivityItemProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  LPLinkMetadata *cachedLinkMetadata;
  _SFLinkWithPreviewActivityItemProvider *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_SFLinkWithPreviewActivityItemProvider;
  v6 = -[_SFActivityItemProvider initWithPlaceholderItem:URL:pageTitle:webView:](&v17, sel_initWithPlaceholderItem_URL_pageTitle_webView_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D8A9E8];
    -[_SFActivityItemProvider url](v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivityItemProvider webView](v7, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "linkPresentationIconCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "linkMetadataForURL:webView:iconCache:", v9, v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    cachedLinkMetadata = v7->_cachedLinkMetadata;
    v7->_cachedLinkMetadata = (LPLinkMetadata *)v13;

    v15 = v7;
  }

  return v7;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___SFLinkWithPreviewActivityItemProvider_activityViewControllerLinkMetadata___block_invoke;
  v6[3] = &unk_1E4AC38D0;
  v6[4] = self;
  __77___SFLinkWithPreviewActivityItemProvider_activityViewControllerLinkMetadata___block_invoke((uint64_t)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setSelectedText:](self->_cachedLinkMetadata, "setSelectedText:", v4);

  return self->_cachedLinkMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLinkMetadata, 0);
}

@end
