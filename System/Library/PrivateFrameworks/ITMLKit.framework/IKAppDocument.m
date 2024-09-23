@implementation IKAppDocument

- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5
{
  return -[IKAppDocument initWithAppContext:document:owner:extraInfo:](self, "initWithAppContext:document:owner:extraInfo:", a3, a4, a5, MEMORY[0x1E0C9AA70]);
}

- (IKAppDocument)initWithAppContext:(id)a3 document:(id)a4 owner:(id)a5 extraInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IKAppDocument *v14;
  IKAppDocument *v15;
  id v16;
  id WeakRetained;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IKAppDocument;
  v14 = -[IKAppDocument init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isViewElementRegistryDirty = 1;
    objc_storeWeak((id *)&v14->_appContext, v10);
    objc_storeWeak((id *)&v15->_owner, v12);
    v16 = objc_storeWeak((id *)&v15->_jsDocument, v11);
    objc_msgSend(v11, "prepareForPresentationWithExtraInfo:", v13);

    WeakRetained = objc_loadWeakRetained((id *)&v15->_jsDocument);
    objc_msgSend(WeakRetained, "setAppBridge:", v15);

    v18 = objc_loadWeakRetained((id *)&v15->_jsDocument);
    -[IKAppDocument _updateWithXML:](v15, "_updateWithXML:", v18);

    v19 = objc_loadWeakRetained((id *)&v15->_appContext);
    objc_msgSend(v19, "jsContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "virtualMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_loadWeakRetained((id *)&v15->_jsDocument);
    v23 = objc_loadWeakRetained((id *)&v15->_owner);
    objc_msgSend(v21, "addManagedReference:withOwner:", v22, v23);

    if (+[IKPreference logDocumentXML](IKPreference, "logDocumentXML"))
      NSLog(CFSTR("Created XML document: %@"), v11);
  }

  return v15;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id to;

  objc_copyWeak(&to, (id *)&self->_owner);
  objc_copyWeak(&from, (id *)&self->_jsDocument);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__IKAppDocument_dealloc__block_invoke;
  v5[3] = &unk_1E9F4C2C8;
  objc_copyWeak(&v6, &to);
  objc_copyWeak(&v7, &from);
  objc_msgSend(WeakRetained, "evaluate:completionBlock:", v5, 0);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&to);
  v4.receiver = self;
  v4.super_class = (Class)IKAppDocument;
  -[IKAppDocument dealloc](&v4, sel_dealloc);
}

void __24__IKAppDocument_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = (id *)(a1 + 40);
    v7 = objc_loadWeakRetained(v6);

    if (v7)
    {
      objc_msgSend(v11, "virtualMachine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained(v6);
      v10 = objc_loadWeakRetained(v3);
      objc_msgSend(v8, "removeManagedReference:withOwner:", v9, v10);

    }
  }

}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[IKAppDocument templateElement](self, "templateElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IKJSNavigationDocument)navigationDocument
{
  void *v2;
  void *v3;

  -[IKAppDocument jsDocument](self, "jsDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKJSNavigationDocument *)v3;
}

- (void)dispatchDocumentCallback:(id)a3 eventType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (v6)
  {
    -[IKAppDocument appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__IKAppDocument_dispatchDocumentCallback_eventType___block_invoke;
    v9[3] = &unk_1E9F4C2F0;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(v7, "evaluate:completionBlock:", v9, 0);

  }
  if (a4)
  {
    -[IKAppDocument templateElement](self, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", a4, 1, 0, 0, 0);

  }
}

void __52__IKAppDocument_dispatchDocumentCallback_eventType___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "invokeMethod:withArguments:", *(_QWORD *)(a1 + 40), 0);

}

- (void)onLoad
{
  void *v3;
  id v4;

  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onLoad"), 7);
  -[IKAppDocument appContext](self, "appContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webInspectorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocumentDidLoad:", self);

}

- (void)onUnload
{
  void *v3;
  id v4;

  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onUnload"), 8);
  -[IKAppDocument appContext](self, "appContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webInspectorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocumentDidUnload:", self);

}

- (void)onAppear
{
  void *v3;
  id v4;

  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onAppear"), 9);
  -[IKAppDocument appContext](self, "appContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webInspectorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocumentDidAppear:", self);

}

- (void)onDisappear
{
  void *v3;
  id v4;

  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onDisappear"), 10);
  -[IKAppDocument appContext](self, "appContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webInspectorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDocumentDidDisappear:", self);

}

- (void)onActive
{
  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onActive"), 0);
}

- (void)onInactive
{
  -[IKAppDocument dispatchDocumentCallback:eventType:](self, "dispatchDocumentCallback:eventType:", CFSTR("onInactive"), 0);
}

- (void)onNeedsUpdateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IKAppDocument appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E9F4C340;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluate:completionBlock:", v7, 0);

}

