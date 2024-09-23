@implementation _SFTouchIconFetchOperation

+ (id)deviceIdealDefaultTouchIconURLsWithURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5910], "_applicationIconCanvasSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldx%ld"), (uint64_t)v6, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/apple-touch-icon-%@-precomposed.png"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/apple-touch-icon-%@.png"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v12);
  return v5;
}

- (id)webViewConfiguration
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFTouchIconFetchOperation;
  -[WBSTouchIconFetchOperation webViewConfiguration](&v6, sel_webViewConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setClientNavigationsRunAtForegroundPriority:", 1);
  _SFApplicationNameForUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setApplicationNameForUserAgent:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0CEF5F0]);
  objc_msgSend(v4, "setJavaScriptEnabled:", 0);
  objc_msgSend(v2, "setPreferences:", v4);

  return v2;
}

- (void)didCreateWebView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFTouchIconFetchOperation;
  -[WBSTouchIconFetchOperation didCreateWebView](&v5, sel_didCreateWebView);
  _SFCustomUserAgentStringIfNeeded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WBSWebViewMetadataFetchOperation webView](self, "webView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setCustomUserAgent:", v3);

  }
}

- (void)didFetchTouchIconURLs:(id)a3 andFaviconURLs:(id)a4 forURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "deviceIdealDefaultTouchIconURLsWithURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)_SFTouchIconFetchOperation;
  -[WBSTouchIconFetchOperation didFetchTouchIconURLs:andFaviconURLs:forURL:](&v13, sel_didFetchTouchIconURLs_andFaviconURLs_forURL_, v12, v9, v8);

}

@end
