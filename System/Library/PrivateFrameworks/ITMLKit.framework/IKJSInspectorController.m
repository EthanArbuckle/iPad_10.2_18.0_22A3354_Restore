@implementation IKJSInspectorController

- (IKJSInspectorController)initWithAppContext:(id)a3
{
  id v4;
  IKJSInspectorController *v5;
  IKJSInspectorController *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  IKJSInspectorDOMAgent *v13;
  IKJSInspectorNetworkAgent *v14;
  IKJSInspectorPageAgent *v15;
  IKJSInspectorCSSAgent *v16;
  IKJSInspectorStorageAgent *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _IKJSInspectorNetworkLoader *v23;
  id v24;
  void *v25;
  uint64_t v26;
  IKNetworkRequestLoader *requestLoader;
  uint64_t v28;
  NSDate *inspectorConnectDate;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id inspectorConnectedToken;
  uint64_t v36;
  id inspectorDisconnectedToken;
  objc_class *v39;
  void *v40;
  NSDate *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  objc_super v46;
  _BYTE location[12];
  __int16 v48;
  IKJSInspectorController *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  NSDate *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)IKJSInspectorController;
  v5 = -[IKJSInspectorController init](&v46, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_appContext, v4);
    objc_msgSend(v4, "app");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_appFlags.respondsToActiveDocument = objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_appContext);
    objc_msgSend(WeakRetained, "jsContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_inspector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[IKJSInspectorDOMAgent initWithInspectorController:]([IKJSInspectorDOMAgent alloc], "initWithInspectorController:", v6);
    objc_msgSend(v12, "setDOMHandler:", v13);

    v14 = -[IKJSInspectorNetworkAgent initWithInspectorController:]([IKJSInspectorNetworkAgent alloc], "initWithInspectorController:", v6);
    objc_msgSend(v12, "setNetworkHandler:", v14);

    v15 = -[IKJSInspectorPageAgent initWithInspectorController:]([IKJSInspectorPageAgent alloc], "initWithInspectorController:", v6);
    objc_msgSend(v12, "setPageHandler:", v15);

    v16 = -[IKJSInspectorCSSAgent initWithInspectorController:]([IKJSInspectorCSSAgent alloc], "initWithInspectorController:", v6);
    objc_msgSend(v12, "setCSSHandler:", v16);

    v17 = -[IKJSInspectorStorageAgent initWithInspectorController:]([IKJSInspectorStorageAgent alloc], "initWithInspectorController:", v6);
    objc_msgSend(v12, "setDOMStorageHandler:", v17);

    objc_msgSend(v12, "domHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_domAgent, v18);

    objc_msgSend(v12, "networkHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_networkAgent, v19);

    objc_msgSend(v12, "pageHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_pageAgent, v20);

    objc_msgSend(v12, "cssHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_cssAgent, v21);

    objc_msgSend(v12, "domStorageHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_storageAgent, v22);

    objc_storeStrong((id *)&v6->_inspector, v11);
    v23 = [_IKJSInspectorNetworkLoader alloc];
    v24 = objc_loadWeakRetained((id *)&v6->_networkAgent);
    objc_msgSend(v12, "networkEventDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_IKJSInspectorNetworkLoader initWithIdentifier:parentIdentifier:agent:dispatcher:](v23, "initWithIdentifier:parentIdentifier:agent:dispatcher:", CFSTR("Inspector"), CFSTR("Inspector"), v24, v25);
    requestLoader = v6->_requestLoader;
    v6->_requestLoader = (IKNetworkRequestLoader *)v26;

    if (-[RWIProtocolInspector connected](v6->_inspector, "connected"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = objc_claimAutoreleasedReturnValue();
      inspectorConnectDate = v6->_inspectorConnectDate;
      v6->_inspectorConnectDate = (NSDate *)v28;

      v30 = objc_loadWeakRetained((id *)&v6->_storageAgent);
      objc_msgSend(v30, "startListeningForStorageNotifications");

      ITMLKitGetLogObject(1);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v6->_inspectorConnectDate;
        *(_DWORD *)location = 138413058;
        *(_QWORD *)&location[4] = v40;
        v48 = 2048;
        v49 = v6;
        v50 = 2112;
        v51 = v4;
        v52 = 2112;
        v53 = v41;
        _os_log_debug_impl(&dword_1D95F2000, v31, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> connected on %@", location, 0x2Au);

      }
    }
    objc_initWeak((id *)location, v6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke;
    v44[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v45, (id *)location);
    objc_msgSend(v32, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DD96B8], v11, 0, v44);
    v34 = objc_claimAutoreleasedReturnValue();
    inspectorConnectedToken = v6->_inspectorConnectedToken;
    v6->_inspectorConnectedToken = (id)v34;

    v42[0] = v33;
    v42[1] = 3221225472;
    v42[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_13;
    v42[3] = &unk_1E9F4CAD8;
    objc_copyWeak(&v43, (id *)location);
    objc_msgSend(v32, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DD96C0], v11, 0, v42);
    v36 = objc_claimAutoreleasedReturnValue();
    inspectorDisconnectedToken = v6->_inspectorDisconnectedToken;
    v6->_inspectorDisconnectedToken = (id)v36;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);

    objc_destroyWeak((id *)location);
  }

  return v6;
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39A0], "_setCollectsTimingData:", 1);
  objc_msgSend(MEMORY[0x1E0CB39A0], "_collectTimingDataWithOptions:", 1);
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_2;
  v9[3] = &unk_1E9F4CB00;
  objc_copyWeak(&v11, v5);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "evaluate:completionBlock:", v9, 0);

  objc_destroyWeak(&v11);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "storageAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startListeningForStorageNotifications");

    objc_storeStrong(v5 + 5, *(id *)(a1 + 32));
    if (*((_BYTE *)v5 + 12))
    {
      objc_msgSend(v5, "appContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_3;
      v12[3] = &unk_1E9F4C390;
      v13 = v5;
      objc_msgSend(v7, "evaluateDelegateBlockSync:", v12);

    }
    ITMLKitGetLogObject(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v15 = v10;
      v16 = 2048;
      v17 = v5;
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_1D95F2000, v8, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> connected on %@", buf, 0x2Au);

    }
  }

}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDocument");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "jsDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActiveDocument:", v4);

}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14;
  v7[3] = &unk_1E9F4BE58;
  objc_copyWeak(&v8, v4);
  objc_msgSend(v6, "evaluate:completionBlock:", v7, 0);

  objc_destroyWeak(&v8);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 7, 0);
    objc_msgSend(v5, "networkAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearAllTrackedLoaders");

    objc_msgSend(v5, "storageAgent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopListeningForStorageNotifications");

    objc_msgSend(v5, "domAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideHighlight");

    ITMLKitGetLogObject(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14_cold_1(v5, (uint64_t)v3, v9);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSInspectorController inspectorConnectedToken](self, "inspectorConnectedToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  -[IKJSInspectorController inspectorDisconnectedToken](self, "inspectorDisconnectedToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v5);

  v6.receiver = self;
  v6.super_class = (Class)IKJSInspectorController;
  -[IKJSInspectorController dealloc](&v6, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToInspectElementModeChanged = objc_opt_respondsToSelector() & 1;

    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToHighlightViewForElementWithOneID = objc_opt_respondsToSelector() & 1;

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToHighlightViewForElementWithManyIDs = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateFlags.respondsToCancelHighlightView = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setActiveDocument:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeDocument);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_activeDocument, obj);
    -[IKJSInspectorController cssAgent](self, "cssAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateStylesheets");

    -[IKJSInspectorController domAgent](self, "domAgent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentDidChange");

    -[IKJSInspectorController pageAgent](self, "pageAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentDidChange");

    v5 = obj;
  }

}

