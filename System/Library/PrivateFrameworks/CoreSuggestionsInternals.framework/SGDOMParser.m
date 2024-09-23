@implementation SGDOMParser

- (id)parseHTML:(id)a3
{
  SGDOMParser *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SGTaggedCharacterRange *v23;
  NSObject *v24;
  SGDOMParserResult *v25;
  SGDOMParserResult *v26;
  NSString *html;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  id v35;
  uint64_t *v36;
  uint8_t *v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_html, a3);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__15476;
  v46 = __Block_byref_object_dispose__15477;
  v47 = 0;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", &v5->_html))
  {
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x2020000000;
    v41 = 0;
    dispatch_get_global_queue(2, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__SGDOMParser_parseHTML___block_invoke;
    block[3] = &unk_1E7DB7850;
    v36 = &v42;
    block[4] = v5;
    v35 = v29;
    v37 = buf;
    dispatch_async(v6, block);

    v7 = *MEMORY[0x1E0C99748];
    do
    {
      if (v39[24])
        break;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "runMode:beforeDate:", v7, v9);

    }
    while ((v10 & 1) != 0);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[SGDOMParser _parseDocument:](v5, "_parseDocument:", v29);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v43[5];
    v43[5] = v11;

  }
  objc_msgSend((id)v43[5], "objectForKeyedSubscript:", CFSTR("plainText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13
    || (objc_msgSend((id)v43[5], "objectForKeyedSubscript:", CFSTR("taggedCharacterRanges")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = v14 == 0,
        v14,
        v13,
        v15))
  {
    v26 = 0;
  }
  else
  {
    v16 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend((id)v43[5], "objectForKeyedSubscript:", CFSTR("taggedCharacterRanges"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v31;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20);
          v22 = (void *)MEMORY[0x1C3BD4F6C]();
          v23 = -[SGTaggedCharacterRange initWithDict:]([SGTaggedCharacterRange alloc], "initWithDict:", v21);
          if (v23)
          {
            objc_msgSend(v16, "addObject:", v23);
          }
          else
          {
            sgEventsLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v24, OS_LOG_TYPE_ERROR, "SGDOMParser: Error parsing tcr tags from js", buf, 2u);
            }

          }
          objc_autoreleasePoolPop(v22);
          if (!v23)
          {
            v26 = 0;
            goto LABEL_25;
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
        if (v18)
          continue;
        break;
      }
    }

    v25 = [SGDOMParserResult alloc];
    objc_msgSend((id)v43[5], "objectForKeyedSubscript:", CFSTR("plainText"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SGDOMParserResult initWithPlainText:taggedCharacterRanges:](v25, "initWithPlainText:taggedCharacterRanges:", v17, v16);
LABEL_25:

  }
  _Block_object_dispose(&v42, 8);

  html = v5->_html;
  v5->_html = 0;

  objc_sync_exit(v5);
  return v26;
}

- (id)webView
{
  WKWebView *webView;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  WKWebView *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  objc_class *v31;
  WKWebView *v32;
  WKWebView *v33;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  webView = self->_webView;
  if (webView)
  {
LABEL_18:
    v10 = webView;
    return v10;
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v4 = (void *)getWKWebViewConfigurationClass_softClass;
  v43 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __getWKWebViewConfigurationClass_block_invoke;
    v38 = &unk_1E7DB7220;
    v39 = &v40;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v35);
    v4 = (void *)v41[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v40, 8);
  v6 = objc_opt_new();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(getWKWebsiteDataStoreClass(), "nonPersistentDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "setWebsiteDataStore:", v8);
    }
    else
    {
      sgLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v35) = 0;
        _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGDOMParser: datastore is nil", (uint8_t *)&v35, 2u);
      }

    }
    objc_msgSend(v7, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setJavaScriptCanOpenWindowsAutomatically:", 0);

    objc_msgSend(v7, "preferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setWebAudioEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setJavaScriptCanAccessClipboard:", 0);

    objc_msgSend(v7, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setStorageBlockingPolicy:", 2);

    objc_msgSend(v7, "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setScreenCaptureEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setPeerConnectionEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setMediaDevicesEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setDOMPasteAllowed:", 0);

    objc_msgSend(v7, "preferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setAVFoundationEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_setLoadsImagesAutomatically:", 0);

    objc_msgSend(v7, "preferences");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setRemotePlaybackEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_setWebAudioEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setTextAutosizingEnabled:", 0);

    objc_msgSend(v7, "preferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_setShouldEnableTextAutosizingBoost:", 0);

    objc_msgSend(getWKWebsiteDataStoreClass(), "nonPersistentDataStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWebsiteDataStore:", v26);

    objc_msgSend(v7, "setAllowsAirPlayForMediaPlayback:", 0);
    objc_msgSend(v7, "_setAllowUniversalAccessFromFileURLs:", 0);
    objc_msgSend(v7, "_setLegacyEncryptedMediaAPIEnabled:", 0);
    objc_msgSend(v7, "_setAllowsJavaScriptMarkup:", 0);
    objc_msgSend(v7, "setAllowsInlineMediaPlayback:", 0);
    objc_msgSend(v7, "setAllowsPictureInPictureMediaPlayback:", 0);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v27 = (void *)getWKWebpagePreferencesClass_softClass;
    v43 = getWKWebpagePreferencesClass_softClass;
    if (!getWKWebpagePreferencesClass_softClass)
    {
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __getWKWebpagePreferencesClass_block_invoke;
      v38 = &unk_1E7DB7220;
      v39 = &v40;
      __getWKWebpagePreferencesClass_block_invoke((uint64_t)&v35);
      v27 = (void *)v41[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v40, 8);
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setAllowsContentJavaScript:", 0);
    objc_msgSend(v29, "setPreferredContentMode:", 2);
    objc_msgSend(v7, "setDefaultWebpagePreferences:", v29);
    v40 = 0;
    v41 = &v40;
    v42 = 0x2050000000;
    v30 = (void *)getWKWebViewClass_softClass;
    v43 = getWKWebViewClass_softClass;
    if (!getWKWebViewClass_softClass)
    {
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __getWKWebViewClass_block_invoke;
      v38 = &unk_1E7DB7220;
      v39 = &v40;
      __getWKWebViewClass_block_invoke((uint64_t)&v35);
      v30 = (void *)v41[3];
    }
    v31 = objc_retainAutorelease(v30);
    _Block_object_dispose(&v40, 8);
    v32 = (WKWebView *)objc_msgSend([v31 alloc], "initWithFrame:configuration:", v7, 0.0, 0.0, 1366.0, 768.0);
    v33 = self->_webView;
    self->_webView = v32;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    webView = self->_webView;
    goto LABEL_18;
  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v35) = 0;
    _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGGDOMParser: Unable to load WKWebConfiguration", (uint8_t *)&v35, 2u);
  }

  v10 = 0;
  return v10;
}

