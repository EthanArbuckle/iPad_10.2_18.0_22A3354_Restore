@implementation EDMailDropMetadataGenerator

void ___ef_log_EDMailDropMetadataGenerator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDMailDropMetadataGenerator");
  v1 = (void *)_ef_log_EDMailDropMetadataGenerator_log;
  _ef_log_EDMailDropMetadataGenerator_log = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[EDMailDropMetadataGenerator tearDownWebView](self, "tearDownWebView");
  v3.receiver = self;
  v3.super_class = (Class)EDMailDropMetadataGenerator;
  -[EDMailDropMetadataGenerator dealloc](&v3, sel_dealloc);
}

- (id)withTimeout:(double)a3 do:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *);
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v7 = (void (**)(id, void *))a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  objc_msgSend(v9, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke;
  v29[3] = &unk_1E949CD18;
  v13 = v10;
  v30 = v13;
  v14 = v8;
  v31 = v14;
  objc_msgSend(v11, "addSuccessBlock:", v29);

  objc_msgSend(v9, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_2;
  v26[3] = &unk_1E949CD40;
  v16 = v13;
  v27 = v16;
  v17 = v14;
  v28 = v17;
  objc_msgSend(v15, "addFailureBlock:", v26);

  v7[2](v7, v9);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_3;
  v24[3] = &unk_1E949AEB8;
  v19 = v9;
  v25 = v19;
  objc_msgSend(v18, "afterDelay:performBlock:", v24, a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addCancelable:", v20);

  v21 = v25;
  v22 = v19;

  return v22;
}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ef_timeoutError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:");

}

- (void)generateMailDropMetadataForContentURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  EDMailDropMetadataGenerator *v13;
  id v14;

  v6 = a3;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __87__EDMailDropMetadataGenerator_generateMailDropMetadataForContentURL_completionHandler___block_invoke;
  v12 = &unk_1E949CD68;
  v13 = self;
  v7 = v6;
  v14 = v7;
  -[EDMailDropMetadataGenerator withTimeout:do:completion:](self, "withTimeout:do:completion:", &v9, a4, 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailDropMetadataGenerator setActivePromise:](self, "setActivePromise:", v8, v9, v10, v11, v12, v13);

}

uint64_t __87__EDMailDropMetadataGenerator_generateMailDropMetadataForContentURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findMailDropNodesInFileURL:promise:", *(_QWORD *)(a1 + 40), a2);
}

- (void)tearDownWebView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EDMailDropMetadataGenerator webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EDMailDropMetadataGenerator scriptHandlers](self, "scriptHandlers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeScriptMessageHandlerForName:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[EDMailDropMetadataGenerator scriptHandlers](self, "scriptHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  -[EDMailDropMetadataGenerator webView](self, "webView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_close");

  -[EDMailDropMetadataGenerator setWebView:](self, "setWebView:", 0);
}

- (BOOL)_shouldSearchForMailDropNodesInFileURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v3, 4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    _ef_log_EDMailDropMetadataGenerator();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EDMailDropMetadataGenerator _shouldSearchForMailDropNodesInFileURL:].cold.1((uint64_t)v3, v7, v10);
    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "containsString:", *MEMORY[0x1E0D1DCA8]);
  _ef_log_EDMailDropMetadataGenerator();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      v9 = 1;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "HTML file seems to contain Mail Drop tags; proceeding with node search",
        buf,
        2u);
      goto LABEL_11;
    }
LABEL_7:
    v9 = 1;
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "HTML file does not contain Mail Drop tags; skipping node search",
      v12,
      2u);
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_findMailDropNodesInFileURL:(id)a3 promise:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (-[EDMailDropMetadataGenerator _shouldSearchForMailDropNodesInFileURL:](self, "_shouldSearchForMailDropNodesInFileURL:", v6))
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke;
    v9[3] = &unk_1E949B390;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v8, "performBlock:", v9);

  }
  else
  {
    objc_msgSend(v7, "finishWithResult:", MEMORY[0x1E0C9AA60]);
  }

}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD block[5];
  _BYTE buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v2, "_setAllowsJavaScriptMarkup:", 0);
  objc_msgSend(v2, "_setClientNavigationsRunAtForegroundPriority:", 1);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2;
  block[3] = &unk_1E949AEB8;
  block[4] = a1[4];
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, block);
  v4 = objc_alloc(MEMORY[0x1E0CEF610]);
  v5 = (void *)objc_msgSend(v4, "initWithSource:injectionTime:forMainFrameOnly:", _block_invoke_mailDropSupportSource, 1, 0);
  objc_msgSend(v2, "userContentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUserScript:", v5);

  objc_msgSend(a1[4], "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _ef_log_EDMailDropMetadataGenerator();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[5], "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Creating a webview for parsing MailDrop nodes for HTML file %@", buf, 0xCu);

    }
    v10 = objc_alloc(MEMORY[0x1E0CEF630]);
    v11 = (void *)objc_msgSend(v10, "initWithFrame:configuration:", v2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(a1[4], "setWebView:", v11);

    v12 = a1[4];
    objc_msgSend(v12, "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNavigationDelegate:", v12);

  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, a1[4]);
  v14 = a1[4];
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_19;
  v17[3] = &unk_1E949CD90;
  objc_copyWeak(&v19, (id *)buf);
  v18 = a1[6];
  objc_msgSend(v14, "_addScriptHandlerForKey:handler:", CFSTR("FinishedParsingMailDropNodes"), v17);
  objc_msgSend(a1[4], "webView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "loadFileURL:allowingReadAccessToURL:", a1[5], a1[5]);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("EDMailDropSupport"), CFSTR("js"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfFile:encoding:error:", v1, 4, &v7);
  v3 = v7;
  v4 = (void *)_block_invoke_mailDropSupportSource;
  _block_invoke_mailDropSupportSource = v2;

  if (!_block_invoke_mailDropSupportSource)
  {
    _ef_log_EDMailDropMetadataGenerator();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2_cold_1(v6, (uint64_t)v8, v5);
    }

  }
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _ef_log_EDMailDropMetadataGenerator();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "MailDrop: Received Script message Finished MailDrop %@", (uint8_t *)&v18, 0xCu);
  }

  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "ef_all:", &__block_literal_global_162);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v6);
      goto LABEL_10;
    }
  }
  else
  {

  }
  _ef_log_EDMailDropMetadataGenerator();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_19_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2049, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "finishWithError:", v17);

  objc_msgSend(WeakRetained, "tearDownWebView");