void __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CBE108];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_2;
  v11[3] = &unk_1E9F4C318;
  v12 = *(id *)(a1 + 40);
  v5 = a2;
  v6 = (void *)MEMORY[0x1DF092410](v11);
  objc_msgSend(v4, "valueWithObject:inContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "invokeMethod:withArguments:", CFSTR("onUpdate"), v9);

}

void __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_3;
  block[3] = &unk_1E9F4C318;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __45__IKAppDocument_onNeedsUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)onUpdate
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[IKAppDocument appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__IKAppDocument_onUpdate__block_invoke;
  v5[3] = &unk_1E9F4C1C0;
  v5[4] = self;
  objc_msgSend(v3, "evaluate:completionBlock:", v5, 0);

  -[IKAppDocument templateElement](self, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 12, 1, 0, 0, 0);

}

void __25__IKAppDocument_onUpdate__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "invokeMethod:withArguments:", CFSTR("onDidUpdate"), 0);

}

- (void)onImpressionsChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v11 = CFSTR("impressions");
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppDocument appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__IKAppDocument_onImpressionsChange___block_invoke;
    v9[3] = &unk_1E9F4C2F0;
    v9[4] = self;
    v10 = v5;
    v7 = v5;
    objc_msgSend(v6, "evaluate:completionBlock:", v9, 0);

    -[IKAppDocument templateElement](self, "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("onImpressionsChange"), 0, 1, 0, v7, 0);

  }
}

void __37__IKAppDocument_onImpressionsChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "invokeMethod:withArguments:", CFSTR("onImpressionsChange"), v3);

}

- (void)onPerformanceMetricsChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10 = CFSTR("metrics");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppDocument appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__IKAppDocument_onPerformanceMetricsChange___block_invoke;
    v8[3] = &unk_1E9F4C2F0;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "evaluate:completionBlock:", v8, 0);

  }
}

void __44__IKAppDocument_onPerformanceMetricsChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "invokeMethod:withArguments:", CFSTR("onPerformanceMetricsChange"), v3);

}

- (void)onViewAttributesChangeWithArguments:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IKAppDocument appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke;
  v11[3] = &unk_1E9F4C368;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "evaluate:completionBlock:", v11, 0);

}

void __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "jsDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "invokeMethod:withArguments:", CFSTR("onViewAttributesChange"), *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke_2;
    block[3] = &unk_1E9F4C318;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __64__IKAppDocument_onViewAttributesChangeWithArguments_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)recordImpressionsForViewElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  timeval v13;

  v4 = a3;
  -[IKAppDocument impressions](self, "impressions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[IKAppDocument setImpressions:](self, "setImpressions:", v6);

  }
  v13.tv_sec = 0;
  *(_QWORD *)&v13.tv_usec = 0;
  gettimeofday(&v13, 0);
  v7 = (double)v13.tv_sec + (double)v13.tv_usec * 0.000001;
  -[IKAppDocument impressionThreshold](self, "impressionThreshold");
  v9 = (uint64_t)(v8 * -1000.0 + v7 * 1000.0);
  -[IKAppDocument appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppDocument impressions](self, "impressions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKJSImpression impressionsMapForViewElements:appContext:timestamp:existingImpressionsMap:](IKJSImpression, "impressionsMapForViewElements:appContext:timestamp:existingImpressionsMap:", v4, v10, v9, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[IKAppDocument onImpressionsChange:](self, "onImpressionsChange:", v12);
}

- (void)snapshotImpressionsForViewElements:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  timeval v8;

  v8.tv_sec = 0;
  *(_QWORD *)&v8.tv_usec = 0;
  v4 = a3;
  gettimeofday(&v8, 0);
  v5 = (uint64_t)(((double)v8.tv_sec + (double)v8.tv_usec * 0.000001) * 1000.0);
  -[IKAppDocument appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKJSImpression impressionsMapForViewElements:appContext:timestamp:](IKJSImpression, "impressionsMapForViewElements:appContext:timestamp:", v4, v6, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[IKAppDocument setCachedSnapshotImpressionsMap:](self, "setCachedSnapshotImpressionsMap:", v7);
}

