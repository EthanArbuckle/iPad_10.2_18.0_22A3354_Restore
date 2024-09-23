@implementation MSCustomProtocolURLSchemeHandler

+ (MSCustomProtocolURLSchemeHandler)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_3);
  return (MSCustomProtocolURLSchemeHandler *)(id)sharedHandler_handler;
}

void __49__MSCustomProtocolURLSchemeHandler_sharedHandler__block_invoke()
{
  MSCustomProtocolURLSchemeHandler *v0;
  void *v1;

  v0 = objc_alloc_init(MSCustomProtocolURLSchemeHandler);
  v1 = (void *)sharedHandler_handler;
  sharedHandler_handler = (uint64_t)v0;

}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke;
  v9[3] = &unk_1E716DD00;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(v7, (const void *)taskKey, v8, (void *)0x301);
  objc_msgSend(v8, "resume");

}

void __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2;
  v13[3] = &unk_1E716DCD8;
  v14 = *(id *)(a1 + 32);
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(*(id *)(a1 + 32), (const void *)taskKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v3, "didReceiveResponse:");
      objc_msgSend(*(id *)(a1 + 32), "didReceiveData:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "didFinish");
    }
    else
    {
      objc_msgSend(v3, "didFailWithError:", *(_QWORD *)(a1 + 56));
    }
  }
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  void *v4;
  id object;

  object = a4;
  objc_getAssociatedObject(object, (const void *)taskKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(object, (const void *)taskKey, 0, (void *)0x301);
  objc_msgSend(v4, "cancel");

}

@end
