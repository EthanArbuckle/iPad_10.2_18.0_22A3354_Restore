@implementation SL

void __48__SL_OOPAWebViewController_setAuthFlowDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_didFinishWithSuccess:response:error:", a2, v10, v7);

}

void __40__SL_OOPAWebViewController__loadWebView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1024);
  v9 = v3;
  if (v4)
    objc_msgSend(v4, "requestForAuthURL:", v3);
  else
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", v3, 1, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 968);
  if (v7)
    v8 = (id)objc_msgSend(v7, "loadRequest:", v5);
  else
    objc_msgSend(*(id *)(v6 + 976), "loadRequest:", v5);

}

void __40__SL_OOPAWebViewController__loadWebView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__SL_OOPAWebViewController__loadWebView__block_invoke_3;
  v10[3] = &unk_1E7590A48;
  v11 = v5;
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v12 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __40__SL_OOPAWebViewController__loadWebView__block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 40), "_didFinishWithSuccess:response:error:", 0, 0, *(_QWORD *)(a1 + 48));
}

uint64_t __49__SL_OOPAWebViewController_webViewDidFinishLoad___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDocumentTitleForUIWebView:retryCount:completion:", *(_QWORD *)(a1 + 40), 5, a2);
}

uint64_t __85__SL_OOPAWebViewController__evaluateDocumentTitleForUIWebView_retryCount_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  _SLLog(v1, 3, CFSTR("No title for webview, re-trying..."));
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDocumentTitleForUIWebView:retryCount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 48));
}

uint64_t __56__SL_OOPAWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDocumentTitleForWebView:retryCount:completion:", *(_QWORD *)(a1 + 40), 5, a2);
}

void __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  dispatch_time_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
  {
    _SLLog(v3, 3, CFSTR("Found title for webview"));
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v7)
      _SLLog(v3, 3, CFSTR("Error evaluating document title: %@"));
    v8 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke_2;
    block[3] = &unk_1E7590AC0;
    v9 = (void *)a1[5];
    block[4] = a1[4];
    v10 = v9;
    v12 = (void *)a1[6];
    v11 = a1[7];
    v14 = v10;
    v16 = v11;
    v15 = v12;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  _SLLog(v1, 7, CFSTR("No title for webview, re-trying..."));
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDocumentTitleForWebView:retryCount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 48));
}

@end
