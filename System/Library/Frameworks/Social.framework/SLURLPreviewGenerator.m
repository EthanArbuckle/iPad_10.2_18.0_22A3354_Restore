@implementation SLURLPreviewGenerator

- (SLURLPreviewGenerator)initWithFrame:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  double x;
  SLURLPreviewGenerator *v9;
  uint64_t v10;
  UIWebView *webView;
  void *v12;
  void *v13;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  _SLLog(v3, 7, CFSTR("SLURLPreviewGenerator %@ initWithFrame: %g %g %g %g"));
  v17.receiver = self;
  v17.super_class = (Class)SLURLPreviewGenerator;
  v9 = -[SLURLPreviewGenerator init](&v17, sel_init, self, *(_QWORD *)&a3.origin.x, *(_QWORD *)&a3.origin.y, *(_QWORD *)&a3.size.width, *(_QWORD *)&a3.size.height);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC10]), "initWithFrame:", x, y, width, height);
    webView = v9->_webView;
    v9->_webView = (UIWebView *)v10;

    -[UIWebView setAllowsInlineMediaPlayback:](v9->_webView, "setAllowsInlineMediaPlayback:", 0);
    -[UIWebView setMediaPlaybackRequiresUserAction:](v9->_webView, "setMediaPlaybackRequiresUserAction:", 1);
    -[UIWebView setMediaPlaybackAllowsAirPlay:](v9->_webView, "setMediaPlaybackAllowsAirPlay:", 0);
    -[UIWebView setSuppressesIncrementalRendering:](v9->_webView, "setSuppressesIncrementalRendering:", 1);
    -[UIWebView setScalesPageToFit:](v9->_webView, "setScalesPageToFit:", 1);
    -[UIWebView setDelegate:](v9->_webView, "setDelegate:", v9);
    -[UIWebView _browserView](v9->_webView, "_browserView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setUIDelegate:", v9);
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v2;
  SLURLPreviewGenerator *v4;
  objc_super v5;

  v4 = self;
  _SLLog(v2, 7, CFSTR("SLURLPreviewGenerator %@ dealloc"));
  if (self->_completion)
    -[SLURLPreviewGenerator _callCompletionWithPreview:](self, "_callCompletionWithPreview:", 0, v4);
  -[UIWebView setDelegate:](self->_webView, "setDelegate:", 0, v4);
  -[UIWebView stopLoading](self->_webView, "stopLoading");
  v5.receiver = self;
  v5.super_class = (Class)SLURLPreviewGenerator;
  -[SLURLPreviewGenerator dealloc](&v5, sel_dealloc);
}

- (void)_callCompletionWithPreview:(id)a3
{
  uint64_t v3;
  void (**completion)(id, id);
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  _SLLog(v3, 7, CFSTR("SLURLPreviewGenerator %@ _callCompletionWithPreview: %@"));
  v7 = (void *)MEMORY[0x1C3B6C8B8](self->_completion);
  _SLLog(v3, 7, CFSTR("_completion %@"));

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v8);
    v6 = self->_completion;
    self->_completion = 0;

  }
}

- (void)loadURL:(id)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id completion;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _SLLog(v4, 7, CFSTR("SLURLPreviewGenerator %@ loadURL:completion: with %@"));
  if (objc_msgSend(v15, "loadingInUIWebViewWillLaunchAnotherApp", self, v15))
  {
    _SLLog(v4, 7, CFSTR("SLURLPreviewGenerator not loading a preview that would launch another app."));
LABEL_8:
    v7[2](v7, 0);
    goto LABEL_9;
  }
  objc_msgSend(v15, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("http")))
  {

  }
  else
  {
    objc_msgSend(v15, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("https"));

    if (!v10)
    {
      objc_msgSend(v15, "scheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v4, 7, CFSTR("SLURLPreviewGenerator not loading a preview for url with unsupported scheme '%@'."));

      goto LABEL_8;
    }
  }
  v11 = (void *)objc_msgSend(v7, "copy");
  completion = self->_completion;
  self->_completion = v11;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v15);
  objc_msgSend(v13, "setHTTPShouldHandleCookies:", 0);
  -[UIWebView loadRequest:](self->_webView, "loadRequest:", v13);

LABEL_9:
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  int v10;

  v8 = a4;
  _SLLog(v5, 7, CFSTR("SLURLPreviewGenerator %@ shouldStartLoadWithRequest: %@ navigationType: %d"));
  objc_msgSend(v8, "URL", self, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "loadingInUIWebViewWillLaunchAnotherApp");
  if (v10)
  {
    _SLLog(v5, 7, CFSTR("SLURLPreviewGenerator not loading a preview that would launch another app."));
    -[SLURLPreviewGenerator _callCompletionWithPreview:](self, "_callCompletionWithPreview:", 0);
  }
  return v10 ^ 1;
}

- (void)webViewDidFinishLoad:(id)a3
{
  uint64_t v3;
  UIWebView *webView;
  CGImage *v6;
  void *v7;
  uint64_t v8;

  v8 = -[UIWebView isLoading](self->_webView, "isLoading", a3);
  _SLLog(v3, 7, CFSTR("SLURLPreviewGenerator %@ webViewDidFinishLoad: still loading %d"));
  if (!-[UIWebView isLoading](self->_webView, "isLoading", self, v8))
  {
    if (self->_completion)
    {
      webView = self->_webView;
      -[UIWebView frame](webView, "frame");
      v6 = (CGImage *)-[UIWebView newSnapshotWithRect:](webView, "newSnapshotWithRect:");
      _SLLog(v3, 7, CFSTR("SLURLPreviewGenerator %@ generated cgImage %p"));
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v6, self, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLURLPreviewGenerator _callCompletionWithPreview:](self, "_callCompletionWithPreview:", v7);

      CGImageRelease(v6);
    }
  }
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  uint64_t v4;
  UIWebView *webView;
  id v7;
  uint64_t v8;

  webView = self->_webView;
  v7 = a4;
  v8 = -[UIWebView isLoading](webView, "isLoading");
  _SLLog(v4, 7, CFSTR("SLURLPreviewGenerator %@ webView:didFailLoadWithError: %@ still loading %d"));

  if (!-[UIWebView isLoading](self->_webView, "isLoading", self, v7, v8))
    -[SLURLPreviewGenerator _callCompletionWithPreview:](self, "_callCompletionWithPreview:", 0);
}

- (void)uiWebView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  id v6;
  id v7;

  v7 = a6;
  v6 = v7;
  WebThreadRun();

}

uint64_t __94__SLURLPreviewGenerator_uiWebView_decidePolicyForGeolocationRequestFromOrigin_frame_listener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deny");
}

- (UIWebView)webView
{
  return (UIWebView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWebView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