- (void)setViewElementStylesDirty
{
  -[IKAppDocument _setViewElementStylesDirtyForced:](self, "_setViewElementStylesDirtyForced:", 1);
}

- (id)retrieveJSElementForViewElement:(id)a3 jsContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  -[IKAppDocument jsDocument](self, "jsDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "itmlID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("//*[@itmlID='%@']"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nodesForXPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateForDocument:(id)a3
{
  id v4;

  v4 = a3;
  -[IKAppDocument _updateWithXML:](self, "_updateWithXML:");
  if (+[IKPreference logDocumentXML](IKPreference, "logDocumentXML"))
    NSLog(CFSTR("Updated XML document: %@"), v4);

}

- (void)setNeedsUpdateForDocument:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[IKAppDocument appContext](self, "appContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__IKAppDocument_setNeedsUpdateForDocument___block_invoke;
  v5[3] = &unk_1E9F4C390;
  v5[4] = self;
  objc_msgSend(v4, "evaluateDelegateBlockSync:", v5);

}

void __43__IKAppDocument_setNeedsUpdateForDocument___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentNeedsUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)snapshotImpressions
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[6];
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  objc_initWeak(&location, self);
  -[IKAppDocument appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __36__IKAppDocument_snapshotImpressions__block_invoke;
  v14[3] = &unk_1E9F4C3B8;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  v14[5] = &v17;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v14);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (id)v18[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "linkReferences", (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v23, 16);
    }
    while (v5);
  }

  v8 = (id)v18[5];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __36__IKAppDocument_snapshotImpressions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  timeval v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cachedSnapshotImpressionsMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "cachedSnapshotImpressionsMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v3, "setCachedSnapshotImpressionsMap:", 0);
    }
    else
    {
      objc_msgSend(v3, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "impressionableViewElementsForDocument:", *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

      v29.tv_sec = 0;
      *(_QWORD *)&v29.tv_usec = 0;
      gettimeofday(&v29, 0);
      v10 = (uint64_t)(((double)v29.tv_sec + (double)v29.tv_usec * 0.000001) * 1000.0);
      objc_msgSend(v3, "appContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKJSImpression impressionsMapForViewElements:appContext:timestamp:](IKJSImpression, "impressionsMapForViewElements:appContext:timestamp:", v9, v11, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "objectForKey:", CFSTR("data-metrics"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v20, "parentImpression");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            objc_msgSend(v12, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    v22 = objc_msgSend(v12, "copy");
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

- (id)recordedImpressions
{
  return -[IKAppDocument recordedImpressions:](self, "recordedImpressions:", 1);
}

- (id)recordedImpressions:(BOOL)a3
{
  return -[IKAppDocument impressionsMatching:reset:](self, "impressionsMatching:reset:", CFSTR("data-metrics"), a3);
}

- (id)impressionsMatching:(id)a3 reset:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  -[IKAppDocument appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __43__IKAppDocument_impressionsMatching_reset___block_invoke;
  v19[3] = &unk_1E9F4C3E0;
  v19[4] = self;
  v8 = v6;
  v22 = a4;
  v20 = v8;
  v21 = &v23;
  objc_msgSend(v7, "evaluateDelegateBlockSync:", v19);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (id)v24[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "linkReferences", (_QWORD)v15);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v29, 16);
    }
    while (v10);
  }

  v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __43__IKAppDocument_impressionsMatching_reset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "impressions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "impressions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "parentImpression");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          objc_msgSend(v2, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(v2, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (void)recordedImpressions:(BOOL)a3 completion:(id)a4
{
  -[IKAppDocument recordedImpressionsMatching:reset:completion:](self, "recordedImpressionsMatching:reset:completion:", CFSTR("data-metrics"), a3, a4);
}

- (void)recordedImpressionsMatching:(id)a3 reset:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[IKAppDocument appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke;
  v13[3] = &unk_1E9F4C408;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v17 = a4;
  v12 = v9;
  v15 = v12;
  objc_msgSend(v10, "addPostEvaluateBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    v25 = 0;
    objc_msgSend(WeakRetained, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke_2;
    v16[3] = &unk_1E9F4C3E0;
    v16[4] = v5;
    v7 = *(id *)(a1 + 32);
    v19 = *(_BYTE *)(a1 + 56);
    v17 = v7;
    v18 = &v20;
    objc_msgSend(v6, "evaluateDelegateBlockSync:", v16);

    if (*(_QWORD *)(a1 + 40))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v8 = (id)v21[5];
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "linkReferences", (_QWORD)v12);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v26, 16);
        }
        while (v9);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    _Block_object_dispose(&v20, 8);
  }

}

