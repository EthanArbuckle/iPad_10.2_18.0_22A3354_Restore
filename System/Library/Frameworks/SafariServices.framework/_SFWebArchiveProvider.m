@implementation _SFWebArchiveProvider

- (_SFWebArchiveProvider)initWithWebView:(id)a3
{
  id v4;
  _SFWebArchiveProvider *v5;
  _SFWebArchiveProvider *v6;
  uint64_t v7;
  NSURL *cachedWebViewURL;
  uint64_t v9;
  NSString *cachedWebViewTitle;
  _SFWebArchiveProvider *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFWebArchiveProvider;
  v5 = -[_SFWebArchiveProvider init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    objc_msgSend(v4, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    cachedWebViewURL = v6->_cachedWebViewURL;
    v6->_cachedWebViewURL = (NSURL *)v7;

    objc_msgSend(v4, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    cachedWebViewTitle = v6->_cachedWebViewTitle;
    v6->_cachedWebViewTitle = (NSString *)v9;

    v11 = v6;
  }

  return v6;
}

- (NSString)suggestedFilenameWithExtension
{
  void *v2;
  void *v3;

  -[_SFWebArchiveProvider _suggestedFilenameWithoutExtension](self, "_suggestedFilenameWithoutExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_ensurePathExtension:", CFSTR("webarchive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)canGenerateWebArchive
{
  id WeakRetained;
  const __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  if (!WeakRetained)
    return 0;
  v4 = -[_SFWebArchiveProvider _webViewUTI](self, "_webViewUTI");
  return UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E0CA5C88]) != 0;
}

- (id)dataForQuickLookDocument:(id)a3
{
  return self->_webArchiveData;
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return CFSTR("webarchive");
}

- (void)generateWebArchiveWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65___SFWebArchiveProvider_generateWebArchiveWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4AC13D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (id)_quickLookDocument
{
  SFQuickLookDocument *quickLookDocument;
  SFQuickLookDocument *v3;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  SFQuickLookDocument *v10;
  id v11;

  quickLookDocument = self->_quickLookDocument;
  if (quickLookDocument)
  {
    v3 = quickLookDocument;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D4ED18]);
    -[_SFWebArchiveProvider suggestedFilenameWithExtension](self, "suggestedFilenameWithExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFileName:mimeType:uti:needsQuickLookDocumentView:", v6, CFSTR("application/x-webarchive"), 0, 0);

    objc_msgSend(v7, "setDocumentSource:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceURL:", v9);

    v10 = self->_quickLookDocument;
    self->_quickLookDocument = (SFQuickLookDocument *)v7;
    v11 = v7;

    -[SFQuickLookDocument saveToFileIfNeeded](self->_quickLookDocument, "saveToFileIfNeeded");
    v3 = self->_quickLookDocument;

  }
  return v3;
}

- (id)_suggestedFilenameWithoutExtension
{
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[NSString safari_suggestedFilenameFromTitleString](self->_cachedWebViewTitle, "safari_suggestedFilenameFromTitleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v5 = -[_SFWebArchiveProvider _webViewUTI](self, "_webViewUTI");
    if (!UTTypeEqual(v5, (CFStringRef)*MEMORY[0x1E0CA5B78]))
    {
      -[NSURL safari_userVisibleString](self->_cachedWebViewURL, "safari_userVisibleString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_lastPathComponentWithoutZipExtension");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "length"))
        goto LABEL_10;

    }
    -[NSURL host](self->_cachedWebViewURL, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_highLevelDomainFromHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;
    }
    else
    {
      _WBSLocalizedString();
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v8;

  }
LABEL_10:

  return v4;
}

- (id)_webViewUTI
{
  id WeakRetained;
  __CFString *v3;
  __CFString *PreferredIdentifierForTag;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  objc_msgSend(WeakRetained, "_MIMEType");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E0CA5A90], v3, 0);
  return PreferredIdentifierForTag;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_cachedWebViewURL, 0);
  objc_storeStrong((id *)&self->_cachedWebViewTitle, 0);
  objc_storeStrong((id *)&self->_webArchiveData, 0);
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
}

@end