- (void)_updateCurrentActiveDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  if (self->_appFlags.respondsToActiveDocument)
  {
    -[IKJSInspectorController appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "app");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_initWeak(&location, self);
  -[IKJSInspectorController appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__IKJSInspectorController__updateCurrentActiveDocument__block_invoke;
  v8[3] = &unk_1E9F4CB00;
  objc_copyWeak(&v10, &location);
  v7 = v5;
  v9 = v7;
  objc_msgSend(v6, "evaluate:completionBlock:", v8, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __55__IKJSInspectorController__updateCurrentActiveDocument__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "inspector");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "connected");

    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "jsDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActiveDocument:", v5);

      WeakRetained = v6;
    }
  }

}

- (id)nodeById:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[IKJSInspectorController activeDocument](self, "activeDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_nodeWithId:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nodesByIds:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IKJSInspectorController activeDocument](self, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_nodesWithIds:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)styleFromComposer:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__IKJSInspectorController_styleFromComposer___block_invoke;
  v8[3] = &unk_1E9F4DFE8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[IKJSInspectorController evaluateMediaQuery:](self, "evaluateMediaQuery:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __45__IKJSInspectorController_styleFromComposer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "composedStyleWithMediaQueryEvaluator:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)evaluateMediaQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IKJSInspectorController appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__IKJSInspectorController_evaluateMediaQuery___block_invoke;
  v7[3] = &unk_1E9F4E010;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

}