void __62__IKAppDocument_recordedImpressionsMatching_reset_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "impressions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "impressions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "parentImpression");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          objc_msgSend(v2, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(v2, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (void)scrollToTop
{
  void *v3;
  _QWORD v4[5];

  -[IKAppDocument appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__IKAppDocument_scrollToTop__block_invoke;
  v4[3] = &unk_1E9F4C390;
  v4[4] = self;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v4);

}

void __28__IKAppDocument_scrollToTop__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "documentScrollToTop:", *(_QWORD *)(a1 + 32));

}

- (void)runTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IKAppDocument appContext](self, "appContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__IKAppDocument_runTestWithName_options___block_invoke;
  v11[3] = &unk_1E9F4C430;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "evaluateDelegateBlockSync:", v11);

}

void __41__IKAppDocument_runTestWithName_options___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "document:runTestWithName:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)_isUpdateAllowed
{
  return !self->_parsingDOM;
}

- (BOOL)evaluateStyleMediaQueryList:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mediaQueryCache;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  char v16;
  BOOL v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKAppDocument delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (!self->_mediaQueryCache)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      mediaQueryCache = self->_mediaQueryCache;
      self->_mediaQueryCache = v6;

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v4;
      v11 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_mediaQueryCache, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "document:evaluateStyleMediaQuery:", self, v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](self->_mediaQueryCache, "setObject:forKey:", v14, v13);
          }
          v15 = objc_msgSend(v13, "isNegated");
          v16 = objc_msgSend(v14, "BOOLValue");

          if (v15)
          {
            if ((v16 & 1) == 0)
              goto LABEL_19;
          }
          else if ((v16 & 1) != 0)
          {
LABEL_19:
            v17 = 1;
            goto LABEL_20;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v10)
          continue;
        break;
      }
      v17 = 0;