LABEL_10:

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  _ef_log_EDMailDropMetadataGenerator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[EDMailDropMetadataGenerator webViewWebContentProcessDidTerminate:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  -[EDMailDropMetadataGenerator activePromise](self, "activePromise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2049, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finishWithError:", v13);

  -[EDMailDropMetadataGenerator tearDownWebView](self, "tearDownWebView");
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  _ef_log_EDMailDropMetadataGenerator();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailDropMetadataGenerator webView:didFailProvisionalNavigation:withError:].cold.1(v8, (uint64_t)v10, v7);
  }

  -[EDMailDropMetadataGenerator activePromise](self, "activePromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithError:", v6);

  -[EDMailDropMetadataGenerator tearDownWebView](self, "tearDownWebView");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ef_log_EDMailDropMetadataGenerator();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "MailDrop: Finished loading webview for URL %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)insertMailDropAttachmentViewForContentURL:(id)a3 HTMLByContentID:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  EDMailDropMetadataGenerator *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  EDMailDropMetadataGenerator *v19;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke;
    v17[3] = &unk_1E949CD68;
    v18 = v7;
    v19 = self;
    v11 = v9;
    v12 = 3221225472;
    v13 = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_27;
    v14 = &unk_1E949CDE0;
    v15 = self;
    v16 = v8;
    -[EDMailDropMetadataGenerator withTimeout:do:completion:](self, "withTimeout:do:completion:", v17, &v11, 5.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDMailDropMetadataGenerator setActivePromise:](self, "setActivePromise:", v10, v11, v12, v13, v14, v15);

  }
  else
  {
    -[EDMailDropMetadataGenerator tearDownWebView](self, "tearDownWebView");
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", *(_QWORD *)(a1 + 32), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("replaceNodeWithIdWithHTML(%@);"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E949CDB8;
  v10 = v7;
  v11 = *(_QWORD *)(a1 + 40);
  v14 = v10;
  v15 = v11;
  v12 = v3;
  v16 = v12;
  objc_msgSend(v9, "evaluateJavaScript:completionHandler:", v8, v13);

}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v7 = *(_QWORD *)(a1 + 32);
    v17 = 0;
    v8 = objc_msgSend(v5, "writeToURL:atomically:encoding:error:", v7, 1, 4, &v17);
    v9 = v17;
    v6 = v9;
    if ((v8 & 1) != 0)
    {
      v10 = v9;
      goto LABEL_15;
    }
    _ef_log_EDMailDropMetadataGenerator();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2_cold_1(v13, (uint64_t)v22, v12);
    }

    if (v6)
    {
      v20 = *MEMORY[0x1E0CB3388];
      v21 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2049, v11);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v19 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1DC10], 2049, v11);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v14;

LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "tearDownWebView");
  v15 = *(void **)(a1 + 48);
  if (v10)
  {
    objc_msgSend(v15, "finishWithError:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", v16);

  }
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "tearDownWebView");
  v5 = v6;
  if (a2)
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)_addScriptHandlerForKey:(id)a3 handler:(id)a4
{
  id v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *scriptHandlers;
  EDMailDropWebViewScriptHandler *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  -[EDMailDropMetadataGenerator webView](self, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDMailDropMetadataGenerator.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("webView"));

  }
  if (!self->_scriptHandlers)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scriptHandlers = self->_scriptHandlers;
    self->_scriptHandlers = v9;

  }
  v11 = objc_alloc_init(EDMailDropWebViewScriptHandler);
  -[EDMailDropWebViewScriptHandler setName:](v11, "setName:", v16);
  -[EDMailDropWebViewScriptHandler setWebView:](v11, "setWebView:", v8);
  -[EDMailDropWebViewScriptHandler setHandler:](v11, "setHandler:", v7);
  -[NSMutableArray addObject:](self->_scriptHandlers, "addObject:", v11);
  objc_msgSend(v8, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userContentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailDropWebViewScriptHandler name](v11, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addScriptMessageHandler:name:", v11, v14);

}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSMutableArray)scriptHandlers
{
  return self->_scriptHandlers;
}

- (void)setScriptHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_scriptHandlers, a3);
}

- (EFPromise)activePromise
{
  return self->_activePromise;
}

- (void)setActivePromise:(id)a3
{
  objc_storeStrong((id *)&self->_activePromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePromise, 0);
  objc_storeStrong((id *)&self->_scriptHandlers, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)_shouldSearchForMailDropNodesInFileURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Could not load contents of URL %@ for pre-screening; proceeding with node search",
    (uint8_t *)&v3);
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "could not load the mail drop support javascript resource: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_19_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "MailDrop: Script message finished with a non-array value", a5, a6, a7, a8, 0);
}

- (void)webViewWebContentProcessDidTerminate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "MailDrop: WebView terminated", a5, a6, a7, a8, 0);
}

- (void)webView:(void *)a1 didFailProvisionalNavigation:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "MailDrop: Failed to load WebView Error %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Unable to rewrite HTML with updated maildrop nodes. Error: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_2_0();
}

@end
