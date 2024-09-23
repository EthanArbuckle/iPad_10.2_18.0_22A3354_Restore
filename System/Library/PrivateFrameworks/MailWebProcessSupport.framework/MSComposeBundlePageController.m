@implementation MSComposeBundlePageController

- (MSComposeBundlePageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6;
  id v7;
  MSComposeBundlePageController *v8;
  MSComposeBundlePageController *v9;
  NSMutableArray *v10;
  NSMutableArray *blocksToPerformOnPage;
  uint64_t v12;
  EFProcessTransaction *webContentProcessTransaction;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MSComposeBundlePageController;
  v8 = -[MSComposeBundlePageController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_plugIn, v6);
    objc_storeStrong((id *)&v9->_controller, a4);
    v9->_performOnPageSuspendCount = 1;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    blocksToPerformOnPage = v9->_blocksToPerformOnPage;
    v9->_blocksToPerformOnPage = v10;

    -[WKWebProcessPlugInBrowserContextController setLoadDelegate:](v9->_controller, "setLoadDelegate:", v9);
    objc_msgSend(MEMORY[0x24BE2E678], "transactionWithDescription:", CFSTR("Compose WebContent process transaction"));
    v12 = objc_claimAutoreleasedReturnValue();
    webContentProcessTransaction = v9->_webContentProcessTransaction;
    v9->_webContentProcessTransaction = (EFProcessTransaction *)v12;

  }
  return v9;
}

- (void)invalidate
{
  JSContext *jsContext;
  JSValue *jsBodyField;
  EFProcessTransaction *webContentProcessTransaction;

  -[WKWebProcessPlugInBrowserContextController setLoadDelegate:](self->_controller, "setLoadDelegate:", 0);
  jsContext = self->_jsContext;
  self->_jsContext = 0;

  jsBodyField = self->_jsBodyField;
  self->_jsBodyField = 0;

  -[EFProcessTransaction invalidate](self->_webContentProcessTransaction, "invalidate");
  webContentProcessTransaction = self->_webContentProcessTransaction;
  self->_webContentProcessTransaction = 0;

}

- (MSComposeBodyFieldObserver)observerProxy
{
  -[MSComposeBundlePageController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MSComposeBundlePageController observerProxy]", "MSComposeBundlePageController.m", 77, "0");
}

- (void)performOnPage:(id)a3
{
  id v4;
  NSMutableArray *blocksToPerformOnPage;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_performOnPageSuspendCount)
  {
    blocksToPerformOnPage = self->_blocksToPerformOnPage;
    v6 = (void *)MEMORY[0x220780478]();
    -[NSMutableArray addObject:](blocksToPerformOnPage, "addObject:", v6);

  }
  else
  {
    self->_performOnPageSuspendCount = 1;
    (*((void (**)(void))v4 + 2))();
    -[MSComposeBundlePageController resumePerformOnPage](self, "resumePerformOnPage");
  }

}

- (void)suspendPerformOnPage
{
  ++self->_performOnPageSuspendCount;
}

- (void)resumePerformOnPage
{
  unint64_t v2;
  uint64_t v4;
  void (**v5)(_QWORD);
  unint64_t v6;

  v2 = self->_performOnPageSuspendCount - 1;
  self->_performOnPageSuspendCount = v2;
  if (!v2)
  {
    do
    {
      -[NSMutableArray firstObject](self->_blocksToPerformOnPage, "firstObject");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
        break;
      v5 = (void (**)(_QWORD))v4;
      -[NSMutableArray removeObjectAtIndex:](self->_blocksToPerformOnPage, "removeObjectAtIndex:", 0);
      ++self->_performOnPageSuspendCount;
      v5[2](v5);

      v6 = self->_performOnPageSuspendCount - 1;
      self->_performOnPageSuspendCount = v6;
    }
    while (!v6);
  }
}