LABEL_20:
      v4 = v19;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (IKNetworkRequestLoader)requestLoader
{
  void *v2;
  void *v3;

  -[IKAppDocument jsDocument](self, "jsDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_requestLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKNetworkRequestLoader *)v3;
}

- (id)_viewElementForNodeID:(unint64_t)a3
{
  NSMapTable *viewElementRegistry;
  NSMapTable *v6;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;
  NSMapTable *v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  NSMapTable *v16;
  void *v17;
  void *v18;

  if (self->_isViewElementRegistryDirty)
  {
    viewElementRegistry = self->_viewElementRegistry;
    if (!viewElementRegistry)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_viewElementRegistry;
      self->_viewElementRegistry = v6;

      viewElementRegistry = self->_viewElementRegistry;
    }
    -[NSMapTable removeAllObjects](viewElementRegistry, "removeAllObjects");
    v8 = self->_viewElementRegistry;
    -[IKAppDocument templateElement](self, "templateElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    RegisterViewElements(v8, v9);

    v10 = self->_viewElementRegistry;
    -[IKAppDocument headElement](self, "headElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    RegisterViewElements(v10, v11);

    v12 = self->_viewElementRegistry;
    -[IKAppDocument navigationBarElement](self, "navigationBarElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    RegisterViewElements(v12, v13);

    v14 = self->_viewElementRegistry;
    -[IKAppDocument toolbarElement](self, "toolbarElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    RegisterViewElements(v14, v15);

    self->_isViewElementRegistryDirty = 0;
  }
  v16 = self->_viewElementRegistry;
  +[IKDOMNode ITMLIDStringforITMLID:](IKDOMNode, "ITMLIDStringforITMLID:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](v16, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)_updateWithXML:(id)a3
{
  IKAppContext **p_appContext;
  id v5;
  id WeakRetained;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  char **__ptr32 *v11;
  void *v12;
  IKViewElementFactoryContext *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  IKViewElementFactoryContext *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  NSObject *v39;
  dispatch_semaphore_t v40;
  NSObject *v41;
  id v42;
  void *v43;
  _QWORD block[4];
  dispatch_semaphore_t v45;
  IKAppDocument *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  IKAppDocument *v52;
  id v53;
  id v54;
  id v55;
  IKViewElementFactoryContext *v56;
  id v57;
  BOOL v58;
  id v59[2];

  self->_parsingDOM = 1;
  p_appContext = &self->_appContext;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_appContext);
  v59[0] = 0;
  v7 = objc_msgSend(WeakRetained, "validateDOMDocument:error:", v5, v59);
  v8 = v59[0];

  objc_msgSend(v5, "documentElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = &off_1D96A7000;
  if (v7)
  {
    objc_msgSend(v9, "getAttribute:", CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(IKViewElementFactoryContext);
    -[IKAppDocument styleFactory](self, "styleFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext setStyleFactory:](v13, "setStyleFactory:", v14);

    -[IKAppDocument headElement](self, "headElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext setHeadViewElement:](v13, "setHeadViewElement:", v15);

    -[IKAppDocument templateElement](self, "templateElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext setTemplateViewElement:](v13, "setTemplateViewElement:", v16);

    v17 = +[IKViewElementFactory elementsForDocumentElement:context:](IKViewElementFactory, "elementsForDocumentElement:context:", v9, v13);
    -[IKViewElementFactoryContext headViewElement](v13, "headViewElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext navigationBarViewElement](v13, "navigationBarViewElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext toolBarViewElement](v13, "toolBarViewElement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementFactoryContext templateViewElement](v13, "templateViewElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      ITMLKitGetLogObject(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[IKAppDocument _updateWithXML:].cold.1((uint64_t)v9, v22);

    }
    self->_isViewElementRegistryDirty = 1;
    v23 = -[IKViewElementFactoryContext updateType](v13, "updateType", v8);
    v24 = v23 == 1;
    if (v23 == 1)
    {
      -[IKAppDocument headElement](self, "headElement");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[IKAppDocument headElement](self, "headElement");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "configureUpdatesWithElement:", v26);

      }
      if (v21)
      {
        -[IKAppDocument templateElement](self, "templateElement");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "configureUpdatesWithElement:", v27);

      }
      -[IKAppDocument navigationBarElement](self, "navigationBarElement");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[IKAppDocument navigationBarElement](self, "navigationBarElement");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "configureUpdatesWithElement:", v29);

      }
      -[IKAppDocument toolbarElement](self, "toolbarElement");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        -[IKAppDocument toolbarElement](self, "toolbarElement");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "configureUpdatesWithElement:", v31);

      }
    }
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __32__IKAppDocument__updateWithXML___block_invoke;
    v50[3] = &unk_1E9F4C458;
    v51 = v18;
    v52 = self;
    v53 = v19;
    v54 = v20;
    v55 = v21;
    v56 = v13;
    v57 = v12;
    v58 = v24;
    v32 = v12;
    v33 = v13;
    v34 = v21;
    v35 = v20;
    v36 = v19;
    v37 = v18;
    v38 = (void *)MEMORY[0x1DF092410](v50);

    v11 = &off_1D96A7000;
    v10 = MEMORY[0x1E0C809B0];
    v8 = v43;
  }
  else
  {
    ITMLKitGetLogObject(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[IKAppDocument _updateWithXML:].cold.2(v8, v39);

    v48[0] = v10;
    v48[1] = 3221225472;
    v48[2] = __32__IKAppDocument__updateWithXML___block_invoke_42;
    v48[3] = &unk_1E9F4C170;
    v48[4] = self;
    v49 = v8;
    v38 = (void *)MEMORY[0x1DF092410](v48);

  }
  objc_msgSend(v9, "clearUpdates");
  v40 = dispatch_semaphore_create(0);
  block[0] = v10;
  block[1] = *((_QWORD *)v11 + 303);
  block[2] = __32__IKAppDocument__updateWithXML___block_invoke_2;
  block[3] = &unk_1E9F4C480;
  v46 = self;
  v47 = v38;
  v45 = v40;
  v41 = v40;
  v42 = v38;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
  self->_parsingDOM = 0;

}

void __32__IKAppDocument__updateWithXML___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  id v36;

  objc_msgSend(*(id *)(a1 + 32), "setAppDocument:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "setAppDocument:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "setAppDocument:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 64), "setAppDocument:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 72), "styleFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStyleFactory:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setIdentifier:", *(_QWORD *)(a1 + 80));
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "headElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "headElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applyUpdatesWithElement:", *(_QWORD *)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHeadElement:", v7);

    }
    else
    {
      objc_msgSend(v4, "setHeadElement:", *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setHeadElement:", *(_QWORD *)(a1 + 32));
  }
  v8 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "navigationBarElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationBarElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applyUpdatesWithElement:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNavigationBarElement:", v11);

    }
    else
    {
      objc_msgSend(v8, "setNavigationBarElement:", *(_QWORD *)(a1 + 48));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setNavigationBarElement:", *(_QWORD *)(a1 + 48));
  }
  v12 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "toolbarElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "toolbarElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applyUpdatesWithElement:", *(_QWORD *)(a1 + 56));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToolbarElement:", v15);

    }
    else
    {
      objc_msgSend(v12, "setToolbarElement:", *(_QWORD *)(a1 + 56));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setToolbarElement:", *(_QWORD *)(a1 + 56));
  }
  v16 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "templateElement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "templateElement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "applyUpdatesWithElement:", *(_QWORD *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTemplateElement:", v19);

    }
    else
    {
      objc_msgSend(v16, "setTemplateElement:", *(_QWORD *)(a1 + 64));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setTemplateElement:", *(_QWORD *)(a1 + 64));
  }
  objc_msgSend(*(id *)(a1 + 40), "_setViewElementStylesDirtyForced:", 0);
  if (*(_BYTE *)(a1 + 88))
  {
    v20 = *(void **)(a1 + 40);
    objc_msgSend(v20, "headElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "updateType"))
    {
      objc_msgSend(v20, "setSubtreeUpdated:", 1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "navigationBarElement");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "updateType"))
      {
        objc_msgSend(v20, "setSubtreeUpdated:", 1);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "toolbarElement");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "updateType"))
        {
          objc_msgSend(v20, "setSubtreeUpdated:", 1);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "templateElement");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setSubtreeUpdated:", objc_msgSend(v24, "updateType") != 0);

        }
      }

    }
  }
  else if (objc_msgSend(*(id *)(a1 + 72), "updateType") == 4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setUpdated:", 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "templateElement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "attributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("impressionsViewableThreshold"));
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v27 = *(void **)(a1 + 40);
  v28 = 1.0;
  if (objc_msgSend(v36, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v36, "doubleValue");
    v28 = v29 / 1000.0;
  }
  objc_msgSend(v27, "setImpressionThreshold:", v28);
  objc_msgSend(*(id *)(a1 + 40), "templateElement");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "attributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("impressionsViewablePercentage"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = *(void **)(a1 + 40);
  v34 = 0.5;
  if (objc_msgSend(v32, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v32, "doubleValue");
    v34 = v35;
  }
  objc_msgSend(v33, "setImpressionViewablePercentage:", v34);
  objc_msgSend(*(id *)(a1 + 40), "setError:", 0);

}

