@implementation IKJSInspectorPageAgent

- (IKJSInspectorPageAgent)initWithInspectorController:(id)a3
{
  id v4;
  IKJSInspectorPageAgent *v5;
  IKJSInspectorPageAgent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKJSInspectorPageAgent;
  v5 = -[IKJSInspectorPageAgent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (RWIProtocolPageFrameResourceTree)resourceTree
{
  RWIProtocolPageFrameResourceTree *resourceTree;
  void *v4;
  uint64_t v5;
  RWIProtocolPageFrameResourceTree *v6;
  RWIProtocolPageFrameResourceTree *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RWIProtocolPageFrameResourceTree *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  resourceTree = self->_resourceTree;
  if (!resourceTree)
  {
    objc_msgSend(MEMORY[0x1E0DD9698], "ik_globalFrame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v4, "ik_resourceTreeWithResources:", MEMORY[0x1E0C9AA60]);
    v6 = (RWIProtocolPageFrameResourceTree *)objc_claimAutoreleasedReturnValue();
    v7 = self->_resourceTree;
    self->_resourceTree = v6;

    v8 = (void *)MEMORY[0x1E0DD9698];
    -[IKJSInspectorPageAgent controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ik_pageFrameFromDOMDocument:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RWIProtocolPageFrameResourceTree frame](self->_resourceTree, "frame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setParentId:", v13);

    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSInspectorPageAgent setCurrentFrameIdentifier:](self, "setCurrentFrameIdentifier:", v14);

    objc_msgSend(v11, "ik_resourceTreeWithResources:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_resourceTree;
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RWIProtocolPageFrameResourceTree setChildFrames:](v16, "setChildFrames:", v17);

    resourceTree = self->_resourceTree;
  }
  return resourceTree;
}

- (void)_dispatchEventWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[IKJSInspectorPageAgent controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inspector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorPageAgent controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__IKJSInspectorPageAgent__dispatchEventWithBlock___block_invoke;
  v13[3] = &unk_1E9F4F488;
  objc_copyWeak(&v16, &location);
  v11 = v4;
  v15 = v11;
  v12 = v8;
  v14 = v12;
  objc_msgSend(v10, "evaluate:completionBlock:", v13, 0);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __50__IKJSInspectorPageAgent__dispatchEventWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (void)documentDidChange
{
  void *v3;
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
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[IKJSInspectorPageAgent currentFrameIdentifier](self, "currentFrameIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IKJSInspectorPageAgent controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_requestLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DD9698], "ik_pageFrameFromDOMDocument:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setParentId:", v10);

    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSInspectorPageAgent setCurrentFrameIdentifier:](self, "setCurrentFrameIdentifier:", CFSTR("Page"));
    -[IKJSInspectorPageAgent controller](self, "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inspector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pageEventDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSInspectorPageAgent currentFrameIdentifier](self, "currentFrameIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safe_frameStartedLoadingWithFrameId:", v18);

    objc_msgSend(v17, "safe_frameNavigatedWithFrame:", v7);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "_recordForResource:withInitiator:synchronousOperation:", 2, 1, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0CB3680]);
      v35 = CFSTR("Content-Type");
      v36[0] = CFSTR("text/xml");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v7;
      v21 = (void *)objc_msgSend(v19, "initWithURL:statusCode:HTTPVersion:headerFields:", v13, 200, CFSTR("1.0"), v20);

      v34 = 0;
      objc_msgSend(v5, "toStringWithError:", &v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v34;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __43__IKJSInspectorPageAgent_documentDidChange__block_invoke;
      v30[3] = &unk_1E9F4F4B0;
      v31 = v22;
      v32 = CFSTR("text/xml");
      v33 = v23;
      v24 = v23;
      v25 = v22;
      objc_msgSend(v29, "didCompleteLoadingFromMemoryWithRequest:response:withResponseBodyBlock:", v28, v21, v30);

      v7 = v27;
    }
    -[IKJSInspectorPageAgent currentFrameIdentifier](self, "currentFrameIdentifier", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safe_frameStoppedLoadingWithFrameId:", v26);

  }
}

void __43__IKJSInspectorPageAgent_documentDidChange__block_invoke(_QWORD *a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v6;

  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD, _QWORD))a2)[2](v5, v6, a1[5], a1[6]);

}

