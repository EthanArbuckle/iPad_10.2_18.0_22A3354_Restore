@implementation _SFReaderViewController

- (_SFReaderViewController)initWithOriginalWebView:(id)a3
{
  id v4;
  _SFReaderViewController *v5;
  _SFReaderViewController *v6;
  _SFReaderViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReaderViewController;
  v5 = -[_SFReaderViewController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_originalWebView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SFWebView *v10;
  _SFWebView *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_originalWebView);
  v3 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(WeakRetained, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processPool");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProcessPool:", v5);

  objc_msgSend(v3, "_setRelatedWebView:", WeakRetained);
  objc_msgSend(v3, "_setAlternateWebViewForNavigationGestures:", WeakRetained);
  objc_msgSend(v3, "_setGroupIdentifier:", CFSTR("Reader"));
  objc_msgSend(WeakRetained, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "websiteDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWebsiteDataStore:", v7);

  objc_msgSend(v3, "setAllowsPictureInPictureMediaPlayback:", 0);
  _SFApplicationNameForUserAgent();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationNameForUserAgent:", v8);

  objc_msgSend(v3, "_setNeedsStorageAccessFromFileURLsQuirk:", 0);
  objc_msgSend(MEMORY[0x1E0CEF608], "safari_readerUserContentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserContentController:", v9);

  v10 = [_SFWebView alloc];
  objc_msgSend(WeakRetained, "frame");
  v11 = -[_SFWebView initWithFrame:configuration:](v10, "initWithFrame:configuration:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_SFWebView _grantAccessToAssetServices](v11, "_grantAccessToAssetServices");
  -[_SFWebView _setBackgroundExtendsBeyondPage:](v11, "_setBackgroundExtendsBeyondPage:", 1);
  -[_SFWebView setAllowsLinkPreview:](v11, "setAllowsLinkPreview:", 1);
  -[_SFWebView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  -[_SFWebView setUIDelegate:](v11, "setUIDelegate:", self);
  -[_SFWebView setInspectable:](v11, "setInspectable:", 1);
  -[_SFReaderViewController setView:](self, "setView:", v11);

}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a4;
  v7 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "contextMenuConfigurationForReaderViewController:element:completionHandler:", self, v10, v7);
  else
    v7[2](v7, 0);

}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  SFReaderViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "readerViewController:contextMenuWillPresentForElement:", self, v6);

}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  SFReaderViewControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "readerViewController:contextMenuForElement:willCommitWithAnimator:", self, v9, v8);

}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  SFReaderViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "readerViewController:contextMenuDidEndForElement:", self, v6);

}

- (SFReaderViewControllerDelegate)delegate
{
  return (SFReaderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_originalWebView);
}

@end