- (void)performBodyFieldMethodOnPage:(id)a3 withArguments:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__MSComposeBundlePageController_performBodyFieldMethodOnPage_withArguments___block_invoke;
  v10[3] = &unk_24E06AE18;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MSComposeBundlePageController performOnPage:](self, "performOnPage:", v10);

}

id __76__MSComposeBundlePageController_performBodyFieldMethodOnPage_withArguments___block_invoke(_QWORD *a1)
{
  return (id)objc_msgSend(*(id *)(a1[4] + 24), "invokeMethod:withArguments:", a1[5], a1[6]);
}

- (id)_linkGeneratorProxy
{
  MSRichLinkGeneration *linkGeneratorProxy;
  void *v4;
  void *v5;
  void *v6;
  MSRichLinkGeneration *v7;
  MSRichLinkGeneration *v8;

  linkGeneratorProxy = self->_linkGeneratorProxy;
  if (!linkGeneratorProxy)
  {
    -[MSComposeBundlePageController controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFA9B0], "remoteObjectInterfaceWithProtocol:", &unk_25529D540);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithInterface:", v6);
    v7 = (MSRichLinkGeneration *)objc_claimAutoreleasedReturnValue();
    v8 = self->_linkGeneratorProxy;
    self->_linkGeneratorProxy = v7;

    linkGeneratorProxy = self->_linkGeneratorProxy;
  }
  return linkGeneratorProxy;
}

- (id)createRichLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  MSComposeBundlePageController *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Promise"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__MSComposeBundlePageController_createRichLink___block_invoke;
  v13[3] = &unk_24E06AE68;
  v7 = v4;
  v14 = v7;
  v15 = self;
  v8 = v5;
  v16 = v8;
  v9 = (void *)MEMORY[0x220780478](v13);
  v17[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constructWithArguments:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __48__MSComposeBundlePageController_createRichLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCF48], "_lp_URLWithUserTypedString:relativeToURL:", *(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_linkGeneratorProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__MSComposeBundlePageController_createRichLink___block_invoke_2;
  v7[3] = &unk_24E06AE40;
  objc_copyWeak(&v10, &location);
  v8 = *(id *)(a1 + 48);
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "createRichLinkWithURL:completionHandler:", v4, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __48__MSComposeBundlePageController_createRichLink___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11)
  {
    if (v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "observerProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "composeBodyFieldAddAttachmentWithData:filename:mimeType:uniqueID:", v12, v13, v14, v15);

    }
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithObject:inContext:", v11, *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 40);
    v23[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v19, "callWithArguments:", v20);

  }
  else
  {
    v22 = (id)objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", MEMORY[0x24BDBD1A8]);
  }

}

- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke;
  v10[3] = &unk_24E06AEB8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MSComposeBundlePageController performOnPage:](self, "performOnPage:", v10);

}

void __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "suspendPerformOnPage");
  v2 = (void *)*((_QWORD *)a1[4] + 3);
  objc_msgSend(a1[5], "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invokeMethod:withArguments:", CFSTR("insertRichLink"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke_2;
  v10[3] = &unk_24E06AE90;
  v6 = a1[6];
  v10[4] = a1[4];
  v11 = v6;
  v7 = (void *)MEMORY[0x220780478](v10);
  v12 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "invokeMethod:withArguments:", CFSTR("then"), v8);

}

uint64_t __73__MSComposeBundlePageController_insertRichLinkWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "resumePerformOnPage");
}

- (void)makeRichLinkFromSelection
{
  -[MSComposeBundlePageController performBodyFieldMethodOnPage:withArguments:](self, "performBodyFieldMethodOnPage:withArguments:", CFSTR("makeRichLinkFromSelection"), MEMORY[0x24BDBD1A8]);
}

- (void)removeRichLinkFromSelection
{
  -[MSComposeBundlePageController performBodyFieldMethodOnPage:withArguments:](self, "performBodyFieldMethodOnPage:withArguments:", CFSTR("removeRichLinkFromSelection"), MEMORY[0x24BDBD1A8]);
}