void __46__IKJSInspectorController_evaluateMediaQuery___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activeDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBridge");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateStylesheets
{
  id v2;

  -[IKJSInspectorController cssAgent](self, "cssAgent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStylesheets");

}

- (void)resetStylesFromNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSInspectorController cssAgent](self, "cssAgent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetStylesFromNode:", v4);

}

- (void)inspectElementModeChanged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_delegateFlags.respondsToInspectElementModeChanged)
  {
    v3 = a3;
    -[IKJSInspectorController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inspectElementModeChanged:", v3);

  }
}

- (BOOL)highlightViewForElementWithID:(int64_t)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  if (!self->_delegateFlags.respondsToHighlightViewForElementWithOneID)
    return 0;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  -[IKJSInspectorController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v16, "highlightViewForElementWithID:contentColor:paddingColor:borderColor:marginColor:", a3, v15, v14, v13, v12);

  return a3;
}

- (BOOL)highlightViewsForElementsWithIDs:(id)a3 contentColor:(id)a4 paddingColor:(id)a5 borderColor:(id)a6 marginColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;

  if (!self->_delegateFlags.respondsToHighlightViewForElementWithManyIDs)
    return 0;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[IKJSInspectorController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "highlightViewsForElementsWithIDs:contentColor:paddingColor:borderColor:marginColor:", v16, v15, v14, v13, v12);

  return v18;
}

- (BOOL)cancelHighlightView
{
  void *v2;
  char v3;

  if (!self->_delegateFlags.respondsToCancelHighlightView)
    return 0;
  -[IKJSInspectorController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cancelHighlightView");

  return v3;
}

- (void)didAddEventListenerForDOMNode:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IKJSInspectorController inspector](self, "inspector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connected");

  if (v7 && v5)
  {
    -[IKJSInspectorController domAgent](self, "domAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didAddEventListenerForNodeID:", objc_msgSend(v7, "ITMLID"));

  }
}

- (void)willRemoveEventListenerForDOMNode:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IKJSInspectorController inspector](self, "inspector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connected");

  if (v7 && v5)
  {
    -[IKJSInspectorController domAgent](self, "domAgent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willRemoveEventListenerForNodeID:", objc_msgSend(v7, "ITMLID"));

  }
}

