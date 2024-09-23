@implementation LoadingController

- (NSString)title
{
  WKWebView *webView;
  void *title;
  void *v4;
  void *v5;

  webView = self->_webView;
  if (webView)
  {
    -[WKWebView title](self->_webView, "title");
    title = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    title = self->_title;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "safari_lockRelatedEmojiCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(title, "safari_stringByRemovingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (webView)
  return (NSString *)v5;
}

- (NSURL)URL
{
  void *URL;
  void *v4;
  NSURL *v5;

  -[WKWebView URL](self->_webView, "URL");
  URL = (void *)objc_claimAutoreleasedReturnValue();
  v4 = URL;
  if (!URL)
    URL = self->_URL;
  v5 = URL;

  return v5;
}

- (float)estimatedProgress
{
  double v2;

  -[WKWebView estimatedProgress](self->_webView, "estimatedProgress");
  return v2;
}

- (void)setURL:(id)a3
{
  NSURL *v5;
  NSURL **p_URL;
  NSURL *URL;
  NSURL *v8;

  v5 = (NSURL *)a3;
  URL = self->_URL;
  p_URL = &self->_URL;
  if (URL != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_URL, a3);
    v5 = v8;
  }

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *title;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_title != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v7;

      v5 = v9;
    }
  }

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (BOOL)canGoForward
{
  return -[WKWebView canGoForward](self->_webView, "canGoForward");
}

- (BOOL)canGoBack
{
  return -[WKWebView canGoBack](self->_webView, "canGoBack");
}

- (NSURL)URLForStatePersisting
{
  NSURL *v3;
  NSURL *URL;
  NSURL *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSURL *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[LoadingController URL](self, "URL");
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  URL = v3;
  if (!v3)
    URL = self->_URL;
  v5 = URL;

  if (-[NSURL safari_isSafariWebExtensionURL](v5, "safari_isSafariWebExtensionURL"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[Application sharedApplication](Application, "sharedApplication", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allWebExtensionsControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "_persistentStateURLForExtensionURL:", v5);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (NSURL *)v12;

            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }

  }
  v13 = v5;
LABEL_15:

  return v13;
}

- (NSString)titleForStatePersisting
{
  void *title;
  void *v4;
  NSString *v5;

  -[LoadingController title](self, "title");
  title = (void *)objc_claimAutoreleasedReturnValue();
  v4 = title;
  if (!title)
    title = self->_title;
  v5 = title;

  return v5;
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4
{
  return -[LoadingController loadRequest:userDriven:shouldOpenExternalURLs:](self, "loadRequest:userDriven:shouldOpenExternalURLs:", a3, a4, 0);
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5
{
  return -[LoadingController loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:](self, "loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:", a3, a4, a5, 0);
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4 shouldOpenExternalURLs:(BOOL)a5 eventAttribution:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  void *v14;
  void *v15;
  WKWebView *webView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  WKWebView *v23;
  uint64_t v24;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_webView)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[LoadingController loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:].cold.1((uint64_t)WeakRetained, v13);
  }
  objc_msgSend(v10, "safari_requestBySettingIsUserInitiated:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "loadingController:willLoadRequest:webView:userDriven:", self, v14, self->_webView, v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WKWebView _setUIEventAttribution:](self->_webView, "_setUIEventAttribution:", v11);
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "sf_isOfflineReadingListURL"))
  {
    webView = self->_webView;
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0DCCBA0], "readingListArchivesDirectoryPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:isDirectory:", v18, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView loadFileURL:allowingReadAccessToURL:](webView, "loadFileURL:allowingReadAccessToURL:", v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBool:forKey:", 1, *MEMORY[0x1E0D4F598]);

  }
  else
  {
    v22 = objc_msgSend(v15, "sf_isTestWebArchiveURL");
    v23 = self->_webView;
    if (v22)
    {
      -[WKWebView loadFileURL:allowingReadAccessToURL:](v23, "loadFileURL:allowingReadAccessToURL:", v15, v15);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7)
        -[WKWebView _loadRequest:shouldOpenExternalURLs:](v23, "_loadRequest:shouldOpenExternalURLs:", v14, 1);
      else
        -[WKWebView loadRequest:](v23, "loadRequest:", v14);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v24;
  }

  return v20;
}

- (void)goBack
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "loadingControllerWillStartUserDrivenLoad:", self);

  v4 = -[WKWebView goBack](self->_webView, "goBack");
}

- (void)goForward
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "loadingControllerWillStartUserDrivenLoad:", self);

  v4 = -[WKWebView goForward](self->_webView, "goForward");
}

- (void)reloadFromOrigin:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  WKWebView *webView;
  id v7;
  id v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "loadingControllerWillStartUserDrivenLoad:", self);

  webView = self->_webView;
  if (v3)
    v7 = -[WKWebView reloadFromOrigin](webView, "reloadFromOrigin");
  else
    v8 = -[WKWebView reload](webView, "reload");
}

- (void)stopLoading
{
  -[WKWebView stopLoading](self->_webView, "stopLoading");
}

- (WKWebView)webView
{
  return self->_webView;
}

- (LoadingControllerDelegate)delegate
{
  return (LoadingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)loadRequest:(uint64_t)a1 userDriven:(NSObject *)a2 shouldOpenExternalURLs:eventAttribution:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D7CA3000, a2, OS_LOG_TYPE_FAULT, "LoadingController with delegate %p is being asked to load a request but does not have a web view", (uint8_t *)&v2, 0xCu);
}

@end