- (void)stripCustomBodyIdentifiers
{
  -[MSComposeBundlePageController performBodyFieldMethodOnPage:withArguments:](self, "performBodyFieldMethodOnPage:withArguments:", CFSTR("stripCustomBodyIdentifiers"), MEMORY[0x24BDBD1A8]);
}

- (void)changeQuoteLevelBy:(int64_t)a3 withUndoActionName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSComposeBundlePageController performBodyFieldMethodOnPage:withArguments:](self, "performBodyFieldMethodOnPage:withArguments:", CFSTR("changeQuoteLevel"), v8);

}

- (id)willSendRequest:(id)a3
{
  return a3;
}

- (void)enableQuickReply:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v3 = a3;
  v7[1] = *MEMORY[0x24BDAC8D0];
  self->_isQuickReplyEnabled = _os_feature_enabled_impl() & a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSComposeBundlePageController performBodyFieldMethodOnPage:withArguments:](self, "performBodyFieldMethodOnPage:withArguments:", CFSTR("enableQuickReply"), v6);

}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "mainFrame");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[MSComposeBundlePageController resumePerformOnPage](self, "resumePerformOnPage");

}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  JSContext *v13;
  JSContext *jsContext;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "mainFrame");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
  {
    objc_msgSend(MEMORY[0x24BDFA910], "normalWorld");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v10)
    {
      objc_msgSend(v9, "jsContextForWorld:", v10);
      v13 = (JSContext *)objc_claimAutoreleasedReturnValue();
      jsContext = self->_jsContext;
      self->_jsContext = v13;

      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v15 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke;
      v25[3] = &unk_24E06AEE0;
      objc_copyWeak(&v26, &location);
      -[JSContext setExceptionHandler:](self->_jsContext, "setExceptionHandler:", v25);
      -[JSContext globalObject](self->_jsContext, "globalObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = CFSTR("unhandledrejection");
      v20 = v15;
      v21 = 3221225472;
      v22 = __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke_2;
      v23 = &unk_24E06AF08;
      objc_copyWeak(&v24, &location);
      v17 = (void *)MEMORY[0x220780478](&v20);
      v28[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2, v20, v21, v22, v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v16, "invokeMethod:withArguments:", CFSTR("addEventListener"), v18);

      -[MSComposeBundlePageController initializeGlobalObject](self, "initializeGlobalObject");
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
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
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v23[0] = *MEMORY[0x24BE63708];
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v23[1] = *MEMORY[0x24BE63710];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stack"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCE88];
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("line"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("column"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("JavaScript exception: %@:%@:%@: %@"), v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], v18, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "observerProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "composeBodyFieldDidThrowException:", v19);

}

void __120__MSComposeBundlePageController_webProcessPlugInBrowserContextController_globalObjectIsAvailableForFrame_inScriptWorld___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "jsContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exceptionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("reason"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v6)[2](v6, v5, v7);

  }
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  -[MSComposeBundlePageController willSendRequest:](self, "willSendRequest:", a6, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)initializeGlobalObject
{
  uint64_t v3;
  JSContext *jsContext;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[29];

  v3 = 0;
  v38[27] = *MEMORY[0x24BDAC8D0];
  v38[0] = "MailSupport/BodyField.js";
  v38[1] = kBodyFieldSource;
  v38[2] = kBodyFieldSourceLength;
  v38[3] = "MailSupport/BodyInputController.js";
  v38[4] = kBodyInputControllerSource;
  v38[5] = kBodyInputControllerSourceLength;
  v38[6] = "MailSupport/Constants.js";
  v38[7] = "/*\n"
           " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
           " */\n"
           "\"use strict\";const MFContentIDScheme=\"cid\",MFHtmlIDSelectionEnd=\"x-apple-selection:end\",MFHtmlIDSelecti"
           "onStart=\"x-apple-selection:start\",MFHtmlTemporaryEditingElement=\"AppleTemporaryEditingElement\",MFHtmlTemp"
           "oraryPresentationElement=\"AppleTemporaryPresentationElement\",MFMailDropBannerClass=\"x-apple-maildropbanner"
           "\",MFMailDropItemClass=\"x-apple-maildrop\",MFHtmlIDSignature=\"AppleMailSignature\",MFHtmlIDLineBreakAtSigna"
           "ture=\"lineBreakAtBeginningOfSignature\",MFHtmlIDLineBreakAtBeginning=\"lineBreakAtBeginningOfMessage\",MFRic"
           "hLinkClass=\"apple-rich-link\",MFLPRichLinkClassPrefix=\"lp-rich-link\",MFMailTemporaryAttachmentWrapper=\"x-"
           "apple-attachment-mark\",MFHtmlIDQuickReplyStyle=\"x-mail-quick-reply-style\",HtmlClassOriginalContent=\"Apple"
           "OriginalContents\",linkPlaceHolderClass=\"linkPlaceholder\",MFMailBigEmojiAttribute=\"AppleMailBigEmoji\",big"
           "EmojiFontSize=\"-webkit-xxx-large\",defaultEmojiFontSize=\"-apple-system-body\",maxNumberBigEmoji=3,largeInhe"
           "ritedFontSize=7;";
  v38[8] = kConstantsSourceLength;
  v38[9] = "MailSupport/DocumentExtras.js";
  v38[10] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";Document.prototype.createBlockPlaceholder=function(){let e=this.createElement(\"BR\");return "
            "e.className=\"webkit-block-placeholder\",e};";
  v38[11] = kDocumentExtrasSourceLength;
  v38[12] = "MailSupport/ElementExtras.js";
  v38[13] = kElementExtrasSource;
  v38[14] = kElementExtrasSourceLength;
  v38[15] = "MailSupport/HTMLDocumentExtras.js";
  v38[16] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLDocument.prototype.mf_createMessageQuoteElement=function(){let e=this.createElement(\"BLO"
            "CKQUOTE\");return e.setAttribute(\"TYPE\",\"cite\"),e},HTMLDocument.prototype.createElementFromMarkup=functi"
            "on(e){let t=this.createElement(\"template\");return t.innerHTML=e,t.content.firstChild},HTMLDocument.mf_list"
            "Elements=[\"ul\",\"ol\",\"dl\"],HTMLDocument.mf_quickReplyElementsToHideSelector=\"blockquote[type=cite], #l"
            "ineBreakAtBeginningOfMessage, #lineBreakAtBeginningOfSignature, .\"+HtmlClassOriginalContent+\", #\"+MFHtmlI"
            "DSignature,HTMLDocument.prototype.mf_getQuickReplyStyleElement=function(){return this.querySelector(\"#\"+MF"
            "HtmlIDQuickReplyStyle)},HTMLDocument.prototype.mf_quickReplyDisplayHiddenNodes=function(e){if (!isQuickReplyE"
            "nabled)return;let t=this.mf_getQuickReplyStyleElement();if (e){if (t&&t.remove(),this.quickReplyHiddenNodes)fo"
            "r(let e of this.quickReplyHiddenNodes)this.body.appendChild(e)}else if (this.quickReplyHiddenNodes===undefine"
            "d)(t=this.createElement(\"style\")).setAttribute(\"id\",MFHtmlIDQuickReplyStyle),this.head.appendChild(t),t."
            "sheet.insertRule(HTMLDocument.mf_quickReplyElementsToHideSelector+\" {display:none;}\");else for (let e of th"
            "is.quickReplyHiddenNodes)e.remove()},HTMLDocument.prototype.mf_quickReplyClearStylesAndSaveNodesIfNeeded=fun"
            "ction(){if (!isQuickReplyEnabled||this.quickReplyHiddenNodes!==undefined)return;let e=this.querySelectorAll(H"
            "TMLDocument.mf_quickReplyElementsToHideSelector);this.quickReplyHiddenNodes=Array.from(e);for (let t=0;t<e.le"
            "ngth;++t){let i=e[t];for (let l=t+1;l<e.length;++l){let t=e[l];if (i.contains(t)){let e=this.quickReplyHiddenN"
            "odes.indexOf(t);e>-1&&this.quickReplyHiddenNodes.splice(e,1)}}}for (let e of this.quickReplyHiddenNodes)e.rem"
            "ove();let t=this.mf_getQuickReplyStyleElement();t&&t.remove()};";
  v38[17] = kHTMLDocumentExtrasSourceLength;
  v38[18] = "MailSupport/HTMLElementExtras.js";
  v38[19] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";HTMLElement.prototype.mf_quoteLevelDelta=function(){if (\"BLOCKQUOTE\"!==this.nodeName.toUpper"
            "Case())return 0;let t=this.getAttribute(\"type\");if (t&&\"CITE\"===t.toUpperCase())return 1;let e=this.getAt"
            "tribute(\"class\");return e&&\"GMAIL_QUOTE\"===e.toUpperCase()?1:0};";
  v38[20] = kHTMLElementExtrasSourceLength;
  v38[21] = "MailSupport/NodeExtras.js";
  v38[22] = kNodeExtrasSource;
  v38[23] = kNodeExtrasSourceLength;
  v38[24] = "MailSupport/RangeExtras.js";
  v38[25] = "/*\n"
            " * Copyright (c) <%= Time.now.strftime(fmt=\"%Y\") %> Apple Inc. All rights reserved.\n"
            " */\n"
            "\"use strict\";const blockElementNames=new Set([\"HTML\",\"BODY\",\"BR\",\"OL\",\"UL\",\"TD\",\"TH\",\"HR\","
            "\"DD\",\"DL\",\"DT\",\"PRE\",\"BLOCKQUOTE\",\"DIV\",\"P\",\"TR\",\"H1\",\"H2\",\"H3\",\"H4\",\"H5\",\"H6\"])"
            ",isBlockElementName=function(e){return blockElementNames.has(e)};Range.prototype.stringValue=function(){let "
            "e=this.text();return isBlockElementName(this.endContainer.nodeName)&&0===this.endOffset&&(e+=\"\\n\"),e},Ran"
            "ge.prototype.mf_hoistRange=function(){let e,t=!1;for (e=this.startContainer;!t&&!e.mf_isBody()&&!e.mf_quoteLe"
            "velDelta();)t=!0,this.endContainer===e&&(this.startOffset||this.endOffset!==e.childNodes.length||(this.setSt"
            "artBefore(e),this.setEndAfter(e),e=this.startContainer,t=!1))},Range.prototype.mf_firstNode=function(){let e"
            ";if (this.collapsed)return e;let t=this.startContainer,n=this.startOffset,i=!1;if (t instanceof Text)e=(i=n>0)"
            "?t.mf_traverseNextNodeStayingWithin():t;else{for (e=t.firstChild;n-- >0;)e=e.nextSibling;e||(e=t.mf_traverseN"
            "extSiblingStayingWithin())}return e&&!this.intersectsNode(e)&&(e=undefined),e},Range.prototype.mf_takeFocus="
            "function(e){e===undefined&&(e=!0),e&&this.collapse(!0);let t=document.getSelection();t.removeAllRanges(),t.a"
            "ddRange(this)},Range.prototype.mf_lastNode=function(){let e;if (this.collapsed)return e;let t=this.endContain"
            "er,n=this.endOffset,i=!1;if (t instanceof Text)e=(i=n<t.length)?t.mf_traversePreviousNode():t;else{for (e=t.fi"
            "rstChild;--n>0;)e=e.nextSibling;e&&this.endOffset||(e=t.mf_traversePreviousNode())}return e&&!this.intersect"
            "sNode(e)&&(e=undefined),e};const IS_BLOCK_ELEMENT_NAME=function(e){const t=[\"HTML\",\"BODY\",\"BR\",\"LI\","
            "\"OL\",\"UL\",\"TD\",\"TH\",\"HR\",\"DD\",\"DL\",\"DT\",\"PRE\",\"BLOCKQUOTE\",\"DIV\",\"P\",\"TR\",\"H1\",\"
            "H2\",\"H3\",\"H4\",\"H5\",\"H6\"];return e&&-1!==t.indexOf(e)},isBlockLevelNode=function(e){let t=!1;return "
            "t=!!IS_BLOCK_ELEMENT_NAME(e.nodeName)};Range.prototype.mf_getBlockBoundaryParentAndNextSibling=function(e){l"
            "et t,n;if (e){let e=this.mf_firstNode(),t=e&&e.mf_topmostContainingNodeWithNameInArray(HTMLDocument.mf_listEl"
            "ements);if (t)return{parent:t.parentNode,nextSibling:t}}else{let e=this.mf_lastNode(),t=e&&e.mf_topmostContai"
            "ningNodeWithNameInArray(HTMLDocument.mf_listElements);if (t)return{parent:t.parentNode,nextSibling:t.nextSibl"
            "ing}}let i,s,o;if (e?(i=this.startContainer,o=this.startOffset):(i=this.endContainer,o=this.endOffset),i inst"
            "anceof Text)i=(s=i).parentNode;else for (s=i.firstChild;o-- >0;s=s.nextSibling);for (e&&(s=s?s.previousSibling"
            ":i.lastChild);!t&&i;){for (;!t&&s;)isBlockLevelNode(s)?(t=i,n=e||\"BR\"===s.nodeName.toUpperCase()?s.nextSibl"
            "ing:s):s=e?s.previousSibling:s.nextSibling;s||(isOrContainsBlockLevelNode(i)?(t=i,n=e?t.firstChild:undefined"
            "):(s=i,i=i.parentNode))}return{parent:t,nextSibling:n}};const isOrContainsBlockLevelNode=function(e){let t,n"
            "=!1;if (IS_BLOCK_ELEMENT_NAME(e.nodeName))n=!0;else for (t=e.firstChild;!n&&t;)n=isOrContainsBlockLevelNode(t)"
            ",t=t.nextSibling;return n};";
  v38[26] = kRangeExtrasSourceLength;
  do
  {
    jsContext = self->_jsContext;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v38[v3 + 1], v38[v3 + 2], 4);
    v6 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38[v3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[JSContext evaluateScript:withSourceURL:](jsContext, "evaluateScript:withSourceURL:", v5, v8);

    v3 += 3;
  }
  while (v3 != 27);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &unk_24E06C918, CFSTR("NSUTF8StringEncoding"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("NSURL"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global, CFSTR("bigEmojiEnabled"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_117, CFSTR("isInlineGenmojiEnabled"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_121, CFSTR("isSmartReplyEnabled"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_124, CFSTR("canUseNamedLinks"));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MSComposeBundlePageController observerProxy](self, "observerProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_5;
  v31[3] = &unk_24E06AFB0;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v10, "composeBodyFieldQuickReplyEnabled:", v31);

  -[JSContext globalObject](self->_jsContext, "globalObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BDDA5E8];
  v13 = MEMORY[0x24BDBD1C8];
  v37[0] = MEMORY[0x24BDBD1C8];
  v14 = *MEMORY[0x24BDDA5F0];
  v36[0] = v12;
  v36[1] = v14;
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_6;
  v29[3] = &unk_24E06AFD8;
  objc_copyWeak(&v30, &location);
  v15 = (void *)MEMORY[0x220780478](v29);
  v37[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defineProperty:descriptor:", CFSTR("isQuickReplyEnabled"), v16);

  -[MSComposeBundlePageController observerProxy](self, "observerProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_7;
  v27[3] = &unk_24E06AFB0;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v17, "composeBodyFieldAddLinkPreviewsEnabled:", v27);

  v34[1] = v14;
  v35[0] = v13;
  v34[0] = v12;
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_8;
  v25[3] = &unk_24E06AFD8;
  objc_copyWeak(&v26, &location);
  v18 = (void *)MEMORY[0x220780478](v25);
  v35[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defineProperty:descriptor:", CFSTR("addLinkPreviewsEnabled"), v19);

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", CFSTR("[\\n\\r\\s]+"), CFSTR("whitespaceRegex"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", CFSTR("(\\p{Emoji_Presentation}|\\p{Extended_Pictographic})"), CFSTR("emojiRegex"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", CFSTR("\\p{RI}\\p{RI}|\\p{Emoji}(\\p{EMod}|️⃣?|[\uE0020-\uE007E]+\uE007F)?(‍\\p{Emoji}(\\p{EMod}|️⃣?|[\uE0020-\uE007E]+\uE007F)?)*|."), CFSTR("stringToArrayRegex"));
  -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("Range"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("prototype"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setObject:forKeyedSubscript:", &__block_literal_global_151, CFSTR("text"));
  -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("String"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("prototype"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setObject:forKeyedSubscript:", &__block_literal_global_157, CFSTR("ef_isWebAddress"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", &__block_literal_global_161, CFSTR("ef_rangeOfWebAddressContainingRange"));

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke()
{
  return _os_feature_enabled_impl();
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_2()
{
  return _os_feature_enabled_impl();
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_3()
{
  return 0;
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_4()
{
  return _os_feature_enabled_impl();
}

void __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_5(uint64_t a1, char a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[48] = _os_feature_enabled_impl() & a2;
  v4 = (void *)*((_QWORD *)WeakRetained + 3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("enableQuickReply"), v6);

}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_6(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDDA730];
  v3 = WeakRetained[48];
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueWithBool:inContext:", v3 != 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_7(uint64_t a1, char a2)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[49] = a2;

}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_8(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x24BDDA730];
  v3 = WeakRetained[49];
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueWithBool:inContext:", v3 != 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_9()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDFA908];
  objc_msgSend(MEMORY[0x24BDDA720], "currentThis");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDA720], "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rangeHandleWithJSValue:inContext:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_10()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDDA720], "currentThis");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "toString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ef_isWebAddress");

  return v2;
}

uint64_t __55__MSComposeBundlePageController_initializeGlobalObject__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDDA720], "currentThis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ef_rangeOfWebAddressContainingRange:", a2, a3);

  return v7;
}

- (void)initializeBodyField:(id)a3
{
  JSValue *v4;
  void *v5;
  JSValue *jsBodyField;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v4 = (JSValue *)a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __53__MSComposeBundlePageController_initializeBodyField___block_invoke;
  v10 = &unk_24E06B0A0;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x220780478](&v7);
  -[JSValue setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, CFSTR("_createRichLink"), v7, v8, v9, v10);

  jsBodyField = self->_jsBodyField;
  self->_jsBodyField = v4;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __53__MSComposeBundlePageController_initializeBodyField___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "createRichLink:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WKWebProcessPlugIn)plugIn
{
  return (WKWebProcessPlugIn *)objc_loadWeakRetained((id *)&self->_plugIn);
}

- (WKWebProcessPlugInBrowserContextController)controller
{
  return self->_controller;
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (JSValue)jsBodyField
{
  return self->_jsBodyField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_plugIn);
  objc_storeStrong((id *)&self->_webContentProcessTransaction, 0);
  objc_storeStrong((id *)&self->_linkGeneratorProxy, 0);
  objc_storeStrong((id *)&self->_jsBodyField, 0);
  objc_storeStrong((id *)&self->_blocksToPerformOnPage, 0);
}

@end