- (void)appDocumentDidAppear:(id)a3
{
  void *v4;
  int v5;

  -[IKJSInspectorController inspector](self, "inspector", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connected");

  if (v5)
    -[IKJSInspectorController _updateCurrentActiveDocument](self, "_updateCurrentActiveDocument");
}

- (void)appDocumentDidDisappear:(id)a3
{
  id v3;

  -[IKJSInspectorController inspector](self, "inspector", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connected");

}

- (void)appDocumentDidLoad:(id)a3
{
  void *v4;
  int v5;

  -[IKJSInspectorController inspector](self, "inspector", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connected");

  if (v5)
    -[IKJSInspectorController _updateCurrentActiveDocument](self, "_updateCurrentActiveDocument");
}

- (void)appDocumentDidUnload:(id)a3
{
  void *v4;
  int v5;

  -[IKJSInspectorController inspector](self, "inspector", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "connected");

  if (v5)
    -[IKJSInspectorController _updateCurrentActiveDocument](self, "_updateCurrentActiveDocument");
}

- (void)appDocumentDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[IKJSInspectorController inspector](self, "inspector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "connected") & 1) != 0)
  {
    objc_msgSend(v4, "jsDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSInspectorController activeDocument](self, "activeDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      objc_initWeak(&location, self);
      -[IKJSInspectorController appContext](self, "appContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __48__IKJSInspectorController_appDocumentDidUpdate___block_invoke;
      v9[3] = &unk_1E9F4CB00;
      objc_copyWeak(&v11, &location);
      v10 = v4;
      objc_msgSend(v8, "evaluate:completionBlock:", v9, 0);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __48__IKJSInspectorController_appDocumentDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "inspector");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "connected");

    WeakRetained = v9;
    if (v4)
    {
      objc_msgSend(v9, "activeDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "jsDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v9;
      if (v5 == v6)
      {
        objc_msgSend(v9, "domAgent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "documentDidUpdate");

        objc_msgSend(v9, "cssAgent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mediaQueryResultDidChange");

        WeakRetained = v9;
      }
    }
  }

}

- (id)registerLoaderWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IKJSInspectorController networkAgent](self, "networkAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerLoaderWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)unregisterLoaderWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IKJSInspectorController networkAgent](self, "networkAgent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterLoaderWithIdentifier:", v4);

}

- (BOOL)isInspectElementModeEnabled
{
  void *v2;
  char v3;

  -[IKJSInspectorController domAgent](self, "domAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInspectElementModeEnabled");

  return v3;
}

- (void)inspectNodeWithID:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  -[IKJSInspectorController inspector](self, "inspector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "connected");

  if (v6)
  {
    objc_initWeak(&location, self);
    -[IKJSInspectorController appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__IKJSInspectorController_inspectNodeWithID___block_invoke;
    v8[3] = &unk_1E9F4E038;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a3;
    objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void __45__IKJSInspectorController_inspectNodeWithID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "domAgent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inspectNodeWithID:", *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKJSInspectorControllerDelegate)delegate
{
  return (IKJSInspectorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (RWIProtocolInspector)inspector
{
  return self->_inspector;
}

- (NSDate)inspectorConnectDate
{
  return self->_inspectorConnectDate;
}

- (IKNetworkRequestLoader)requestLoader
{
  return self->_requestLoader;
}

- (IKDOMDocument)activeDocument
{
  return (IKDOMDocument *)objc_loadWeakRetained((id *)&self->_activeDocument);
}

- (IKJSInspectorDOMAgent)domAgent
{
  return (IKJSInspectorDOMAgent *)objc_loadWeakRetained((id *)&self->_domAgent);
}

- (IKJSInspectorNetworkAgent)networkAgent
{
  return (IKJSInspectorNetworkAgent *)objc_loadWeakRetained((id *)&self->_networkAgent);
}

- (IKJSInspectorPageAgent)pageAgent
{
  return (IKJSInspectorPageAgent *)objc_loadWeakRetained((id *)&self->_pageAgent);
}

- (IKJSInspectorCSSAgent)cssAgent
{
  return (IKJSInspectorCSSAgent *)objc_loadWeakRetained((id *)&self->_cssAgent);
}

- (IKJSInspectorStorageAgent)storageAgent
{
  return (IKJSInspectorStorageAgent *)objc_loadWeakRetained((id *)&self->_storageAgent);
}

- (id)inspectorConnectedToken
{
  return self->_inspectorConnectedToken;
}

- (id)inspectorDisconnectedToken
{
  return self->_inspectorDisconnectedToken;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inspectorDisconnectedToken, 0);
  objc_storeStrong(&self->_inspectorConnectedToken, 0);
  objc_destroyWeak((id *)&self->_storageAgent);
  objc_destroyWeak((id *)&self->_cssAgent);
  objc_destroyWeak((id *)&self->_pageAgent);
  objc_destroyWeak((id *)&self->_networkAgent);
  objc_destroyWeak((id *)&self->_domAgent);
  objc_destroyWeak((id *)&self->_activeDocument);
  objc_storeStrong((id *)&self->_requestLoader, 0);
  objc_storeStrong((id *)&self->_inspectorConnectDate, 0);
  objc_storeStrong((id *)&self->_inspector, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_appContext);
}

void __46__IKJSInspectorController_initWithAppContext___block_invoke_2_14_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inspectorConnectDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = 138413058;
  v12 = v7;
  v13 = 2048;
  v14 = a1;
  v15 = 2112;
  v16 = a2;
  v17 = 2048;
  v18 = v10;
  _os_log_debug_impl(&dword_1D95F2000, a3, OS_LOG_TYPE_DEBUG, "<%@: %p: %@> disconnected. Connected for %fs.", (uint8_t *)&v11, 0x2Au);

}

@end
