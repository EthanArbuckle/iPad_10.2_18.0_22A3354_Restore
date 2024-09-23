@implementation PageContentFetcher

- (PageContentFetcher)init
{
  PageContentFetcher *v3;
  id v4;
  void *v5;
  uint64_t v6;
  WKWebView *webView;
  objc_super v9;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v9.receiver = self;
  v9.super_class = (Class)PageContentFetcher;
  v3 = -[PageContentFetcher init](&v9, sel_init);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDFA918]);
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "_copyDefaultWebViewConfiguration");
    v6 = objc_msgSend(v4, "initWithFrame:configuration:", v5, 0.0, 0.0, 1366.0, 768.0);
    webView = v3->_webView;
    v3->_webView = (WKWebView *)v6;

    -[WKWebView setNavigationDelegate:](v3->_webView, "setNavigationDelegate:", v3);
  }
  return v3;
}

- (void)runJavaScriptOnHTML:(id)a3 javaScript:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *providedJavaScript;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = (NSString *)objc_msgSend(a4, "copy");
  providedJavaScript = self->_providedJavaScript;
  self->_providedJavaScript = v10;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__PageContentFetcher_runJavaScriptOnHTML_javaScript_completionHandler___block_invoke;
  block[3] = &unk_24F0F3EA0;
  v15 = v8;
  v16 = v9;
  block[4] = self;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

id __71__PageContentFetcher_runJavaScriptOnHTML_javaScript_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "loadHTMLString:baseURL:", *(_QWORD *)(a1 + 40), 0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__PageContentFetcher_webView_didFailNavigation_withError___block_invoke;
  v8[3] = &unk_24F0F3EC8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __58__PageContentFetcher_webView_didFailNavigation_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5;
  NSString *providedJavaScript;
  void (**pendingBlock)(id, _QWORD, void *);
  void *v8;
  _QWORD v9[5];

  v5 = a3;
  if (-[NSString length](self->_providedJavaScript, "length"))
  {
    providedJavaScript = self->_providedJavaScript;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__PageContentFetcher_webView_didFinishNavigation___block_invoke;
    v9[3] = &unk_24F0F3F18;
    v9[4] = self;
    objc_msgSend(v5, "evaluateJavaScript:completionHandler:", providedJavaScript, v9);
  }
  else
  {
    pendingBlock = (void (**)(id, _QWORD, void *))self->_pendingBlock;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PageContentFetcher"), -1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    pendingBlock[2](pendingBlock, 0, v8);

  }
}

void __50__PageContentFetcher_webView_didFinishNavigation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PageContentFetcher_webView_didFinishNavigation___block_invoke_2;
  block[3] = &unk_24F0F3EF0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __50__PageContentFetcher_webView_didFinishNavigation___block_invoke_2(_QWORD *a1)
{
  char isKindOfClass;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1[4] + 32))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = *(_QWORD *)(a1[4] + 32);
    if ((isKindOfClass & 1) != 0)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[5], 0);
    }
    else
    {
      v4 = a1[6];
      if (v4)
      {
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, v4);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PageContentFetcher"), -1, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v5);

      }
    }
    v6 = a1[4];
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

  }
}

+ (id)_copyDefaultWebViewConfiguration
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  if (!_copyDefaultWebViewConfiguration_configuration)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDFA920]);
    v4 = (void *)_copyDefaultWebViewConfiguration_configuration;
    _copyDefaultWebViewConfiguration_configuration = (uint64_t)v3;

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setAllowsJavaScriptMarkup:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setAllowsMetaRefresh:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setAllowUniversalAccessFromFileURLs:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setLegacyEncryptedMediaAPIEnabled:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setLoadsSubresources:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setAVFoundationEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setDOMPasteAllowed:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setJavaScriptCanAccessClipboard:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setLoadsImagesAutomatically:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMediaDevicesEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPeerConnectionEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setRemotePlaybackEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setScreenCaptureEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setStorageBlockingPolicy:", 2);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setWebAudioEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setJavaScriptCanOpenWindowsAutomatically:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setTextAutosizingEnabled:", 0);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "preferences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setShouldEnableTextAutosizingBoost:", 0);

    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v18 = (void *)getWKWebsiteDataStoreClass_softClass;
    v37 = getWKWebsiteDataStoreClass_softClass;
    if (!getWKWebsiteDataStoreClass_softClass)
    {
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __getWKWebsiteDataStoreClass_block_invoke;
      v32 = &unk_24F0F3C70;
      v33 = &v34;
      __getWKWebsiteDataStoreClass_block_invoke((uint64_t)&v29);
      v18 = (void *)v35[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v34, 8);
    objc_msgSend(v19, "nonPersistentDataStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setWebsiteDataStore:", v20);

    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setAllowsAirPlayForMediaPlayback:", 0);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v21 = (void *)getWKWebpagePreferencesClass_softClass;
    v37 = getWKWebpagePreferencesClass_softClass;
    if (!getWKWebpagePreferencesClass_softClass)
    {
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __getWKWebpagePreferencesClass_block_invoke;
      v32 = &unk_24F0F3C70;
      v33 = &v34;
      __getWKWebpagePreferencesClass_block_invoke((uint64_t)&v29);
      v21 = (void *)v35[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v34, 8);
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setAllowsContentJavaScript:", 0);
    objc_msgSend(v23, "setPreferredContentMode:", 2);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setDefaultWebpagePreferences:", v23);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setAllowsInlineMediaPlayback:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setAllowsPictureInPictureMediaPlayback:", 0);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "_setClientNavigationsRunAtForegroundPriority:", 1);
    v24 = objc_alloc_init(MEMORY[0x24BDFA978]);
    objc_msgSend(v24, "setJITEnabled:", 0);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA8E8]), "_initWithConfiguration:", v24);
    objc_msgSend((id)_copyDefaultWebViewConfiguration_configuration, "setProcessPool:", v25);

    v2 = (void *)_copyDefaultWebViewConfiguration_configuration;
  }
  v26 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWebsiteDataStore:", v27);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingBlock, 0);
  objc_storeStrong((id *)&self->_providedJavaScript, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