- (void)enableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)disableWithErrorCallback:(id)a3 successCallback:(id)a4
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("unsupported"));
}

- (void)reloadWithErrorCallback:(id)a3 successCallback:(id)a4 ignoreCache:(BOOL *)a5 revalidateAllResources:(BOOL *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a4;
  if (a5)
    LODWORD(a5) = *a5;
  ITMLKitGetLogObject(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[IKJSInspectorPageAgent reloadWithErrorCallback:successCallback:ignoreCache:revalidateAllResources:].cold.1((int)a5, v11);

  -[IKJSInspectorPageAgent controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v13);

  -[IKJSInspectorPageAgent controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__IKJSInspectorPageAgent_reloadWithErrorCallback_successCallback_ignoreCache_revalidateAllResources___block_invoke;
  v18[3] = &unk_1E9F4F4D8;
  objc_copyWeak(&v21, &location);
  v16 = v10;
  v19 = v16;
  v17 = v9;
  v20 = v17;
  objc_msgSend(v15, "evaluate:completionBlock:", v18, 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __101__IKJSInspectorPageAgent_reloadWithErrorCallback_successCallback_ignoreCache_revalidateAllResources___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("App"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toObjectOfClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "reload::", &unk_1E9F8C9A8, 0);
    else
      objc_msgSend(WeakRetained, "reload");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)getResourceTreeWithErrorCallback:(id)a3 successCallback:(id)a4
{
  void *v5;
  void (**v6)(id, void *);
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
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DD9698];
  v6 = (void (**)(id, void *))a4;
  -[IKJSInspectorPageAgent controller](self, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_pageFrameFromDOMDocument:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParentId:", v12);

  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorPageAgent setCurrentFrameIdentifier:](self, "setCurrentFrameIdentifier:", v13);

  objc_msgSend(v9, "ik_resourceTreeWithResources:", MEMORY[0x1E0C9AA60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setChildFrames:", v16);

  -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v17);

}

- (void)getResourceContentWithErrorCallback:(id)a3 successCallback:(id)a4 frameId:(id)a5 url:(id)a6
{
  void (**v10)(id, void *);
  void (**v11)(id, void *, _QWORD);
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void (**v20)(id, void *, _QWORD);
  void (**v21)(id, void *);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  id v30;

  v10 = (void (**)(id, void *))a3;
  v11 = (void (**)(id, void *, _QWORD))a4;
  v12 = a6;
  v13 = a5;
  -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
  {
    -[IKJSInspectorPageAgent resourceTree](self, "resourceTree");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "url");
    v20 = v11;
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v12, "isEqualToString:", v22);

    v10 = v21;
    v11 = v20;

    if (v29)
    {
      v20[2](v20, &stru_1E9F50578, 0);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[IKJSInspectorPageAgent controller](self, "controller");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activeDocument");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(v24, "toStringWithError:", &v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v30;
  v27 = v26;
  if (v25)
  {
    v11[2](v11, v25, 0);
  }
  else
  {
    objc_msgSend(v26, "localizedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v28);

  }
LABEL_9:

}

- (IKJSInspectorController)controller
{
  return (IKJSInspectorController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (NSString)currentFrameIdentifier
{
  return self->_currentFrameIdentifier;
}

- (void)setCurrentFrameIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrameIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrameIdentifier, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_resourceTree, 0);
}

- (void)reloadWithErrorCallback:(int)a1 successCallback:(NSObject *)a2 ignoreCache:revalidateAllResources:.cold.1(int a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("held");
  if (!a1)
    v2 = CFSTR("not held");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "Reload requested with shift %@ down", (uint8_t *)&v3, 0xCu);
}

@end