- (id)_parseDocument:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *loadedSem;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SGDOMParser *v19;
  NSObject *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint8_t buf[8];
  _QWORD block[5];
  id v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  id v34;

  v4 = a3;
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__15476;
  v33[4] = __Block_byref_object_dispose__15477;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15476;
  v31 = __Block_byref_object_dispose__15477;
  v32 = 0;
  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  loadedSem = self->_loadedSem;
  self->_loadedSem = v6;

  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SGDOMParser__parseDocument___block_invoke;
  block[3] = &unk_1E7DB7878;
  v26 = v33;
  block[4] = self;
  v9 = v4;
  v25 = v9;
  dispatch_async(v5, block);

  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", self->_loadedSem);
  if (self->_webView)
  {
    sgEventsLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGDOMParser: Loaded HTML Document", buf, 2u);
    }

    v15 = v8;
    v16 = 3221225472;
    v17 = __30__SGDOMParser__parseDocument___block_invoke_12;
    v18 = &unk_1E7DB7850;
    v19 = self;
    v21 = v33;
    v22 = &v27;
    v11 = dispatch_semaphore_create(0);
    v20 = v11;
    v12 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], &v15);

    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v11, v15, v16, v17, v18, v19);
    v13 = (id)v28[5];

  }
  else
  {
    v13 = (id)v28[5];
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v33, 8);

  return v13;
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  NSObject *loadedSem;

  loadedSem = self->_loadedSem;
  if (loadedSem)
    dispatch_semaphore_signal(loadedSem);
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSObject *loadedSem;

  loadedSem = self->_loadedSem;
  if (loadedSem)
    dispatch_semaphore_signal(loadedSem);
}

- (void)runJavascriptOnWebView:(id)a3 withCallback:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filesystemPathForAssetDataRelativePath:", CFSTR("HTMLPreprocessor.js"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v8, 4, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__SGDOMParser_runJavascriptOnWebView_withCallback___block_invoke;
      v13[3] = &unk_1E7DAD830;
      v14 = v6;
      objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v9, v13);

    }
    else
    {
      sgEventsLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "SGDOMParser: jsContent nil: %@", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA70]);
    }

  }
  else
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGDOMParser: Nil path for HTMLPreprocessor from asset", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x1E0C9AA70]);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_loadedSem, 0);
}

void __51__SGDOMParser_runJavascriptOnWebView_withCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sgEventsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "Error evaluating JS: %@", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v5;
    else
      v8 = (id)MEMORY[0x1E0C9AA70];
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8);
  }

}

id __30__SGDOMParser__parseDocument___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v5)
    return (id)objc_msgSend(v5, "loadHTMLString:baseURL:", *(_QWORD *)(a1 + 40), 0);
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGDOMParser: Unable to load WebView", v8, 2u);
  }

  return (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

void __30__SGDOMParser__parseDocument___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SGDOMParser__parseDocument___block_invoke_2;
  v4[3] = &unk_1E7DAD808;
  v6 = v1;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "runJavascriptOnWebView:withCallback:", v2, v4);

}

void __30__SGDOMParser__parseDocument___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __25__SGDOMParser_parseHTML___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_parseDocument:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

@end