uint64_t __32__IKAppDocument__updateWithXML___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__IKAppDocument__updateWithXML___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if ((objc_msgSend(*(id *)(a1 + 40), "isUpdated") & 1) != 0
    || (result = objc_msgSend(*(id *)(a1 + 40), "isSubtreeUpdated"), (_DWORD)result))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "documentDidUpdate:", *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(a1 + 40), "headElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetProperty:", 1);

    objc_msgSend(*(id *)(a1 + 40), "navigationBarElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetProperty:", 1);

    objc_msgSend(*(id *)(a1 + 40), "toolbarElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetProperty:", 1);

    objc_msgSend(*(id *)(a1 + 40), "templateElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetProperty:", 1);

    objc_msgSend(*(id *)(a1 + 40), "setUpdated:", 0);
    return objc_msgSend(*(id *)(a1 + 40), "setSubtreeUpdated:", 0);
  }
  return result;
}

- (void)_setViewElementStylesDirtyForced:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  NSMutableDictionary *mediaQueryCache;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
    goto LABEL_10;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_mediaQueryCache, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v5)
  {
LABEL_11:

    goto LABEL_12;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v4);
      v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_mediaQueryCache, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      -[IKAppDocument delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v13, "document:evaluateStyleMediaQuery:", self, v10);

      v7 |= v12 ^ v10;
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v6);

  if ((v7 & 1) != 0)
  {
LABEL_10:
    mediaQueryCache = self->_mediaQueryCache;
    self->_mediaQueryCache = 0;

    -[IKAppDocument styleFactory](self, "styleFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setViewElementStylesDirty");

    -[IKAppDocument toolbarElement](self, "toolbarElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appDocumentDidMarkStylesDirty");

    -[IKAppDocument navigationBarElement](self, "navigationBarElement");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appDocumentDidMarkStylesDirty");

    -[IKAppDocument templateElement](self, "templateElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appDocumentDidMarkStylesDirty");
    goto LABEL_11;
  }
