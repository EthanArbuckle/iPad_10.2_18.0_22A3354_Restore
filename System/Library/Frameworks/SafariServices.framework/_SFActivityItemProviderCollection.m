@implementation _SFActivityItemProviderCollection

- (_SFActivityItemProviderCollection)initWithWebView:(id)a3
{
  id v5;
  _SFActivityItemProviderCollection *v6;
  _SFActivityItemProviderCollection *v7;
  _SFActivityItemProviderCollection *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFActivityItemProviderCollection;
  v6 = -[_SFActivityItemProviderCollection init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webView, a3);
    v8 = v7;
  }

  return v7;
}

- (_SFActivityItemProvider)standaloneImageProvider
{
  _SFActivityItemProvider *standaloneImageProvider;
  _SFImageActivityItemProvider *v4;
  _SFActivityItemProvider *v5;
  _SFActivityItemProvider *v6;

  standaloneImageProvider = self->_standaloneImageProvider;
  if (!standaloneImageProvider)
  {
    if (!-[_SFActivityItemProviderCollection displayingStandaloneImage](self, "displayingStandaloneImage"))
    {
      v6 = 0;
      return v6;
    }
    v4 = -[_SFImageActivityItemProvider initWithWebView:]([_SFImageActivityItemProvider alloc], "initWithWebView:", self->_webView);
    v5 = self->_standaloneImageProvider;
    self->_standaloneImageProvider = &v4->super;

    standaloneImageProvider = self->_standaloneImageProvider;
  }
  v6 = standaloneImageProvider;
  return v6;
}

- (_SFActivityItemProvider)webArchiveProvider
{
  _SFActivityItemProvider *webArchiveProvider;
  _SFWebArchiveActivityItemProvider *v4;
  _SFWebArchiveProvider *v5;
  _SFActivityItemProvider *v6;
  _SFActivityItemProvider *v7;

  webArchiveProvider = self->_webArchiveProvider;
  if (!webArchiveProvider)
  {
    v4 = [_SFWebArchiveActivityItemProvider alloc];
    v5 = -[_SFWebArchiveProvider initWithWebView:]([_SFWebArchiveProvider alloc], "initWithWebView:", self->_webView);
    v6 = -[_SFWebArchiveActivityItemProvider initWithWebArchiveProvider:](v4, "initWithWebArchiveProvider:", v5);
    v7 = self->_webArchiveProvider;
    self->_webArchiveProvider = v6;

    webArchiveProvider = self->_webArchiveProvider;
  }
  return webArchiveProvider;
}

- (id)activityItemProvidersWithCustomizationController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canShareAsLink"))
  {
    -[_SFActivityItemProviderCollection linkProvider](self, "linkProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v6);
    -[_SFActivityItemProviderCollection javaScriptExtensionProvider](self, "javaScriptExtensionProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v7);

  }
  else
  {
    v6 = 0;
  }
  -[_SFActivityItemProviderCollection standaloneImageProvider](self, "standaloneImageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canShareAsStandaloneImage") && v8)
  {
    objc_msgSend(v5, "addObject:", v8);
    objc_msgSend(v6, "excludedActivityTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObject:", *MEMORY[0x1E0CEB1E0]);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "excludedActivityTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_setByRemovingObject:", *MEMORY[0x1E0CEB1E0]);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v6, "setExcludedActivityTypes:", v10);

  if (objc_msgSend(v4, "canPrint"))
  {
    -[_SFActivityItemProviderCollection printProvider](self, "printProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v12);

    -[_SFPrintActivityItemProvider setCanVendPDFRepresentation:](self->_printProvider, "setCanVendPDFRepresentation:", objc_msgSend(v4, "canShareAsPDF"));
  }
  if (objc_msgSend(v4, "canShareAsDownload"))
  {
    -[_SFActivityItemProviderCollection downloadProvider](self, "downloadProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v5, "addObject:", v13);
      objc_msgSend(v6, "excludedActivityTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setByAddingObject:", *MEMORY[0x1E0CEB1B0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExcludedActivityTypes:", v15);

    }
  }
  if (objc_msgSend(v4, "canShareAsWebArchive")
    && !-[_SFActivityItemProviderCollection displayingDigitalHealthLockoutView](self, "displayingDigitalHealthLockoutView"))
  {
    -[_SFActivityItemProviderCollection webArchiveProvider](self, "webArchiveProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_addObjectUnlessNil:", v16);

  }
  -[_SFActivityItemProviderCollection documentProvider](self, "documentProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_addObjectUnlessNil:", v17);

  return v5;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (BOOL)displayingDigitalHealthLockoutView
{
  return self->_displayingDigitalHealthLockoutView;
}

- (void)setDisplayingDigitalHealthLockoutView:(BOOL)a3
{
  self->_displayingDigitalHealthLockoutView = a3;
}

- (BOOL)displayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)displayingStandaloneMedia
{
  return self->_displayingStandaloneMedia;
}

- (void)setDisplayingStandaloneMedia:(BOOL)a3
{
  self->_displayingStandaloneMedia = a3;
}

- (_SFActivityItemProvider)linkProvider
{
  return self->_linkProvider;
}

- (void)setLinkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_linkProvider, a3);
}

- (_SFPrintActivityItemProvider)printProvider
{
  return self->_printProvider;
}

- (void)setPrintProvider:(id)a3
{
  objc_storeStrong((id *)&self->_printProvider, a3);
}

- (_SFActivityItemProvider)javaScriptExtensionProvider
{
  return self->_javaScriptExtensionProvider;
}

- (void)setJavaScriptExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_javaScriptExtensionProvider, a3);
}

- (_SFActivityItemProvider)downloadProvider
{
  return self->_downloadProvider;
}

- (void)setDownloadProvider:(id)a3
{
  objc_storeStrong((id *)&self->_downloadProvider, a3);
}

- (_SFActivityItemProvider)documentProvider
{
  return self->_documentProvider;
}

- (void)setDocumentProvider:(id)a3
{
  objc_storeStrong((id *)&self->_documentProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_downloadProvider, 0);
  objc_storeStrong((id *)&self->_javaScriptExtensionProvider, 0);
  objc_storeStrong((id *)&self->_printProvider, 0);
  objc_storeStrong((id *)&self->_linkProvider, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webArchiveProvider, 0);
  objc_storeStrong((id *)&self->_standaloneImageProvider, 0);
}

@end