LABEL_12:
  -[IKAppDocument appContext](self, "appContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "webInspectorController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appDocumentDidUpdate:", self);

}

- (void)pushTrackingImplictUpdates
{
  ++self->_implicitUpdatesStack;
}

- (void)popTrackingImplictUpdates
{
  int64_t v2;

  v2 = self->_implicitUpdatesStack - 1;
  self->_implicitUpdatesStack = v2;
  if (!v2)
    -[IKAppDocument _resetImplicitUpdates](self, "_resetImplicitUpdates");
}

- (BOOL)markImplicitlyUpdated
{
  if (self->_implicitUpdatesStack >= 1)
    self->_implicitlyUpdated = 1;
  return -[IKAppDocument isImplicitlyUpdated](self, "isImplicitlyUpdated");
}

- (void)_resetImplicitUpdates
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  if (-[IKAppDocument isImplicitlyUpdated](self, "isImplicitlyUpdated"))
  {
    -[IKAppDocument delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F020C8C8))
    {
      -[IKAppDocument delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0)
      {
LABEL_6:
        self->_implicitlyUpdated = 0;
        -[IKAppDocument templateElement](self, "templateElement");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "resetImplicitUpdates");

        return;
      }
      -[IKAppDocument delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "documentDidUpdateImplicitly:", self);
    }

    goto LABEL_6;
  }
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKDOMDocument)jsDocument
{
  return (IKDOMDocument *)objc_loadWeakRetained((id *)&self->_jsDocument);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (IKHeadElement)headElement
{
  return (IKHeadElement *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHeadElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (IKViewElement)navigationBarElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigationBarElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (IKViewElement)toolbarElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 88, 1);
}

- (void)setToolbarElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (IKViewElement)templateElement
{
  return (IKViewElement *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTemplateElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (IKAppDocumentDelegate)delegate
{
  return (IKAppDocumentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isUpdated
{
  return self->_updated;
}

- (void)setUpdated:(BOOL)a3
{
  self->_updated = a3;
}

- (BOOL)isSubtreeUpdated
{
  return self->_subtreeUpdated;
}

- (void)setSubtreeUpdated:(BOOL)a3
{
  self->_subtreeUpdated = a3;
}

- (double)impressionThreshold
{
  return self->_impressionThreshold;
}

- (void)setImpressionThreshold:(double)a3
{
  self->_impressionThreshold = a3;
}

- (double)impressionViewablePercentage
{
  return self->_impressionViewablePercentage;
}

- (void)setImpressionViewablePercentage:(double)a3
{
  self->_impressionViewablePercentage = a3;
}

- (NSDictionary)cachedSnapshotImpressionsMap
{
  return self->_cachedSnapshotImpressionsMap;
}

- (void)setCachedSnapshotImpressionsMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSnapshotImpressionsMap, a3);
}

- (NSMutableDictionary)impressions
{
  return self->_impressions;
}

- (void)setImpressions:(id)a3
{
  objc_storeStrong((id *)&self->_impressions, a3);
}

- (IKJSObject)owner
{
  return (IKJSObject *)objc_loadWeakRetained((id *)&self->_owner);
}

- (IKViewElementStyleFactory)styleFactory
{
  return self->_styleFactory;
}

- (void)setStyleFactory:(id)a3
{
  objc_storeStrong((id *)&self->_styleFactory, a3);
}

- (BOOL)isImplicitlyUpdated
{
  return self->_implicitlyUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleFactory, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_impressions, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotImpressionsMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_toolbarElement, 0);
  objc_storeStrong((id *)&self->_navigationBarElement, 0);
  objc_storeStrong((id *)&self->_headElement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_jsDocument);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_viewElementRegistry, 0);
  objc_storeStrong((id *)&self->_mediaQueryCache, 0);
}

- (void)_updateWithXML:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Unable to create elements for document %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateWithXML:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "XML validation error: %ld...%@", (uint8_t *)&v6, 0x16u);

}

@end
